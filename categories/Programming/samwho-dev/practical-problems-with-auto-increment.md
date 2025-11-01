---
title = "Practical Problems with Auto-Increment"
description = '''In this post I'm going to demonstrate 2 reasons I will be avoiding auto-increment fields in Postgres and MySQL in future. I'm going to prefer using UUID fields unless I have a very good reason not to.\ MySQL \<8.0 auto-increment ID re-use'''
date = "2023-03-25T00:00:00Z"
url = "/blog/practical-problems-with-auto-increment/"
author = "Sam Rose"
text = ""
lastupdated = "2025-10-22T08:59:06.847358253Z"
seen = true
---

In this post I'm going to demonstrate 2 reasons I will be avoiding auto-increment fields in Postgres and MySQL in future. I'm going to prefer using UUID fields unless I have a *very* good reason not to.

[\#](#mysql-8-0-auto-increment-id-re-use) MySQL \<8.0 auto-increment ID re-use
----------

If you're running an older version of MySQL, it's possible for auto-incrementing IDs to get re-used. Let's see this in action.

```
$ docker volume create mysql-data
$ docker run --platform linux/amd64 -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -v mysql-data:/var/lib/mysql mysql:5.7

```

This gets us a Docker container of MySQL 5.7 running, attached to a volume that will persist the data between runs of this container. Next let's get a simple schema we can work with:

```
$ docker run -it --rm --network host --platform linux/amd64 mysql:5.7 mysql -h 127.0.0.1 -P 3306 -u root -p
mysql> CREATE DATABASE my_database;
Query OK, 1 row affected (0.01 sec)

mysql> USE my_database;
Database changed
mysql> CREATE TABLE my_table (
    -> ID INT AUTO_INCREMENT PRIMARY KEY
    -> );
Query OK, 0 rows affected (0.02 sec)

```

Now let's insert a couple of rows.

```
mysql> INSERT INTO my_table () VALUES ();
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO my_table () VALUES ();
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO my_table () VALUES ();
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM my_table;
+----+
| ID |
+----+
|  1 |
|  2 |
|  3 |
+----+
3 rows in set (0.01 sec)

```

So far so good. We can restart the MySQL server and run the same SELECT statement again and get the same result.

Let's delete a row.

```
mysql> DELETE FROM my_table WHERE ID=3;
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM my_table;
+----+
| ID |
+----+
|  1 |
|  2 |
+----+
2 rows in set (0.00 sec)

```

Let's insert a new row to make sure the ID 3 doesn't get reused.

```
mysql> INSERT INTO my_table () VALUES ();
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM my_table;
+----+
| ID |
+----+
|  1 |
|  2 |
|  4 |
+----+
3 rows in set (0.00 sec)

```

Perfect. Let's delete that latest row, restart the server, and then insert a new row.

```
mysql> DELETE FROM my_table WHERE ID=4;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM my_table;
ERROR 2013 (HY000): Lost connection to MySQL server during query

$ docker run -it --rm --network host --platform linux/amd64 mysql:5.7 mysql -h 127.0.0.1 -P 3306 -u root -p

mysql> USE my_database;
Database changed

mysql> SELECT * FROM my_table;
+----+
| ID |
+----+
|  1 |
|  2 |
+----+
2 rows in set (0.00 sec)

mysql> INSERT INTO my_table () VALUES ();
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM my_table;
+----+
| ID |
+----+
|  1 |
|  2 |
|  3 |
+----+
3 rows in set (0.00 sec)

```

Eep. MySQL has re-used the ID 3. This is because the way that auto-increment works in InnoDB is, on server restart, it will figure out what the next ID to use is by effectively running this query:

```
SELECT MAX(ID) FROM my_table;

```

If you had deleted the most recent records from the table just before restart, IDs that had been used will be re-used when the server comes back up.

In theory, this *shouldn't* cause you trouble. Best practice dictates that you shouldn't be using IDs from database tables outside of that table unless it's some foreign key field, and you certainly wouldn't leak that ID out of your system, right?

In practice, this stuff happens and can cause devastatingly subtle bugs. MySQL 8.0 changed this behaviour by storing the auto-increment value on disk in a way that persists across restarts.

[\#](#postgres-sequence-values-don-t-get-replicated) Postgres sequence values don't get replicated
----------

Like MySQL 8.0, Postgres stores auto-increment values on disk. It does this in a schema object called a "sequence." When you create an auto-incrementing field in Postgres, behind the scenes a sequence will be created to back that field and durably keep track of what the next value should be.

Let's take a look at that in practice.

```
$ docker volume create postgres-14-data
$ docker run --network host -e POSTGRES_PASSWORD=my-secret-pw -v postgres-14-data:/var/lib/postgresql/data -p postgres:14

```

With Postgres up and running, let's go ahead and create our table:

```
$ docker run -it --rm --network host postgres:14 psql -h 127.0.0.1 -U postgres
postgres=# CREATE TABLE my_table (id SERIAL PRIMARY KEY);
CREATE TABLE

```

And insert a few rows:

```
postgres=# INSERT INTO my_table DEFAULT VALUES;
INSERT 0 1
postgres=# INSERT INTO my_table DEFAULT VALUES;
INSERT 0 1
postgres=# INSERT INTO my_table DEFAULT VALUES;
INSERT 0 1
postgres=# SELECT * FROM my_table;
 id
----
  1
  2
  3
(3 rows)

```

So far so good. Let's take a look at the table:

```
postgres=# \d my_table
                            Table "public.my_table"
 Column |  Type   | Collation | Nullable |               Default
--------+---------+-----------+----------+--------------------------------------
 id     | integer |           | not null | nextval('my_table_id_seq'::regclass)
Indexes:
    "my_table_pkey" PRIMARY KEY, btree (id)

```

This output tells us that the default value for our `id` field is the `nextval` of `my_table_id_seq`. Let's take a look at `my_table_id_seq`:

```
postgres=# \d my_table_id_seq
                  Sequence "public.my_table_id_seq"
  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache
---------+-------+---------+------------+-----------+---------+-------
 integer |     1 |       1 | 2147483647 |         1 | no      |     1
Owned by: public.my_table.id

postgres=# SELECT currval('my_table_id_seq');
 currval
---------
       3
(1 row)

```

Neat, we have a bonafide object in Postgres that's keeping track of the auto-incrementing ID value. If we were to repeat what we did in MySQL, delete some rows and restart, we wouldn't have the same problem here. `my_table_id_seq` is saved to disk and doesn't lose its place.

Or does it?

If you want to update Postgres to a new major version, the way you typically accomplish that is by creating a new Postgres instance on the version you want to upgrade to, logically replicate from the old instance to the new one, and then switch your application to talk to the new one.

First we need to restart our Postgres 14 with some new configuration to allow logical replication:

```
$ docker run --network host -e POSTGRES_PASSWORD=my-secret-pw -v postgres-14-data:/var/lib/postgresql/data -p postgres:14 -c wal_level=logical

```

Now let's get Postgres 15 up and running:

```
$ docker volume create postgres-15-data
$ docker run --network host -e POSTGRES_PASSWORD=my-secret-pw -v postgres-15-data:/var/lib/postgresql/data postgres:15 postgres:14 -c wal_level=logical -p 5431

```

Next up, we create a "publication" on our Postgres 14 instance:

```
postgres=# CREATE PUBLICATION my_publication FOR ALL TABLES;
CREATE PUBLICATION

```

Then we create our "my\_table" table and a "subscription" on our Postgres 15 instance:

```
postgres=# CREATE TABLE my_table (id SERIAL PRIMARY KEY);
CREATE TABLE
postgres=# CREATE SUBSCRIPTION my_subscription CONNECTION 'host=127.0.0.1 port=5432 dbname=postgres user=postgres password=my-secret-pw' PUBLICATION my_publication;
NOTICE:  created replication slot "my_subscription" on publisher
CREATE SUBSCRIPTION

```

After doing this, we should see data syncing between old and new instances:

```
$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5432 -c "SELECT * FROM my_table"
 id
----
  1
  2
  3
(3 rows)

$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5431 -c "SELECT * FROM my_table"
 id
----
  1
  2
  3
(3 rows)

$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5432 -c "INSERT INTO my_table DEFAULT VALUES"
INSERT 0 1

$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5431 -c "SELECT * FROM my_table"
 id
----
  1
  2
  3
  4
(4 rows)

```

So what's the problem?

Well...

```
$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5432 -c "SELECT nextval('my_table_id_seq')"
 nextval
---------
       5
(1 row)

$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5431 -c "SELECT nextval('my_table_id_seq')"
 nextval
---------
       1
(1 row)

```

The sequence value is not replicated. If we tried to insert a row into Postgres 15 we get this:

```
$ docker run -it --rm --network host postgres:15 psql -h 127.0.0.1 -U postgres -p 5431 -c "INSERT INTO my_table DEFAULT VALUES"
ERROR:  duplicate key value violates unique constraint "my_table_pkey"
DETAIL:  Key (id)=(2) already exists.

```

Note: It's tried to insert id=2 here because when we called `nextval` earlier, it modified the sequence.

This can make major Postgres version updates very tricky if you rely heavily on auto-incrementing ID fields. You need to modify the sequence values manually to values you know for a fact won't be reached during the process of the upgrade, and then you likely need to disable writes during the upgrade depending on your workload.

[\#](#conclusion) Conclusion
----------

You can avoid all of the above pain by using UUID fields instead of auto-incrementing integers. These have the benefit of being unpredictable and not leak information about the cardinality of the underlying table if you do end up using them outside of the table (which you shouldn't).

Thanks to [this article](https://incident.io/blog/one-two-skip-a-few) from the wonderful folks at [Incident.io](https://incident.io), I am now aware of the [German tank problem](https://en.wikipedia.org/wiki/German_tank_problem). Well worth reading both the linked article, and the Wikipedia page, for more reasons not to use auto-increment ID fields.