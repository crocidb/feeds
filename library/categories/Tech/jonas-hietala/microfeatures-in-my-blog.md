---
title = "Microfeatures in my blog"
description = " xkcd: Nerd snipingA while I ago I encountered a blog post called Microfeatures I Love in Blogs and Personal Websites, and together with the related [Hacker News d"
date = "2025-01-18T19:10:29Z"
url = "http://jonashietala.se/blog/2024/07/09/microfeatures_in_my_blog/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.179840347Z"
seen = true
---

![](/images/microfeatures/nerd_sniping.png) [xkcd: Nerd sniping](https://xkcd.com/356/)

A while I ago I encountered a blog post called [Microfeatures I Love in Blogs and Personal Websites](https://danilafe.com/blog/blog_microfeatures/), and together with the related [Hacker News discussion](https://news.ycombinator.com/item?id=40774277) I got [nerd sniped](https://xkcd.com/356/). (I spent more time than I care to admit implementing new and exciting microfeatures for the blog.)

[Microfeatures are fun and time consuming](#Microfeatures-are-fun-and-time-consuming)
----------

For some people, blogging is their job. For me, blogging is a way to delve deeper into ideas, to document my journey to future me, to relax, or have fun. Microfeatures are *fun* and so they’re a perfect fit for my blog.

I also really appreciate microfeatures in other blogs. It’s nice to [discover a beautiful table of content](https://www.evalapply.org/posts/n-ways-to-fizzbuzz-in-clojure/index.html) or a [page with favorite blog posts](https://jvns.ca/categories/favorite/). It makes me want to stick around longer and appreciate the craft that is blogging.

But realize that microfeatures take time to implement. One small feature won’t make a big difference but dozens of microfeatures might transform your blog rewrite you thought were going to take a weekend, to a project spanning weeks or even months.

[Microfeatures I’ve implemented](#Microfeatures-Ive-implemented)
----------

Here’s a collection of notable microfeatures I’ve implemented for the blog. It’s not an exhaustive list, just the ones I think are fun, interesting, or that I’d like to see in more blogs.

### [Published and revision info](#Published-and-revision-info) ###

There’s a trend for blog posts to not include the date the post was published—and I hate it, *especially* for technical content. I don’t even like to call the date of publishing a “micro” feature as it’s more an essential feature.

Regardless, I include the published date below the post title in my blog:

![](/images/microfeatures/with_published_date.png) The published date together with the Git commit.

I also think it’s valuable to display the date the post was updated:

![](/images/microfeatures/with_rev_date.png) The date of the last revision together with the corresponding Git commit.

I guess it would be more precise to manually specify when the post was updated, to avoid changes like [Enclose titles in “, now an error after Hakyll update](https://github.com/treeman/jonashietala/commit/011cebb16131566a186b1fe7c8ba884890a688d6) where the post content isn’t changed in a meaningful way. It’s too bothersome to remember though so I rely on the Git history and have a list of commits I ignore when I fetch the dates. Not perfect but good enough I think.

### [Quote attribution](#Quote-attribution) ###

>
>
> The only true wisdom is in knowing you know nothing.
>
>
>
> Socrates
>
>

Blockquotes are standard everywhere but you often want to show where the quote originates from.

I think it’s nicer to have specific styling for attributes than to solve it manually, like this:

>
>
> The only true wisdom is in knowing you know nothing.  
>  — Socrates
>
>

### [Different kinds of notes](#Different-kinds-of-notes) ###

I’m a fan of sidenotes and [I used them](/blog/2019/03/04/pollen_sidenotes) heavily [in the book I wrote](https://whycryptocurrencies.com/toc.html). They’re great for a certain style of content but for the blog I noticed I used them very rarely. Instead I use “notes” of different kinds to highlight certain things:

This is a regular note.

Update 2002-01-12

If I want to make a correction I can add a note with a timestamp.

Did you know that you can [check out the source](https://github.com/treeman/jonashietala) of this site to see how the features are implemented?

It’s easy to spend a lot of time building features for the blog instead of actually writing.

Building features just for the sake of building is perfectly fine!

Maybe a weird thing to prioritize in a post but I really like the additional color splash the notes can give to a post.

I also have footnotes[<sup>1</sup>](#fn1) (mostly because [Djot](https://djot.net/) provides them by default) but I never really use them. I guess I should use footnotes more now that I have them.

### [Enhanced code snippets](#Enhanced-code-snippets) ###

```
pub enum Code<'a> {
    Inline {
        code: &'a str,
        lang: Option<&'a str>,
    },
    Block {
        code: &'a str,
        lang: Option<&'a str>,
        path: Option<&'a str>,
        linenum_start: Option<u32>,
        highlight_lines: Option<RangeSet<u32>>,
    },
}

```

Embedding code into blogs is common practice and I’ve added a few extra features to the code display on my blog:

1. Overlay the language or file path.

   For code blocks there’s a small [description that displays the language](/blog/2023/10/06/language_spec_in_code_blocks). It can be customized to for example display the path of the file:

   ![](/images/microfeatures/code_descr.png)

   It’s accomplished using CSS with [data attributes](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes) and [::before](https://developer.mozilla.org/en-US/docs/Web/CSS/::before), and won’t be visible in the RSS feed.

   View the source Luke.

2. Syntax highlight for inline code elements.

   Highlighting code blocks is standard but I wonder, why don’t we also highlight inline code?

   It’s something I added to be able to refer back to values like `"-NoHU"`, `0`, and `require("telescope.builtin").find_files()` when explaining what happens inside a code block. A sentence with color is much more pleasing than the colorless `"-NoHU"`, `0`, and `require("telescope.builtin").find_files()` don’t you think?

3. Ability to highlight lines.

   ```
   code > .line.hl {
     background-color: var(--melange_a_sel);
   }

   ```

   Benjamin Tan’s excellent [blog post about Jujutsu](https://ofcr.se/jujutsu-merge-workflow) used highlighted lines to good effect and inspired me to implement them.

4. Line numbers with offset.

   ```
   code > .line[data-linenum]::before {
     content: attr(data-linenum);
     padding-right: var(--space-2xs);
     color: var(--melange_a_ui);
   }

   ```

   Line numbers is another feature I’ve recently implemented that I *think* is a good idea. Them being optional is important as line numbers adds visual bloat. I’ll probably only use them in very specific scenarios where I really want to call out code at certain lines.

   The selector at line 9 targets lines with the linenum [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes) to avoid the padding at line 11 to apply to code blocks without line numbers.

   Adding line numbers in [::before](https://developer.mozilla.org/en-US/docs/Web/CSS/::before) has the additional benefit of the line numbers not being included in the selection, so copying the code works as expected.

5. No images, no JavaScript, and no embedded Gists.

   It frustrates me to no end when someone has made the effort to write a good blog post and then use *images* for their code. Images inevitably fail to render as crisply as regular text and they’re either too small, too blurry, or impossible to read on the phone.

   I also really dislike requiring JavaScript just for displaying text or embedding code as [GitHub Gists](https://docs.github.com/en/get-started/writing-on-github/editing-and-sharing-content-with-gists/creating-gists). It’s just text—let’s serve it as text.

   I’ve gotten email at work with images of code they expected me to copy. That’s [Office Space thriller](https://www.youtube.com/watch?v=2mtTBtMXNkg) material and such behavior will earn you enemies for life.

### [Table of content](#Table-of-content) ###

I can optionally insert a table of contents by including a `:table-of-content:` marker in the markup. It uses the [\<details\>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) element and is collapsed by default. When expanded it looks like this:

![](/images/microfeatures/toc.png) Expanded table of content for [Let’s create a Tree-sitter grammar](/blog/2024/03/19/lets_create_a_tree-sitter_grammar).

It’s important for me that the table of content is optional as I have a mix of small and large posts. The table of content is generated from the first two heading levels and it works quite well for my use-case.

### [Flex and gallery display for images](#Flex-and-gallery-display-for-images) ###

I sometimes want to display two or more images next to each other. Instead of having images embedded like normal I place two or more images in a `<figure>` and use [flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flexible_box_layout/Basic_concepts_of_flexbox) to place them next to each other:

[![](/images/hextraction/fancy_board.jpg)](/images/hextraction/fancy_board.jpg) [![](/images/hextraction/modular_board.jpg)](/images/hextraction/modular_board.jpg)

Two boards for a game called [Hextraction](https://www.playhextraction.com/) that I [3D printed](/blog/2024/02/09/printing_hextraction_for_my_kids).

When I have more images I use [CSS grid](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout) to create a small gallery:

[![](/images/trap14/Robot_0001.jpg)](/images/trap14/Robot_0001.jpg) [![](/images/trap14/Robot_0002.jpg)](/images/trap14/Robot_0002.jpg) [![](/images/trap14/Robot_0005.jpg)](/images/trap14/Robot_0005.jpg) [![](/images/trap14/Robot_0010.JPG)](/images/trap14/Robot_0010.JPG) [![](/images/trap14/Robot_0012.JPG)](/images/trap14/Robot_0012.JPG) [![](/images/trap14/Robot_0013.JPG)](/images/trap14/Robot_0013.JPG)

Pictures of a robot project from my time at the University.

### [Embedding YouTube thumbnails](#Embedding-YouTube-thumbnails) ###

[https://www.youtube.com/watch?v=eoKDyhxCVm0](https://www.youtube.com/watch?v=eoKDyhxCVm0)

The recommended way to embed YouTube videos is to use iframes and it’s something [I implemented over a decade ago](/blog/2014/09/01/embedding_youtube_videos_with_hakyll). It works but it’s not a great solution. Embedding anything from Google is an enabler for their all-encompassing privacy violations and [YouTube embeds are bananas heavy](https://frontendmasters.com/blog/youtube-embeds-are-bananas-heavy-and-its-fixable/).

Instead I embed an image generated from the video (served from my site, not YouTube) and make it a link that takes you to YouTube. I could’ve used JavaScript to convert the placeholder into an embedded video when clicked but I like simplicity and redirecting to YouTube allows third-party players to handle the redirect.

### [Different list types](#Different-list-types) ###

I like lists and I have several different types I can use to mix things up a bit.

Here are some ordered list types:

1. One
2. Two

1. Alpha 1
2. Alpha 2

1. Roman 1
2. Roman 2

1. Alpha
2. Beta

And here are some unordered list types:

* Bullet

* Dash

* Plus

Necessary? No.  
 Fun? I think so.

### [Unbroken indexes of all posts](#Unbroken-indexes-of-all-posts) ###

Under [/archive](/archive) I have a list of all posts so it’s easy to scroll through and get an overview of what I’ve written about during the 15 years the blog has been active.

Naturally there’s no pagination so you can just scroll through. I only have *279* posts… What’s the point of pagination anyway?

There’s also indexes for [tags](/blog/tags) (see [keyboards](/blog/tags/keyboards)) and per year (see [2023](/blog/2023)). The yearly index mostly exists so I have an easy way to see the past years posts when I do my [yearly review](/blog/tags/yearly_review).

### [Featured & favorite posts](#Featured-favorite-posts) ###

Highlighting favorite posts is a good idea I got from the [Hacker News discussion](https://news.ycombinator.com/item?id=40774277) and one I just had to implement after seeing it. I handle featured and favorite posts in three ways:

1. I list five featured posts on the homepage:

   ![](/images/microfeatures/featured_posts.png) Featured posts on the homepage.

   A featured post isn’t the same as a favorite post, although the featured posts tend to be favorites.

2. All favorite posts are listed under [/favorite](/favorite).

3. Each favorite post is accompanied by a star: `<span class="favorite"><a href="/favorite">★</a></span>`

   ![](/images/microfeatures/archive_favs.png) A post listing from the [archives](/archive).

   Clicking on the star takes you to [/favorite](/favorite).

### [Series](#Series) ###

Tags are fine for grouping slightly related posts but sometimes posts follow a more structured story, which is where [series](/series) come in.

A good example of a series is the [Let’s build a VORON Trident](/series/voron_trident) where I document my journey of building my first 3D printer over 12 posts.

There’s a few features that come with a series:

1. All series, both ongoing and completed, are listed under [/series](/series).

2. Each series gets a separate page with a description and the list of posts.

   See [/series/voron\_trident](/series/voron_trident) or [/series/t-34](/series/t-34).

3. A post is clearly marked as belonging to a series.

   It’s marked next to the post title:

   ![](/images/microfeatures/series_post_title.png) The series is marked both above and below the post title.

   And more information about the series is included at the end of the post, so it’s easy to jump around in the series:

   ![](/images/microfeatures/series_post_end.png) All posts in the series are included at the end of a post.
4. Selected series are showcased on the homepage.

I like series and I want to write more series. The drawback is that they take more effort to create than standalone blog posts. As my attention and motivation tends to shift a lot this increases the [risk of stress](/blog/2023/03/14/battling_burnout) if I lose motivation in the middle of a series.

### [Projects](#Projects) ###

While a blog is about writing I also wanted to highlight some of the personal projects I’ve made.

There are no individual pages for the projects as they typically live outside this site (maybe at GitHub). Instead I have a [/projects](/projects) page with the projects and I include a subset of those on the homepage.

The projects markup is fairly simple, just a title and a description (that could include an image, code block, or whatever):

![](/images/microfeatures/t34_project.png) The [T-34 Keyboard layout](/series/t-34/) project.

Long ago I made some game prototypes and I wanted to showcase them in a slightly different manner. They’re still included as a project but they get specialized markup that I’m pretty happy with:

![](/images/microfeatures/games.png) The games overview in the [/projects](/projects) page.

### [Automatic dark mode](#Automatic-dark-mode) ###

[![](/images/microfeatures/djot_light.png)](/images/microfeatures/djot_light.png) [![](/images/microfeatures/djot_dark.png)](/images/microfeatures/djot_dark.png)

The light and dark style of the site.

Because I have a preference for dark mode I really wanted a dark mode for the blog, while also catering to people that prefers a light mode.

[I implemented](/blog/2023/10/04/giving_the_blog_a_facelift/#automatic-dark-mode) dark mode using [prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme), a simple solution that doesn’t require JavaScript and “just works”. It’s a CSS feature that allows the user to specify their preference using the browser or operating system.

[Microfeatures I may implement in the future](#Microfeatures-I-may-implement-in-the-future)
----------

Naturally, there’s always more features you can implement. Many I won’t bother with but there are some that I think are good ideas and that I may implement one day.

### [Targeted RSS feeds](#Targeted-RSS-feeds) ###

RSS feeds are awesome and I think all blogs should have them (and news sites, social media sites… almost everything really). I do of course [have a feed](/feed.xml) but it might be a good idea to add specialized feeds such as:

* Feed for a series
* Feed for a tag

The only reason I don’t have them is laziness.

### [Search](#Search) ###

Because it’s a static site it’s harder to have a good search functionality. Maybe there’s a good way to create/include one but I haven’t looked into it more.

### [A better 404 page](#A-better-404-page) ###

Perhaps related to the search functionality, it would be nice if the 404 page would include a helpful “did you mean” message.

For example if you typed in the path `/use` it could suggest you to try [/uses](/uses) instead.

So far I’ve avoided JavaScript in the blog but here it would be nice to have.

### [Summary of a post](#Summary-of-a-post) ###

I’ve toyed with the idea of having a summary of each post, so I could have the summary of a featured post on the homepage. However, good summaries are cumbersome to maintain and hard to auto-generate.

I don’t want to summarize manually—it introduces too much friction into blogging. While LLMs are honestly quite good at generating summaries, I think we need less AI generated content on the web, not more. Taking the first N characters or M paragraphs is a shoddy way of summarizing a post and won’t create a useful summary.

While I like the idea of a post summary, it’s not a feature I’ll implement anytime soon.

### [Display “related” posts below the post](#Display-related-posts-below-the-post) ###

Another interesting idea is to display a bunch of related posts at the end of a post. The problem is similar to that of [summarizing a post](#Summary-of-a-post): it’s cumbersome to maintain or hard to auto-generate well. For now I’m content with [tags](/blog/tags) and [series](/series) as a means of grouping related posts.

### [Changelog](#Changelog) ###

While I [display the latest Git commit](#Published-and-revision-info) for each post I was impressed by the list of “meaningful changes” at the bottom of the [jj init](https://v5.chriskrycho.com/essays/jj-init/) blog post.

A changelog looks cool but I’m too lazy to maintain one for all posts. A post like [The current T-34 keyboard layout](/blog/2022/09/06/the_current_t-34_keyboard_layout) would probably benefit from a proper changelog.

---

1. [Djot](https://djot.net/) has a bunch of nice benefits over markdown such as footnotes.

   There are various flavors such as [Pandoc](https://pandoc.org/MANUAL.html) flavored markdown that has footnotes, among other things.[↩︎](#fnref1)