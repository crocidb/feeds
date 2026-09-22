+++
title = "Tag index for Org mode blog"
description = " Since people keep asking how this blog is made, and I don’t want to share the awful, terrible code that it is taped together with, I’ve decided to start explaining parts of it piecewise. Generally, any time something breaks and I have to fix it, I write down what I did and what "
date = "2026-09-14T22:00:00Z"
url = "https://entropicthoughts.com/tag-index-for-org-mode-blog"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-09-21T09:42:41.995605938Z"
seen = false
+++

 Since people keep asking how this blog is made, and I don’t want to share the awful, terrible code that it is taped together with, I’ve decided to start explaining parts of it piecewise. Generally, any time something breaks and I have to fix it, I write down what I did and what it connects to.

 The most recent issue was the stack limit being blown by a helper function involved in generating the tag index. I had written it to be explicitly recursive, which worked fine with a small-ish number of published articles, but not anymore. The tag index creation follows a similar pattern to the RSS feed generation detailed in the previous article.

In[1]:

```
(defun tw-tag-index (project)
  "Generate a tag index page for PROJECT."
  (let* ((filename (concat (project-dir "src" "org") "tags.org"))
         ;; Get all publically listed files in this project.
         (files (seq-filter (lambda (entry) (plist-get entry :indexed))
                            (tw-get-all-files project)))
         ;; Convert to sorted alist of tag×article pairs.
         (all-tags (sort (tw-get-all-file-tags files)
                         (lambda (a b) (string< (car a) (car b))))))
    (with-temp-file filename
      (insert (concat
               "#+TITLE: Tags\n"
               ;; Don't show author and publish date.
               "#+AUTHOR: \n"
               ;; Don't list in public indices.
               "#+FILETAGS: :page:\n\n"
               ;; Include table of contents.
               "#+TOC: headlines:1\n\n"
               ;; Then produce headings for each tag.
               (org-element-interpret-data
                   (tw-article-entry-headlines all-tags)))))
    ;; Return the filename of the created file. I don't
    ;; remember why. Maybe it's not necessary.
    filename))

```

[(Continue reading the full article on the web.)](https://entropicthoughts.com/tag-index-for-org-mode-blog)