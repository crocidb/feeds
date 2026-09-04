+++
title = "Using {Blocks} in Rust & Go for Fun & Profit"
description = 'Did you know you can just whip out curly-braces all over the place in Rust and Go?a := 1a = 2{ b := 1 }b := 2let mut a = 1;a = 2;{ let b = 1; };let b = 2;let c = {  let mut d = 1;  d = 2;  d};But why on Earth would you even want to do this?Creating "Construction-Zo'
date = "2021-12-28T00:00:00Z"
url = "https://taylor.town/code-blocks"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.716587066Z"
seen = true
+++

Did you know you can just whip out curly-braces all over the place in Rust and Go?

```
a := 1
a = 2

{ b := 1 }
b := 2
```

```
let mut a = 1;
a = 2;

{ let b = 1; };
let b = 2;

let c = {
  let mut d = 1;
  d = 2;
  d
};
```

But why on Earth would you even want to do this?

---

Creating "Construction-Zones"
----------

When you're creating a variable that demands multiple initialization steps, it's tider to tuck the details into a block:

```
// before
let person = Person(id);
person.authenticate(token).await;
let raw_email = person.fetchEmail().await;
let email = Email.parse(email);
```

```
// after
let email = {
  let person = Person(id);
  person.authenticate(token).await;
  let raw_email = person.fetchEmail().await;
  Email.parse(email)
}
```

In this example, it's obvious that the "end-goal" is `email`. At a quick-glance, you can see which variables are important, and which are intermediate ephemera.

Containing Side-Effects and Error-Handling
----------

Every golang programmer knows the pain of juggling `result` and `err` variables. With blocks, you can tidily handle each `err` and other variables without worrying about weird assignment problems with `:=` and `=`:

```
id := 123
firstName := "John"
lastName := "Smith"

{
  result, err := db.Exec(
    `UPDATE usr SET first_name = $2 WHERE id = $1`,
    id,
    firstName,
  )
  if result.RowsAffected() = 0 || err != nil {
    return err
  }
}

{
  result, err := db.Exec(
    `UPDATE usr SET last_name = $2 WHERE id = $1`,
    id,
    lastName,
  )
  if result.RowsAffected() = 0 || err != nil {
    return err
  }
}
```

Restricting Variable Lifetimes
----------

I like creating tidy "workspaces" for each group of intermediate variables:

```
// define vars
// do stuff with vars
{
  // define intermediate vars
  // manipulate top-level vars
}
// do more stuff with vars
{
  // define intermediate vars
  // manipulate top-level vars
}
// do even more stuff with vars
```

For example:

```
email := "j.smith@example.com"

usr := Usr{}
{
  var usrId int
  {
    err := db.QueryRow(
      `SELECT usr_id FROM usr_email WHERE email = $1`,
      email,
    ).Scan(&usrId)
    if err != nil {
      return err
    }
  }

  {
    err := db.QueryRow(
      `SELECT * FROM usr WHERE id = $1`,
      usrId,
    ).Scan(&usr)
    if err != nil {
      return err
    }
  }
}
```

In this very contrived example, you can easily see the purpose of everything just by glancing at the general structure:

* `email` is at the beginning with an explicit value, so it's a given input
* `usr` is declared empty, so the block directly beneath it will define it
* `usrId` is declared empty, so the block directly beneath it will define it
* `usr` and `email` are the only variables that we need to care about after this section

---

Conclusion
----------

Use `{}` blocks to prevent your variables from leaking everywhere.

Your friends and coworkers will thank you.