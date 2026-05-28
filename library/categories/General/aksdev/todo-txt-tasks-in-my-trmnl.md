+++
title = "todo.txt tasks in my TRMNL"
description = "Edit: Please avoid buying TRMNLIt turns out some people behind TRMNL are not something I want to support.See: https://social.lol/@adam/114959554043586459Archive link: https://archive.is/3Nu1cI do not w"
date = "2025-06-14T15:58:00Z"
url = "https://akselmo.dev/posts/todotxt-in-my-trmnl/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.023904577Z"
seen = true
+++

**Edit: Please avoid buying TRMNL**

It turns out some people behind TRMNL are not something I want to support.

See: [https://social.lol/@adam/114959554043586459](https://social.lol/@adam/114959554043586459)

Archive link: [https://archive.is/3Nu1c](https://archive.is/3Nu1c)

I do not want to support a company that allows and endorses this sort of behavior.

You are allowed to do what you wish, but I can't with good consciences support something like this.

What also annoys me a ton is that I made a plugin for TRMNL, for free, and I'm part of these minorities they seem to dislike.

I'm currently looking into ways to self-host my TRMNL infrastructure so that it's completely detached from TRMNL itself. Will write a post about that when I get something done. The device itself is fine and I do not want it to go to e-waste.

Original text below.

---

I'm never really satisfied with my task and note taking systems. Always looking for new stuff.

I had my [Kate-Orgmode](https://akselmo.dev/posts/kate-and-orgmode/) system for a long while, but I ended up disliking the Org mode syntax on the longer run, so I use Markdown. And now especially when I do all my journaling by hand to my [reMarkable2](https://remarkable.com/products/remarkable-2) e-ink tablet, markdown suits me fine.

But tasks..! I used a simple markdown todo-list for my tasks, but it got unwieldy really quickly.

[Todo.txt](#todo-txt)
----------

So I decided to try something else. I wanted something super simple, something with zero effort to understand and work with. So I went with [todo.txt](http://todotxt.org/).

So far I've been very happy with it. I made a [snippet collection](<https://codeberg.org/akselmo/dotfiles/src/branch/main/kate/Todotxt Snippets.xml>) for it for the [Kate](https://kate-editor.org/) text editor, so creating new tasks is super fast. Kate even has syntax highlighting for the todo.txt files, so it all worked out for me. On Android i use [ntodotxt](https://github.com/tmaegel/ntodotxt).

[Then I got a TRMNL](#then-i-got-a-trmnl)
----------

I saw a post about this nifty thing on fedi: [TRMNL](https://usetrmnl.com/). I couldn't say no: I have noticed I really like e-ink stuff. Maybe a bit too much. Anyway, I bought one and it arrived in +7 days.

It's really cool little screen to show you various information. They have a website where you can tinker with what the device shows to you, during what time of day etc.

I mostly use it to show me my calendar, some weather information etc. Anykind of productivity stuff.

But I wanted to see my tasks there too..

[First try: Parse the todo.txt file](#first-try-parse-the-todo-txt-file)
----------

Since todo.txt files are rather simple to parse, I just made a plugin on TRMNL site that reads the todo.txt file from my Nextcloud, and prints it all pretty and nice.

But this was not really what I wanted: I wanted to have all the `+projects` and `@contexts` and dates on their own separate line.

I could have spent year trying to come up with some awful regex and javascript combination to parse things, but instead I went with something else.

[Second try: todo.json](#second-try-todo-json)
----------

Since TRMNL plugins really like working with json, I was looking around for any kind of tool that could take a todo.txt file and spit out a json out of it with all the information categorized nicely.

Well, I didn't find a premade tool, but I found [pytodotxt](https://vonshednob.cc/pytodotxt/). This Python module allowed me easily to parse things.

I then wrote my own Python script [todojson](https://codeberg.org/akselmo/todojson) for it. It takes the todo.txt file, takes the info, and writes a todo.json out of it.

Next up is.. How do I share this json nicely? I don't want it to be in public for everyone to poll my todos, but I need somekind of endpoint.

I went with something very simple: Website that asks a password to log in. Then this file is on that website.

I followed some tutorials [how to set up password auth with Apache2](https://www.digitalocean.com/community/tutorials/how-to-set-up-password-authentication-with-apache-on-ubuntu-20-04) and placed the json file behind that.

Then on TRMNL side I just poll that URL with proper authentication header. This works really nicely! I now have an endpoint for all my todo.txt data.

[TRMNL plugin](#trmnl-plugin)
----------

The actual TRMNL plugin [markup](https://usetrmnl.com/framework) for this is rather simple as well. They use some template language called [Liquid](https://shopify.github.io/liquid/) which made the creation of the plugin markup rather nice.

It looks like this on the screen:

[![TRMNL with Todo items](/assets/images/trmnl/trmnl_todo_txt.jpg)](/assets/images/trmnl/trmnl_todo_txt.jpg)

The block on the left indicates the priority of the item with A, B, C... And then there is the actual task description, and then any relevant metadata, such as start date, `+projects` and `@contexts`. The date with black background is a `due:YYYY-MM-DD` item, which shows when the item is due.

It turned out to look really nice! I am very happy with it. Now I have easy way to check my todo list without having to juggle with many apps. I also have copy of this plugin that only shows tasks with the `@Personal` context, so I wont be looking at work tasks during off hours. :)

Since I do not have these yet uploaded anywhere, nor have this shared as an actual plugin on TRMNL plugin gallery (yet, I may do that at some point), here's the markup code for the full view:

```
{% assign todo_data = {{todos}} %}
{% assign todo_sorted = todo_data | sort: "priority" %}

<div class="layout">
  <div class="list" data-content-limiter="true" data-list-limit="true" data-list-max-height="420" data-list-hidden-count="false">      
    {% for todo in todo_sorted %}
    {% unless todo.data.completed %}
    <div class="item">
      <div class="meta">
        <span class="index">{{todo.data.priority}}</span>
      </div>
      <div class="content">
        <span class="description">{{todo.data.bare_description}}</span>
        <div class="flex gap--small">
          {% if todo.data.attributes contains "due" %}
          <span class="label label--small label--inverted" data-value-fit="true">{{todo.data.attributes['due']}}</span>
          {%endif%}
          <span class="label label--small label--outline">{{todo.data.creation_date | join}}</span>
          {% for project in todo.data.projects %}
          <span class="label label--small label--outline">+{{project}}</span>
          {% endfor %}
          {% for context in todo.data.contexts %}
          <span class="label label--small label--outline">@{{context}}</span>
          {% endfor %}
        </div>
      </div>
    </div>
    {% endunless %}
    {% endfor %}
  </div>
</div>

<div class="title_bar">
  <img class="image" style="background-color:black; border-radius:5px" src="https://usetrmnl.com/images/plugins/todo_list.svg">
  <span class="title">{{ trmnl.plugin_settings.instance_name }}</span>
</div>

```

I like how simple these are to make. I could see myself easily to make more changes and such to this, but for now I'm satisfied.

[But why](#but-why)
----------

Why make all these things and get the TRMNL display?

Well I just think it's cool and I had some extra pocket cash.

Also I really like how simple todo.txt system is, since it's very effortless to make new tasks. And having this little display to show my tasks as it loops through the many different plugins I've added helps me avoid closing and opening all kinds of apps all the time. I can just.. Look at it, and it's there.

Obviously this is nothing essential. It's just a little cool gadget for myself, as a treat. In short: I got it and did this just for the fun of it.

Does it actually help me day-to-day? I think so, it's rather easy now for me to check if I have any calendar appointments or tasks incoming while gaming for example. Looking at another screen is more effortless than juggling between apps.

I hope you liked this thing I did and maybe other todo.txt users can find the [todojson](https://codeberg.org/akselmo/todojson) script I made useful for their own needs. Maybe someone wants to use this markup for their own TRMNL but for different purpose.

Either way, thanks for reading!