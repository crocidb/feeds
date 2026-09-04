+++
title = "Easy Email Tokens in Pure Postgres"
description = '''select email\_token(now(), 'hello@example.com');'''
date = "2023-09-25T00:00:00Z"
url = "https://taylor.town/pg-email-token"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.495876107Z"
seen = true
+++

1. [Generate a secret.](#1)
2. [Add the token function.](#2)
3. [Create/send tokens.](#3)
4. [Verify tokens.](#4)

1. Generate a secret.
----------

Generate a random string using Bash…

```
openssl rand -base64 32
```

…or Postgres:

```
select string_agg(substr(c, (random() * length(c) + 1)::integer, 1), '')
from (values('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789')) as x(c)
, generate_series(1, 32)
```

2. Add the token function.
----------

```
create function email_token (ts timestamptz, email text) returns text
  language sql
  immutable
  returns null on null input
  return ''
    || extract(epoch from ts)::bigint
    || ':'
    || encode(
         sha256(( email || 'SECRET' || extract(epoch from ts)::bigint )::bytea),
         'base64'
       )
    ;
```

Make sure to replace `SECRET` with your secret from step 1!

With the code above each token will look something like this:

```
1695683829:Kr/BYcOyBifA6RvSp+EoK0isN7XkKk/dGkFHr27JKG8=
```

Feel free to use `hex` instead of `base64`, or `sha512` instead of `sha256`. Be wary of `md5`.

3. Create/send tokens.
----------

Generate email tokens when you register new users…

```
with u as (
  insert into usr (email, password)
  values ($1, crypt($2, gen_salt('bf', 8)))
  returning *
)
select usr_id, email_token(now(), email) from u;
```

…or use the function ad-hoc for any flow you need:

```
select email_token(now(), 'hello@example.com');
```

You'll need to send your user a link like this at some point:

```
<a href="https://taylor.town/verify-token?token=TOKEN">verify email</a>
```

4. Verify tokens.
----------

Use the following logic on an endpoint like `/verify-token`:

```
const token = request.url.searchParams.get("token");
const [usr] = await sql<{ usr_id: string }[]>`
  update usr
  set email_verified_at = now()
  where email_verified_at is null
    and to_timestamp(split_part(${token},':',1)::bigint) > now() - interval '2 days'
    and ${email} = email
    and ${token} = email_token(
      to_timestamp(split_part(${token},':',1)::bigint),
      email
    )
  returning usr_id
`;
```

There are multiple ways to pass `${email}` into this query:

* *Option #1:* Store the email address in cookie/session. Unfortunately, they won't be able to confirm their email from a different device without logging in again.
* *Option #2:* Remove the `${email} = email` line and Postgres will check all unverified emails. This is easiest to implement, but insecure and inefficient.
* *Option #3:* Pass the email address through the verification link via an additional search param like `&email=EMAIL`.