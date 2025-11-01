---
title = "A type checking error in Elixir 1.18"
description = "Although I’m a big Elixir fan, the lack of static typing has always been my biggest annoyance (and why I think Gleam is so cool). I think static typing helps catch bugs earlier and in an automated way, leading to less buggy software and saves time in the lon"
date = "2025-01-18T19:07:28Z"
url = "http://jonashietala.se/blog/2024/12/30/type_checking_in_elixir_118/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.128003625Z"
seen = true
---

Although I’m a big Elixir fan, the lack of static typing has always been my biggest annoyance (and why I think [Gleam](https://gleam.run/) is so cool). I think static typing helps catch bugs earlier and in an automated way, leading to less buggy software and saves time in the long run.

To my great joy Elixir is working on [a new type system](https://elixir-lang.org/blog/2023/06/22/type-system-updates-research-dev/) that will hopefully give us the early type checking errors I’ve been craving for. The system has been rolled out in steps [since v1.17](https://elixir-lang.org/blog/2024/06/12/elixir-v1-17-0-released/) and when I migrated to [v1.18](https://elixir-lang.org/blog/2024/12/19/elixir-v1-18-0-released/) I found my first type checking warning that I wanted to highlight.

[Comparison with structs](#Comparison-with-structs)
----------

This is the offending code with the corresponding warning:

```
def get_surrounding_events_as_dt(events, now = %DateTime{}) do
  time = DateTime.to_time(now)
  next_i = Enum.find_index(events, fn {_, event_time} -> time < event_time end) || 0

```

```
warning: comparison with structs found:

    time < event_time

given types:

    dynamic(%Time{}) < dynamic()

where "event_time" was given the type:

    # type: dynamic()
    # from: lib/haex/sun.ex
    {_, event_time}

where "time" was given the type:

    # type: dynamic(%Time{})
    # from: lib/haex/sun.ex:88:10
    time = DateTime.to_time(now)

Comparison operators (>, <, >=, <=, min, and max) perform structural and not semantic comparison.
Comparing with a struct won't give meaningful results.
Structs that can be compared typically define a compare/2 function within their modules that
can be used for semantic comparison.

typing violation found at:
│
│     next_i = Enum.find_index(events, fn {_, event_time} -> time < event_time end) || 0
│                                                                 ~

```

(The type checker cannot yet resolve `event_time` to the `Time` struct, leaving it as `dynamic()` in the text above.)

The issue here as that `<` isn’t overloaded for the `Time` struct (like it would be in for instance Rust) and will instead perform structural comparison.

You should use `Time.before?` instead of `<` (and `DateTime.before` for `DateTime` etc).

As it happens for `Time` this doesn’t seem to be an issue as the structure *happens* to perform the comparisons in the same order as `Time.before?`, which this test verifies:

```
test "check_times" do
  times =
    Enum.zip([0..23, 0..59, 0..59])
    |> Enum.map(fn {h, m, s} -> Time.new!(h, m, s) end)

  for a <- times do
    for b <- times do
      assert a < b == Time.before?(a, b)
    end
  end
end

```

This is not the case for `DateTime`, which did cause a production bug in my home automation system, that my spouse complained about…

Remember this when you think about types: **type checking saves relationships**.

[My hope for the future](#My-hope-for-the-future)
----------

I’ve always disliked matching against atoms in Elixir as it’s so easy to make a mistake, for example like this:

```
case Supervisor.start_child(supervisor, child_spec) do
  {:error, {:already_stated, pid}} ->
    Logger.info("Got pid: #{inspect(pid)}")

```

(There’s a missing `r` in `:already_stated`.)

At the moment this doesn’t produce an error but I really hope we’ll reach this point sooner rather than later as I make these kinds of mistakes all the time. I think I catch most of these with tests but I’m sure some slip through.

I hope this isn’t that far away as the v1.18 type checker manages to catch a simpler case like this:

```
def num_to_descr(num) do
  case num do
    1 -> :one
    2 -> :two
    _ -> :many
  end
end

def print(num) do
  case num_to_descr(num) do
    :zero -> IO.puts("zero")
    x -> IO.puts("Other: #{x}")
  end
end

```

```
    warning: the following clause will never match:

        :zero

    because it attempts to match on the result of:

        num_to_descr(num)

    which has type:

        dynamic(:many or :one or :two)

    typing violation found at:
    │
 41 │       :zero -> IO.puts("zero")
    │       ~~~~~~~~~~~~~~~~~~~~~~~~

```