+++
title = "Tidy Dice"
description = "I designed a game to convince myself to do basic household chores."
date = "2024-03-16T00:00:00Z"
url = "https://taylor.town/tidy-dice"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.319458631Z"
seen = true
+++

In this latest edition of "overthinking everything", I designed a game to convince myself to do basic household chores.

The game comprises two dice throws. The first throw says *what* to improve. The second throw says *where* to do it.

### 1. Roll one die: ###

|     |          |
|-----|----------|
|**1**|  floor   |
|**2**| surfaces |
|**3**| clutter  |
|**4**|  germs   |
|**5**| fabrics  |
|**6**|decoration|

### 2. Roll two dice: ###

|      |   |                          |
|------|---|--------------------------|
|**2** |3% |         freebie          |
|**3** |5% |  hallways/decks/entries  |
|**4** |8% |        front yard        |
|**5** |11%|family/entertainment rooms|
|**6** |14%|    laundry & bedrooms    |
|**7** |17%|         kitchen          |
|**8** |14%|        bathrooms         |
|**9** |11%|     office/workspace     |
|**10**|8% |        back yard         |
|**11**|5% |      garage/storage      |
|**12**|3% |      basement/attic      |
 const dice = "⚀⚁⚂⚃⚄⚅"; const roll = () =\> dice[Math.floor(6\*Math.random())]; document.getElementById("type").innerText = `${roll()}`; document.getElementById("area").innerText = `${roll()}${roll()}`; document.getElementById("type").style.display = `block`; document.getElementById("area").style.display = `block`;