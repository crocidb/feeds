+++
title = "Programs and Intent"
description = "What does this program do? At the most reduced level, one could say that a program’s behavior is defined by the effect it has on the hardware running it. That’s not very useful however; when we’re programming, we often have to deal with legacy code and tease out the original inte"
date = "2021-11-09T00:00:00Z"
url = "https://lambdaland.org/posts/2021-11-09_programs_and_intent/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.292618590Z"
seen = false
+++

What does this program do? At the most reduced level, one could say that a program’s behavior is defined by the effect it has on the hardware running it. That’s not very useful however; when we’re programming, we often have to deal with legacy code and tease out the original intent of the code.

Saying that the meaning of a program is entirely encapsulated by the code is saying that the intent and the implementation are the same. They so rarely are!

Today I found some Elixir code that looked like the following:

```
@spec all_have_key?(lst :: [%{}], needed_key :: String.t()) :: boolean()
def all_have_key?(lst, needed_key) do
  lst
  |> Enum.map(fn m -> m |> Map.keys() |> Enum.any?(fn k -> k == needed_key end) end)
  |> Enum.all?()
end
```

(Note, I just threw that together—possible syntax errors in there.)

What is this code trying to do? It’s trying to check that each map in a list has a given key and return true or false on that condition. I don’t think the code even had a `@spec` to help explain that: all I had was the function name (which was not as clear as `all_have_key`) and the source.

After a few moments of reflection, I rewrote it to this:

```
@spec all_have_key?(lst :: [%{}], needed_key :: String.t()) :: boolean()
def all_have_key?(lst, needed_key) do
  lst
  |> Enum.map(&Map.has_key?(&1, needed_key))
  |> Enum.all?()
end
```

That big long complicated bit has a built-in function. The built-in function is more efficient because it doesn’t traverse the entire list of keys searching for a match: with a map, you get O(1) lookup time.

So what does a program mean? I’m pretty confident that I preserved the intended meaning of this program. But what’s a better way to express that intent?

Tests are useful, but they don’t capture everything. While I think this function was tested, no test can ever ensure 100% preservation of intent. *Tests can only find witnesses of meaning mismatches.*

Type systems are helpful too. But types come in varying degrees of precision: some languages give you an `Int`, while others give you `Int` or `Nat` or `∈ {1, 2, 3}`. More powerful type systems let you express more of your intent in a way that can be mechanically checked, but they tend to also be more burdensome.

This is an open question that I know there’s a lot of ongoing research around. I’m excited to see what I find!