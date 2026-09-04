+++
title = "Moving my game project from C to Odin language"
description = "Some months ago, I got really fed up with C.Like, I don't hate C. Hating programming languages is silly. But it was way too much effort to do simple things like lists/hashmaps and other simple data structures and such.I decided to try this language called [Odin](https://odin-la"
date = "2024-11-02T00:00:00Z"
url = "https://akselmo.dev/posts/moving-from-c-to-odin/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.052423324Z"
seen = true
+++

Some months ago, I got really fed up with C.

Like, I don't *hate* C. Hating programming languages is silly. But it was way too much effort to do simple things like lists/hashmaps and other simple data structures and such.

I decided to try this language called [Odin](https://odin-lang.org/), which is one of these "Better C" languages. And I ended up liking it *so much* that I moved my game [Artificial Rage](https://codeberg.org/akselmo/artificial-rage) from C to Odin. Since Odin has support for Raylib too (like everything really), it was very easy to move things around.

Here's how it all went.. Well, what I remember the very least.

[Learning Odin](#learning-odin)
==========

Firstly I want to go through the things I learned while tinkering on Odin with separate project, since I didn't want to just go blindly in and decide I dislike the language.

Luckily, learning Odin was rather easy.

I am no programmer language enthusiast like many others may be, and I will make weird comparison and anecdotes. But this is my blog so deal with it.

I am not going through everything. Just the things that stuck to my mind the best.

[Backwards syntax](#backwards-syntax)
----------

You see, Odin is like taking C and then.. Writing it backwards. And remove the unnecessary cruft.

For example, in C you type `int variableName = 10`.

In Odin, you type `variableName: int = 10` or `variableName := 10`.

This was probably the most difficult part for me: Remembering that the name comes first then the type (if you dont let it be inferred automatically).

Functions are also called procedures or "procs." This sometimes still throws me off, but it's just semantic, they're essentially the same name, just less math-y name.

I still prefer the C way, but the only reasoning I have for it is that "it's what I learned."

### [Pointy pointers](#pointy-pointers) ###

This one I kinda like. In Odin, pointers are `^pointer` instead of `*pointer`.

Then when you want to deference the pointer, its `pointer^`. In some cases, like with Raylib, you have to feed the memory address with `&pointer`.

To have better understanding, look at the docs, I am bound to have something wrong in this blogpost anyway: [https://odin-lang.org/docs/overview/#pointers](https://odin-lang.org/docs/overview/#pointers)

[Lack of header files](#lack-of-header-files)
----------

When it comes to removing unnecessary cruft, one of the biggest things that made me happy was lack of header files.

I have ADHD. It's my excuse for having bad memory. When working with C, I often forgot to edit either the header file or the source file and then I was wondering why something fails to compile or otherwise acts weird... Juggling two files for one "programmatic unit" is stupid. I hate it.

In Odin it's all in the one file, so I don't forget it.

I know this is not a major revelation and people are like "wtf this is basic" but for me it was big deal!

[Building is not pain](#building-is-not-pain)
----------

In C, building requires either a shell script with some magic notation or CMake or Meson or XMake or Make or Autotools or..

You get the point. There's so many ways to do same thing because the original way is just not fun.

I've never enjoyed writing CMake files. I appreciate CMake, but I don't want to write the build systems. I just don't like setting up build systems in general, when I want to hack on a game on my limited time.

In Odin? `odin build .` or `odin run .`. That's it. It just does the thing.

Now if you are like me and love organizing your code into blocks and modules and whatever, you have to do things like `odin build ./src -collection:src=src -debug -out:./build/binary`.

This takes your collection of packages and spits out a debug build of your thing, then you can use LLDB to debug it.

Simple little commands you can stick into a `build.sh` and then just run that. Super simple, works well.

It's rather quick to build too!

[No package management is good, actually](#no-package-management-is-good-actually)
----------

Odin doesn't have built-in package manager. It doesn't need one.

Packages are folders of files. You can just plop it in your repo, then use some collection commands and It Just Works.

However you rarely even need to download third party packages from the internets!

Odin has a lot of nice core features for basically everything one needs, and then for more extra things, like Raylib, theres [vendored packages](https://pkg.odin-lang.org/vendor/).

So if you need something from Raylib, you just do `import rl "vendor:raylib"`. Then you have all the fun Raylib things under `rl.`.

For third party packages you can just use git submodules for example, so the packages are managed that way per project.

I honestly love this way of working. Batteries included like with Python, but if you need more stuff, you just take care of it yourself and make sure you only have what you need, instead of 1000 random packages.

[Moving my game from C to Odin](#moving-my-game-from-c-to-odin)
==========

In the end, moving the game project was quite simple. C and Odin are like very long distance relatives. They do similar things, but maybe in different ways. C likes to build things every time ground up, while Odin just provides you the niceties.

[Swapping syntaxes](#swapping-syntaxes)
----------

Surprisingly often, moving the code from C to Odin was just "transpiling" the C syntax to Odin.

I mostly had to change the name and type other way around, turn `void bla()` to `bla :: proc()` and so on.

This was the easy part, though I sometimes forgot I was writing Odin when I was looking at the old C code and had things wrong way around.

[Cyclic dependencies](#cyclic-dependencies)
----------

However, one caveat is that Odin really doesn't like cyclic dependencies. In C you could get away with having two files that import each other.

In Odin, if you have `src:game` package, and `src:scene` package, only one can rely on the other one. This means that if your `src:game` needs something from `src:scene`, then `src:scene` can't get stuff from `src:game`.

If you are organizing maniac like me, this can be difficult to deal with first. I wanted to create a package for everything in the game, but it turned out that this is not what Odin wants to do.

I am sure Odin devs have many opinions on this, but I'm still exploring. Many Odin devs seem to just have one package for their whole project, avoiding the cyclic dependencies completely.. Kinda like you do in C. I think that's also fine approach, as long as you remember having a consistent naming scheme like `EnemyEntity` and `WeaponEntity` etc etc.

What I did was I turned the packages into more a hierarchial style, so that a child package doesnt rely on it's parent.

```
Odin dependency diagram

+-------------->---------+  +-----------+
| Settings |   |  Game   |  | Utilities |
|----------+   +----|----+  +-----------|
|                   |                   |
--------------->----v----<---------------
|              |  Scene  |              |
|              +----|----+              |
|                   |                   |
|      +------------v--------------+    |
|      |         Entities          |    |
+------>                           <----+
       | Player, Weapon, Enemies.. |     
       +---------------------------+     

```

I know it's a bit messy, I tried my best with the diagram. But basically, nothing relies *back* to it's predecessor. Anything that *needs* to know about each other (enemy and player for example) is in same package.

* Game is our main loop, it just runs the show. It will likely be the one that toggles between game state and menu state.
* Settings is a config loader that just makes sure our things are accessible from anywhere.
* Utilities are procs that are commonly used, like creating bounding boxes.
* Scene generates data for all entities, like where they should be placed. It also updates entities when iterating over the scene.
* Entities have their shared update, where we use tagged unions (more of those later) to update whatever happens
  * Player, players weapons, projectiles, enemies, level walls and objects, pickup items..
  * These items need to know about each other so they're in same blob.

I am sure this creates a lot of opinions and different takes, someone will tell me this is horrible mess and I likely will agree.

But hey, it works. And I am quite happy with it.

With the C code, we had this instead:

```

C dependency diagram (mess)

               +----------------------------------+
+--------------|------------+                     |
|              |            |          +-------+  |
|              |            |          |       |  |
|     <--------+------------v----------+------>|  |
|     | Settings |   |  Game   |  | Utilities ||  |
|     |----------^   +----|----+  ^-----------||  |
|   +-------+    |        |       |           ||  |
|   | |-----|----|--->----v----<--|------------|  |
|   | |     |    |   |  Scene  |  |           ||  |
|   | |     |    |   ^----^----<-------------->|  |
|   | |     |    |   |    |       |           ||  |
|   | |     |+---v---v----v-------v------+    ||  |
|   | |     ||         Entity            |    ||  |
|   | v----<+>                           <----+|  |
|   |        | Player, Weapon, Enemies.. |     |  |
|   |        +---------------------------+     |  |
|   |                                          |  |
|   |                                          |  |
|   +------------------------------------------+  |
+-------------------------------------------------+

```

Honestly everything relied on each other. Remove one block, something breaks. In C it was way too easy to have these weird dependencies, and I am glad Odin basically told me to have some discipline and do things properly.

Now if I break something, it's way more predictable where the issue occurs and why.

In C breaking something in place A would break something in place XYZ.

This is not really C's fault, it's fault of my bad planning. But the fact that C doesn't really enforce me to have good planning is why it got that way.

[Tagged unions my beloved](#tagged-unions-my-beloved)
----------

In C, I wanted to use unions because they made sense for my faux-entity-component system.

There was a `struct` that holds `EntityType enum` and `Entity union` which holds all the different `structs` like `Player`, `Enemy`, `Item` etc..

This got bit messy over time and I had to rely a lot on this `EntityType enum` to make sure I am doing the right thing in right place. I had a lot of the following in C in various entity functions:

```

if (entity->type != EntityType.item)
{
	return;
}

```

Sure it works but eventually you forget to make that check and then it bites your ass.

In Odin, thanks to tagged unions, I could do following for example:

```
HandlePlayerPickup :: proc(entity: ^Entity) {
	destroyed := false
	#partial switch ent in entity.type {
	case ItemHealth:
		if (Player.health < PLAYER_MAX_HEALTH) {
			PlayerSetHealth(ent.healAmount)
			destroyed = true
		}
	case ItemAmmo:
		destroyed = WeaponAddAmmo(ent.ammoAmount, ent.ammoMorph)
	case ItemWeapon:
		pickedUp := WeaponPickup(ent.weaponType)
		ammoAdded := WeaponAddAmmo(ent.ammoAmount, ent.weaponType)
		destroyed = pickedUp || ammoAdded
	case ItemKey:
		destroyed = true
		Player.hasTeleportKey = true
	case:
		fmt.printfln("Unimplemented: %[0]v", entity.type)
	}
	if (destroyed) {
		entity.transform.isPickup = false
		entity.active = false
		Destroy(entity)
	}
}

```

This is such a nice way of handling unions. Every type has it's own proc related to the current action, so just go through a fun and quick switch ladder and do the action if we find that specific entity. We can also have default too, like that `case:` which prints that the thing is unimplemented. This actually helped me to catch a bug with the item pickup thing very quickly and I loved the experience.

[Strings actually exist](#strings-actually-exist)
----------

Due to having a HUD and config files, I have to do string handling.

In C this is misery. Anyone who has done string handling in C knows this. It's absolutely insane how a language in the year `[CURRENTYEAR]` has no proper string handling.

Anyway, instead of having do stuff like in C:

```
if (strcmp(key, "ceilingtexture") == 0)
{
	scene->ceilingPlaneTexture = LoadTexture(fullTexturePath);
	free(fullTexturePath);
	return true;
}

```

In Odin I could do just this:

```
	switch key
	{
	case "ceilingtexture":
		ceilingPlaneTexture = rl.LoadTexture(texturesPath)
		return true
...

```

Again our old friend lil switchy there, and its just simple and easy to read.

Even opening files is less pain.

C:

```
// Parse scene plane textures from level.cfg
void Scene_LoadSceneConfig(void)
{
	const char *fileName = "./assets/levels/level1.cfg";
	const int bufferSize = Utilities_GetFileCharacterCount(fileName);

	FILE *filePointer = fopen(fileName, "r");
	if (nullptr == filePointer)
	{
		printf("Failed to open level config file %s \n", fileName);
		fclose(filePointer);
		return;
	}

	char buffer[bufferSize];
	while (fgets(buffer, bufferSize, filePointer))
	{
		char key[bufferSize];
		char value[bufferSize];
		Utilities_ParseKeyValuePair(buffer, key, "=", value);

		if (!Scene_ParseConfig(key, value))
		{
			printf("Failed to parse level.cfg key-value: %s - %s \n", key, value);
		}
		else
		{
			printf("Parsed level.cfg key-value: %s - %s \n", key, value);
		}
	}
	fclose(filePointer);
}

```

Odin:

```
LoadSceneConfig :: proc() {
	fileName := "./assets/levels/level1.cfg"
	data, success := os.read_entire_file(fileName)

	if (!success) {
		fmt.printfln("Failed to open level config file %[0]v", fileName)
		return
	}

	sceneConfigText := string(data)
	sceneArr := strings.split_lines(sceneConfigText)
	for item in sceneArr {
		keyValuePair := strings.split(item, "=")
		if (len(keyValuePair) < 2) {
			continue
		}

		if (ParseConfig(keyValuePair[0], keyValuePair[1])) {
			fmt.printfln("Parsed level.cfg key-value: %[0]v - %[1]v", keyValuePair[0], keyValuePair[1])
		}
	}
}

```

It's just much easier to understand the Odin code, and I likely could implement that better still, since it's mostly recreation of the C code. But here you can see well how the two differ.

[Deferring defers](#deferring-defers)
----------

Defer is also a beautiful thing. Like I said, due to my ADHD I have trouble remembering things. So I often `malloc`, but rarely `free`. And this makes computers sad.

In Odin I can just do following:

```
txt := strings.clone_to_cstring(fmt.aprintf("%[0]v", entity.Player.health))
defer delete(txt)

```

And in the end of the block the delete is called. I don't have to remember to separately add it to end of the block.

However I think C23 is going to have a defer too? Some doc I found: [https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2589.pdf](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2589.pdf)

But yeah, it's really nice!

[Matrices are stored differently in C and Odin](#matrices-are-stored-differently-in-c-and-odin)
----------

One thing that REALLY stumped me was that matrices are handled differently in Raylib-Odin and Raylib-C:

* Odin, right handed, stored row major
* C, right handed, stored column major

This caused some problems with my custom camera code, but when I figured it out it got easier from there.

Here's couple tables to help you remember how they differ between C and Odin.

### [Column major](#column-major) ###

*Used by Raylib C*

|   | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| 0 |m0 |m4 |m8 |m12|
| 1 |m1 |m5 |m9 |m13|
| 2 |m2 |m6 |m10|m14|
| 3 |m3 |m7 |m11|m15|

### [Row major](#row-major) ###

*Used by Raylib Odin*

|   | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| 0 |m0 |m1 |m2 |m3 |
| 1 |m4 |m5 |m6 |m7 |
| 2 |m8 |m9 |m10|m11|
| 3 |m12|m13|m14|m15|

[Conclusions](#conclusions)
==========

Sadly I don't remember much else. I had a blast with moving the codebase, and when I was visiting [Akademy](https://akselmo.dev/posts/akademy-2024/), I did some game programming in a plane while I was super sleep deprived and still managed to get things work.

In general, moving from C to Odin was quite a pleasant and rather easy experience. The languages are rather similar but Odin takes the painful bits away, letting you to focus on the problem instead of wondering why something is going weirdly wrong again.

What's the most essential part of this movement, and why I did it, was that when I write C, I have to use much more effort to write it. I have to remember so many things, like updating headers and sources, updating CMake files, remembering to free in the end of block instead of deferring, having to create my own systems for everything instead of using common datatypes...

There's so much mental overhead in C. Odin takes that mental overhead away mostly and just lets you concentrate on the problem. And it's so much more effortless to write too!

I could feel my motivation come back and I am always excited to write more Odin code. With C code, I only enjoy it with very small projects, like couple files.. But with larger projects it gets overwhelming really fast.

On top of that, staring at C++ for my dayjob (I know it's different, but syntax is similar), working with C made me feel like I was at work at times. It wasn't different enough, in a way.

But now, instead of dreading opening my C game project, I am excited to open my Odin game project!

I really recommend giving Odin a try, especially if you're tired with C. It's really fun language that helps you a lot when it comes to writing systems, and thanks to all the vendored packages it's really good for gamedev.

Also if you use language servers, make sure to set up and use [ols](https://github.com/DanielGavin/ols), it's brilliant. Debugging can be done easily with LLDB debug adapters (or from commandline).

I hope you got something out of this yet-another-rambly-tired blogpost. If nothing else, moving from C to Odin is something if I can do it, you can do it too!

***Happy hacking, and thanks for reading!***