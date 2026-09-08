+++
title = "Code generation that just works"
description = "About nine months ago, my son said he wanted to make a video game. He said it was called Exploding Kitties. We made it together on my computer. He described the gameplay and drew the graphics. I vibed the code. The game basically worked. But we had to build it in small pieces. An"
date = "2026-03-27T00:00:00Z"
url = "https://maryrosecook.com/blog/post/code-generation-that-just-works"
author = ""
text = ""
lastupdated = "2026-03-29T12:38:08.897210003Z"
seen = true
+++

About nine months ago, my son said he wanted to make a video game. He said it was called Exploding Kitties. We made it together on my computer. He described the gameplay and drew the graphics. I vibed the code. The game basically worked. But we had to build it in small pieces. And, periodically, I had to spend time in the guts of the code, getting it back on the rails. Unifying two ways of doing the same thing. Fixing gnarlier bugs. Disentangling the game code from the engine.

Today, I know that we’d be able to one-shot Exploding Kitties. The first reason: models and agent harnesses produce much higher intelligence. But, the second reason, the one I want to talk about, is the supporting techniques and environment.

I’ve built a new game-making tool called Fountain. You can one-shot any simple mobile arcade game. Or, you can iterate your way to a more complex game and the code stays on the rails over many turns. Here’s why it works -

### A framework that supplies decisions and built-ins ###

Every game is given a game framework upfront.

This framework encodes many decisions. That game entities have a certain data shape. That behavior abstraction is done with prototypal inheritance. That the coordinates of an entity represent its top left.

This keeps the code generation aligned.

And this framework includes generally useful built-ins. An update/event/draw loop. A WebGL canvas render surface. A collision detection and resolution system. A particle system. A system to detect input.

This reduces the amount of code that must be generated.

### A manipulable artifact ###

Prompting can be tiresome. Language is ambiguous. The model can interpret a prompt in a way the game designer didn’t intend, and make the wrong change. Language is clumsy. It’s hard to precisely indicate any point in a continuum. A color. A point. An amount.

But there’s a solution. Do it the old way. Give the game developer a user interface through which to express their intent. A color picker to choose the color of the water. A slider to select the density of the spray ejected by a speedboat. A drag and drop interaction to move game entities into the right place.

Some of these are framework built-ins. Every game needs to position entities. But many are generated dynamically by the model, based on the exact needs of a game.

### A constrained domain ###

An arcade game with vector graphics on a browser running on a mobile touch device in portrait at a 16x9 aspect ratio. That’s my target domain.

Even within these tight constraints, there are infinite possibilities for expression. But, now, the chances of success are much higher. The framework can make decisions upfront so I can reduce model drift whilst imposing minimal limits on the possibilities. And the framework can supply built-ins that are highly likely to be useful.

### Authentic verification ###

When generating code, it’s becoming common practice to build a means of verification into each prompt. Telling the model to write tests. Telling the model to drive the browser to try a new feature. Naturally, for code generation just that works, we also require verification of each change.

The framework has a little test harness that takes a stream of inputs and some frame numbers indicating when screenshots should be captured. The game is then run heedlessly - several seconds of gameplay in just a few tens of milliseconds - and the screens are captured. Then the model can do what it does best: make an interpretation of whether some fuzzy criteria have been achieved.

The model can, for example, build a speedboat that sprays water behind it, run the game, send input to make the speed boat go, grab a screenshot and decide, Does that look like a boat spraying water?

–

So, better models and harnesses. Yes. But, also, an environment and some techniques that increase alignment to maximize the chance of success. Because of this, I can prompt a game at Castro station, and play it by Montgomery.