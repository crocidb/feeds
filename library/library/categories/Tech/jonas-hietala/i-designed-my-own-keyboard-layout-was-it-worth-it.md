---
title = "I designed my own keyboard layout. Was it worth it?"
description = "Almost two and a half years ago I embarked on the journey to change keyboard layout. At first I tried out existing ones, but it didn’t take long before I figured it’s better to develop my own—and things went downhill fast from there. ("
date = "2024-12-01T08:14:22Z"
url = "http://jonashietala.se/blog/2023/11/02/i_designed_my_own_keyboard_layout_was_it_worth_it/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.304247787Z"
seen = true
---

Almost two and a half years ago I embarked on the journey to change keyboard layout. At first I tried out existing ones, but it didn’t take long before I figured it’s better to develop my own—and things went downhill fast from there.

![](/images/t-34-layout/neighbour_combos.svg) (Some) [combos](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Combos) of the [T-34 layout](/blog/2022/09/06/the_current_t-34_keyboard_layout/).

But now that I haven’t made any changes to the layout for over a year, I think it’s time for some introspection and ask the dreaded question: was it worth it? And should you—the dear reader—do the same?

[What were my goals in creating my own?](#What-were-my-goals-in-creating-my-own)
----------

I essentially had two big goals with my layout:

1. Relieve my RSI

   I had started to develop RSI in my right hand that I really wanted to cure. Especially in the area of my right thumb, I wanted to relieve my right hand in general.

   I also wanted to reduce pinky usage—particularly for my right pinky that I had broken earlier and felt very weak.

2. Optimized for my usage

   I had three main use-cases I wanted to optimize for:

   * Vim usage
   * Write Swedish and English
   * Coding in a myriad of different programming languages

[Did I succeed with the goals?](#Did-I-succeed-with-the-goals)
----------

For the first I can say that in combination with the [Ferris](https://github.com/pierrechevalier83/ferris)—a split keyboard with 34 keys—my RSI did indeed get a lot better.

![](/images/uses/ferris.jpg) The [Ferris](https://github.com/pierrechevalier83/ferris), my keyboard that helps with RSI.

As for the second—if it’s optimized for my usage—I don’t really know how to answer. When I was in the middle of designing the layout I probably would’ve pointed out the low SFB values (Same Finger Bigram), the redirects and [generated interesting graphs](/blog/2021/06/03/the-t-34-keyboard-layout/#Symbols) and [heatmaps](/blog/2022/08/28/the_t-342_keyboard_layout/#more-heatmaps).

![](/images/t-34-crazy.jpg)

But now I’m satisfied with saying that it just **feels really good**.

[You have to be a little crazy](#You-have-to-be-a-little-crazy)
----------

It’s quite extreme to design your own layout and I think you have to be a little crazy to do it. I know I was.

---

There I was; awake in the middle of the night carrying our baby in a harness, standing in front of the computer trying to learn this new stinking layout while ignoring his cute smile, hoping he would fall asleep soon.

I was trying to learn the [BEAKL 15](https://deskthority.net/wiki/BEAKL#BEAKL_15) layout but it just wasn’t working for me. Maybe I could tweak it a little—so I did. Maybe I could tweak it some more? I did that too.

Eventually the sleep deprivation took over and I abandoned it and started to design my own layout.

And that’s how I mostly designed my layout: I designed, tweaked and learned it in the middle of the night as I was trying to get our little kid to sleep.

---

I don’t think you have to be crazy to design a keyboard layout—but it probably helps to overcome the healthy fear of overoptimization and diminishing returns.

[What could I have done differently?](#What-could-I-have-done-differently)
----------

I’m not motivated to make any large changes or experiments with the layout now, but there are some things I wish I had tried out more:

1. [One shot](https://docs.qmk.fm/#/one_shot_keys) shift on the thumb instead of `E`.

   The [one shot](https://docs.qmk.fm/#/one_shot_keys) shift seems like such a fantastic feature, but that would require me to move `E` away from the thumb, which would snowball into an entirely different layout.

   Using a combo for [one shot](https://docs.qmk.fm/#/one_shot_keys) shift is another thing I’d like to try that wouldn’t be too invasive.

2. [Home-row mods](https://precondition.github.io/home-row-mods).

   [Home-row mods](https://precondition.github.io/home-row-mods) is another very popular feature that would unlock a lot of extra space on the keyboard (as it would allow secondary effects on long-press instead of shifting and reduce the amount of combos I have).

   I did try it out a little bit, but maybe I could get used to it with more effort?

3. 32 keys instead of 34.

   It would be fairly simple to go down to 32 keys, with only a single key for each thumb. The idea appeals to me, but I don’t think there are any practical benefits for me to do so. I might do it in the future if/when I build a new keyboard.

4. More practice.

   I’m not close to my old QWERTY speed of +120 wpm simply because I got bored of practicing typing.

[Would I recommend you to create your own layout?](#Would-I-recommend-you-to-create-your-own-layout)
----------

Let’s summon [Betteridge’s law of headlines](https://en.wikipedia.org/wiki/Betteridge's_law_of_headlines) that says:

>
>
> Any headline that ends in a question mark can be answered by the word **no**.
>
>

I wouldn’t go quite that far, but you need to realize that there’s very real diminishing returns of completely designing your own layout.

In the **vast** majority of cases it would be good enough to switch to something like [Colemak-DH](https://colemakmods.github.io/mod-dh/) or [Hands Down](https://sites.google.com/alanreiser.com/handsdown), and depending on what you’re after switching to a more ergonomical keyboard would probably suffice.

Or maybe not do anything at all. Lot’s of people have been happy with a regular keyboard and QWERTY.

### [When should I make a change?](#When-should-I-make-a-change) ###

I think it comes down to two things:

1. What benefits are you looking for?
2. How motivated are you?

First an important note: changing the layout because you want to type faster will probably not work out. Chances are you’ve been using QWERTY for many years and the amount of practice you need to catch up to and surpass your QWERTY speed will be **staggering**. Most will burn out long before reaching that point (including me).

The biggest benefit I see with an alternative layout is comfort. If you’re worried about RSI, and you foresee yourself spending a few decades more in front of the computer, then switching layout might be a good idea.

Another benefit is if you have some special requirements with your layout. In my case for example I wanted to be able to comfortably type Swedish on a tiny keyboard, and just using [Colemak-DH](https://colemakmods.github.io/mod-dh/) or something wouldn’t really support that well because I couldn’t fit `åäö` on the base layer.

But with my own layout I could have `åäö` [easily accessible](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Swedish-overlay) (by toggling between `()_` and `åäö` with a layer).

And of course, if you find the idea of designing your own layout interesting or fun, you should totally do it! I honestly thought it was ****really fun**** (even though learning it was a pain).

### [A layout is more than alpha characters](#A-layout-is-more-than-alpha-characters) ###

![](/images/t-34-layout/_SYM.svg) Symbols are very important for a programmer.

Something that people seem to miss with alternative layouts—even people designing them—is that a layout is much more than where the alpha characters goes.

I’ve spent much more time on where to [place the symbols](/blog/2021/06/03/the-t-34-keyboard-layout/#Symbols), how to [handle numbers](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Numbers), what type of [modifiers](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Modifiers) I want, a [navigation layer](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Navigation-layer), and [shortcuts](/blog/2022/09/06/the_current_t-34_keyboard_layout/#One-handed-Shortcuts) than the base layer, and that’s also where most of the benefit of my layout comes from.

Symbols for example are very dependent on the programming languages you use, so there’s lots of benefit to a symbols layer optimized for those. It’s much more productive to spend time on optimizing symbols placement than to try to improve [Colemak-DH](https://colemakmods.github.io/mod-dh/), which is already pretty darn good.

Even simple things like adding a [navigation layer](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Navigation-layer) (with arrow keys under your fingertips) or moving Escape are hugely beneficial. And of course, avoiding the gymnastics of pressing Ctrl in the lower left corner with the pinky is a big win.

### [My recommendation](#My-recommendation) ###

If you want to make a change to your setup, these are my recommendations sorted from least to most effort:

1. Get a programmable keyboard.

   For example, moving Escape to Caps Lock and [behave like Ctrl when held](https://docs.qmk.fm/#/mod_tap) are great modifications for a regular keyboard. (You might be able to do that on the OS level too.)

2. Get a more ergonomical keyboard.

   I think a split keyboard with tenting is a great start. If you want to go the extra length try to make it smaller.

3. Tweak the big buttons to avoid large and awkward motions.

   For a Vim user, remapping Escape is a classic. Ctrl, Shift, Alt, and Enter are also good candidates for moving to a thumb button, a [combo](https://docs.qmk.fm/#/feature_combo) or a [Mod-Tap](https://docs.qmk.fm/#/mod_tap).

4. Add a [navigation layer](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Navigation-layer) (or [two](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Workspace-layer) or [three](/blog/2022/09/06/the_current_t-34_keyboard_layout/#Windows-layer)).

5. Start tweaking the symbols and numbers (and other things you can come up with).

6. Use an alternative layout such as [Colemak-DH](https://colemakmods.github.io/mod-dh/), [Hands Down](https://sites.google.com/alanreiser.com/handsdown) or [MTGAP 2.0](https://mathematicalmulticore.wordpress.com/the-keyboard-layout-project/).

7. Make your own completely custom layout.

You don’t have to do everything at once and you can try out the different levels to see how painful and time consuming the changes are.

[How do you even learn a new layout?](#How-do-you-even-learn-a-new-layout)
----------

![](/images/t-34-layout/_BASE.svg) The [T-34](/blog/2022/09/06/the_current_t-34_keyboard_layout/) base layer. There’s not a trace of QWERTY left.

Say that you’ve decided to learn a new layout. Now what?

The simple answer is that you just need to practice. But here are some tips to make the process more efficient:

* Don’t look at a reference of the layout and use blank keycaps.

  Being forced to remember is painful but recall helps you learn faster.

* Practice in small bursts.

  Small and frequent sessions are better than few but larger ones.

* Learn to touch type.

  Might as well learn it properly from the start.

  Note that you don’t have to be super strict. I press the upper corners with my ring fingers instead of the pinky for instance (because I’m weird and it feels better).

* If you want to retain the ability to type QWERTY, use a different setup.

  A different keyboard for a different layout can help keep them separate. Pressing space with a different thumb is another trick that may help.

There are very good online tools to help you learn a layout. Here are some I like:

*
*
*
*

It’s important to stress how much motivation matters. Even though I feel that I want to pick up the practice again when I’m writing this, I don’t think that will actually happen as I’m not really motivated enough. But if you start using a new layout you **have** to practice, and you have to practice quite a lot at least at the beginning.

![](/images/monkey_sessions.png) My practice died off hard a year ago when I got good enough, around 70 wpm.  
 (Some of this was spent practicing numbers and symbols.)

[FAQ](#FAQ)
----------

* ****You dodged the question; Was it worth it?****

  Hell yes it was. The massive amount of nerd points alone is enough.

* ****I still want to use QWERTY on a regular keyboard****

  If you continue using it regularly you’ll be fine. After 2 years I can still type faster with QWERTY on my laptop than with my own layout on my ergonomical keyboard, and I can use both an English and Swedish layout (symbols move around and `åäö` are added).

* ****How long does it take to learn a new layout?****

  Impossible to say as we’re all different. The first layout I learned took \~16 hours of practice time on [keybr](https://www.keybr.com/) until I got up to \~40 wpm and with the second layout it took \~12 hours. At \~40 wpm I felt I could write without wanting to throw the keyboard through the monitor.

  Beyond that it depends on how diligent you are with practice.

* ****Sounds like a massive effort, I don’t think it’s worth it?****

  If this sounds too much for you, it probably is.

  I rationalized it by saying that I’ll spend a few decades more programming, so a big investment now will pay for itself with time as long as there’s some benefit.

  (This is indeed the trick on how to waste time on Very Productive™ things like [rewriting your Neovim setup](/blog/2023/10/01/rewriting_my_neovim_config_in_lua/).)