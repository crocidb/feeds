+++
title = "Pseudoprose"
description = "Pseudoprose is pseudocode for writers."
date = "2023-11-14T00:00:00Z"
url = "https://taylor.town/pseudoprose"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.466605538Z"
seen = true
+++

```
[[

pseudoprose is pseudocode[1] for writers.

## how to

- write english, spanish, whatever.
- grammar optional.
- markdown encouraged.
- embed in any doc with `[[...]]` brackets.
- use `{...}` for comments.
- use `<<...>>` for LLM instructions.
- "tk" means "todo".

## why

- jot notes/ideas quickly.
- semantics over syntax.
- less text to edit.
- foist gruntwork on llms.

## tips

pseudoprose makes better writers.

my advice rests on unsubstantiated claims:

<<create table-of-contents from h3 titles below.>>

### build with svo.

study sentences.
svo<a href="#footnote-2"><sup>[2]</sup></a> makes solid foundation.
practice with toki pona[^3].

construct lean subjects and objects.
choose load-bearing adjectives.

erect compound sentences from basic clauses.
writers overuse commas. {commas are for cowards.}
omit "and"/"but"/"so" without adding ambiguity.

### celebrate strong verbs.

strong verbs bear weight.
"is"/"are"/"do" laze around.

use adverbs sparingly.
e.g. prefer "rocketed" over "went fast".

### create arguments.

structure your thoughts.

form propositions[^4],
qualify opinions,
cite axioms,
etc.

hunt for holes; the essay writes itself.

### expand fractally.

write via nondeterministic recursive algorithm.
perform any transformation until satisfied:
- write a sentence.
- replace weak sentence with more sentences.
- delete nonsense.

e.g.
"she slept."
becomes
"she dreamt of clowns. she woke up in her car."

### qualify later.

watch out for implied qualifications.
"people eat" does not equal "most people eat".

"usually" wrecks text.
don't water down verbs.
make subject/object more specific.

always avoid superlatives.

### measure twice, prompt once.

gpt4 produced the markdown at <https://taylor.town/pseudoprose>.

tweak the following prompt:
```
I'm going to provide pseudoprose as input.
I want a well-formatted markdown document as output.

- Use my exact words unless there is a grammatical mistake.
- When possible, replace footnotes with markdown links.
- Omit everything in braces (e.g. {this is a comment}).
- Replace anything in double angle-brackets with its output.
- "tk" means "todo". Replace every "tk" with a sensible guess.

example 1:
"[[she hid her wedding ring in a bag of doritos.]]"
"She hid her wedding ring in a bag of Doritos."

example 2:
"[[sarah likes coffee. sam prefers tea {chai?}.]]"
"Sarah likes coffee. Sam prefers tea."

example 3:
"[[fido licked his paw and barked. <<change fido to a cat>>]]"
"Fido licked his paw and meowed."

example 4:
"[[i wore a fuzzy green tk to prom.]]"
"I wore a fuzzy green jacket to prom."

input:
```

---

[^1]: https://en.wikipedia.org/wiki/Pseudocode

[^2]: https://en.wikipedia.org/wiki/Subject–verb–object_word_order

[^3]: https://en.wikipedia.org/wiki/Toki_Pona

[^4]: https://en.wikipedia.org/wiki/Proposition

]]
```

---

Pseudoprose is [pseudocode](https://en.wikipedia.org/wiki/Pseudocode) for writers.

How to
----------

* Write in English, Spanish, whatever.
* Grammar is optional.
* Markdown is encouraged.
* Embed in any document with `[[...]]` brackets.
* Use `{...}` for comments.
* Use `<<...>>` for LLM instructions.
* "tk" means "todo".

Why
----------

* Jot down notes/ideas quickly.
* Focus on semantics over syntax.
* Less text to edit.
* Offload grunt work to LLMS.

Tips
----------

Pseudoprose makes better writers.

My advice rests on unsubstantiated claims:

1. [Build with SVO](#build-with-svo)
2. [Celebrate Strong Verbs](#celebrate-strong-verbs)
3. [Create Arguments](#create-arguments)
4. [Expand Fractally](#expand-fractally)
5. [Qualify Later](#qualify-later)
6. [Measure Twice, Prompt Once](#prompt-once)

### Build with SVO ###

Study sentences. [SVO](https://en.wikipedia.org/wiki/Subject–verb–object_word_order) makes a solid foundation. Practice with [Toki Pona](https://en.wikipedia.org/wiki/Toki_Pona).

Build lean subjects and objects. Choose load-bearing adjectives.

Erect compound sentences from basic clauses. Writers overuse commas. Omit "and"/"but"/"so" without adding ambiguity.

### Celebrate Strong Verbs ###

Strong verbs bear weight. "Is"/"are"/"do" laze around.

Use adverbs sparingly. Prefer "rocketed" over "went fast".

### Create Arguments ###

Structure your thoughts.

Form [propositions](https://en.wikipedia.org/wiki/Proposition), qualify opinions, cite axioms, etc.

Hunt for holes; the essay writes itself.

### Expand Fractally ###

Write via a nondeterministic recursive algorithm. Perform any transformation until satisfied:

* Write a sentence.
* Replace weak sentence with more sentences.
* Delete nonsense.

Example: "She slept." becomes "She dreamt of clowns. She woke up in her car."

### Qualify Later ###

Watch out for implied qualifications. "People eat" does not equal "most people eat".

"Usually" wrecks text. Don't water down verbs. Make the subject/object more specific.

Always avoid superlatives.

### Measure Twice, Prompt Once. ###

GPT-4 produced the markdown at [https://taylor.town/pseudoprose](https://taylor.town/pseudoprose).

Tweak the following prompt:

```
I'm going to provide pseudoprose as input.
I want a well-formatted markdown document as output.

- Use my exact words unless there is a grammatical mistake.
- When possible, replace footnotes with markdown links.
- Omit everything in braces (e.g. {this is a comment}).
- Replace anything in double angle-brackets with its output.
- "tk" means "todo". Replace every "tk" with a sensible guess.

example 1:
"[[she hid her wedding ring in a bag of doritos.]]"
"She hid her wedding ring in a bag of Doritos."

example 2:
"[[sarah likes coffee. sam prefers tea {chai?}.]]"
"Sarah likes coffee. Sam prefers tea."

example 3:
"[[fido licked his paw and barked. <<change fido to a cat>>]]"
"Fido licked his paw and meowed."

example 4:
"[[i wore a fuzzy green tk to prom.]]"
"I wore a fuzzy green jacket to prom."

input:
```