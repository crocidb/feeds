+++
title = "GitLab on FreeBSD"
description = "Today I will share how to install and setup a GitLab server on FreeBSD. Most people just use Microslopft GitHub these days but this approach has one big drawback – its cloud only solution. When it comes to on premise solutions there are GitLab and there is also Gitea. GitLab is c"
date = "2026-07-09T01:09:11Z"
url = "https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/"
author = "vermaden"
text = ""
lastupdated = "2026-07-09T12:05:11.774072412Z"
seen = false
+++

Today I will share how to install and setup a GitLab server on FreeBSD. Most people just use *Microslopft* GitHub these days but this approach has one big drawback – its cloud only solution. When it comes to on premise solutions there are GitLab and there is also Gitea. GitLab is closest to what GitHub provides while Gitea is very light and smaller brother trying to achieve the same goals by doing less. Good to have alternatives.

<img data-attachment-id="10463" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-logo/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png" data-orig-size="1550,347" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-logo" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=960" class="alignnone size-full wp-image-10463" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png" alt="" width="625" height="140" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=625&amp;h=140 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=1250&amp;h=280 1250w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=150&amp;h=34 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=300&amp;h=67 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=768&amp;h=172 768w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-logo.png?w=1024&amp;h=229 1024w" sizes="(max-width: 625px) 100vw, 625px">

The *Table of Contents* is more or less like that:

* **Bhyve VM**
* **Packages**
* **PostgreSQL**
* **Redis**
* **GitLab**
* **Nginx**
* **Final GitLab Tweaks**
* **GitLab Web Interface**
* **Summary**

We will use a dedicated Bhyve VM for that – with **sysutils/vm-bhyve-devel** help.

Bhyve VM
==========

We will also use FreeBSD project provided ready to use **FreeBSD-15.1-RELEASE-amd64-zfs.raw.xz** VM image.

```
host # vm create -t freebsd gitlab

host # env EDITOR=cat vm config gitlab
loader="bhyveload"
cpu=4
memory=16G
network0_type="virtio-net"
network0_switch="public"
network0_mac="58:9c:fc:01:fb:f8"
disk0_type="nvme"
disk0_name="disk0.img"
uuid="15cd2fff-7942-4ca4-a29f-6ed48f063371"

host # xz -d -c FreeBSD-15.1-RELEASE-amd64-zfs.raw.xz > /vm/gitlab/disk0.img

host # truncate -s 30g /vm/gitlab/disk0.img

host # vm start gitlab   
Starting gitlab
  * found guest in /vm/gitlab
  * booting...

host # vm console gitlab   

login: root

root@gitlab:~ # :> ~/.hushlogin

root@gitlab:~ # gpart show -p
=>      34  62914486    nda0  GPT  (30G)
        34       347  nda0p1  freebsd-boot  (174K)
       381     66584  nda0p2  efi  (33M)
     66965   2097152  nda0p3  freebsd-swap  (1.0G)
   2164117  60750403  nda0p4  freebsd-zfs  (29G)

```

