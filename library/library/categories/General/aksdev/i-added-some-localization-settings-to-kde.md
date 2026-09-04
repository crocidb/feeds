+++
title = "I added some localization settings to KDE"
description = "This was my biggest contribution so far! And it was a bit more involved than I expected, so I wanted to write down what I learned.Here's a screenshot:KDE Locale settings in system settings, the ones I added are outlined in redI added the set"
date = "2022-08-18T00:00:00Z"
url = "https://akselmo.dev/posts/i-added-localization-settings-for-kde/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.110757048Z"
seen = true
+++

This was my biggest contribution so far! And it was a bit more involved than I expected, so I wanted to write down what I learned.

Here's a screenshot:

![KDE Locale settings in system settings, the ones I added are outlined in red](/assets/images/kde/kdecontrib1.png)

I added the settings there that are in the red box. I also added the `Paper size` setting earlier in another contribution, but it was pretty simple.

This was not, since Qt did not have builtin functions for these three settings: `LC_ADDRESS`, `LC_NAME` and `LC_TELEPHONE`. I assume it's because only `glibc` has these settings.

Before I go any further, you can look at the commit in here: [Add LC\_ADDRESS, LC\_IDENTIFICATION, LC\_NAME and LC\_TELEPHONE to region settings](https://invent.kde.org/plasma/plasma-workspace/-/commit/c7c2a3a85e5b7f74dcb2eadc35defe9e4b55c737)

[The settings part themselves](#the-settings-part-themselves)
==========

Most of the settings was actually easy to implement, since I could follow the old parts of the code and just reimplement them separately for the `LC_ADDRESS` and friends.

What gave me most trouble though, were the examples. My post will be mostly about them.

[Figuring out how to parse stuff](#figuring-out-how-to-parse-stuff)
==========

To get a nice example to see what the locale you're setting looks like, we have to pull the format string from the locale object/file.

For example, Finnish `postal_fmt` string is `%f%N%d%N%b%N%a%N%s %h%t%e%t%r%N%z %T%N%c%N`.

Yeah, fun. This website was REALLY helpful during making this: [https://lh.2xlibre.net/locale/fi\_FI/](https://lh.2xlibre.net/locale/fi_FI/)

Archive it, cherish it.

I was going to make my own silly regexp parser thing, but luckily KDE has something called `KMacroExpander::expandMacros`, that takes a hashmap and the format string. I gave the job to that method and it returned a nice parsed string.

However... How to get the correct locale? Now THIS, THIS was pain.

[nl\_langinfo or nl\_langinfo\_l](#nl-langinfo-or-nl-langinfo-l)
==========

I just wanted to tell the C function that hey, I got this locale, how to get it's format string?

After hours of searching, `nl_langinfo_l` seemed the obvious choice. Except that you need to give it `locale_t` struct and I still don't know what could give me that struct. There was only ways to make new locales with `newlocale` and meanwhile it could duplicate existing locales, it also required `locale_t`.

I tried to make my own `locale_t` at first since I couldn't find any `getlocale_t` functions. It was messy and it didn't work, so I just groaned and tried to just use `nl_langinfo`. What this does is that it gets the information of the locale that is currently active. Close, but not quite.

Due to being unable to get `locale_t` anywhere, I decided to do something a bit dirty. I set the locale that the example is for with `setlocale`. So when the example is being built, the locale is active, and thus `nl_langinfo` can get it's data, without me having to create a new `locale_t` by hand.

It is not ideal solution. I got asked about it many times. But when I asked how to get `locale_t`, it was just nowhere to be found. Nobody knew, and I don't blame them. I quickly learned this locale stuff is pretty much dark wizardry that only few understand.

At least the examples were *finally* working and I didn't see any weird side-effects.

If you, my dear reader, know how to get `locale_t` from `QLocale`, do share and I'll do this the proper way.

[What if the locales are not generated](#what-if-the-locales-are-not-generated)
==========

I was told quickly that this will not work, if there's no locales generated and all the locale files are still in the `/usr/share/i18n/locales/`.

So you gotta parse those files. Have fun!

Well, I did actually. It sounded more difficult than it was, but with simple regex I could get the right value: The locale files in the folder were pretty well formatted, so it was quite easy to regex through it. I had to just look for the name of the format, for example `postal_fmt`, then whitespace, then match and capture the value.

Of course, I didn't loop through all files, but only the file that matches the locale name. So for `fi_FI` locale we only look for the `fi_FI` file.

[Getting language code from the locale](#getting-language-code-from-the-locale)
==========

After the examples were done, we wanted to localize the examples to the native language of the locale the example is shown for. So Finnish address example actually is in Finnish, and not in English.

This felt a bit silly and I feel like there should've been better way to do this.

I could not figure out how to get the locale *language shortcode* from the locale name.

So the `en` part of `en_US`. I couldn't find anything that does this in Qt libraries, there were methods that return the full name of the language but not the first part.

Regex to rescue again, just a simple regex, right? Wrong: `([a-z]*)($|[\-]).*`.

This regex first looks for and captures as many lowercase letters there are, then ends the capture when either meeting end of string or `\` or `-`. I am not sure why I added the `\` there but I do remember the `locale.bcp47Name()` returning locales with `\` too. Or I was just sleep deprived.

Anyhow,do share if you have an idea for simpler solution, be it simpler regex or "you should've just used this one hidden function."

[Some things I learned](#some-things-i-learned)
==========

Here's few things I learned thanks to the reviewers:

* Examples should be easy to understand: Instead of having name example like `Jane Belle Doe` you should have `Firstname Middlename Lastname`, at least in this context. This helps the user recognize the name order between locales, since in some locales lastname may be first etc.

* Using `i18nc`: This will give the translators *context* besides just the string to translate for. Example: `i18nc("This is a contextual translation", "Hello")`

* `const` is a friend in C++ (and I assume in C as well). If you have a variable that is initialized once but never modified after, just add `const` in front of it. This tells the compiler that "hey this variable won't change" and also keeps it from accidentally changing. (Usually.)

* Instead of returning empty QString `""`, just return `{}`. Avoids accidental non-empty strings, since the object is empty. Probably other reasons too.

* Use `QLatin1String` when comparing strings, it's usually safer so that the decoding/encoding won't mess things up.

Feel free to tell me if you know better why some things are like this. Most of these are based on my own experiences.

[Conclusion](#conclusion)
==========

So yeah, it was way more involved than I expected. I was honestly expecting Qt having some premade classes and methods for the locale trio, but nope. So I had to get my hands dirty and do it myself.

I may sound grumpy in text but I legit enjoyed it even it was quite challenging for my tiny brain. I've never really worked with C++ before due to people scaring me that it's a scary spooky hellish language.

Well, it certainly is a bit scary language. But I managed to make something nice with it.

Also there was no need for me to be scared of the review process. It was actually super educational and I learned a lot from it. I am thankful for all the people who helped me work on this!!

All in all, I'm proud of myself. I'm proud that I managed to contribute something small like this. And I am super excited to find more things to contribute to.

Just no locales anymore. Please.