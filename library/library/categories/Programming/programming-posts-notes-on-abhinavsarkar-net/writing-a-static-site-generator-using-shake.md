+++
title = "Writing a Static Site Generator Using Shake"
description = "Static site generators (SSGs) are all rage these days as people realize that plain HTML websites are good enough for most cases. SSGs take raw data in various formats—often Markdown, JSON, and [YAML]("
date = "2022-12-17T00:00:00Z"
url = "https://abhinavsarkar.net/posts/static-site-generator-using-shake/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.559162675Z"
seen = false
+++

Static site generators (SSGs) are all rage these days as people realize that plain HTML websites are good enough for most cases. SSGs take raw data in various formats—often [Markdown](https://en.wikipedia.org/wiki/Markdown), [JSON](https://en.wikipedia.org/wiki/JSON), and [YAML](https://en.wikipedia.org/wiki/YAML)—and process them to produce the static websites, which can then be hosted easily on any hosting provider, or on personal VPSes. In this post, we write a bespoke SSG using the [Shake](https://shakebuild.com/) build system.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/static-site-generator-using-shake/?mtm_campaign=feed).

### Contents ###

1. [Introduction](#introduction)
2. [Build Systems](#build-systems)
3. [Static Site Structure](#static-site-structure)
4. [Main](#main)
5. [Build Targets](#build-targets)
6. [Build Rules](#build-rules)
7. [Utilities](#utilities)
8. [Building the Blog](#building-the-blog)
9. [Shake Features](#shake-features)
10. [Tips and Tricks](#tips-and-tricks)
11. [Conclusion](#conclusion)

Introduction[#](#introduction)
----------

In the [beginning](http://info.cern.ch/), people coded websites by hand, painstakingly writing the HTML tags and CSS styles (and JavaScript code, if they were into [DHTML](https://en.wikipedia.org/wiki/DHTML)). Many [weblogs](https://en.wikipedia.org/wiki/Weblog) were crafted by the hands of passionate individuals, even before the word *Blog* came into being.

Over time, these websites grew in size and some clever people decided to separate the data for the websites from the presentation and layout. The data moved into databases and [CGI](https://en.wikipedia.org/wiki/Common_Gateway_Interface) scripts were invented to pull the data and create webpages out of them programmatically, on request. Thus began the age of [Content management systems](https://en.wikipedia.org/wiki/Content_management_systems) (CMS) like [Drupal](https://en.wikipedia.org/wiki/Drupal), and of course, blogging software like [Wordpress](https://en.wikipedia.org/wiki/Wordpress) and [Blogspot](https://en.wikipedia.org/wiki/Blogspot).

Things eventually came full circle, as people realized that they don’t need the bloated and complicated mess of CMSes and blogging software, but at the same time appreciated the separation of presentation and data. Thus [Static site generators](https://en.wikipedia.org/wiki/Static_site_generator) were born[<sup>1</sup>](#fn1).

SSGs allow users to write blog articles and pages as plain data in various simple formats like [Markdown](https://en.wikipedia.org/wiki/Markdown) or [reStructuredText](https://en.wikipedia.org/wiki/reStructuredText), and configurations in [YAML](https://en.wikipedia.org/wiki/YAML), [JSON](https://en.wikipedia.org/wiki/JSON) or [TOML](https://en.wikipedia.org/wiki/TOML), and process them to produce static websites in HTML/CSS/JS.

Most SSGs allow the user to operate in a default mode where you can follow the conventions of the SSG—like writing the blog articles in certain formats, and putting them in certain directories—and the SSG takes care of everything else. The user does not need to know any internals.

At the same time, most SSGs allow users to customize the output website by creating custom templates, and custom URLs. However, all SSGs limit what users can do with them. If you need to do something that goes against the grain of your SSG, you are stuck.

Build Systems[#](#build-systems)
----------

SSGs are used to create websites by transforming a set of input files (templates, content, and assets) into a set of output files (HTML, CSS, and JavaScript files). In this sense, SSGs can be seen as a type of build system, as they automate the process of building a website by following a set of rules and dependencies.

A build system is a tool for automating the process of building complex projects. Build systems are commonly used in software development to ensure that the correct sequence of steps is followed in order to produce a working version of the software. This typically involves compiling source code, linking libraries, and running tests to ensure that the software is correct. However, build systems can also be used for projects in other domains where a set of input files need to be transformed into a set of output files according to some rules.

[Shake](https://shakebuild.com/) is a build system written in the [Haskell](https://www.haskell.org). It is flexible and powerful enough for managing the build process of complex software projects like [GHC](https://www.haskell.org/ghc/), but at the same time, it is simple enough to be used to create an SSG[<sup>2</sup>](#fn2).

### Shake[#](#shake) ###

In Shake, build targets represent the files or outputs that need to be produced as part of the build process. These could be executable binaries, library files, or any other type of output that is required to complete the build. Build targets are declared in a build script, along with information about their dependencies. For example, if an executable binary depends on a particular library file, the build script would specify this dependency.

Once the build targets and their dependencies have been declared, Shake uses [`Rules`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#t:Rules) to specify how those targets should be built. A rule typically consists of a pattern that matches one or more targets, along with a set of instructions—called build [`Action`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#t:Action)s by Shake—for building them. For example, a rule might specify that a certain type of source code file should be compiled using a particular compiler, with a certain set of flags. When Shake encounters a target that matches the pattern in a rule, it executes the instructions in the rule to build it.

By declaring dependencies between targets and defining rules to build them , Shake is able to figure out the correct order in which to build the targets [<sup>3</sup>](#fn3). Shake also provides a number of features to help users customize and optimize their build process, such as support for parallel builds, on-demand rebuilding, and caching of intermediate results.

In this post, we use Shake to build an SSG by defining the build targets and rules for building the website. In addition, we use [Pandoc](https://pandoc.org/) to render Markdown content into HTML, and [Mustache](https://hackage.haskell.org/package/mustache) to render HTML templates.

Static Site Structure[#](#static-site-structure)
----------

The source of our website is arranged like this:

```
shake-blog
├── Site.hs
├── about.md
├── contact.md
├── css
│   └── default.css
├── images
│   └── logo.png
├── posts
│   ├── 2022-08-12-welcome.md
│   ├── 2022-10-07-hello-world.md
└── templates
    ├── archive.html
    ├── default.html
    ├── home.html
    ├── post-list.html
    └── post.html
```

`Site.hs` contains the Haskell code that we are going to write in this post. `about.md` and `contact.md` are two static pages. The `css` and `images` directories contain assets for the website. The `posts` directory contains blog posts, names of which start with the post publication dates in `YYYY-mm-dd` format. Finally, the `templates` directory contains the Mustache templates for the website.

The blog posts start with YAML metadata sections that contain the title of the post, name of the author (optional) and a list of tags for the post. For example:

```
---
title: Welcome to my blog
author: Abhinav Sarkar
tags:
  - brag
  - note
---

Welcome to my new blog. I wrote the blog generator myself.
```

`posts/2022-08-12-welcome.md`

Pages are written in a similar fashion, but have only title in their YAML metadata.

After processing the input above, our SSG produces the following file structure:

```
_site/
├── about
│   └── index.html
├── archive
│   └── index.html
├── contact
│   └── index.html
├── css
│   └── default.css
├── images
│   └── logo.png
├── index.html
├── posts
│   ├── 2022-08-12-welcome
│   │   └── index.html
│   ├── 2022-10-07-hello-world
│   │   └── index.html
└── tags
    ├── brag
    │   └── index.html
    ├── note
    │   └── index.html
    └── programming
        └── index.html
```

The CSS and image assets are copied directly. One `index.html` file is generated for each page, post, and tag. Additionally, one file is generated for the archive of posts, and one for the home page.

With the input and output described, let’s get started with writing the generator.

Main[#](#main)
----------

We are going to write the program in a top-down fashion, starting with the `main` function. First come the extensions and imports. Other than imports from Shake, Pandoc and Mustache libraries, we also import from [aeson](https://hackage.haskell.org/package/aeson), [text](https://hackage.haskell.org/package/text), [time](https://hackage.haskell.org/package/time) and [unordered-containers](https://hackage.haskell.org/package/unordered-containers) libraries[<sup>4</sup>](#fn4).

```
{-# LANGUAGE ApplicativeDo, DataKinds, DeriveGeneric #-}
{-# LANGUAGE DerivingVia, LambdaCase, TypeApplications #-}

module Main where

import Control.Monad (forM, void)
import Data.Aeson.Types (Result (..))
import Data.List (nub, sortOn)
import Data.Text (Text)
import Data.Time (UTCTime, defaultTimeLocale, formatTime, parseTimeM)
import Deriving.Aeson
import Deriving.Aeson.Stock (PrefixedSnake)
import Development.Shake (Action, Rules, (%>), (|%>), (~>))
import Development.Shake.FilePath ((<.>), (</>))
import Text.Pandoc (Block (Plain), Meta (..), MetaValue (..), Pandoc (..))
import qualified Data.Aeson.Types as A
import qualified Data.HashMap.Strict as HM
import qualified Data.Ord as Ord
import qualified Data.Text as T
import qualified Development.Shake as Shake
import qualified Development.Shake.FilePath as Shake
import qualified Text.Mustache as Mus
import qualified Text.Mustache.Compile as Mus
import qualified Text.Pandoc as Pandoc
```

The `main` function sets up the top-level Shake build targets, and lets Shake invoke the right one depending on the arguments passed at runtime.

```
main :: IO ()
main = Shake.shakeArgs Shake.shakeOptions $ do
  Shake.withTargetDocs "Build the site" $
    "build" ~> buildTargets
  Shake.withTargetDocs "Clean the built site" $
    "clean" ~> Shake.removeFilesAfter outputDir ["//*"]

  Shake.withoutTargets buildRules

outputDir :: String
outputDir = "_site"
```

There are two top-level build targets:

1. `build`: generates the website.
2. `clean`: deletes the generated website.

`outputDir` is the subdirectory in which the website is generated. Building the `clean` target deletes all files inside `outputDir`. The `build` target runs the `buildTargets` action that sets up the build targets for generating the site. The `buildRules` are also included in the Shake setup.

Build Targets[#](#build-targets)
----------

The `buildTargets` function sets up the build targets for the files to be generated by Shake.

```
buildTargets :: Action ()
buildTargets = do
  assetPaths <- Shake.getDirectoryFiles "" assetGlobs
  Shake.need $ map (outputDir </>) assetPaths

  Shake.need $ map indexHtmlOutputPath pagePaths

  postPaths <- Shake.getDirectoryFiles "" postGlobs
  Shake.need $ map indexHtmlOutputPath postPaths

  Shake.need $ map (outputDir </>) ["archive/index.html", "index.html"]

  posts <- forM postPaths readPost
  Shake.need
    [ outputDir </> "tags" </> T.unpack tag </> "index.html"
      | post <- posts, tag <- postTags post ]
```

The [`Shake.need`](https://hackage.haskell.org/package/shake-0.19.6/docs/Development-Shake.html#v:need) function registers one or more targets with Shake.

For assets, we just want them to be copied to the `outputDir` at the same path.

Page and post target paths in the `outputDir` are stripped of their extensions and appended with `/index.html`. So a post sourced from `posts/example.md` ends up at `<outputDir>/posts/example/index.html`.

We also register two composite targets for the post archive and the home page[<sup>5</sup>](#fn5).

The paths, globs and helper function are shown below:

```
assetGlobs :: [String]
assetGlobs = ["css/*.css", "images/*.png"]

pagePaths :: [String]
pagePaths = ["about.md", "contact.md"]

postGlobs :: [String]
postGlobs = ["posts/*.md"]

indexHtmlOutputPath :: FilePath -> FilePath
indexHtmlOutputPath srcPath =
  outputDir </> Shake.dropExtension srcPath </> "index.html"
```

Now Shake knows what we want it to build. But how does it know how to build them? That’s what the build rules are for.

Build Rules[#](#build-rules)
----------

We have one build rule function for each build target type:

```
buildRules :: Rules ()
buildRules = do
  assets
  pages
  posts
  archive
  tags
  home
```

Let’s start with the simplest one, the build rule for assets.

### Assets[#](#assets) ###

In Shake, the build rules are written with [`|%>`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:-124--37--62-) or [`%>`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:-37--62-) operators. The `|%>` operator takes a list of output globs or paths, and a function from target path to build action. When `Shake.need` is called with a file that matches a target glob, the corresponding build action is called with the target path.

```
assets :: Rules ()
assets = map (outputDir </>) assetGlobs |%> \target -> do
  let src = Shake.dropDirectory1 target
  Shake.copyFileChanged src target
  Shake.putInfo $ "Copied " <> target <> " from " <> src
```

In case of assets, we simply get the original source path by dropping the first directory from the target path (that is, `outputDir`), and copy the source file to the target path if the file has changed[<sup>6</sup>](#fn6).

### Pages[#](#pages) ###

Building pages is a bit more interesting. First, we write a data type to represent a page:

```
data Page = Page {pageTitle :: Text, pageContent :: Text}
  deriving (Show, Generic)
  deriving (ToJSON) via PrefixedSnake "page" Page
```

A page has a title and some text content. We also make `Page` data type JSON serializable so that it can be consumed by the Mustache library for filling templates.

Now, the code that builds pages:

```
pages :: Rules ()
pages = map indexHtmlOutputPath pagePaths |%> \target -> do
  let src = indexHtmlSourcePath target
  (meta, html) <- markdownToHtml src

  let page = Page (meta HM.! "title") html
  applyTemplateAndWrite "default.html" page target
  Shake.putInfo $ "Built " <> target <> " from " <> src

indexHtmlSourcePath :: FilePath -> FilePath
indexHtmlSourcePath =
  Shake.dropDirectory1
    . (<.> "md")
    . Shake.dropTrailingPathSeparator
    . Shake.dropFileName
```

We get the source path from the target path by passing it through the `indexHtmlSourcePath` function. We read and render the source file by calling the `markdownToHtml` function. It returns the page YAML metadata as a [`FromJSON`](https://hackage.haskell.org/package/aeson/docs/Data-Aeson-Types.html#t:FromJSON)-able value (a [`HashMap`](https://hackage.haskell.org/package/unordered-containers/docs/Data-HashMap-Strict.html) in this case), and the page HTML text.

Next, we apply the `Page` data to the `default.html` template, and write it to the target path by calling the `applyTemplateAndWrite` function. This creates the HTML file for the page.

The `default.html` Mustache template can be seen below:

<details> <summary class="print-em"> `templates/default.html` </summary>

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>My Shake Blog — {{{title}}}</title>
  <link rel="stylesheet" type="text/css" href="/css/default.css" />
</head>
<body>
  <div id="header">
    <div id="logo">
      <a href="/">My Shake Blog</a>
    </div>
    <div id="navigation">
      <a href="/">Home</a>
      <a href="/about/">About</a>
      <a href="/contact/">Contact</a>
      <a href="/archive/">Archive</a>
    </div>
  </div>
  <div id="content">
    <h1>{{{title}}}</h1>
    {{{content}}}
  </div>
  <div id="footer">
    Site proudly generated by <a href="https://shakebuild.com">Shake</a>
  </div>
</body>
</html>
```

</details>

### Posts[#](#posts) ###

Building posts is similar to building pages. We have a data type for posts:

```
data Post = Post
  { postTitle :: Text,
    postAuthor :: Maybe Text,
    postTags :: [Text],
    postDate :: Maybe Text,
    postContent :: Maybe Text,
    postLink :: Maybe Text
  } deriving (Show, Generic)
    deriving (FromJSON, ToJSON) via PrefixedSnake "post" Post
```

Other than the title and text content, a post also has a date, a list of tags, an optional author, and a permalink. Some of these data come from the post YAML metadata, and some are derived from the post source path. as we see below:

```
posts :: Rules ()
posts = map indexHtmlOutputPath postGlobs |%> \target -> do
  let src = indexHtmlSourcePath target
  post <- readPost src
  postHtml <- applyTemplate "post.html" post

  let page = Page (postTitle post) postHtml
  applyTemplateAndWrite "default.html" page target
  Shake.putInfo $ "Built " <> target <> " from " <> src

readPost :: FilePath -> Action Post
readPost postPath = do
  date <- parseTimeM False defaultTimeLocale "%Y-%-m-%-d"
    . take 10
    . Shake.takeBaseName
    $ postPath
  let formattedDate =
        T.pack $ formatTime @UTCTime defaultTimeLocale "%b %e, %Y" date

  (post, html) <- markdownToHtml postPath
  Shake.putInfo $ "Read " <> postPath
  return $ post
    { postDate = Just formattedDate,
      postContent = Just html,
      postLink = Just . T.pack $ "/" <> Shake.dropExtension postPath <> "/"
    }
```

We call the `readPost` function, which parses the post date from the post path, and renders the post text using the `markdownToHtml` function. We then apply the `Post` data to the `post.html` template to create the templated HTML content. Finally, we create the `Page` data from the rendered post, apply it to the `default.html` template, and write the final HTML file to the target path.

The template for the post page can be seen below:

<details> <summary class="print-em"> `templates/post.html` </summary>

```
<div class="info">
  Posted on {{{date}}}
  {{#author}}
    by {{{author}}}
  {{/author}}
</div>
<div class="info">
  Tags:
  <ul class="tags">
  {{#tags}}
    <li><a href="/tags/{{{.}}}/">{{{.}}}</a></li>
  {{/tags}}
  </ul>
</div>
{{{content}}}
```

</details>

### Archive[#](#archive) ###

The archive page is a bit more involved. We read all the posts, and sort them by date. Then we apply the `archive.html` template, and then the `default.html` template to create the final HTML file, as shown below:

```
archive :: Rules ()
archive = outputDir </> "archive/index.html" %> \target -> do
  postPaths <- Shake.getDirectoryFiles "" postGlobs
  posts <- sortOn (Ord.Down . postDate) <$> forM postPaths readPost
  writeArchive (T.pack "Archive") posts target

writeArchive :: Text -> [Post] -> FilePath -> Action ()
writeArchive title posts target = do
  html <- applyTemplate "archive.html" $ HM.singleton "posts" posts
  applyTemplateAndWrite "default.html" (Page title html) target
  Shake.putInfo $ "Built " <> target
```

The `archive.html` template transcludes the `post-list.html` template for reuse with the home page.

<details> <summary class="print-em"> `templates/archive.html` </summary>

```
My posts:
{{> templates/post-list.html }}
```

</details> <details> <summary class="print-em"> `templates/post-list.html` </summary>

```
<ul>
  {{#posts}}
    <li>
      <a href="{{{link}}}">{{{title}}}</a> - {{{date}}}
    </li>
  {{/posts}}
</ul>
```

</details>

### Tags[#](#tags) ###

Now, we build a page for each post tag. Step one is to read all the posts, collect the tags, and add build targets for each tag. We do this in the `buildTargets` function, as shown in the emphasized code below:

```
buildTargets :: Action ()
buildTargets = do
  assetPaths <- Shake.getDirectoryFiles "" assetGlobs
  Shake.need $ map (outputDir </>) assetPaths

  Shake.need $ map indexHtmlOutputPath pagePaths

  postPaths <- Shake.getDirectoryFiles "" postGlobs
  Shake.need $ map indexHtmlOutputPath postPaths

  Shake.need $ map (outputDir </>) ["archive/index.html", "index.html"]

  posts <- forM postPaths readPost
  Shake.need
    [ outputDir </> "tags" </> T.unpack tag </> "index.html"
      | post <- posts, tag <- postTags post ]
```

Next, we implement the build rule for tags:

```
tags :: Rules ()
tags = outputDir </> "tags/*/index.html" %> \target -> do
  let tag = T.pack $ Shake.splitDirectories target !! 2
  postPaths <- Shake.getDirectoryFiles "" postGlobs
  posts <- sortOn (Ord.Down . postDate)
    . filter ((tag `elem`) . postTags)
    <$> forM postPaths readPost
  writeArchive (T.pack "Posts tagged " <> tag) posts target
```

First, we parse the tag from the target path. We then read all the posts, filter them by tag, and render the tag page using the `writeArchive` function that we use for the archive page.

### Home[#](#home) ###

Finally, we come to the home page. It is quite similar to the archive page, except that we only show the first few posts[<sup>7</sup>](#fn7)[<sup>8</sup>](#fn8):

```
home :: Rules ()
home = outputDir </> "index.html" %> \target -> do
  postPaths <- Shake.getDirectoryFiles "" postGlobs
  posts <- take 3
    . sortOn (Ord.Down . postDate)
    <$> forM postPaths readPost
  html <- applyTemplate "home.html" $ HM.singleton "posts" posts

  let page = Page (T.pack "Home") html
  applyTemplateAndWrite "default.html" page target
  Shake.putInfo $ "Built " <> target
```

The `home.html` template also transcludes the `post-list.html` template:

<details> <summary class="print-em"> `templates/home.html` </summary>

```
<h2>Welcome</h2>
<img src="/images/logo.png" style="float: right; margin: 10px;" />
<p>Welcome to my blog!</p>
<p>My recent posts here for your reading pleasure:</p>
<h2>Posts</h2>
{{> templates/post-list.html }}
<p>You can find all posts in the <a href="/archive/">archives</a>.
```

</details>

That’s it for the build rules. We have covered all the targets that we defined in the `buildTargets` function. Next, we look at the Pandoc and Mustache utilities that we use in the build rules.

Utilities[#](#utilities)
----------

We use the Pandoc library to render Markdown to HTML. We also use the Mustache library to render the generated HTML with the Mustache templates. We wrap these libraries in a few utility functions, as shown in the next sections.

### Pandoc[#](#pandoc) ###

We wrap Pandoc’s Markdown-to-HTML rendering to make it a Shake build action. We also parse the YAML metadata from the Markdown source, and return it as a `FromJSON`-able value[<sup>9</sup>](#fn9).

```
markdownToHtml :: FromJSON a => FilePath -> Action (a, Text)
markdownToHtml filePath = do
  content <- Shake.readFile' filePath
  Shake.quietly . Shake.traced "Markdown to HTML" $ do
    pandoc@(Pandoc meta _) <-
      runPandoc . Pandoc.readMarkdown readerOptions . T.pack $ content
    meta' <- fromMeta meta
    html <- runPandoc . Pandoc.writeHtml5String writerOptions $ pandoc
    return (meta', html)
  where
    readerOptions =
      Pandoc.def {Pandoc.readerExtensions = Pandoc.pandocExtensions}
    writerOptions =
      Pandoc.def {Pandoc.writerExtensions = Pandoc.pandocExtensions}

    fromMeta (Meta meta) =
      A.fromJSON . A.toJSON <$> traverse metaValueToJSON meta >>= \case
        Success res -> pure res
        Error err -> fail $ "json conversion error:" <> err

    metaValueToJSON = \case
      MetaMap m -> A.toJSON <$> traverse metaValueToJSON m
      MetaList m -> A.toJSONList <$> traverse metaValueToJSON m
      MetaBool m -> pure $ A.toJSON m
      MetaString m -> pure $ A.toJSON $ T.strip m
      MetaInlines m -> metaValueToJSON $ MetaBlocks [Plain m]
      MetaBlocks m ->
        fmap (A.toJSON . T.strip)
          . runPandoc
          . Pandoc.writePlain Pandoc.def
          $ Pandoc mempty m

    runPandoc action =
      Pandoc.runIO (Pandoc.setVerbosity Pandoc.ERROR >> action)
        >>= either (fail . show) return
```

### Mustache[#](#mustache) ###

We wrap Mustache’s template reading and rendering to make them Shake build actions.

```
applyTemplate :: ToJSON a => String -> a -> Action Text
applyTemplate templateName context = do
  tmpl <- readTemplate $ "templates" </> templateName
  case Mus.checkedSubstitute tmpl (A.toJSON context) of
    ([], text) -> return text
    (errs, _) -> fail $
      "Error while substituting template " <> templateName
        <> ": " <> unlines (map show errs)

applyTemplateAndWrite :: ToJSON a => String -> a -> FilePath -> Action ()
applyTemplateAndWrite templateName context outputPath =
  applyTemplate templateName context
    >>= Shake.writeFile' outputPath . T.unpack

readTemplate :: FilePath -> Action Mus.Template
readTemplate templatePath = do
  Shake.need [templatePath]
  eTemplate <- Shake.quietly
    . Shake.traced "Compile template"
    $ Mus.localAutomaticCompile templatePath
  case eTemplate of
    Right template -> do
      Shake.need . Mus.getPartials . Mus.ast $ template
      Shake.putInfo $ "Read " <> templatePath
      return template
    Left err -> fail $ show err
```

The `readTemplate` function specially takes care of marking the template (and its transcluded templates) as dependencies of pages that use them. By doing this, Shake rebuilds the pages if any of the templates change.

Building the Blog[#](#building-the-blog)
----------

We are now ready to run the build:

<details> <summary class="print-hide"> Build log </summary>

```
$ ./Site.hs clean
Build completed in 0.02s

$ ./Site.hs build
Copied _site/images/logo.png from images/logo.png
Copied _site/css/default.css from css/default.css
Read templates/default.html
Built _site/contact/index.html from contact.md
Read templates/default.html
Built _site/about/index.html from about.md
Read posts/2022-10-07-hello-world.md
Read templates/post.html
Read templates/default.html
Built _site/posts/2022-10-07-hello-world/index.html from posts/2022-10-07-hello-world.md
Read posts/2022-08-12-welcome.md
Read templates/post.html
Read templates/default.html
Built _site/posts/2022-08-12-welcome/index.html from posts/2022-08-12-welcome.md
Read posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Read templates/home.html
Read templates/default.html
Built _site/index.html
Read posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Read templates/archive.html
Read templates/default.html
Built _site/archive/index.html
Read posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Read posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Read templates/archive.html
Read templates/default.html
Built _site/tags/programming/index.html
Read posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Read templates/archive.html
Read templates/default.html
Built _site/tags/note/index.html
Read posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Read templates/archive.html
Read templates/default.html
Built _site/tags/brag/index.html
Build completed in 0.10s
```

</details>

The logs show that Shake built all the targets that we define in the `buildTargets` function[<sup>10</sup>](#fn10)[<sup>11</sup>](#fn11).

Next, we look into some helpful Shake specific features.

Shake Features[#](#shake-features)
----------

Being a generic build system, Shake has some unique features that are not found in most other SSGs. In this section, we look at some of these features.

### Caching[#](#caching) ###

As we see in the build log above, the posts and templates are read multiple times. This is because Shake does not cache the dependencies of build rules by default. However, we can add caching by using the [`newCacheIO`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:newCacheIO) function[<sup>12</sup>](#fn12)[<sup>13</sup>](#fn13). Once we add caching, the build log shows that the posts and templates are read only once:

<details> <summary class="print-hide"> Build log </summary>

```
Copied _site/images/logo.png from images/logo.png
Copied _site/css/default.css from css/default.css
Read templates/default.html
Built _site/contact/index.html from contact.md
Built _site/about/index.html from about.md
Read posts/2022-08-12-welcome.md
Read templates/post.html
Built _site/posts/2022-08-12-welcome/index.html from posts/2022-08-12-welcome.md
Read posts/2022-10-07-hello-world.md
Built _site/posts/2022-10-07-hello-world/index.html from posts/2022-10-07-hello-world.md
Read templates/home.html
Built _site/index.html
Read templates/archive.html
Built _site/archive/index.html
Built _site/tags/programming/index.html
Built _site/tags/note/index.html
Built _site/tags/brag/index.html
Build completed in 0.03s
```

</details>

### Parallelism[#](#parallelism) ###

Shake can run build actions in parallel. We can enable parallelism by using the [`shakeThreads`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:shakeThreads) configuration option, or by using the `--jobs` command line option. Enabling parallel builds can reduce build times significantly.

Shake tries to automatically detect which build actions can be run in parallel. However, we can specify it explicitly as well. We explore this in the [Tips and Tricks](#tips-and-tricks) section.

### Fine-grain Dependency Management[#](#fine-grain-dependency-management) ###

Using the `Shake.need` function, we can explicitly specify the dependencies of a build target. For example, we can use it to mark the `Site.hs` file as a dependency of all targets. This way, Shake rebuilds the site if the build script changes. We have already seen how we can use it to mark the templates as dependencies of pages that use them.

### Traces and Reports[#](#traces-and-reports) ###

Shake can be instructed to generate build traces and reports. These can be used to understand/debug/improve the builds. We can enable these features by using the [`shakeReport`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:shakeReport) configuration option, or by using the `--report` command line option.

The report generated by Shake shows time taken by each build rule, their dependency graph, and the command plot traced by the `Shake.traced` function. For example, here is the command plot for a build of the website you are reading right now[<sup>14</sup>](#fn14):

<details> <summary class="print-hide"> Command plot of a build of this website </summary> [![Command plot of a build of this website]() \<picture\>\<source srcset="/images/static-site-generator-using-shake/command-plot.webp" type="image/webp"\>\<img src="/images/static-site-generator-using-shake/command-plot.png" alt="Command plot of a build of this website"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/static-site-generator-using-shake/command-plot.png) Command plot of a build of this website </details>

The traces can be viewed using a trace viewer like [Perfetto](https://ui.perfetto.dev/). For example, here is a trace of a build of this website:

<details> <summary class="print-hide"> Trace of a build of this website </summary> [![Trace of a build of this website]() \<picture\>\<source srcset="/images/static-site-generator-using-shake/trace.webp" type="image/webp"\>\<img src="/images/static-site-generator-using-shake/trace.png" alt="Trace of a build of this website"\>\</img\>\</picture\>](https://abhinavsarkar.net/images/static-site-generator-using-shake/trace.png) Trace of a build of this website </details>

### Errors[#](#errors) ###

Shake provides detailed error messages when builds fail. For example, here is the error message when a build fails due to a missing template:

```
Error when running Shake build system:
  at want, called at src/Development/Shake/Internal/Args.hs:83:67 in shake-0.19.7-IRPInZXX5QOAqz04qHWdHp:Development.Shake.Internal.Args
* Depends on: build
  at need, called at Site.hs:54:3 in main:Main
* Depends on: _site/posts/2022-10-07-hello-world/index.html
* Depends on: templates/post.html
  at error, called at src/Development/Shake/Internal/Rules/File.hs:179:58 in shake-0.19.7-IRPInZXX5QOAqz04qHWdHp:Development.Shake.Internal.Rules.File
* Raised the exception:
Error, file does not exist and no rule available:
  templates/post.html
```

To learn more about Shake, read the Shake [manual](https://shakebuild.com/manual) and the [FAQ](https://shakebuild.com/faq).

Tips and Tricks[#](#tips-and-tricks)
----------

Let’s look at some tips and tricks that can be used to improve the build.

### Explicit Parallelism[#](#explicit-parallelism) ###

Shake is a monadic build system. That means, while the build actions are executing for a build target, they can add new dependencies for the target. These dependencies can depend on the result of previous build actions. So, Shake cannot know all the dependencies of a build target before the build actions for it are executed. This makes it difficult for Shake to automatically detect which build actions can be run in parallel.

However, we can explicitly specify it by using the [`parallel`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:parallel), and [`forP`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:forP), and [`par`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:par) functions[<sup>15</sup>](#fn15). Additionally, Shake also builds all builds targets specified in a single `Shake.need` call in parallel. Here is how we can improve the parallelism of our SSG using these functions:

```
buildTargetsParallel :: Action ()
buildTargetsParallel = do
  (assetPaths, postPaths) <-
    Shake.getDirectoryFiles "" assetGlobs
      `Shake.par` Shake.getDirectoryFiles "" postGlobs
  posts <- Shake.forP postPaths readPost

  void $ Shake.parallel [
      Shake.need $
        map (outputDir </>)
          (assetPaths <> ["archive/index.html", "index.html"]
            <> ["tags" </> T.unpack tag </> "index.html"
                | post <- posts, tag <- postTags post])
    , Shake.need $ map indexHtmlOutputPath (pagePaths <> postPaths)
    ]
```

### Faster Builds[#](#faster-builds) ###

There are different modes in which we can run our builds depending on the complexity of our generator, and our preferences:

1. Run the build script without compiling it using the `runhaskell` command.
2. Compile the build script using `ghc` or `cabal` every time we have to run the build, and then run the build using the compiled executable.
3. Compile the build script using `ghc` or `cabal` once, and then run the build using the compiled executable.

Mode 1 is good enough for small scripts. However, it is slow for large scripts because it runs the script using an interpreter, which is slower than running a compiled executable.

Mode 2 and 3 speed up the build by compiling the build script. However, they have different tradeoffs: mode 2 is good if we change the build script often, but, it is useless work if the build script stays the same. Mode 3 is good if the build script does not change often. But if we do change it often, we’ll have to remember to recompile it.

If we go with compiling the script, we can use the tips in [this article](https://www.parsonsmatt.org/2019/11/27/keeping_compilation_fast.html) to speed up the compilation. Additionally, hand-writing the JSON instances for data types instead of deriving them also gives a noticeable speedup. We may also want to switch on/off optimizations by passing the `-O2`/`-O0` flag to `ghc` or `cabal` to speed up the compilation. We may also enable parallel compilation by passing the `-j` flag.

If we decide to go with mode 2, that is, to compile the build script every time we run the build, we may want to use [dynamic linking](https://cabal.readthedocs.io/en/3.6/cabal-project.html#cfg-field-executable-dynamic) to reduce linking time.

When running the build using a compiled executable, Shake recommends switching on multithreading but switching off idle and parallel garbage collection. Additionally, we may also want to tune the allocation area sizes for the garbage collector.

Putting all this together, we may want to use the following flags to compile the generator in mode 2:

```
-O0 -dynamic -j -threaded -rtsopts "-with-rtsopts=-I0 -qg -N -A32m -n8m"
```

and these flags for mode 3:

```
-O2 -j -threaded -rtsopts "-with-rtsopts=-I0 -qg -N -A32m -n8m"
```

However, these flags are suggestions only. We should experiment with them to find the best combination for our build.

### Watch and Serve[#](#watch-and-serve) ###

We can add support for automatically rebuilding the site when the Markdown files or assets change using the [fsnotify](https://hackage.haskell.org/package/fsnotify) package. We can add support for automatic rebuilding for the Haskell source as well using [`entr`](http://eradman.com/entrproject/) to rerun the script, or using [`ghcid`](https://github.com/ndmitchell/ghcid) to re-interpret the script on every change.

We can also add support for serving the site using the [warp](https://hackage.haskell.org/package/warp) and [wai-app-static](https://hackage.haskell.org/package/wai-app-static) packages[<sup>16</sup>](#fn16)[<sup>17</sup>](#fn17). We can add live reloading on the browser side using the [livejs](https://livejs.com/) JavaScript library.

Together, these features give us a hot-reloading development environment with fast feedback loop for our SSG.

Conclusion[#](#conclusion)
----------

In this article, we looked at how we can use Shake to build a static site generator. We also looked at Shake specific features, and some tips and tricks that can be used to improve the build. Shake offers flexibility that is unparalleled by other SSGs, but at the cost of writing your own build script. However, if you do want to write your own SSG, Shake is a great choice as the foundation for it.

Acknowledgements[#](#acknowledgements)
----------

Many thanks to [Arun Raghavan](https://arunraghavan.net/) and [Steven Deobald](https://deobald.ca/) for reviewing a draft of this article.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. [Jekyll](https://jekyllrb.com/) was the first modern SSG released in 2008. Since then, there has been a [proliferation](https://staticsitegenerators.net/) of SSGs.[↩︎](#fnref1)

2. There are already a few SSGs that use Shake as their build system. See [Slick](https://github.com/ChrisPenner/slick) and [Rib](https://github.com/srid/rib).[↩︎](#fnref2)

3. Shake is a monadic and suspending build system. Being monadic here means that while build actions are executing, they can add new dependencies for build targets, and those dependencies can depend on the results of previous build actions. Being suspending means that when a build action requires a dependency that is not yet built, Shake suspends the build action and builds the dependency first. Together, these features make Shake flexible and powerful. Read the detailed and accessible paper [Build systems à la carte: Theory and practice](https://www.microsoft.com/en-us/research/uploads/prod/2020/04/build-systems-jfp.pdf) for a comparison of Shake with other build systems.[↩︎](#fnref3)

4. To run the generator directly without writing a separate file for dependency management, we can prepend one of these three [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) snippets to `Site.hs`.

   ```
   #! /usr/bin/env nix-shell
   #! nix-shell -p "haskellPackages.ghcWithPackages (p: [p.mustache p.pandoc p.shake p.deriving-aeson])"
   #! nix-shell -i runhaskell
   ```

   [Nix shell](https://web.archive.org/web/20221217/http://iam.travishartwell.net/2015/06/17/nix-shell-shebang/) shebang snippet

   ```
   #! /usr/bin/env cabal
   {- cabal:
   build-depends: base, aeson, deriving-aeson, mustache, pandoc, shake, text, time, unordered-containers
   -}
   ```

   [Cabal](https://cabal.readthedocs.io/en/latest/cabal-commands.html#cabal-run) shebang snippet

   ```
   #! /usr/bin/env stack
   {- stack script
     --resolver lts-19.28
     --package "base aeson deriving-aeson mustache pandoc shake text time unordered-containers"
   -}
   ```

   [Stack](https://docs.haskellstack.org/en/latest/scripts/) shebang snippet

   We need to have the corresponding toolchain (Nix, Cabal or Stack) installed to run the generator. The snippets take care of downloading and/or building the dependencies, and running the generator.[↩︎](#fnref4)

5. Since tag page generation is a bit more involved, we have faded out the related code for now. We come back to it a later section.[↩︎](#fnref5)

6. We use the [`Shake.putInfo`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:putInfo) function to print a message to the console. There also exist [`putWarn`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:putWarn) and [`putError`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:putError) functions for printing warnings and errors respectively.[↩︎](#fnref6)

7. If you are familiar with other templating languages like [Liquid](https://github.com/Shopify/liquid), and are wondering why we are limiting the post count in the Haskell code, and not in the Mustache template, it is because Mustache is a logic-less template engine. It does not have any control flow constructs except check for null values. Hence, we have to do the limiting in the Haskell code.[↩︎](#fnref7)

8. If the code accumulates a lot of config options like post count on home page, we can move them to an external JSON/YAML/TOML config file, and read them at the start of the build script. We can wrap the `Rules` monad in a [`ReaderT`](https://hackage.haskell.org/package/transformers/docs/Control-Monad-Trans-Reader.html#t:ReaderT) monad transformer to make the config options available to all build rules.[↩︎](#fnref8)

9. We use the [`Shake.traced`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake.html#v:traced) function to trace the operations in build actions. It logs the operations to the console, and also records them in traces and reports. See the [Traces and Reports](#traces-and-reports) section for more details.[↩︎](#fnref9)

10. The full code for the SSG is available [here](https://abhinavsarkar.net/code/shake-blog.html?mtm_campaign=feed).[↩︎](#fnref10)

11. When we run the build for the first time, it takes some time to download and/or build the dependencies. Subsequent builds are much faster.[↩︎](#fnref11)

12. You can find the code for the SSG with caching [here](https://abhinavsarkar.net/code/shake-blog-with-caching.html?mtm_campaign=feed).[↩︎](#fnref12)

13. If we use the experimental forward build feature, it’s easier to cache the output of build actions using one of the `cache*` functions in the [`Development.Shake.Forward`](https://hackage.haskell.org/package/shake-0.19.7/docs/Development-Shake-Forward.html) module. However, forward builds require [`fsatrace`](https://github.com/jacereda/fsatrace) to be installed on the system, and it doesn’t work on macOS with [System Integrity Protection](https://support.apple.com/en-us/HT204899) enabled.[↩︎](#fnref13)

14. That’s right, [abhinavsarkar.net](https://abhinavsarkar.net?mtm_campaign=feed) is also built using Shake! See [the website Colophon](https://abhinavsarkar.net/colophon/?mtm_campaign=feed) for more details. It used to be built using [Hakyll](https://jaspervdj.be/hakyll/), but I switched to Shake after getting frustrated with the opaqueness of Hakyll’s build system, and those pesky [contexts](https://hackage.haskell.org/package/hakyll-4.15.1.1/docs/Hakyll-Web-Template-Context.html).[↩︎](#fnref14)

15. Shake also supports the [`ApplicativeDo`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/applicative_do.html) extension, enabling which causes the compiler to automatically detect the build actions that can be run in parallel. However, it may not detect all cases. Regardless, it is better to enable it to improve the parallelism of the build.[↩︎](#fnref15)

16. Don’t forget to add a signal handler to stop the watcher and server threads when the build script is interrupted.[↩︎](#fnref16)

17. See how Rib does watch and serve [here](https://github.com/srid/rib/tree/master/rib-core/src/Rib).[↩︎](#fnref17)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/static-site-generator-using-shake/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/109529115712361346)
* [Lobsters](https://lobste.rs/s/axkbmk)
* [Reddit](https://www.reddit.com/r/haskell/comments/zo5nd1/)
* [My website](https://abhinavsarkar.net/posts/static-site-generator-using-shake/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)