+++
title = "Flagging suspicious websites in Artemis"
description = "Artemis now has a feature to flag websites that you have subscribed to as suspicious. This feature appears in two places: In the “Report spam or domain takeover: Report website as suspicious” link that appears on the page where you edit an author you are following, and;On the pag"
date = "2026-06-01T00:00:00Z"
url = "https://jamesg.blog/2026/06/01/flagging-suspicious-websites-in-artemis"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-06-01T21:30:16.217712843Z"
seen = true
+++

pre { line-height: 125%; } td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } .highlight .hll { background-color: #49483e } .highlight { background: #272822; color: #F8F8F2 } .highlight .c { color: #959077 } /\* Comment \*/ .highlight .err { color: #ED007E; background-color: #1E0010 } /\* Error \*/ .highlight .esc { color: #F8F8F2 } /\* Escape \*/ .highlight .g { color: #F8F8F2 } /\* Generic \*/ .highlight .k { color: #66D9EF } /\* Keyword \*/ .highlight .l { color: #AE81FF } /\* Literal \*/ .highlight .n { color: #F8F8F2 } /\* Name \*/ .highlight .o { color: #FF4689 } /\* Operator \*/ .highlight .x { color: #F8F8F2 } /\* Other \*/ .highlight .p { color: #F8F8F2 } /\* Punctuation \*/ .highlight .ch { color: #959077 } /\* Comment.Hashbang \*/ .highlight .cm { color: #959077 } /\* Comment.Multiline \*/ .highlight .cp { color: #959077 } /\* Comment.Preproc \*/ .highlight .cpf { color: #959077 } /\* Comment.PreprocFile \*/ .highlight .c1 { color: #959077 } /\* Comment.Single \*/ .highlight .cs { color: #959077 } /\* Comment.Special \*/ .highlight .gd { color: #FF4689 } /\* Generic.Deleted \*/ .highlight .ge { color: #F8F8F2; font-style: italic } /\* Generic.Emph \*/ .highlight .ges { color: #F8F8F2; font-weight: bold; font-style: italic } /\* Generic.EmphStrong \*/ .highlight .gr { color: #F8F8F2 } /\* Generic.Error \*/ .highlight .gh { color: #F8F8F2 } /\* Generic.Heading \*/ .highlight .gi { color: #A6E22E } /\* Generic.Inserted \*/ .highlight .go { color: #66D9EF } /\* Generic.Output \*/ .highlight .gp { color: #FF4689; font-weight: bold } /\* Generic.Prompt \*/ .highlight .gs { color: #F8F8F2; font-weight: bold } /\* Generic.Strong \*/ .highlight .gu { color: #959077 } /\* Generic.Subheading \*/ .highlight .gt { color: #F8F8F2 } /\* Generic.Traceback \*/ .highlight .kc { color: #66D9EF } /\* Keyword.Constant \*/ .highlight .kd { color: #66D9EF } /\* Keyword.Declaration \*/ .highlight .kn { color: #FF4689 } /\* Keyword.Namespace \*/ .highlight .kp { color: #66D9EF } /\* Keyword.Pseudo \*/ .highlight .kr { color: #66D9EF } /\* Keyword.Reserved \*/ .highlight .kt { color: #66D9EF } /\* Keyword.Type \*/ .highlight .ld { color: #E6DB74 } /\* Literal.Date \*/ .highlight .m { color: #AE81FF } /\* Literal.Number \*/ .highlight .s { color: #E6DB74 } /\* Literal.String \*/ .highlight .na { color: #A6E22E } /\* Name.Attribute \*/ .highlight .nb { color: #F8F8F2 } /\* Name.Builtin \*/ .highlight .nc { color: #A6E22E } /\* Name.Class \*/ .highlight .no { color: #66D9EF } /\* Name.Constant \*/ .highlight .nd { color: #A6E22E } /\* Name.Decorator \*/ .highlight .ni { color: #F8F8F2 } /\* Name.Entity \*/ .highlight .ne { color: #A6E22E } /\* Name.Exception \*/ .highlight .nf { color: #A6E22E } /\* Name.Function \*/ .highlight .nl { color: #F8F8F2 } /\* Name.Label \*/ .highlight .nn { color: #F8F8F2 } /\* Name.Namespace \*/ .highlight .nx { color: #A6E22E } /\* Name.Other \*/ .highlight .py { color: #F8F8F2 } /\* Name.Property \*/ .highlight .nt { color: #FF4689 } /\* Name.Tag \*/ .highlight .nv { color: #F8F8F2 } /\* Name.Variable \*/ .highlight .ow { color: #FF4689 } /\* Operator.Word \*/ .highlight .pm { color: #F8F8F2 } /\* Punctuation.Marker \*/ .highlight .w { color: #F8F8F2 } /\* Text.Whitespace \*/ .highlight .mb { color: #AE81FF } /\* Literal.Number.Bin \*/ .highlight .mf { color: #AE81FF } /\* Literal.Number.Float \*/ .highlight .mh { color: #AE81FF } /\* Literal.Number.Hex \*/ .highlight .mi { color: #AE81FF } /\* Literal.Number.Integer \*/ .highlight .mo { color: #AE81FF } /\* Literal.Number.Oct \*/ .highlight .sa { color: #E6DB74 } /\* Literal.String.Affix \*/ .highlight .sb { color: #E6DB74 } /\* Literal.String.Backtick \*/ .highlight .sc { color: #E6DB74 } /\* Literal.String.Char \*/ .highlight .dl { color: #E6DB74 } /\* Literal.String.Delimiter \*/ .highlight .sd { color: #E6DB74 } /\* Literal.String.Doc \*/ .highlight .s2 { color: #E6DB74 } /\* Literal.String.Double \*/ .highlight .se { color: #AE81FF } /\* Literal.String.Escape \*/ .highlight .sh { color: #E6DB74 } /\* Literal.String.Heredoc \*/ .highlight .si { color: #E6DB74 } /\* Literal.String.Interpol \*/ .highlight .sx { color: #E6DB74 } /\* Literal.String.Other \*/ .highlight .sr { color: #E6DB74 } /\* Literal.String.Regex \*/ .highlight .s1 { color: #E6DB74 } /\* Literal.String.Single \*/ .highlight .ss { color: #E6DB74 } /\* Literal.String.Symbol \*/ .highlight .bp { color: #F8F8F2 } /\* Name.Builtin.Pseudo \*/ .highlight .fm { color: #A6E22E } /\* Name.Function.Magic \*/ .highlight .vc { color: #F8F8F2 } /\* Name.Variable.Class \*/ .highlight .vg { color: #F8F8F2 } /\* Name.Variable.Global \*/ .highlight .vi { color: #F8F8F2 } /\* Name.Variable.Instance \*/ .highlight .vm { color: #F8F8F2 } /\* Name.Variable.Magic \*/ .highlight .il { color: #AE81FF } /\* Literal.Number.Integer.Long \*/ .highlight .nn, .highlight .n{color: light-dark(black, var(--dark-foreground-color)) }pre { line-height: 125%; } td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } .highlight .hll { background-color: #ffffcc } .highlight { background: #f8f8f8; } .highlight .c { color: #3D7B7B; font-style: italic } /\* Comment \*/ .highlight .err { border: 1px solid #F00 } /\* Error \*/ .highlight .k { color: #008000; font-weight: bold } /\* Keyword \*/ .highlight .o { color: #666 } /\* Operator \*/ .highlight .ch { color: #3D7B7B; font-style: italic } /\* Comment.Hashbang \*/ .highlight .cm { color: #3D7B7B; font-style: italic } /\* Comment.Multiline \*/ .highlight .cp { color: #9C6500 } /\* Comment.Preproc \*/ .highlight .cpf { color: #3D7B7B; font-style: italic } /\* Comment.PreprocFile \*/ .highlight .c1 { color: #3D7B7B; font-style: italic } /\* Comment.Single \*/ .highlight .cs { color: #3D7B7B; font-style: italic } /\* Comment.Special \*/ .highlight .gd { color: #A00000 } /\* Generic.Deleted \*/ .highlight .ge { font-style: italic } /\* Generic.Emph \*/ .highlight .ges { font-weight: bold; font-style: italic } /\* Generic.EmphStrong \*/ .highlight .gr { color: #E40000 } /\* Generic.Error \*/ .highlight .gh { color: #000080; font-weight: bold } /\* Generic.Heading \*/ .highlight .gi { color: #008400 } /\* Generic.Inserted \*/ .highlight .go { color: #717171 } /\* Generic.Output \*/ .highlight .gp { color: #000080; font-weight: bold } /\* Generic.Prompt \*/ .highlight .gs { font-weight: bold } /\* Generic.Strong \*/ .highlight .gu { color: #800080; font-weight: bold } /\* Generic.Subheading \*/ .highlight .gt { color: #04D } /\* Generic.Traceback \*/ .highlight .kc { color: #008000; font-weight: bold } /\* Keyword.Constant \*/ .highlight .kd { color: #008000; font-weight: bold } /\* Keyword.Declaration \*/ .highlight .kn { color: #008000; font-weight: bold } /\* Keyword.Namespace \*/ .highlight .kp { color: #008000 } /\* Keyword.Pseudo \*/ .highlight .kr { color: #008000; font-weight: bold } /\* Keyword.Reserved \*/ .highlight .kt { color: #B00040 } /\* Keyword.Type \*/ .highlight .m { color: #666 } /\* Literal.Number \*/ .highlight .s { color: #BA2121 } /\* Literal.String \*/ .highlight .na { color: #687822 } /\* Name.Attribute \*/ .highlight .nb { color: #008000 } /\* Name.Builtin \*/ .highlight .nc { color: #00F; font-weight: bold } /\* Name.Class \*/ .highlight .no { color: #800 } /\* Name.Constant \*/ .highlight .nd { color: #A2F } /\* Name.Decorator \*/ .highlight .ni { color: #717171; font-weight: bold } /\* Name.Entity \*/ .highlight .ne { color: #CB3F38; font-weight: bold } /\* Name.Exception \*/ .highlight .nf { color: #00F } /\* Name.Function \*/ .highlight .nl { color: #767600 } /\* Name.Label \*/ .highlight .nn { color: #00F; font-weight: bold } /\* Name.Namespace \*/ .highlight .nt { color: #008000; font-weight: bold } /\* Name.Tag \*/ .highlight .nv { color: #19177C } /\* Name.Variable \*/ .highlight .ow { color: #A2F; font-weight: bold } /\* Operator.Word \*/ .highlight .w { color: #BBB } /\* Text.Whitespace \*/ .highlight .mb { color: #666 } /\* Literal.Number.Bin \*/ .highlight .mf { color: #666 } /\* Literal.Number.Float \*/ .highlight .mh { color: #666 } /\* Literal.Number.Hex \*/ .highlight .mi { color: #666 } /\* Literal.Number.Integer \*/ .highlight .mo { color: #666 } /\* Literal.Number.Oct \*/ .highlight .sa { color: #BA2121 } /\* Literal.String.Affix \*/ .highlight .sb { color: #BA2121 } /\* Literal.String.Backtick \*/ .highlight .sc { color: #BA2121 } /\* Literal.String.Char \*/ .highlight .dl { color: #BA2121 } /\* Literal.String.Delimiter \*/ .highlight .sd { color: #BA2121; font-style: italic } /\* Literal.String.Doc \*/ .highlight .s2 { color: #BA2121 } /\* Literal.String.Double \*/ .highlight .se { color: #AA5D1F; font-weight: bold } /\* Literal.String.Escape \*/ .highlight .sh { color: #BA2121 } /\* Literal.String.Heredoc \*/ .highlight .si { color: #A45A77; font-weight: bold } /\* Literal.String.Interpol \*/ .highlight .sx { color: #008000 } /\* Literal.String.Other \*/ .highlight .sr { color: #A45A77 } /\* Literal.String.Regex \*/ .highlight .s1 { color: #BA2121 } /\* Literal.String.Single \*/ .highlight .ss { color: #19177C } /\* Literal.String.Symbol \*/ .highlight .bp { color: #008000 } /\* Name.Builtin.Pseudo \*/ .highlight .fm { color: #00F } /\* Name.Function.Magic \*/ .highlight .vc { color: #19177C } /\* Name.Variable.Class \*/ .highlight .vg { color: #19177C } /\* Name.Variable.Global \*/ .highlight .vi { color: #19177C } /\* Name.Variable.Instance \*/ .highlight .vm { color: #19177C } /\* Name.Variable.Magic \*/ .highlight .il { color: #666 } /\* Literal.Number.Integer.Long \*/  @font-face { font-family: 'MonaspaceArgon'; src: url('/assets/fonts/MonaspaceArgon-Regular.woff2') format('woff2'); font-weight: 400; font-style: normal; } pre, code { font-family: 'MonaspaceArgon', ui-monospace, monospace; }

Artemis now has a feature to flag websites that you have subscribed to as suspicious. This feature appears in two places:

1. In the “Report spam or domain takeover: [Report website as suspicious](https://jamesg.blog/cdn-cgi/l/email-protection#6405161001090d17240e05090117034a06080b035b1711060e010710590c101014175e4b4b011c05091408014a070b09415654170c0b11080041565406014156540905160f01004156540517415654171117140d070d0b1117)” link that appears on the page where you edit an author you are following, and;
2. On the page to unsubscribe from an author.

You can also email Artemis at any time using the email [[email protected]](https://jamesg.blog/cdn-cgi/l/email-protection) to report a suspicious website.

If a site has been marked as suspicious, Artemis takes several steps to protect users.

When to flag a website as suspicious
----------

You might want to use this feature if:

1. A website you are following has been taken over and is now a [zombie site](https://indieweb.org/zombie).
2. You have noticed suspicious content published by the author (i.e. spam).

When a website is flagged as suspicious, I will review your email. If I agree that a website is suspicious, a few things will happen in Artemis.

What happens when a website has been flagged as suspicious
----------

First, every link to the domain in users’ Artemis feeds will show a message that says “This link has been flagged as suspicious. Learn why.”, where "Learn why" is linked to a dedicated landing page explaining the page has been flagged as suspicious (pictured later in this blog post).

Here is what the inline “This link has been flagged as suspicious. Learn why.” message looks like:

![An entry in an Artemis feed that has been visually indented and has the preface "This link has been flagged as suspicious. Learn why."](https://editor.jamesg.blog/content/images/2026/06/suspiciouslearnwhylink.png)

ALT

An entry in an Artemis feed that has been visually indented and has the preface "This link has been flagged as suspicious. Learn why."

Of note, this check happens at the URL level, rather than the author level. Suppose example.com has been flagged. Every URL in my feed with the domain example.com will appear with the aforementioned message. If I follow example.com, all posts in their feed with the domain example.com will be flagged [^1]. If someone I follow has a "bookmarks" feed that lists links to articles they have bookmarked, all URLs with the domain example.com will show the message.

Second, every link to the domain in users’ Artemis feeds (and in the API) will be replaced to a web page within Artemis that informs the user the link they are about to open has been flagged as suspicious. Here is what the web page looks like:

![](https://editor.jamesg.blog/content/images/2026/06/wallsuspicious.png) <details style="margin-top: 1rem"> <summary>View alternative text</summary>

Title: Suspicious link

The domain of the page you are trying to open (example.com) has been flagged as being potentially malicious.

This flag appears when the Artemis service operator identifies a site may have become spam.

We recommend proceeding to the website with caution.

The link you are trying to open is:

https://example.com/test

Should this domain not be flagged as suspicious? If so, let us know by email.

</details>

This feature allows a user to learn that a domain has been flagged as suspicious without having to first open the link. Also, there is no mechanism to proceed to the link within Artemis. This is because any site that has been flagged as suspicious has been, at minimum, reviewed by me.

The suspicious link page has the following URL structure:

```
https://artemis.jamesg.blog/confirm-potentially-suspicious-url?uuid=e61d6c1b681f4f40ac1c382b87ae160c
```

Originally, I was going to include the URL whose domain has been flagged as a URL parameter, but I decided instead to implement this using a post's UUID. When the page is loaded, Artemis checks if:

1. The UUID matches a post in a user's feed, and;
2. The domain associated with the UUID has been flagged as suspicious.

If both of these things are true, the aforementioned suspicious link page in Artemis shows up. Otherwise, the user is redirected to their Artemis feed. These checks are necessary so that a user can't craft a link that makes it look like Artemis has flagged a website as suspicious that is not actually flagged.

Second, a notice will appear at the top of the author page associated with the domain (if applicable) to indicate that the website has been marked as suspicious:

![](https://editor.jamesg.blog/content/images/2026/06/editwall.png) <details style="margin-top: 1rem"> <summary>View alternative text</summary>

This author's website has been flagged as suspicious

The Artemis system operator has marked the domain this author uses as suspicious.

This flag appears when the Artemis service operator identifies a site may have become spam.

We recommend checking if the website is one you want to still want to follow.

If you think this is an error, please [let us know](https://jamesg.blog/cdn-cgi/l/email-protection#c8a9babcada5a1bb88a2a9a5adbbafe6aaa4a7aff7bbbdaaa2adabbcf5a0bcbcb8bbf2e7e7adb0a9a5b8a4ade6aba7a5e8bba0a7bda4ace8a6a7bce8aaade8a5a9baa3adace8a9bbe8bbbdbbb8a1aba1a7bdbb).

</details>

This feature explicitly invites a user to consider whether they still want to subscribe to a website. The user can still keep their subscription, but if a site has been marked as suspicious it not likely that someone would want to do this.

Third, anyone who tries to subscribe to the domain will see a message warning them that the website has been marked as suspicious. Subscribing to the domain will be disabled. Here is what the warning message looks like:

![](https://editor.jamesg.blog/content/images/2026/06/subscribewall.png) <details style="margin-top: 1rem"> <summary>View alternative text</summary>

This website has been flagged as suspicious

The Artemis system operator has marked the domain of the website you are trying to follow as suspicious.

This flag appears when the Artemis service operator identifies a site may have become spam.

As a result of this flag, you cannot subscribe to this website.

If you think this is an error, please [let us know](https://jamesg.blog/cdn-cgi/l/email-protection#3c5d4e485951554f7c565d51594f5b125e50535b034f495e56595f48015448484c4f06131359445d514c5059125f53511c4f54534950581c5253481c5e591c515d4e5759581c5d4f1c4f494f4c555f5553494f).

</details>

These changes are designed so that:

1. Users don’t click links to a site that has been marked as suspicious.
2. Users can see an author they are following has been flagged as suspicious when they visit the edit author page associated with the website.
3. Users cannot subscribe to a site that has been marked as suspicious.

Importantly, all error messages have a link to contact me if a user thinks a domain that has been marked as suspicious is now fine. This is important because a site may not be suspicious forever.

### Areas yet not covered ###

One area that is not covered by the malicious URL guard is links in a user's [Artemis link graph](https://jamesg.blog/2025/03/17/artemis-link-graph). This is something I am planning to work on. I think the implementation will involve leaving out entries by any domains that have been marked as suspicious, and creating a new key that lists domains that have been marked as suspicious to which the user has subscribed.

What happens if you think a site has been flagged as suspicious in error
----------

If you notice that a site has been flagged as suspicious when it looks fine, please contact [[email protected]](https://jamesg.blog/cdn-cgi/l/email-protection) and I will investigate.

Why this feature exists
----------

In [Mitigating floods of posts in Artemis](https://jamesg.blog/2026/05/30/mitigating-floods-of-posts-in-artemis), I noted that a site I had been following for several months had become inactive and, later, had become a zombie site. The site published several spam posts which appeared in my reader. This got me thinking about how there should be a mechanism for reporting sites like this to Artemis so users get a message when a site has been marked as suspicious.

The website I encountered this weekend that is now spam has been marked as suspicious, meaning that users will see all the aforementioned messages and visual indicators I mentioned in the last section.

Reflections on this feature
----------

There are several improvements I may make to the suspicious website feature in the future. First, it would be nice to allow in-platform reporting, rather than relying on email. I opted to add an email-based reporting system since: (i) an email-based system is easier to implement than manage, and doesn’t add too much friction compared to what an in-platform flow would look like, and; (ii) because I could implement this quicker, I could have something in place faster than I otherwise would.

I may also add a feature so that I as the platform operator can write a custom message to display next to the aforementioned warnings so that a user knows exactly why a site has been flagged as suspicious. Indeed, there are many reasons a site may be marked as suspicious: the site may [have become a zombie website](https://indieweb.org/zombie) and now promotes spam, the site may have been hacked, the site may show signs of phishing or distributing malware.

In addition, I am curious about whether there are automated ways to detect whether a site has become a [zombie website](https://indieweb.org/zombie). This could include a combination of factors such as, for example, a burst in posts after a long period of no content being published, a change in web host or site generator, a domain registrar change, all the posts on a website suddenly changing language, and more. I will need to do research to see if there is prior art on this topic. Any automated method would require careful implementation; false positives would create a significant user experience issue.

Of note, this feature does not check domains against an external database like [Google’s Safe Browsing utility](https://transparencyreport.google.com/safe-browsing/search?). This is because doing so would involve sending lists of domains to which users have subscribed to a third party. The current Artemis implementation relies solely on user reports and my adding URLs manually as I encounter them.

If you have any feedback on this feature, please do let me know at [[email protected]](https://jamesg.blog/cdn-cgi/l/email-protection). Countering spam and ensuring users do not click on malicious links is essential to ensure people feel safe when using the software.

[Also posted on IndieNews](https://news.indieweb.org/en).

<sup class="footnote-definition-label" id="f-1">1</sup>

Reflecting on this more, Artemis should also flag all posts by an author whose domain matches a suspicious one, instead of solely looking at the URL level. I will need to implement this.

[[↩]](https://jamesg.blog/longform-feed#f-1)

[have become a zombie website](https://indieweb.org/zombie) [zombie site](https://indieweb.org/zombie) [zombie website](https://indieweb.org/zombie) [Artemis link graph](https://jamesg.blog/2025/03/17/artemis-link-graph) [Mitigating floods of posts in Artemis](https://jamesg.blog/2026/05/30/mitigating-floods-of-posts-in-artemis) [[email protected]](https://jamesg.blog/cdn-cgi/l/email-protection) [let us know](https://jamesg.blog/cdn-cgi/l/email-protection#3c5d4e485951554f7c565d51594f5b125e50535b034f495e56595f48015448484c4f06131359445d514c5059125f53511c4f54534950581c5253481c5e591c515d4e5759581c5d4f1c4f494f4c555f5553494f) [Report website as suspicious](https://jamesg.blog/cdn-cgi/l/email-protection#6405161001090d17240e05090117034a06080b035b1711060e010710590c101014175e4b4b011c05091408014a070b09415654170c0b11080041565406014156540905160f01004156540517415654171117140d070d0b1117) [let us know](https://jamesg.blog/cdn-cgi/l/email-protection#c8a9babcada5a1bb88a2a9a5adbbafe6aaa4a7aff7bbbdaaa2adabbcf5a0bcbcb8bbf2e7e7adb0a9a5b8a4ade6aba7a5e8bba0a7bda4ace8a6a7bce8aaade8a5a9baa3adace8a9bbe8bbbdbbb8a1aba1a7bdbb) [[↩]](https://jamesg.blog/longform-feed#f-1) [Also posted on IndieNews](https://news.indieweb.org/en) [Google’s Safe Browsing utility](https://transparencyreport.google.com/safe-browsing/search?)