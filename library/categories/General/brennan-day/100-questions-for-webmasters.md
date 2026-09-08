+++
title = "100 Questions for Webmasters"
description = "A hundred-question chain meme making the rounds about how and why we make websites. I answer my way through questions on workflow, editors, CSS confidence, webrings, Neocities and Nekoweb, domain names, accessibility, genAI ethics, Gruvbox, and everything else about being a webma"
date = "2026-09-01T02:00:00Z"
url = "https://brennan.day/100-questions-for-webmasters/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-09-08T09:41:46.886720754Z"
seen = true
+++

I really miss chain-letter-style questionnaires, which I often participated in on sites like deviantART and Nexopia many years ago.

There's been one floating around [specifically designed for webmasters](https://mouseling.net/100webmaster) created by [MOUSEcky](https://mouseling.net/)! Initially, I wasn’t going to answer these questions, since I feel I've covered a lot of them already over the course of my writing, in addition to my [interview with Zacharay Kai](https://zacharykai.net/notes/pb/brennan) and podcast appearance on [Wonders of Webweaving](https://web-weaving.jamesg.blog/8).

But then I saw that [Shen has been keeping an impressive record](https://shens.world/about/100webmaster#other) of webmasters answering, and I couldn't help myself but end Blaugust 2026 with the longest post of the month. So here are 100 answers, written in one sitting, in order and with no skipping.

The more questions I answer, the more I think I might come back and give more detailed responses later. Some questions I feel warrant their own blog posts!

The 100 Questions [](#the-100-questions)
----------

1. **Introduce yourself.** Hi! I'm Brennan Kenneth Brown (he/they). I'm Queer, Red River Métis, 30, born in Winnipeg, based in Calgary/Mohkínstsis (Treaty 7). I'm an independent author and web developer, founder of Berry House, and operator of Folk Zone and fanfiction.lol, and the founder of Write Club. My [/about](https://brennan.day/about) page has more details.

2. **How long have you been making websites?** Quite a long time, I'd say. I've been tinkering with HTML and CSS since I was around 13 years old tweaking themes on Tumblr. The first full-fledged websites I created were with [Jekyll](https://jekyllrb.com/) with [GitHub pages](https://github.com/collections/github-pages-examples). What survives includes a [music review site](https://thegliss.github.io/), [my first attempt at a blog](https://brenjour.github.io/). So, at least ten years.

3. **And what got you into the hobby?** Blogging and writing! I remember stumbling upon the [Markdown](https://daringfireball.net/projects/markdown/) language for the first time and was amazed at how human readable it was, which led me to the static site generator Jekyll—because all you really had to do was fork a theme and then write Markdown posts and the rest was taken care of with a few commands. I was already using [CrunchBang #!](https://crunchbang.org) Linux on my desktop computer at the time because my computer wouldn't properly install Windows (which turned out to be a blessing in disguise), and so I was able to follow the instructions and install Ruby, Gems, and Jekyll.

4. **What kind of website are you most interested in?** I love websites made by people to share their interests or life. There are countless I could refer to. Just take a gander at [Neocities](https://neocities.org/browse) for a couple minutes and you'll quickly see what I mean.

5. **What's your workflow?** I've written a blog post about [my blogging workflow](https://brennan.day/my-blogging-workflow-a-routine-for-nearly-a-post-a-day-for-4-months-straight/), but my web development workflow looks different. I usually get the idea for a particular website or site design and go over the basics—layout, fonts, semantics, accessibility—and then I just start with the index.html (or [index.md](http://index.md)). Sometimes I start with a SSG framework or theme/template. Other times, I prototype what I want the homepage to look like by itself and then work at the modular layouts, partials, etc. from that.

6. **Please link to your biggest inspirations.** [Buster Benson](https://busterbenson.com) is probably my biggest inspiration out of everything. I only have my writing habit thanks to [750words.com](https://750words.com), but I also found his birthday posts and [Codex Vitae](https://github.com/busterbenson/public/blob/master/book-of-beliefs.md) really inspiring, especially when I was a lot younger and looking for role models. For the web specifically, I'd say [omg.lol](https://omg.lol), the [IndieWeb](https://indieweb.org) community, [melonking.net](https://melonking.net), and the dozens of friends on my [/blogroll](https://brennan.day/blogroll/).

7. **What's your favourite part about making websites?** When the design finally gets to a place that feels cohesive and presentable. I always get anxiety at the start when it looks off and so far from what I envisioned in my head, and I often feel as though it'll never get to a point I'll be happy with it. But then it does! That's a great feeling.

8. **And the thing you struggle with the most?** Oh my God, everything? Because I work with static site generators, I really struggle with backends and databases. I also often struggle with proper RSS formatting, Nunjucks templating, JSON data, logic in JavaScript, keeping security up-to-date, basic syntax errors... Like really, everything. It is a miracle any of my websites function and work at all.

9. **Do you keep the same layout on all of your pages?** Yes, I do. And I also want to add you certainly don't need to yourself! But one of the biggest draws to SSGs for me was that you can just write the header and footer and page layout once and then never have to worry about it again instead of copy-pasting it for each page.

10. **How confident are you with CSS?** I'd like to think I'm pretty good with it at this point after years of trial and error. [Brennan.day's](https://brennan.day) CSS is custom and uses no framework. And I enjoy learning new techniques that are added to vanilla CSS, like container queries, :user-invalid, forced-colors mode, @view-transition.

11. **Do you know how to correctly use `<dl>`?** Yes! My [/style guide](https://brennan.day/style/) demonstrates definition lists as part of the markdown reference. I love the specific, rarely-used HTML tags.

12. **What is your favourite HTML element?** I display quite a few of them in [my HTML Day 2026 project](https://brennan.day/html-day-2026/). `<ruby>` and `<abbr>` to explain acronyms, and `<mark>` for highlighting. Things I don't use enough myself.

13. **If you're making a new web page from scratch, what is the first thing you do?** If I'm doing it FULLY from scratch, then I'd grab a template with good practices, [something like this](https://www.freecodecamp.org/news/html-starter-template-a-basic-html5-boilerplate-for-index-html/) just to give myself a good starting point. Then I start writing. I'll typically write in Markdown then [use an online converter](https://markdowntohtml.com/).

14. **Do you know JavaScript?** Yes, I'd say I'm proficient with it. Both vanilla JS and TypeScript. I also use NodeJS and EJS as my backend language of choice. But JavaScript should always be optional for a website's front-end, not mandatory for end-users.

15. **How about PHP?** No, not really. But I want to! Adam of [omg.lol](https://omg.lol) has done some absolutely amazing and fascinating work with PHP and has really showed me that it's worth learning, especially for the upcoming [Neato Pub](https://www.neato.pub/)!

16. **Does your website have a theme that you stick to?** Yes, I use the retro groove colour scheme [Gruvbox](https://github.com/morhetz/gruvbox) for the colour palette. I also am heavily inspired by the old-school, classic two-column blog layouts you'd see on WordPress and Blogger many years ago.

17. **Are you more focused on content or design?** I'm always primarily focused on accessible content. I wish I was better at interesting web design. Take a look at the [2026 finalists for the Tiny Web Awards](https://tinyawards.net/vote/), they're all so incredible.

18. **Do you own a domain name?** I own way too many domain names. On Porkbun I have: [brennan.page](https://brennan.page), [brennan.cafe](https://brennan.cafe), [fireweed.school](https://fireweed.school), [brennan.jp.net](https://brennan.jp.net), [meddler.fyi](https://meddler.fyi), [fanfiction.lol](https://fanfiction.lol), [fanfic.lol](https://fanfic.lol), [theforum.love](https://theforum.love), [brennan.casa](https://brennan.casa), [brennan.click](https://brennan.click), [fanfiction.forum](https://fanfiction.forum), [folkzone.org](https://folkzone.org), [folk.zone](https://folk.zone), [tilde.land](https://tilde.land), [craft.wang](https://craft.wang), [blogstudy.org](https://blogstudy.org), [brennan.day](https://brennan.day). I have even more on NameCheap. Some are in use, some are still just mere ideas.

19. **What do you think of nostalgia-focused or "retro" websites?** I love them! It's so cool to see how people use the design languages of the past in their websites. Simone.computer keeps a wonderful selection of [websites that are designed to look like desktops](https://simone.computer/#/webdesktops) which often are nostalgic in nature.

20. **Is your HTML valid? Do you even check?** Good question! I check when I first make a website, but I don't do routine checks on this. According to the [W3 validator](https://validator.w3.org/nu/?doc=https://brennan.day/), Brennan.day has [two errors and three warnings](https://cdn.some.pics/brennan/6a957fe32afb7.png). Good enough for me, right now.

21. **What are your opinion on buttons and banners?** I love them! There's a dedicated spot on my sidebar for them, after all. And I have [my own 88x31 badge](https://brennan.day/assets/images/brennan-day-alt.gif), free for anyone to grab or hotlink!

22. **What do you think of button walls in particular?** I'll once again link to Shen with his wonderful page, [go click on a wall!](https://shens.world/campaigns/go-click-on-a-wall) I also love these.

23. **If you started over again, would you make something similar or completely different?** I have started over many times already, and I find myself gravitating towards the same inclinations no matter how I try to renew or reinvent myself. I think this is most evident in my timeline of poetry blogs: [b.k. blayze](https://www.deviantart.com/bk-blayze), [the Hyacinth Boy](https://hyacinthboy.wordpress.com/), [the Pine Draft](https://web.archive.org/web/20180722212013/http://pinedraft.com/), and [Warsaw Mountain](https://warsawmountain.com/), and finally [bkpoetry.com](https://bkpoetry.com).

24. **Are you envious of other people's websites?** I would not use the word envy, but I am in awe of people's design talent and skills. There are so many sites I visit that have a user experience that just sparks joy! My philosophy has always been "community over competition." Other people's good sites always make the neighbourhood better.

25. **What text editor do you use?** Primarily, I use [Sublime Text 4](https://www.sublimetext.com/). I also use [Bear](https://bear.app/), [VSCodium](https://vscodium.com/), [TextEdit](https://en.wikipedia.org/wiki/TextEdit), [Geany](https://www.geany.org/), and I've been meaning to get into [Gram](https://gram-editor.com/) and [IA Writer](https://ia.net/writer).

26. **Why do you use that one?** I love simplicity, speed, and a proactive lack of genAI features. All of which have become increasingly difficult to find in an IDE and word processor. I was a huge fan of [Atom](https://atom-editor.cc/) (RIP) when it first came out many years ago, as it felt really aligned with Jekyll. Oh, how things change.

27. **Do you host your image files on your web server, or on another host?** Most assets live in the site's [codebase repo](https://gitlab.com/brennankbrown/brennan.day/-/tree/main/src/assets/images/blog?ref_type=heads), which is becoming increasingly unsustainable. I also use [some.pics](https://some.pics) (an omg.lol service) for some images as well.

28. **What's your opinion on the Neocities vs. Nekoweb debate?** I wasn’t aware there was a debate! They both are wonderful platforms and I'm thankful both exist. We need more accessible ways for people to get into webdev, not less.

29. **How much server space would you estimate your main website takes up?** The folder of my codebase is just over 1GB including `node_modules`, and when I build, the generated `_site` is 437MB (mostly images). Despite these rather large sizes, I'm in the [1MB Club](https://1mb.club/#:~:text=brennan.day)! There are +400 pages generated in about a 4 second build from a dry run, and my site produces [0.07g of CO₂ per visit](https://brennan.day/green/) which is cleaner than 94% of pages tested.

30. **Do you keep local backups of your files?** Of course! My codebase lives on my local computers as a git repository, and on a redundant USB stick. Build for portability and back up constantly, or accept your work dies with the platform.

31. **Do you prefer simple or highly visual websites?** I prefer visually-interesting websites that manage to remain accessible and readable, which is a very hard balance to strike.

32. **Do you stick to certain colours?** The only colours I stick to are all of them. I love rainbows and being colourful, using all colours as much as I can. The human eye can only see so many shades, I want to take advantage of that as much as I can!

33. **Have you ever thought about quitting?** Quit be a webmaster? If I'm being candid, yes. All the time. There's real responsibility to having a computer in my home that runs a website that has hundreds of users, and I take that seriously, and it's stressful sometimes. But the human spirit is indomitable, and I will continue trying to improve the web and contribute in the little ways I can as long as I can do so!

34. **Do you have many webmaster friends, or is it a solitary hobby?** Solitary by temperament, social by effort. [Melo](https://girlonthemoon.xyz/) and [Agnes](https://agnes.love) are two of my closest webmaster friends I've made since I started, and both are very inspiring to me. I'm also in over a dozen webrings and I'm an organiser in [the Web Writers' Collective](https://webwriterscollective.com), but it all takes real work against my introversion.

35. **Do people in your real life know about your website?** I'd say so. I shamelessly promoted myself heavily on Instagram and Discord and whatnot before I deleted all those accounts. I don't really have anybody IRL interact with my site, but everyone I know does indeed know.

36. **Do you update your website very often?** If you check my [changelog](https://brennan.day/changelog/), I push a commit to this website nearly every day since I started it back in December 2025. There are over 1,400 commits currently.

37. **And the overall design, do you change that much?** I would say no. If you look at the [first archive](http://web.archive.org/web/20251228064152/https://brennan.day//) of my website back on December 28th, just a couple weeks after I started, it looks largely the same as it does now. I make small tweaks and iterate, but I actually really enjoy the design overall and don’t have an itch to do an overhaul as I typically do.

38. **Is your website more you-focused, hobby-focused, or outside world-focused?** All of the above? I love everything, and so my personal essays and biography sit next to my writing on cultural criticism, tech ethics, and politics. I don't stop myself from adding anything on this site, no topic off-limits, no specific niche. It's very freeing.

39. **Do you do web design professionally?** Yes, I'm the lead developer and founder of [Berry House](https://berryhouse.ca).

40. **If not, would you like to?** N/A, since I already do. Writing is also part of my income, through the Medium Partner Program.

41. **Do you communicate with people by email very much?** Yes, I find that I've been writing more emails this year than any before. I love exchanging letters with people. It's a wonderful and rather intimate mode of communication. But of course I also love public comments and guestbook signings!

42. **Do you keep social media outside of your website?** I deleted Facebook, Messenger, Instagram, WhatsApp, Threads, X, Reddit, and Discord. I still use [Mastodon](https://social.lol/@brennan) and [Bluesky](https://bsky.app/@brennan.day). I also use some more niche social media you can find on my [/accounts](https://brennan.day/accounts) page.

43. **How about instant messengers?** Signal, plus a handful of IRC networks (Libera, tilde.chat, irc.social.lol).

44. **Do you listen to music while you work on websites?** Constantly! Mostly indie folk and singer-songwriter stuff like Sufjan Stevens, Phoebe Bridgers, The Mountain Goats, and Elliott Smith. I also love Midwest emo, post-rock, ambient, and hip-hop. There's quite a few of my faves on my [/canon](https://brennan.day/canon/) page.

45. **Do you keep everything you make on one website, or do you have more than one?** Despite the fact that I allow myself to publish anything on Brennan.day, I have many websites! (See my answer to question #18.)

46. **On a similar note, do you keep to one topic on your site, or many?** Many. I find myself focusing on writing craft, the IndieWeb, accessibility, Métis and Indigenous issues, layman science, webdev tutorials, community, disability, genAI ethics, philosophy, music, and whatever else grabs me.

47. **Do you present your real self, or at least try?** We are always in a state of performance in a social setting, no matter how authentic and honest we attempt to be, on or off the Internet. Sociology aside, I do try to be genuine and as close to myself as I can be on here. It would be far too exhausting to be anything else, really.

48. **Have you ever made a good friend thanks to your website?** Yes, absolutely! My [/blogroll](https://brennan.day/blogroll) has a "Friends!" section of people I have been lucky enough to meet through the IndieWeb.

49. **Are you happy with the way HTML and CSS currently work?** I think my answer is no? It is a little bonkers you have to write a reset.css stylesheet whenever creating a webpage that you want to look the same in any browser, but I suppose that is the price paid for a free and open protocol. I guess HTML/CSS are fine if used responsibly, but the browsers we use and the most popular frameworks are so heavy and bloated. The Internet does not need to be complex or resource-intensive, and I am increasingly appreciative of the [Gemini protocol](https://geminiprotocol.net/) because of that.

50. **What are practices that you think people should avoid?** Many. Dark patterns, invasive analytics, unnecessary JS frameworks, clickbait, SEO-optimized garbage, and AI-generated content passed off as human. Just be honest, try your best. Use your own hands, hearts, and mind.

51. **What about under-utilised practices?** I don't know if these are under-utilised, but I'd say RSS/Atom feeds, semantic HTML, webmentions, progressive enhancement, and plain-text/Markdown workflows.

52. **Do you use a lot of semantic HTML? Or are you guilty of generic structure?** I love semantic HTML. Divs and spans everywhere would confuse me more (and are worse for accessibility). Headers are headers, lists are lists, forms are forms.

53. **Do you consider different browsers?** Yes! I check my sites on Firefox, Chromium, Lynx, and on iOS and Android devices. Brennan.day looks a little different depending on your operating system since I use system fonts instead of embedded fonts, but it is at a functional parity.

54. **Speaking of, what's your preferred browser?** I have been a Firefox user forever. But since their baffling push towards genAI, I have been trying various forks: Palemoon, Iceweasel, Waterfox, but I find myself returning back to FF.

55. **And what OS are you on?** macOS Sequoia 15 on a 2025 MacBook Air (M4) daily, and Debian-based Linux (BunsenLabs) on my ThinkPads and desktop.

56. **Do you have a strong opinion on that, or do you just happen to use it?** I've always loved the stability and brutalist aesthetic of Debian-based distros (though that's [now being questioned](https://brennan.day/sad-machine/)), and I use Mac day-to-day for the reasons you always hear: the trackpad, keyboard, screen, integration, devtools, etc. It really does just work, though I still haven't upgraded to Tahoe because it seems to be getting worse. Maybe Golden Gate will fix things.

57. **Are your websites mobile-friendly?** Yes, very much so. I explicitly design for a responsive experience across devices. See [phoneblogging](https://brennan.day/phoneblogging/).

58. **What are your thoughts on autoplay?** I used to love having an autoplaying music playlist on my Tumblr, it gave my blog such a mood. But of course, I recognize now that this is universally a terrible and user-hostile feature. There is never a reason to have something autoplay unless it is the sole purpose of a webpage.

59. **What are your thoughts on webrings? Are you in any?** I love them! I'm in many: Bucketfish, Hotline, Static.Quest, IndieWeb, the a11y Webring, Fediring, XXIIVV, and others. I wrote a whole post about it, [Won't you be my neighbour?](https://brennan.day/be-my-neighbour/)

60. **Do you have any web shrines?** Hm, I don't think so. You could say that my page about [Winnipeg](https://brennan.day/hometown/) is a shrine. I should make shrines though, the world needs more of them.

61. **Are your websites "cliché", in your opinion?** I don't think they're cliché, but I do think all of my websites are rather boring and use predictable, obvious layouts. But I'm okay with this since it means I can make them accessible.

62. **What is your ideal website?** Honestly? I think Brennan.day is close to that. A durable, useful, human-first archive that serves writers, open-source devs, readers, and small organizations instead of feeds or engagement metrics.

63. **Are you an artist? Do you draw or design your own assets?** I've got design tools in my kit (GIMP, Inkscape), I draw a little bit sometimes, and have past lives as a photographer and a musician, but I don't hand-draw my own site graphics.

64. **What are your favourite resource sites?** [32-bit Café's Personal Web Resource List](https://discourse.32bit.cafe/t/resources-list-for-the-personal-web/49), and everything else I list in my [WEBMASTER@ Manifesto](https://brennan.day/webmaster-a-manifesto-for-everyone/#further-resources)

65. **Is there a habit you just can't get away from no matter how hard you try?** Self-quantification. I track my steps, sleep, chess puzzles, word counts and a lot more on Beeminder. Also, as you can see, writing as well.

66. **What's your biggest advice for a new webmaster?** You are capable of learning what's needed to be learned, I promise. And the bare minimum is all you need: a computer, a text editor, a way to host. Read the [WEBMASTER@ Manifesto](https://brennan.day/webmaster-a-manifesto-for-everyone/) for my full pep talk!

67. **Do you keep all your styling in CSS? Or do you hard-code some?** My CSS is fairly well organized into multiple stylesheets. I really dislike inline CSS because it often violates the DRY principle of writing things out only once and it gets really hard to keep track of.

68. **What do you think of frameset layouts?** These are really [before my time](https://www.w3.org/TR/html401/present/frames.html). I wouldn't use them myself, but I think it's really cool so long as it works for things like screen readers, keyboard navigation, etc.

69. **How about table-based layouts?** Same as above, although I will add [this hilarious rant](https://flownet.com/ron/css-rant.html) found by Shen about how people should be using tables instead of CSS. It's so hard to wrap my head around!

70. **Do you subscribe to the ideas of "one-column", "two-column" and "three-column" layouts?** Yes, absolutely. My site runs a two-column layout with a sidebar, which goes underneath of the main content in mobile view.

71. **Do you spend longer on the HTML or the CSS?** According to [WakaTime](https://wakatime.com/@brennan), I've spent twice the amount of time on HTML as I have CSS.

72. **Have you ever made a page with no CSS?** I tried really hard to do so for my [HTML Day 2026 project](https://brennan.day/html-day-2026/). This is the CSS I managed to golf for it:

```css
    body{max-width:70rem;margin:0 auto;
        background:radial-gradient(circle at center,
        #c6ffca 0%, #ffffff 60%, #ffffff 100%);
        min-height:100vh;background-attachment:fixed;
        background-size:cover;background-position:center;}
    @media(max-width:768px){
        body{max-width:100%;padding-left:1.5rem;padding-right:1.5rem;}
    }
    pre,code{overflow-x:auto;max-width:100%;word-wrap:break-word;}
    @keyframes marquee {
        0% { transform: translateX(0); }
        100% { transform: translateX(-50%); }
    }
    marquee {
        display: block;
        width: 100%;
        overflow: hidden;
        white-space: nowrap;
    }
    marquee span {
        display: inline-block;
        animation: marquee 30s linear infinite;
    }
```

1. **Do you ever find yourself making layouts with nothing to put on them?** Yes, sort of. I build a lot of standalone [JAMstack themes](https://brennan.day/indieweb/#my-indieweb-projects) for other people's future content, separate from my own writing.

2. **Would you consider yourself a beginner? Or advanced?** I guess I'm a bit of a static-site generator/JAMstack specialist with over ten years of experience by now, but I still very much feel like a beginner, or just a hobbyist. There's still so much for me to learn and understand!

3. **Do you have a habit of looking at the source code of websites you visit?** If it's a website with a design I particularly admire, I usually do. Also if I'm trying to properly cite a webpage I'll see if the source code has something that's missing (author name, date published, etc.). And, cheekily, sometimes I check to see if a CMS or theme is being used for fun.

4. **How did YOU learn how to make websites?** As I mentioned earlier, doing the HTML/CSS for my Tumblr blogs back when I was a teenager. I also have used Lynda (now LinkedIn Learning), Codecademy, and FreeCodeCamp for self-directed learning. But I also studied software development for a year at SAIT in 2019 and then attended a full-stack web bootcamp called EvolveU in 2020.

5. **Do you ever force elements to do things they're not supposed to?** I try not to, but sometimes certain frameworks and platforms require the dreaded `!important` CSS keyword flag.

6. **Thoughts on floating elements?** Should be used sparingly and in the right context, like wrapping text around an inline element, eg. images, icons, or pull-quotes. There's always an exception to every rule.

7. **When you're sizing stuff, what do you use first?** The right answer here is [`rem`](https://www.freecodecamp.org/news/what-is-rem-in-css-rem-unit-font-size-padding-height-and-more/), but I still often use pixels due to force of habit.

8. **Do you have a favourite font?** I used to really love [EB Garamond](https://github.com/octaviopardo/EBGaramond12) but I've used it so often that it's starting to wear on me. Now I'm absolutely loving bold Old Style serifs like [Young Serif](https://github.com/noirblancrouge/YoungSerif). More generally speaking though, I enjoy Geometric Humanist for headings, Old Style for body text, Monospace Code for code — all system fonts via [Modern Font Stacks](https://modernfontstacks.com/).

9. **Would you run a website with another person?** I would absolutely love to. If anybody reading this is interested in that idea, please hit me up!

10. **Do you surf the Web to find new personal websites very often?** Yes, definitely! I use various directories, blogrolls, aggregators, anything that lets me find new personal websites and people.

11. **Do you bookmark other people's websites? How would you feel knowing someone else bookmarked yours?** I'm so bad at remembering to bookmark in general. It's a habit I absolutely need to reinforce more. If I don’t note something in a blog post immediately it usually vanishes from my mind. But I guess my [/blogroll](https://brennan.day/blogroll) is a bit of a bookmark list. And I'd be touched to know someone bookmarked mine!

12. **What do you want people to be most impressed with when they see your website?** Oh goodness, I'm not trying to impress anyone. I hope they enjoy the custom cursor and rainbows and little hover animations, though! And maybe the couple easter eggs my website has.

13. **Are you interested in technology outside of websites? Do you collect?** You bet. I'm into mechanical keyboards, ThinkPads, retro handhelds, and single-use devices in general.

14. **How often and for how long are you online?** Very often, very long. I try to step away from screens as much as possible and only use them for work rather than leisure, but I find myself working often.

15. **When it comes to your website, who is your target audience?** I explicitly don't have an audience in mind for my website. I write for myself, and I find that paradoxically makes the content more enjoyable for a larger amount of people as a result.

16. **Have you ever been interested in XHTML?** Oh goodness, another piece of history before my time. I'd say in passing, like while researching XFN (XHTML Friends Network) for semantic `rel` links between sites. Not a personal enthusiasm so much as a historical footnote.

17. **Do you program in general?** A little bit. I dabble in Python, Ruby, TypeScript, shell scripts, across various tools and side projects. See [/projects](https://brennan.day/projects/).

18. **Speaking of programs that help you make websites, what do you think of static site generators (SSGs)?** Obviously I love them, I grew up with them! Right now, I use Eleventy as my primary, but I also often use Hugo. Jekyll has sadly become too slow with too many dependencies in comparison, but I still maintain quite a few Jekyll projects from earlier years.

19. **Do you keep a hitcounter?** No, I don't. I lean on privacy-focused analytics (Umami and NeatStats) instead, though I have a soft spot for hitcounters as GeoCities-era culture.

20. **Do you frequent forums?** Yes! 32-bit Café (Discourse), the MelonLand Forum, and the BBS communities on tilde.town and tilde.club.

21. **Do you write your page content directly into the editor, or do you prepare it elsewhere?** Drafts start as Markdown on [750 Words](https://750words.com), which I've been using since 2011. Once I reach 750 words then I move over to writing the rest in Sublime, typically.

22. **Do you think you appear cool to others?** Nah, probably not.

23. **Are you embarrassed of your old work? Have you ever deleted everything out of shame?** No, quite the opposite. I used to delete everything out of an impulse to start fresh and escape myself, but now I try to archive and retain absolutely everything I do. My [first book, *The Dogwood Verses*](https://www.lulu.com/shop/brennan-kenneth-brown/the-dogwood-verses/hardcover/product-pmv7zj.html?page=1&pageSize=4) was my attempt at collecting all of my still-surviving writing, starting from 2011 up to 2021.

24. **Would you close down your website if you couldn’t update it, or would you leave an archive?** I'd definitely leave an archive. My whole philosophy is "plain text survives" and "own your domain, own your words." Frankly, I would be really upset if all this work I've done vanished. Silly, right?

25. **Do you reveal a lot about yourself on your website?** A lot, yes. I'd say nearly everything about myself, including full name and location. I publish about my disabilities, mental health, family history, and personal boundaries openly. See [/disability](https://brennan.day/disability/).

26. **Are you willing to reveal who your best online friend is, and/or if they have a website?** Yes! See my answer to question #34.

27. **And do you optimise the images on your website?** Yes, I try to with lazy loading, compression, and proper formats. I have a Sharp-based image compression workflow. That said, my articles typically feature a 2500x2500 featured image.

28. **We're out of time! How do you feel after answering 100 questions?** Let's see. I began at 6AM and it's now 9:30AM. The word count (including the questions) is just over 4,700 words. I've just completed 31/31 blog posts for Blaugust and have written 54,000 words this month in total. I feel like I closed a hundred browser tabs I'd been meaning to deal with for weeks, and I think I'm going back to bed.

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Fireweed Writing School and Berry House Studio, and of Write Club at Mount Royal University. His work has been cited in Le Monde and other publications.
>
>
>
> **Enjoy this content?** Support my work and help me create more:
>
>
>
> [Patreon](https://patreon.com/brennankbrown) | [Ko-fi](https://ko-fi.com/brennan) | [GitHub Sponsors](https://github.com/sponsors/brennanbrown)
>
>