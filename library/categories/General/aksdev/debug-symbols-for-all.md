+++
title = "Debug symbols for all!"
description = "When running Linux software and encountering a crash, and you make a bug report about it (thank you!), you may be asked for backtraces and debug symbols.And if you're not developer you may wonder what in the heck are those?I wanted to open up this topic a bit, but if you want mor"
date = "2024-01-21T00:00:00Z"
url = "https://akselmo.dev/posts/debug-symbols-for-all/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.066704214Z"
seen = true
+++

When running Linux software and encountering a crash, and you make a bug report about it (thank you!), you may be asked for backtraces and debug symbols.

And if you're not developer you may wonder what in the heck are those?

I wanted to open up this topic a bit, but if you want more technical in-depth look into these things, internet is full of info. :)

This is more a **guide for any common user** who encounters this situation and what they can do to get these mystical backtraces and symbols and magic to the devs.

[Backtrace](#backtrace)
==========

When developers ask for a backtrace, they're basically asking "what are the steps that caused this crash to happen?" Debugger software can show this really nicely, line by line. However without correct debug symbols, the backtrace can be meaningless.

But first, how do you get a backtrace of something?

On systems with systemd installed, you often have a terminal tool called `coredumpctl`. This tool can list many crashes you have had with software. When you see something say "segmentation fault, core dumped", this is the tool that can show you those core dumps.

So, here's a few ways to use it!

[How to see all my crashes (coredumps)](#how-to-see-all-my-crashes-coredumps)
----------

Just type `coredumpctl` in terminal and a list opens. It shows you a lot of information and last the app name.

[How to open a specific coredump in a debugger](#how-to-open-a-specific-coredump-in-a-debugger)
----------

First, check from the plain `coredumpctl` list the coredump you want to check out. Easiest way to deduce it is to check the date and time. After that, there's something called `PID` number, for example `12345`. You can close the list by pressing `q` and then type `coredumpctl debug 12345`.

This will often open GDB, where you can type `bt` for it to start printing the backtrace. You can then copy that backtrace. But there's IMO easier way.

[Can I just get the backtrace automatically in a file..?](#can-i-just-get-the-backtrace-automatically-in-a-file)
----------

If you only want the latest coredump of the app that crashed on you, then print the backtrace in a text file that you can just send to devs, here's a oneliner to run in terminal:

```
coredumpctl debug APP_NAME_HERE -A "-ex bt -ex quit" |& tee backtrace.txt

```

You can also use the `PID` shown earlier in place of the app name, if you want some specific coredump.

The above command will open the coredump in a debugger, then run `bt` command, then quit, and it will write it all down in a file called `backtrace.txt` that you can share with developers.

As always when using debugging and logging features, **check the file for possible personal data!** It's very unlikely to have anything personal data, BUT it's still a good practice to check it!

Here's a small snippet from a backtrace I have for Kate text editor:

```
#0  __pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0)
    at pthread_kill.c:44
...
#18 0x00007f5653fbcdb9 in parse_file
    (table=table@entry=0x19d5a60, file=file@entry=0x19c8590, file_name=file_name@entry=0x7f5618001590 "/usr/share/X11/locale/en_US.UTF-8/Compose") at ../src/compose/parser.c:749
#19 0x00007f5653fc5ce0 in xkb_compose_table_new_from_locale
    (ctx=0x1b0cc80, locale=0x18773d0 "en_IE.UTF-8", flags=<optimized out>) at ../src/compose/table.c:217
#20 0x00007f565138a506 in QtWaylandClient::QWaylandInputContext::ensureInitialized (this=0x36e63c0)
    at /usr/src/debug/qt6-qtwayland-6.6.0-1.fc39.x86_64/src/client/qwaylandinputcontext.cpp:228
#21 QtWaylandClient::QWaylandInputContext::ensureInitialized (this=0x36e63c0)
    at /usr/src/debug/qt6-qtwayland-6.6.0-1.fc39.x86_64/src/client/qwaylandinputcontext.cpp:214
#22 QtWaylandClient::QWaylandInputContext::filterEvent (this=0x36e63c0, event=0x7ffd27940c50)
    at /usr/src/debug/qt6-qtwayland-6.6.0-1.fc39.x86_64/src/client/qwaylandinputcontext.cpp:252
...

```

The first number is the step where we are. Step `#0` is where the app crashes. The last step is where the application starts running. Keep in mind though that even the app crashes at `#0` that may be just the computer handling the crash, instead of the actual culprit. The culprit for the crash can be anywhere in the backtrace. So you have to do some detective work if you want to figure it out. Often crashes happen when some code execution path goes in unexpected route, and the program is not prepared for that.

**Remember that you will, however, need proper debug symbols for this to be useful!** We'll check that out in the next chapter.

[Debug symbols](#debug-symbols)
==========

Debug symbols are something that tells the developer using debugger software, like GDB, what is going on and where. Without debugging symbols the debugger can only show the developer more obfuscated data.

I find this easier to show with an example:

**Without debug symbols**, this is what the developer sees when reading the backtrace:

```
0x00007f7e9e29d4e8 in QCoreApplication::notifyInternal2(QObject*, QEvent*) () from /lib64/libQt5Core.so.5

```

Or even worse case scenario, where the debugger can't read what's going on but only can see the "mangled" names, it can look like this:

```
_ZN20QEventDispatcherGlib13processEventsE6QFlagsIN10QEventLoop17ProcessEventsFlagEE

```

Now, those are not very helpful. At least the first example tells what file the error is happening in, but it doesn't really tell where. And the second example is just very difficult to understand what's going on. You don't even see what file it is.

With **correct debug symbols** installed however, this is what the developer sees:

```
QCoreApplication::notifyInternal2(QObject*, QEvent*) (receiver=0x7fe88c001620, event=0x7fe888002c20) at kernel/qcoreapplication.cpp:1064

```

As you can see, it shows the file *and* line. This is super helpful since developers can just open the file in this location and start mulling it over. No need to guess what line it may have happened, it's right there!

[So, where to get the debug symbols?](#so-where-to-get-the-debug-symbols)
----------

Every distro has it's own way, but KDE wiki has an excellent list of most common operating systems and how to get debug symbols for them: [https://community.kde.org/Guidelines\_and\_HOWTOs/Debugging/How\_to\_create\_useful\_crash\_reports](https://community.kde.org/Guidelines_and_HOWTOs/Debugging/How_to_create_useful_crash_reports)

As always, double check with **your distros official documentation** how to proceed. But the above link is a good starting point!

But basically, your package manager should have them. If not, you will have to build the app yourself with debug symbols enabled, which is definitely not ideal.. If the above list does not have your distro/OS, you may have to ask the maintainers of your distro/OS for help with getting the debug symbols installed.

[Wait, which ones do I download?!](#wait-which-ones-do-i-download)
----------

Usually the ones for the app that is crashing. Sometimes you may also need include the libraries the app is using.

There is no real direct answer this, but at the very least, get debug symbols for the app. If developers need more, they will ask you to install the other ones too.

You can uninstall the debug symbols after you're done, but that's up to you.

[Thanks for reading!](#thanks-for-reading)
==========

I hope this has been useful! I especially hope the terminal "oneliner" command mentioned above for printing backtraces quickly into a file is useful for you!

Happy backtracing! :)