+++
title = "HTML element letter count distribution"
description = "How many HTML elements are exactly five letters long? This question came to mind in the context of a discussion I had yesterday about what an indie web version of Wordle would look like. We all started to name elements. table, tbody, input, among others, all have five letters. Af"
date = "2026-08-21T00:00:00Z"
url = "https://jamesg.blog/2026/08/21/html-element-letter-counts"
author = "with words, wonder"
text = ""
lastupdated = "2026-08-24T15:49:16.965627488Z"
seen = false
+++

 table { width: 20rem; border-collapse: collapse; } tr td:nth-child(2) { background-color: light-dark(orange, royalblue); display: block; } th { text-align: left; }

*How many HTML elements are exactly five letters long?* This question came to mind in the context of a discussion I had yesterday about what an indie web version of Wordle would look like. We all started to name elements. `table`, `tbody`, `input`, among others, all have five letters.

After the discussion, I wrote a Python script to compute the string lengths of each HTML element. I used the list of HTML elements on the MDN website as my dataset. The MDN list includes some elements (like `selectedcontent`) that are not Baseline supported yet, but I included them anyway. I excluded deprecated elements.

From my analysis, I found there are fifteen elements that are exactly five letters long. These are:

* aside
* audio
* embed
* input
* label
* meter
* small
* style
* table
* tfoot
* thead
* title
* track
* video

This means that there are fifteen possibilities for a HTML Wordle. We’d definitely need more words.

Here is a histogram showing the letter count distribution for all HTML elements:

|Element Length|Number of Elements|
|--------------|------------------|
|    1 chr.    |         7        |
|    2 chrs.   |        20        |
|    3 chrs.   |        17        |
|    4 chrs.   |        21        |
|    5 chrs.   |        15        |
|    6 chrs.   |        17        |
|    7 chrs.   |         7        |
|    8 chrs.   |         8        |
|    9 chrs.   |         0        |
|   10 chrs.   |         2        |
|   11 chrs.   |         2        |
|   12 chrs.   |         0        |
|   13 chrs.   |         0        |
|   14 chrs.   |         0        |
|   15 chrs.   |         1        |

The design of this table was inspired by [Norvig's English letter frequency counts analysis](https://www.norvig.com/mayzner.html).

<details> <summary>View raw data, with a list of elements that match each count</summary>

```
Element count: 117
String Length | # of Matching Elements | % of Element Count | Elements
-----------
1 7 6.0% ['a', 'b', 'i', 'p', 'q', 's', 'u']
2 20 17.1% ['br', 'dd', 'dl', 'dt', 'em', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'hr', 'li', 'ol', 'rp', 'rt', 'td', 'th', 'tr', 'ul']
3 17 14.5% ['bdi', 'bdo', 'col', 'del', 'dfn', 'div', 'img', 'ins', 'kbd', 'map', 'nav', 'pre', 'sub', 'sup', 'svg', 'var', 'wbr']
4 21 17.9% ['abbr', 'area', 'base', 'body', 'cite', 'code', 'data', 'form', 'head', 'html', 'link', 'main', 'mark', 'math', 'menu', 'meta', 'ruby', 'samp', 'slot', 'span', 'time']
5 15 12.8% ['aside', 'audio', 'embed', 'input', 'label', 'meter', 'small', 'style', 'table', 'tbody', 'tfoot', 'thead', 'title', 'track', 'video']
6 17 14.5% ['button', 'canvas', 'dialog', 'figure', 'footer', 'header', 'hgroup', 'iframe', 'legend', 'object', 'option', 'output', 'script', 'search', 'select', 'source', 'strong']
7 7 6.0% ['address', 'article', 'caption', 'details', 'picture', 'section', 'summary']
8 8 6.8% ['colgroup', 'datalist', 'fieldset', 'noscript', 'optgroup', 'progress', 'template', 'textarea']
10 2 1.7% ['blockquote', 'figcaption']
11 2 1.7% ['fencedframe', 'geolocation']
15 1 0.9% ['selectedcontent']
```

Percentages may not add up to exactly one hundred percent, due to rounding. </details>

If you are interested, here is the code I used to produce the analysis:

```python
# data source https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements

from collections import defaultdict

with open("elements.txt", "r") as file:
    elements = [i.strip() for i in file.readlines()]

letters2counts = {el: len(el) for el in elements}
counts2letters = defaultdict(list)

for el, count in letters2counts.items():
    counts2letters[count].append(el)

num_of_elements_with_each_letter_count = {k: len(v) for k, v in counts2letters.items()}

print("Element count:", len(elements))
print("String Length | # of Matching Elements | % of Element Count | Elements")
print("-----------")

for length, count in sorted(num_of_elements_with_each_letter_count.items(), key=lambda x: x[0]):
    print(length, count, str(round((count / len(elements)) * 100, 1)) + "%", sorted(counts2letters[length]))
    # NB, there are no 9, 12, 13, 14

```

And here is my list of HTML elements I wrote (by hand) from the MDN list:

<details> <summary>View HTML element list.</summary>

```
html
base
head
link
meta
style
title
body
address
article
aside
footer
header
h1
h2
h3
h4
h5
h6
hgroup
main
nav
section
search
blockquote
dd
div
dl
dt
figcaption
figure
hr
li
menu
ol
p
pre
ul
a
abbr
b
bdi
bdo
br
cite
code
data
dfn
em
i
kbd
mark
q
rp
rt
ruby
s
samp
small
span
strong
sub
sup
time
u
var
wbr
area
audio
img
map
track
video
embed
fencedframe
iframe
object
picture
source
svg
math
canvas
noscript
script
del
ins
caption
col
colgroup
table
tbody
td
tfoot
th
thead
tr
button
datalist
fieldset
form
input
label
legend
meter
optgroup
option
output
progress
select
selectedcontent
textarea
details
dialog
geolocation
summary
slot
template
```

</details> [Norvig's English letter frequency counts analysis](https://www.norvig.com/mayzner.html)