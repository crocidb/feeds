+++
title = "Loading bold and italics fonts on my website"
description = "A while ago, I noticed that my headings did not look consistent across Firefox and Safari. I learned that this was because the font file I was using on my website did not contain bold characters. This meant that browsers were trying to “synthesise” a bold font. This synthesised f"
date = "2026-09-14T00:00:00Z"
url = "https://jamesg.blog/2026/09/14/bold-italic-fonts"
author = "with words, wonder"
text = ""
lastupdated = "2026-09-21T09:42:42.421608600Z"
seen = false
+++

pre { line-height: 125%; } td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } .highlight .hll { background-color: #49483e } .highlight { background: #272822; color: #F8F8F2 } .highlight .c { color: #959077 } /\* Comment \*/ .highlight .err { color: #ED007E; background-color: #1E0010 } /\* Error \*/ .highlight .esc { color: #F8F8F2 } /\* Escape \*/ .highlight .g { color: #F8F8F2 } /\* Generic \*/ .highlight .k { color: #66D9EF } /\* Keyword \*/ .highlight .l { color: #AE81FF } /\* Literal \*/ .highlight .n { color: #F8F8F2 } /\* Name \*/ .highlight .o { color: #FF4689 } /\* Operator \*/ .highlight .x { color: #F8F8F2 } /\* Other \*/ .highlight .p { color: #F8F8F2 } /\* Punctuation \*/ .highlight .ch { color: #959077 } /\* Comment.Hashbang \*/ .highlight .cm { color: #959077 } /\* Comment.Multiline \*/ .highlight .cp { color: #959077 } /\* Comment.Preproc \*/ .highlight .cpf { color: #959077 } /\* Comment.PreprocFile \*/ .highlight .c1 { color: #959077 } /\* Comment.Single \*/ .highlight .cs { color: #959077 } /\* Comment.Special \*/ .highlight .gd { color: #FF4689 } /\* Generic.Deleted \*/ .highlight .ge { color: #F8F8F2; font-style: italic } /\* Generic.Emph \*/ .highlight .ges { color: #F8F8F2; font-weight: bold; font-style: italic } /\* Generic.EmphStrong \*/ .highlight .gr { color: #F8F8F2 } /\* Generic.Error \*/ .highlight .gh { color: #F8F8F2 } /\* Generic.Heading \*/ .highlight .gi { color: #A6E22E } /\* Generic.Inserted \*/ .highlight .go { color: #66D9EF } /\* Generic.Output \*/ .highlight .gp { color: #FF4689; font-weight: bold } /\* Generic.Prompt \*/ .highlight .gs { color: #F8F8F2; font-weight: bold } /\* Generic.Strong \*/ .highlight .gu { color: #959077 } /\* Generic.Subheading \*/ .highlight .gt { color: #F8F8F2 } /\* Generic.Traceback \*/ .highlight .kc { color: #66D9EF } /\* Keyword.Constant \*/ .highlight .kd { color: #66D9EF } /\* Keyword.Declaration \*/ .highlight .kn { color: #FF4689 } /\* Keyword.Namespace \*/ .highlight .kp { color: #66D9EF } /\* Keyword.Pseudo \*/ .highlight .kr { color: #66D9EF } /\* Keyword.Reserved \*/ .highlight .kt { color: #66D9EF } /\* Keyword.Type \*/ .highlight .ld { color: #E6DB74 } /\* Literal.Date \*/ .highlight .m { color: #AE81FF } /\* Literal.Number \*/ .highlight .s { color: #E6DB74 } /\* Literal.String \*/ .highlight .na { color: #A6E22E } /\* Name.Attribute \*/ .highlight .nb { color: #F8F8F2 } /\* Name.Builtin \*/ .highlight .nc { color: #A6E22E } /\* Name.Class \*/ .highlight .no { color: #66D9EF } /\* Name.Constant \*/ .highlight .nd { color: #A6E22E } /\* Name.Decorator \*/ .highlight .ni { color: #F8F8F2 } /\* Name.Entity \*/ .highlight .ne { color: #A6E22E } /\* Name.Exception \*/ .highlight .nf { color: #A6E22E } /\* Name.Function \*/ .highlight .nl { color: #F8F8F2 } /\* Name.Label \*/ .highlight .nn { color: #F8F8F2 } /\* Name.Namespace \*/ .highlight .nx { color: #A6E22E } /\* Name.Other \*/ .highlight .py { color: #F8F8F2 } /\* Name.Property \*/ .highlight .nt { color: #FF4689 } /\* Name.Tag \*/ .highlight .nv { color: #F8F8F2 } /\* Name.Variable \*/ .highlight .ow { color: #FF4689 } /\* Operator.Word \*/ .highlight .pm { color: #F8F8F2 } /\* Punctuation.Marker \*/ .highlight .w { color: #F8F8F2 } /\* Text.Whitespace \*/ .highlight .mb { color: #AE81FF } /\* Literal.Number.Bin \*/ .highlight .mf { color: #AE81FF } /\* Literal.Number.Float \*/ .highlight .mh { color: #AE81FF } /\* Literal.Number.Hex \*/ .highlight .mi { color: #AE81FF } /\* Literal.Number.Integer \*/ .highlight .mo { color: #AE81FF } /\* Literal.Number.Oct \*/ .highlight .sa { color: #E6DB74 } /\* Literal.String.Affix \*/ .highlight .sb { color: #E6DB74 } /\* Literal.String.Backtick \*/ .highlight .sc { color: #E6DB74 } /\* Literal.String.Char \*/ .highlight .dl { color: #E6DB74 } /\* Literal.String.Delimiter \*/ .highlight .sd { color: #E6DB74 } /\* Literal.String.Doc \*/ .highlight .s2 { color: #E6DB74 } /\* Literal.String.Double \*/ .highlight .se { color: #AE81FF } /\* Literal.String.Escape \*/ .highlight .sh { color: #E6DB74 } /\* Literal.String.Heredoc \*/ .highlight .si { color: #E6DB74 } /\* Literal.String.Interpol \*/ .highlight .sx { color: #E6DB74 } /\* Literal.String.Other \*/ .highlight .sr { color: #E6DB74 } /\* Literal.String.Regex \*/ .highlight .s1 { color: #E6DB74 } /\* Literal.String.Single \*/ .highlight .ss { color: #E6DB74 } /\* Literal.String.Symbol \*/ .highlight .bp { color: #F8F8F2 } /\* Name.Builtin.Pseudo \*/ .highlight .fm { color: #A6E22E } /\* Name.Function.Magic \*/ .highlight .vc { color: #F8F8F2 } /\* Name.Variable.Class \*/ .highlight .vg { color: #F8F8F2 } /\* Name.Variable.Global \*/ .highlight .vi { color: #F8F8F2 } /\* Name.Variable.Instance \*/ .highlight .vm { color: #F8F8F2 } /\* Name.Variable.Magic \*/ .highlight .il { color: #AE81FF } /\* Literal.Number.Integer.Long \*/ .highlight .nn, .highlight .n{color: light-dark(black, var(--dark-foreground-color)) }pre { line-height: 125%; } td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; } td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; } .highlight .hll { background-color: #ffffcc } .highlight { background: #f8f8f8; } .highlight .c { color: #3D7B7B; font-style: italic } /\* Comment \*/ .highlight .err { border: 1px solid #F00 } /\* Error \*/ .highlight .k { color: #008000; font-weight: bold } /\* Keyword \*/ .highlight .o { color: #666 } /\* Operator \*/ .highlight .ch { color: #3D7B7B; font-style: italic } /\* Comment.Hashbang \*/ .highlight .cm { color: #3D7B7B; font-style: italic } /\* Comment.Multiline \*/ .highlight .cp { color: #9C6500 } /\* Comment.Preproc \*/ .highlight .cpf { color: #3D7B7B; font-style: italic } /\* Comment.PreprocFile \*/ .highlight .c1 { color: #3D7B7B; font-style: italic } /\* Comment.Single \*/ .highlight .cs { color: #3D7B7B; font-style: italic } /\* Comment.Special \*/ .highlight .gd { color: #A00000 } /\* Generic.Deleted \*/ .highlight .ge { font-style: italic } /\* Generic.Emph \*/ .highlight .ges { font-weight: bold; font-style: italic } /\* Generic.EmphStrong \*/ .highlight .gr { color: #E40000 } /\* Generic.Error \*/ .highlight .gh { color: #000080; font-weight: bold } /\* Generic.Heading \*/ .highlight .gi { color: #008400 } /\* Generic.Inserted \*/ .highlight .go { color: #717171 } /\* Generic.Output \*/ .highlight .gp { color: #000080; font-weight: bold } /\* Generic.Prompt \*/ .highlight .gs { font-weight: bold } /\* Generic.Strong \*/ .highlight .gu { color: #800080; font-weight: bold } /\* Generic.Subheading \*/ .highlight .gt { color: #04D } /\* Generic.Traceback \*/ .highlight .kc { color: #008000; font-weight: bold } /\* Keyword.Constant \*/ .highlight .kd { color: #008000; font-weight: bold } /\* Keyword.Declaration \*/ .highlight .kn { color: #008000; font-weight: bold } /\* Keyword.Namespace \*/ .highlight .kp { color: #008000 } /\* Keyword.Pseudo \*/ .highlight .kr { color: #008000; font-weight: bold } /\* Keyword.Reserved \*/ .highlight .kt { color: #B00040 } /\* Keyword.Type \*/ .highlight .m { color: #666 } /\* Literal.Number \*/ .highlight .s { color: #BA2121 } /\* Literal.String \*/ .highlight .na { color: #687822 } /\* Name.Attribute \*/ .highlight .nb { color: #008000 } /\* Name.Builtin \*/ .highlight .nc { color: #00F; font-weight: bold } /\* Name.Class \*/ .highlight .no { color: #800 } /\* Name.Constant \*/ .highlight .nd { color: #A2F } /\* Name.Decorator \*/ .highlight .ni { color: #717171; font-weight: bold } /\* Name.Entity \*/ .highlight .ne { color: #CB3F38; font-weight: bold } /\* Name.Exception \*/ .highlight .nf { color: #00F } /\* Name.Function \*/ .highlight .nl { color: #767600 } /\* Name.Label \*/ .highlight .nn { color: #00F; font-weight: bold } /\* Name.Namespace \*/ .highlight .nt { color: #008000; font-weight: bold } /\* Name.Tag \*/ .highlight .nv { color: #19177C } /\* Name.Variable \*/ .highlight .ow { color: #A2F; font-weight: bold } /\* Operator.Word \*/ .highlight .w { color: #BBB } /\* Text.Whitespace \*/ .highlight .mb { color: #666 } /\* Literal.Number.Bin \*/ .highlight .mf { color: #666 } /\* Literal.Number.Float \*/ .highlight .mh { color: #666 } /\* Literal.Number.Hex \*/ .highlight .mi { color: #666 } /\* Literal.Number.Integer \*/ .highlight .mo { color: #666 } /\* Literal.Number.Oct \*/ .highlight .sa { color: #BA2121 } /\* Literal.String.Affix \*/ .highlight .sb { color: #BA2121 } /\* Literal.String.Backtick \*/ .highlight .sc { color: #BA2121 } /\* Literal.String.Char \*/ .highlight .dl { color: #BA2121 } /\* Literal.String.Delimiter \*/ .highlight .sd { color: #BA2121; font-style: italic } /\* Literal.String.Doc \*/ .highlight .s2 { color: #BA2121 } /\* Literal.String.Double \*/ .highlight .se { color: #AA5D1F; font-weight: bold } /\* Literal.String.Escape \*/ .highlight .sh { color: #BA2121 } /\* Literal.String.Heredoc \*/ .highlight .si { color: #A45A77; font-weight: bold } /\* Literal.String.Interpol \*/ .highlight .sx { color: #008000 } /\* Literal.String.Other \*/ .highlight .sr { color: #A45A77 } /\* Literal.String.Regex \*/ .highlight .s1 { color: #BA2121 } /\* Literal.String.Single \*/ .highlight .ss { color: #19177C } /\* Literal.String.Symbol \*/ .highlight .bp { color: #008000 } /\* Name.Builtin.Pseudo \*/ .highlight .fm { color: #00F } /\* Name.Function.Magic \*/ .highlight .vc { color: #19177C } /\* Name.Variable.Class \*/ .highlight .vg { color: #19177C } /\* Name.Variable.Global \*/ .highlight .vi { color: #19177C } /\* Name.Variable.Instance \*/ .highlight .vm { color: #19177C } /\* Name.Variable.Magic \*/ .highlight .il { color: #666 } /\* Literal.Number.Integer.Long \*/  @font-face { font-family: 'MonaspaceArgon'; src: url('/assets/fonts/MonaspaceArgon-Regular.woff2') format('woff2'); font-weight: 400; font-style: normal; } pre, code { font-family: 'MonaspaceArgon', ui-monospace, monospace; }

A while ago, I noticed that my headings did not look consistent across Firefox and Safari. I learned that this was because the font file I was using on my website did not contain bold characters. This meant that browsers were trying to “synthesise” a bold font.

This synthesised font, while achieving its functional requirement – being bold – was not optimal because the font family I was using did in fact have a designed bold typeface. This bold typeface, however, was in a separate file. I recently l learned this can happen with italics, too: if no italic version of a character is available in a font file, the browser will try to synthesise one <sup class="footnote-reference" id="f-1"><a href="https://jamesg.blog/longform-feed#1">1</a></sup>.

You can see the impact of font synthesis in the [font synthesis playground I have made](https://playground.jamesg.blog/font-synthesis.html), which lets you toggle between applying the regular font (without bold, italic, or bold and italic styles) and the appropriate font (i.e. the bold font for bold text).

Whereas “[variable fonts](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts)” can encompass multiple axes of a font (bold, italic, bold and italic at the same time, and more), the font I use, [Standard](https://github.com/brycewilner/Standard), had regular, bold, italic, and bold and italic in different files.

Incrementally, I have changed my site so that I now load four separate font files from the [Standard](https://github.com/brycewilner/Standard) font family for use in body text. Here is what the CSS looks like:

```
@font-face {
  font-family: "Standard";
  src: url("/assets/fonts/standard-book-webfont.woff2");
  font-display: swap;
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "Standard";
  src: url("/assets/fonts/standard-bold-webfont.woff2");
  font-display: swap;
  font-weight: bold;
  font-style: normal;
}
@font-face {
  font-family: "Standard";
  src: url("/assets/fonts/standard-book-italic-webfont.woff2");
  font-display: swap;
  font-style: italic;
  font-weight: normal;
}
@font-face {
  font-family: "Standard";
  src: url("/assets/fonts/standard-bold-italic-webfont.woff2");
  font-display: swap;
  font-style: italic;
  font-weight: bold;
}

```

Above, the same font name is used across all declarations – “Standard” – but the font style and weight properties vary. In the first declaration, “Standard” is loaded with the normal style and weight. For the bold font, in the second declaration, the `font-style` value is equal to `normal`, but the `font-weight` property is equal to `bold.`For the italic font, in the third declaration, the `font-style` value is equal to `italic`, and the `font-weight` property is equal to `normal`. The fourth declaration will apply if text is both bold and italic.

I then use the following code to apply the styles:

```
html {
	font-family: "Standard", sans-serif;
}

```

By specifying font files for each style “book-webfont” (regular), “bold-webfont” (bold), “book-italic-webfont” (italic), and “bold-italic-webfont” (bold and italic), the browser will look characters in all of these font faces before trying to synthesise a font.

If you ever see that italic or bold text doesn’t look the same in different browsers, or that your italic or bold text doesn’t look like it should, consider checking whether the typeface you have chosen requires you to load different files to represent characters in bold, italic, and bold and italic.

For further reading, the [MDN page on the @font-face declaration](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/At-rules/@font-face) documents more rules you can apply when loading a font.

*This is my second post as part of the [WASSUP 2026 challenge](https://tantek.com/2026/244/t1/september-blogging-challenge-wassup), in which participants are invited to write useful tips about the web or web standards in the month of September. [Read my first contribution to WASSUP 2026.](https://jamesg.blog/2026/09/02/hide-on-desktop-mobile-css)*

Addendum
----------

After publishing this post, I noticed that `/assets/fonts/standard-bold-italic-webfont.woff2` was not loading on the page. I experimented a little bit and added `<strong><em>test</em></strong>` to the page using developer tools in Firefox. As soon as I added the element, Firefox loaded the font file. There must be some intelligent logic going on in the browser to only load the font when it is needed (if anyone knows more about how this works, do let me know!).

<sup class="footnote-definition-label" id="f-2">1</sup>

Although not relevant to solving the problem outlined in the introduction of this post, how – and whether – browsers synthesise fonts can be controlled by the `font-synthesis` property.

[[↩]](https://jamesg.blog/longform-feed#f-1)

[variable fonts](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts) [MDN page on the @font-face declaration](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/At-rules/@font-face) [Standard](https://github.com/brycewilner/Standard) [Read my first contribution to WASSUP 2026.](https://jamesg.blog/2026/09/02/hide-on-desktop-mobile-css) [1](https://jamesg.blog/longform-feed#1) [[↩]](https://jamesg.blog/longform-feed#f-1) [font synthesis playground I have made](https://playground.jamesg.blog/font-synthesis.html) [WASSUP 2026 challenge](https://tantek.com/2026/244/t1/september-blogging-challenge-wassup)