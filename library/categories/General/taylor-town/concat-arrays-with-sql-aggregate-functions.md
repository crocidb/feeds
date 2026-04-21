+++
title = "Concat Arrays with SQL Aggregate Functions"
description = 'create aggregate array\_concat\_agg(anycompatiblearray)'
date = "2024-03-31T00:00:00Z"
url = "https://taylor.town/array-concat-agg"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.314963263Z"
seen = true
+++

```
create aggregate array_concat_agg(anycompatiblearray) (
  sfunc = array_cat,
  stype = anycompatiblearray
);
```

Examples
----------

```
create table usr (
  usr_id int primary key,
  country text not null,
  fav_animals text[] not null
);

insert into usr (usr_id, country, fav_animals) values
(1, 'UK', '{Tiger, Wolf}'),
(2, 'AU', '{Kangaroo, Platypus}'),
(3, 'JP', '{Jaguar, Llama}'),
(4, 'UK', '{Fox, Badger}'),
(5, 'AU', '{Emu, Koala}'),
(6, 'JP', '{Tanuki, Koi}'),
(7, 'UK', '{Hedgehog, Robin}'),
(8, 'AU', '{Wombat, Shark}'),
(9, 'JP', '{Crane, Salamander}');
```

```
select
  country,
  array_concat_agg(fav_animals)
from usr
group by country;

-- ----+--------------------------------------------
--  JP | {Jaguar,Llama,Tanuki,Koi,Crane,Salamander}
--  AU | {Kangaroo,Platypus,Emu,Koala,Wombat,Shark}
--  UK | {Tiger,Wolf,Fox,Badger,Hedgehog,Robin}
```

```
select
  country,
  array_concat_agg(fav_animals)
    filter (where 'Emu' = any(fav_animals))
from usr
group by country;

-- ----+--------------
--  JP |
--  AU | {Emu,Koala}
--  UK |
```