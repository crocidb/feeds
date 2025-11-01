---
title = "Regex substitution with unicode in Haskell"
description = "While remaking the site I noticed my automatic embedding of bare youtube links sometimes didn’t work. The culprit was unicode in the document which the regex library couldn’t ha"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2019/01/25/regex_substitution_with_unicode_in_haskell/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.453921386Z"
seen = true
---

While [remaking the site](/blog/2019/01/25/site_restyle_and_update/) I noticed [my automatic embedding of bare youtube links](/blog/2014/09/01/embedding_youtube_videos_with_hakyll/) sometimes didn’t work. The culprit was unicode in the document which the regex library couldn’t handle.

Apparently while this would be supported by default by almost all modern languages it’s not the case with Haskell. I tried several regex libraries which either didn’t support substitutions or couldn’t handle unicode properly.

As usual [others](https://stackoverflow.com/questions/45067622/how-to-find-and-replace-unicode-chars-in-haskell) have [had](https://stackoverflow.com/questions/3847475/haskell-regex-substitution) this before me. This is the most elegant working solution I could find:

```
import qualified Text.Regex.PCRE.Light as RL
import qualified Text.Regex.PCRE.Heavy as RH

-- Find and replace bare youtube links separated by <p></p>.
youtubeFilter :: String -> String
youtubeFilter txt = RH.gsub rx replace txt
    where
      rx = RL.compile "<p>\\s*https?://www\\.youtube\\.com/watch\\?v=([A-Za-z0-9_-]+)\\s*</p>"
                      [RL.utf8]
      replace = \[g] -> "<div class=\"video-wrapper\">\
                 \<div class=\"video-container\">\
                   \<iframe src=\"//www.youtube.com/embed/" ++ g ++ "\" frameborder=\"0\" allowfullscreen/>\
                 \</div>\
              \</div>";

```

Which is to say it’s not very elegant but it does get the job done.