To expand the disk/partition/pool this is the guide You are looking for – [**Expand GELI Encrypted Bhyve VM ZFS Disk**](https://vermaden.wordpress.com/2026/06/17/expand-geli-encrypted-bhyve-vm-zfs-disk/) – just omit the GELI part as its not used here.

Back to the VM configuration.

```
root@gitlab:~ # cat /etc/rc.conf
# NETWORK
  hostname="gitlab.local"
  ifconfig_vtnet0="inet 10.1.1.44/24 up"
  defaultrouter="10.1.1.1"

# DAEMONS
  zfs_enable="YES"

root@gitlab:~ # sed -i '' s/quarterly/latest/g /etc/pkg/FreeBSD.conf

root@gitlab:~ # echo nameserver 1.1.1.1 > /etc/resolv.conf

root@gitlab:~ # netstat -Win -f inet
Name     Mtu Network      Address      Ipkts Ierrs Idrop    Opkts Oerrs  Coll
vtnet0     - 10.1.1.0/24  10.1.1.44      905     -     -      466     -     -
lo0        - 127.0.0.0/8  127.0.0.1   633774     -     -   633774     -     -

```

Packages
==========

Needed packages installation.

```
root@gitlab:~ # \
  pkg install -y \
    gitlab-ce \
    postgresql18-server \
    postgresql18-client \
    postgresql18-contrib \
    nginx \
    redis

```

PostgreSQL
==========

Now PostgreSQL database setup.

```
root@gitlab:~ # service postgresql enable
root@gitlab:~ # service postgresql initdb
root@gitlab:~ # service postgresql start
root@gitlab:~ # psql -d template1 -U postgres -c "CREATE USER git CREATEDB SUPERUSER PASSWORD 'password';"
root@gitlab:~ # psql -d template1 -U postgres -c "CREATE DATABASE gitlabhq_production OWNER git;"

```

Now lets try to connect to new database with new user.

```
root@gitlab:~ # psql -U git -d gitlabhq_production
psql (18.4)
Type "help" for help.

gitlabhq_production=#

```

Seems to work.

Now connect to PostgreSQL GitLab database and enable **pg\_trgm** extension.

```
root@gitlab:~ # psql -U postgres -d gitlabhq_production -c "CREATE EXTENSION IF NOT EXISTS pg_trgm;"
root@gitlab:~ # psql -U postgres -d gitlabhq_production -c "CREATE EXTENSION IF NOT EXISTS btree_gist;"
root@gitlab:~ # psql -U postgres -d gitlabhq_production -c "CREATE EXTENSION IF NOT EXISTS plpgsql;"

```

Next enable 200 connections to PostgreSQL database.

```
root@gitlab:~ # psql -U postgres -c "ALTER SYSTEM SET max_connections TO '200';"
root@gitlab:~ # psql -U postgres -c "SELECT pg_reload_conf();"
root@gitlab:~ # service postgresql restart

```

Verify it is now set to 200.

```
root@gitlab:~ # psql -U postgres -c "show max_connections;"
 max_connections
-----------------
 200
(1 row)

```

Redis
==========

Setup Redis config.

```
root@gitlab:~ # echo 'unixsocket /var/run/redis/redis.sock' >> /usr/local/etc/redis.conf

```

Grant permission to socket to all members of the **redis** group.

```
root@gitlab:~ # echo 'unixsocketperm 770' >> /usr/local/etc/redis.conf

```

Add **git** user to **redis** group.

```
root@gitlab:~ # pw groupmod redis -m git

```

Allow Redis to be started and start it.

```
root@gitlab:~ # service redis enable
root@gitlab:~ # service redis start

```

GitLab
==========

Find number of CPU cores.

```
root@gitlab:~ # sysctl hw.ncpu
hw.ncpu: 4

```

Change amount of workers to 4 next.

```
root@gitlab:~ # grep '^workers' /usr/local/www/gitlab/config/puma.rb
workers 4

```

Configure Git global settings for **git** user.

```
root@gitlab:~ # su -l git -c "git config --global core.autocrlf input"

```

Disable **'git gc --auto'** because GitLab already runs **'git gc'** when needed.

```
root@gitlab:~ # su -l git -c "git config --global gc.auto 0"

```

Enable **packfile** bitmaps.

```
root@gitlab:~ # su -l git -c "git config --global repack.writeBitmaps true"

```

Enable push options.

```
root@gitlab:~ # su -l git -c "git config --global receive.advertisePushOptions true"

```

Enable **fsyncObjectFiles** to reduce risk of repository corruption if server crashes.

```
root@gitlab:~ # su -l git -c "git config --global core.fsync objects,derived-metadata,reference"

```

Make sure SSH directory exists for GitLab user.

```
root@gitlab:~ # su -l git -c "mkdir -p /usr/local/git/.ssh"

```

Make sure repositories directory exists with correct permissions.

```
root@gitlab:~ # su -l git -c "mkdir -p /usr/local/git/repositories"
root@gitlab:~ # chown git:git /usr/local/git/repositories
root@gitlab:~ # chmod 2770 /usr/local/git/repositories

```

Change passwords.

```
root@gitlab:~ # sed -i '' -e 's/secure password/password/g' /usr/local/www/gitlab/config/database.yml

```

Show used passwords.

```
root@gitlab:~ # grep password: /usr/local/www/gitlab/config/database.yml
    password: "password"
    password: "password"
    password: "password"
    password: "password"
    password: "password"
    password: "password"
    password:
    password:

```

Proper owner for GitLab shell.

```
root@gitlab:~ # chown git /usr/local/share/gitlab-shell

```

Setup GitLab with its password.

```
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && env DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake gitlab:setup RAILS_ENV=production GITLAB_ROOT_PASSWORD=password"
(...)
Do you want to continue (yes/no)? yes
(...)

Could not create the default administrator account:

--> Password must not contain commonly used combinations of words and letters

```

I wanted this guide to be a generic setup – with ‘must to change’ password as **password** but GitLab knows better – lets cope with that.

Lets try something more sophisticated:

```
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && env DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake gitlab:setup RAILS_ENV=production GITLAB_ROOT_PASSWORD=GtFO/wTh!sBu112!t"

(...)
Do you want to continue (yes/no)? yes

Dropped database 'gitlabhq_production'
Created database 'gitlabhq_production'

== Seed from /usr/local/www/gitlab/db/fixtures/production/001_application_settings.rb
Creating the default ApplicationSetting record.
== /usr/local/www/gitlab/db/fixtures/production/001_application_settings.rb took 0.70 seconds

== Seed from /usr/local/www/gitlab/db/fixtures/production/002_default_organization.rb

OK
== /usr/local/www/gitlab/db/fixtures/production/002_default_organization.rb took 0.08 seconds

== Seed from /usr/local/www/gitlab/db/fixtures/production/003_admin.rb
Administrator account created:

login:    root
password: ******

== /usr/local/www/gitlab/db/fixtures/production/003_admin.rb took 2.61 seconds

== Seed from /usr/local/www/gitlab/db/fixtures/production/010_settings.rb
Saved CI JWT signing key
Saved CI Job Token signing key
== /usr/local/www/gitlab/db/fixtures/production/010_settings.rb took 0.67 seconds
== Seeding took 4.06 seconds
root@gitlab:~ # echo $?
0

root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && rake gitlab:env:info RAILS_ENV=production"
you have mail

System information
System:         
Current User:   git
Using RVM:      no
Ruby Version:   3.4.9
Gem Version:    4.0.15
Bundler Version:4.0.15
Rake Version:   13.4.2
Redis Version:  8.8.0
Sidekiq Version:7.3.9
Go Version:     unknown

GitLab information
Version:        19.1.1
Revision:       Unknown
Directory:      /usr/local/www/gitlab
DB Adapter:     PostgreSQL
DB Version:     18.4
URL:            http://localhost
HTTP Clone URL: http://localhost/some-group/some-project.git
SSH Clone URL:  git@localhost:some-group/some-project.git
Using LDAP:     no
Using Omniauth: yes
Omniauth Providers:

GitLab Shell
Version:        14.54.0
Repository storages:
- default:      unix:/usr/local/www/gitlab/tmp/sockets/private/gitaly.socket
GitLab Shell path:              /usr/local/share/gitlab-shell

(...)

```

The terminal output is much more colorful.

<img data-attachment-id="10464" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-install-yes/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png" data-orig-size="939,962" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-install-yes" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png?w=939" class="alignnone size-full wp-image-10464" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png" alt="" width="625" height="640" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png?w=625&amp;h=640 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png?w=146&amp;h=150 146w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png?w=293&amp;h=300 293w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png?w=768&amp;h=787 768w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-install-yes.png 939w" sizes="(max-width: 625px) 100vw, 625px">

Better.

Now lets start it.

```
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && rake gitlab:env:info RAILS_ENV=production"

```

Compile needed assets … it will take some time.

If something breaks … just run it again – should help.

```
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && yarn config set python /usr/local/bin/python3.12"
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && yarn install --production --pure-lockfile --ignore-optional"
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && node scripts/frontend/infection_scanner/infection_scanner.mjs"
root@gitlab:~ # su -l git -c "cd /usr/local/www/gitlab && RAILS_ENV=production NODE_ENV=production USE_DB=false SKIP_STORAGE_VALIDATION=true bundle exec rake gitlab:assets:compile"

```

Remove superuser rights from PostgreSQL database user.

```
root@gitlab:~ # psql -d template1 -U postgres -c "ALTER USER git WITH NOSUPERUSER;"

```

… and enable and start GitLab service.

```
root@gitlab:~ # service gitlab enable
root@gitlab:~ # service gitlab start
GitLab Registry Key missing. Generating...
(...)
Starting GitLab web server (puma)
Starting GitLab Sidekiq
Starting GitLab Workhorse
Starting Gitaly
(...)
Started in 53s.
The GitLab web server with pid 70182 is running.
The GitLab Sidekiq job dispatcher with pid 72791 is running.
The GitLab Workhorse with pid 74932 is running.
Gitaly with pid 76120 is running.
GitLab and all its components are up and running.

```

Nginx
==========

Site Configuration – include provided configuration in your Nginx configuration.

```
root@gitlab:~ # vi /usr/local/etc/nginx/nginx.conf

```

Within **'http'** configuration block add this:

```
include       /usr/local/www/gitlab/lib/support/nginx/gitlab;

```

Looks more or less like this.

```
root@gitlab:~ # diff -u /usr/local/etc/nginx/nginx.conf.ORG /usr/local/etc/nginx/nginx.conf
--- /usr/local/etc/nginx/nginx.conf.ORG 2026-07-07 09:46:08.835333000 +0000
+++ /usr/local/etc/nginx/nginx.conf     2026-07-07 09:46:32.884929000 +0000
@@ -37,6 +37,8 @@

     #gzip  on;

+    include       /usr/local/www/gitlab/lib/support/nginx/gitlab;
+
     server {
         listen       80;
         server_name  localhost;

```

Validate Nginx config file.

```
root@gitlab:~ # nginx -t
nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful

```

This above is the message You expect to see.

Next enable and start Nginx server.

```
root@gitlab:~ # service nginx enable
root@gitlab:~ # service nginx restart

```

Final GitLab Tweaks
==========

Next create GitLab secret.

```
root@gitlab:~ # su -l git -c "openssl rand -base64 32 > /usr/local/www/gitlab/.gitlab_pages_secret"

root@gitlab:~ # chmod 640          /usr/local/www/gitlab/.gitlab_pages_secret

root@gitlab:~ # chgrp gitlab-pages /usr/local/www/gitlab/.gitlab_pages_secret

root@gitlab:~ # cat /usr/local/www/gitlab/.gitlab_pages_secret
p+IUsbCnDrpltlyPGq8gBzrHIkKN3++/CD+4C76Wlnw=

```

Lets check who is listening and on which port.

```
root@gitlab:~ # sockstat -l4
USER     COMMAND      PID FD PROTO LOCAL ADDRESS         FOREIGN ADDRESS      
www      nginx      15826  8 tcp4  *:80                  *:*                  
root     nginx      15825  8 tcp4  *:80                  *:*                  
git      ruby34      2224 11 tcp4  127.0.0.1:8082        *:*                  
git      ruby34      2223 16 tcp4  127.0.0.1:8092        *:*                  
redis    redis-serv  1143  6 tcp4  127.0.0.1:6379        *:*                  
postgres postgres    1084  7 tcp4  127.0.0.1:5432        *:*                  
root     syslogd      914  7 udp4  *:514   

```

GitLab Web Interface
==========

We can now access the GitLab web interface finally.

Login with **root** user and **GtFO/wTh!sBu112!t** password.

<img data-attachment-id="10465" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-www-01/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png" data-orig-size="686,460" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-www-01" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png?w=686" class="alignnone size-full wp-image-10465" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png" alt="" width="625" height="419" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png?w=625&amp;h=419 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png?w=150&amp;h=101 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png?w=300&amp;h=201 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-01.png 686w" sizes="(max-width: 625px) 100vw, 625px">

You can just click **Skip** here and cover it later.

<img loading="lazy" data-attachment-id="10466" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-www-02/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png" data-orig-size="686,520" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-www-02" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png?w=686" class="alignnone size-full wp-image-10466" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png" alt="" width="625" height="474" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png?w=625&amp;h=474 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png?w=150&amp;h=114 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png?w=300&amp;h=227 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-02.png 686w" sizes="auto, (max-width: 625px) 100vw, 625px">

Same here.

<img loading="lazy" data-attachment-id="10467" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-www-03/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png" data-orig-size="686,520" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-www-03" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png?w=686" class="alignnone size-full wp-image-10467" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png" alt="" width="625" height="474" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png?w=625&amp;h=474 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png?w=150&amp;h=114 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png?w=300&amp;h=227 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-03.png 686w" sizes="auto, (max-width: 625px) 100vw, 625px">

There are some **Acknowledgements** here to be taken care of.

<img loading="lazy" data-attachment-id="10468" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-www-04/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png" data-orig-size="686,602" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-www-04" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png?w=686" class="alignnone size-full wp-image-10468" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png" alt="" width="625" height="548" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png?w=625&amp;h=548 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png?w=150&amp;h=132 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png?w=300&amp;h=263 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-04.png 686w" sizes="auto, (max-width: 625px) 100vw, 625px">

Seems its all ready.

<img loading="lazy" data-attachment-id="10469" data-permalink="https://vermaden.wordpress.com/2026/07/09/gitlab-on-freebsd/freebsd-gitlab-www-05/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png" data-orig-size="686,602" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="freebsd-gitlab-www-05" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png?w=686" class="alignnone size-full wp-image-10469" src="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png" alt="" width="625" height="548" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png?w=625&amp;h=548 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png?w=150&amp;h=132 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png?w=300&amp;h=263 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/07/freebsd-gitlab-www-05.png 686w" sizes="auto, (max-width: 625px) 100vw, 625px">

You now have your GitLab instance ready to be used for whatever you want to use it for.

The final **/etc/rc.conf** config file after all these actions looks as follows.

```
root@gitlab:~ # cat /etc/rc.conf
# NETWORK
  hostname="gitlab.local"
  ifconfig_vtnet0="inet 10.1.1.44/24 up"
  defaultrouter="10.1.1.1"

# DAEMONS
  zfs_enable="YES"
  postgresql_enable="YES"
  redis_enable="YES"
  gitlab_enable="YES"
  nginx_enable="YES"

```

Summary
==========

I assume You will want to add some certificate to Nginx config to make it HTTPS way … and that is a good thing to start.

Not much more to be added here – feel free to share Your thoughts of course.

EOF