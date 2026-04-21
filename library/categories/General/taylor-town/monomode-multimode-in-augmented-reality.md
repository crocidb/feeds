+++
title = "Monomode & Multimode in Augmented Reality"
description = "Humans mainly use 2 main modes of attention. There will be 2 corresponding modes of AR/VR."
date = "2023-05-07T00:00:00Z"
url = "https://taylor.town/ar-modes"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.593218591Z"
seen = true
+++

Related AR/VR essays: [Apple Will Win The AR/VR Wars](https://taylor.town/apple-will-win-vr), [AR Demands Peripherals](https://taylor.town/ar-peripherals), [Bananas Will Become Smartphones](https://taylor.town/banana-phone), [Claim a Domain in the Wet Web](https://taylor.town/wet-web), [Tools and Techniques for AR/VR Media](https://taylor.town/arvr-tech), [AR Interoperability Opportunities](https://taylor.town/ar-interop)

Humans mainly use 2 main modes of attention:

* **diffuse**: engaging with surroundings and shifting priorities
* **directed**: focusing all efforts into singular goal

There will be 2 corresponding modes of AR/VR:

* **multimode:** object detection combined with gaze-tracking provides contextual affordances in an event-based as-needed architecture
* **monomode:** an interface for a single software suite; "full-screen" app takes control of all inputs and outputs

Overlays
----------

Notifications, HUDs, and PIP windows will exist in both modes.

These will appear close to your face so that they take precedence over the augmented world around you.

Text, lists, calendars, and legacy apps will survive as "flat" media.

Multimode
----------

AR begins with transparent displays over your eyes. This is useful for displaying notifications/HUDs/PIPs in front of your face. Remember Google Glass?

Magic happens when you strap cameras to your face. Computer vision algorithms can identify and track objects in your field-of-view.

But people don't like heavy things on their face. There will be a pressure to limit hardware.

Object identification is CPU/GPU intensive. AR OSes will perform object identification on behalf of installed extensions. Gaze detection can be used to prioritize running software, but the OS can't let each app run amok with its own computer vision stack.

The OS will identify objects and summon extensions in context. In multimode, extensions cooperate by doing minimum amounts of contextual work.

For example, when you look at a carrot, the OS can ask your extensions about carrots. Your extensions can respond with annotations/shaders to render over the carrot in your view. If multiple extensions respond, the OS can choose to automatically display the results or collapse them in a menu. Chefs and botanists would likely install different extensions, and therefore see different results for carrots.

Possible multimode extensions:

* Wikipedia annotations
* analog clock digitizer widget (shows digital clock readings on top of all analog clocks)
* refrigerator X-ray vision (to show what's inside)
* tophats for everybody
* automatic nutrition labels
* price of barcode on Amazon

Monomode
----------

Multimode offers ubiquitous/diffuse interaction, but people need a monomode for focused/complex experiences.

Some apps demand "full-screen". Monomode can dedicate lower-level graphics APIs and extra computing resources to a singular experience.

An OS can give limited data to extensions, but some apps will require direct access to image/IR data. Apps with complex inputs will likely have complex outputs. To keep the OS simple, many input APIs will only be accessible in monomode.

Because monomode apps may obstruct your vision, the OS will virtually "cover" your face in public. This will prevent accidental staring between strangers.

Possible monomode apps:

* running/cycling/exercise tool
* focused writing/coding editor
* cooking tutor
* AR games
* photo editor
* surgical assistant

The Multimode App
----------

Each AR/VR headset will have one multimode app (with extensions) and many monomode apps. The multimode app will behave like a modern web-browser among many mobile apps.

If people use large numbers of AR/VR apps, apps will be collected on a "home screen". Otherwise, you can switch apps via a physical digital-crown carousel or an "alt-tab" gesture.

Wet Stuff
----------

The social dynamics of [wet stuff](https://taylor.town/wet-web) (public virtual objects) will evolve unpredictably.

People and organizations will post signs, instructions, statuses (e.g. wait times), art, etc.

If your friend wants to display digital art on their wall, will you see it in multimode with extensions? Without extensions? What about monomode? Will you see it automatically or do you have to "activate" it? Will businesses and advertisers have the same power to usurp your vision? Will one organization monopolize virtual objects, or will we build a decentralized protocol?

Now is the time to choose our [AR interop protocols](https://taylor.town/ar-interop).