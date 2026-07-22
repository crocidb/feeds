+++
title = "Advent of Code 2020 — Week 1"
description = "I’m solving the Advent of Code 2020 in the Haskell REPL (GHCi). You can copy the code and paste it in GHCi to play with it. Here are my solutions for week 1 (Dec 1–5)."
date = "2020-12-05T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2020-aoc-wk1/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.625216990Z"
seen = false
+++

I’m solving the [Advent of Code 2020](https://adventofcode.com/2020/) in the Haskell REPL (GHCi). You can copy the code and paste it in GHCi to play with it. Here are my solutions for week 1 (Dec 1–5).

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2020-aoc-wk1/?mtm_campaign=feed).

This post is a part of the series: **Advent of Code 2020**.

1. **Week 1** 👈
2. [Week 2](https://abhinavsarkar.net/notes/2020-aoc-wk2/?mtm_campaign=feed)
3. [Week 3](https://abhinavsarkar.net/notes/2020-aoc-wk3/?mtm_campaign=feed)
4. [Week 4](https://abhinavsarkar.net/notes/2020-aoc-wk4/?mtm_campaign=feed)
5. [Lessons from Solving in Haskell](https://abhinavsarkar.net/notes/2020-aoc-learnings/?mtm_campaign=feed)

### Contents ###

1. [Day 1](#day-1)
2. [Day 2](#day-2)
3. [Day 3](#day-3)
4. [Day 4](#day-4)
5. [Day 5](#day-5)

Day 1[#](#day-1)
----------

[Problem](https://adventofcode.com/2020/day/1)

Solution:

```
> entries <- map read . lines <$> readFile "/tmp/input1" :: IO [Int]
> -- part 1
> head [i * j | i <- entries, j <- entries, i + j == 2020]
> -- part 2
> head [i * j * k | i <- entries, j <- entries, k <- entries , i + j + k == 2020]
```

Day 2[#](#day-2)
----------

[Problem](https://adventofcode.com/2020/day/2)

Solution:

```
> import Data.List.Split (splitOn)
> data Policy = Policy Char Int Int
> data Entry = Entry Policy String
> :{
> parse s = let
>     [po, pa] = splitOn ": " s
>     [pol, poc] = splitOn " " po
>     [pon, pox] = splitOn "-" pol
>   in Entry (Policy (head poc) (read pon) (read pox)) pa
> :}
> entries <- map parse . lines <$> readFile "/tmp/input2"
> :{
> validate (Entry (Policy c min max) pass) =
>   let count = length (filter (== c) pass) in count >= min && count <= max
> :}
> length $ filter validate entries -- part 1
> xor a b = if a then not b else b
> :{
> validate (Entry (Policy c p1 p2) pass) =
>   (c == pass !! (p1-1)) `xor` (c == pass !! (p2-1))
> :}
> length $ filter validate entries -- part 2
```

Day 3[#](#day-3)
----------

[Problem](https://adventofcode.com/2020/day/3)

Solution:

```
> data Z = Z Int String [String]
> toZ (x:xs) = Z 0 x xs
> goRight (Z l (x:xs) b) = Z (l+1) xs b
> goDown (Z l r (x:xs)) = Z l (drop l x) xs
> atBottom (Z _ _ b) = null b
> zAt (Z _ (x:_) _) = x
> import Data.List (unfoldr)
> :{
> travel move = unfoldr $ \g ->
>   if atBottom g then Nothing else let g' = move g in Just (zAt g', g')
> :}
> treeCount grid = length . filter (== '#') . flip travel grid
> f `times` n = (!! n) . iterate f
> grid <- toZ . map cycle . lines <$> readFile "/tmp/input3"
> import Control.Arrow ((>>>))
> treeCount grid (goRight `times` 3 >>> goDown) -- part 1
> -- part 2
> :{
> product $ map (treeCount grid) [
>   goRight `times` 3 >>> goDown
> , goRight >>> goDown
> , goRight `times` 5 >>> goDown
> , goRight `times` 7 >>> goDown
> , goRight >>> goDown `times` 2]
> :}
```

Day 4[#](#day-4)
----------

[Problem](https://adventofcode.com/2020/day/4)

Solution:

```
> import Data.List.Split (splitOn)
> splitPair pair = let [a,b] = splitOn ":" pair in (a, b)
> :{
> passports <-
>   map (map splitPair . words) . splitOn "\n\n" <$> readFile "/tmp/input4"
> :}
> reqFields = ["hcl", "iyr", "eyr", "ecl", "pid", "byr", "hgt"]
> :{
> fieldsPresent passport =
>   let fields = map fst passport in all (`elem` fields) reqFields
> :}
> length $ filter fieldsPresent passports -- part 1
> safeRead s = case reads s of { [(x, "")] -> Just x; _ -> Nothing }
> checkLimits min max = maybe False (\y -> y >= min && y <= max) . safeRead
> validByr = checkLimits 1920 2002
> validIyr = checkLimits 2010 2020
> validEyr = checkLimits 2020 2030
> import Data.List.Split (split, dropFinalBlank, onSublist)
> endBy d = split (dropFinalBlank $ onSublist d)
> :{
> validHgt hgt
>   | [h, "cm"] <- endBy "cm" hgt = checkLimits 150 193 h
>   | [h, "in"] <- endBy "in" hgt = checkLimits 59 76 h
>   | otherwise = False
> :}
> import Data.Char (isHexDigit)
> validHcl hcl = case hcl of { '#':cs -> all isHexDigit cs; _ -> False }
> validEcl = flip elem ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
> import Data.Char (isDigit)
> validPid pid = length pid == 9 && all isDigit pid
> :{
> validators = [("hcl", validHcl), ("iyr", validIyr), ("eyr", validEyr),
>   ("ecl", validEcl), ("pid", validPid), ("byr", validByr), ("hgt", validHgt)]
> :}
> fieldsValid = all $ \(f, v) -> maybe True ($ v) $ lookup f validators
> valid passport = fieldsPresent passport && fieldsValid passport
> length $ filter valid passports -- part 2
```

Day 5[#](#day-5)
----------

[Problem](https://adventofcode.com/2020/day/5)

Solution:

```
> :{
> partition lower upper (min, max) c
>   | c == lower = (min, (min+max) `div` 2)
>   | c == upper = ((min+max) `div` 2 + 1, max)
> :}
> locateRow = fst . foldl (partition 'F' 'B') (0, 127)
> locateCol = fst . foldl (partition 'L' 'R') (0, 7)
> seatId code = locateRow (take 7 code) * 8 + locateCol (drop 7 code)
> codes <- lines <$> readFile "/tmp/input5"
> seatIds = map seatId codes
> maximum seatIds -- part 1
> import Data.List ((\\))
> missingSeatIds = [8..1015] \\ seatIds
> -- part 2
> filter (\id -> (id-1) `elem` seatIds && (id+1) `elem` seatIds) missingSeatIds
```

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

This post is a part of the series: **Advent of Code 2020**.

1. **Week 1** 👈
2. [Week 2](https://abhinavsarkar.net/notes/2020-aoc-wk2/?mtm_campaign=feed)
3. [Week 3](https://abhinavsarkar.net/notes/2020-aoc-wk3/?mtm_campaign=feed)
4. [Week 4](https://abhinavsarkar.net/notes/2020-aoc-wk4/?mtm_campaign=feed)
5. [Lessons from Solving in Haskell](https://abhinavsarkar.net/notes/2020-aoc-learnings/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2020-aoc-wk1/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [My website](https://abhinavsarkar.net/notes/2020-aoc-wk1/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)