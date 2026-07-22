+++
title = "Solving Advent of Code 2025 in Janet: Days 1–4"
description = "I’m solving the Advent of Code 2025 in Janet. After doing the last five years in Haskell, I wanted to learn a new language this year. I’ve been eyeing the “New Lisps”<sup1</supfor a while now, and I decided t"
date = "2025-12-05T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2025-aoc-1/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.452433238Z"
seen = false
+++

I’m solving the [Advent of Code 2025](https://adventofcode.com/2025/) in [Janet](https://janet-lang.org/). After doing the last five years in Haskell, I wanted to learn a new language this year. I’ve been eyeing the “New Lisps”[<sup>1</sup>](#fn1) for a while now, and I decided to learn Janet.

Janet is a [Clojure](https://clojure.org/) like Lisp that can be interpreted, embedded and compiled, and comes with a large standard library with concurrency, HTTP and PEG parser support. I want to replace [Python](https://python.org) with Janet as my scripting language.

Here are my solutions for December 1–4.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-aoc-1/?mtm_campaign=feed).

This post is a part of the series: **Solving Advent of Code 2025 in Janet**.

1. **Days 1–4** 👈
2. [Days 5–8](https://abhinavsarkar.net/notes/2025-aoc-2/?mtm_campaign=feed)

### Contents ###

1. [Day 1](#day-1)
2. [Day 2](#day-2)
3. [Day 3](#day-3)
4. [Day 4](#day-4)

Day 1[#](#day-1)
----------

[Problem](https://adventofcode.com/2025/day/1).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/1.txt"))

(def pattern-captured
  '(some (sequence (capture (choice "L" "R"))
                   (number (some :d))
                   (opt "\n"))))

(defn parse-moves [input]
  (let [matches (peg/match pattern-captured input)]
    (if matches
      (map (fn [i]
             {:dir (in matches i) :steps (in matches (+ i 1))})
           (range 0 (length matches) 2))
      (error "no matches"))))

(defn wrap-position [pos]
  (cond
    (zero? pos) 0
    (zero? (% pos 100)) 0
    (pos? pos) (% pos 100)
    (neg? pos) (+ (% pos 100) 100)))

(defn move-dial [position {:dir direction :steps steps}]
  (wrap-position
   (if (= direction "L")
     (- position steps)
     (+ position steps))))

(defn apply-moves-1 [moves start-position]
  (var current start-position)
  (var zero-hits 0)
  (each move moves
        (set current (move-dial current move))
        (when (= current 0)
          (++ zero-hits)))
  zero-hits)

(defn apply-moves-2 [moves start-position]
  (var current start-position)
  (var zero-crossings 0)
  (each move moves
        (let [{:dir direction :steps steps} move
              steps-to-zero (if (= direction "L") current (- 100 current))]
          (when (>= steps steps-to-zero)
            (set zero-crossings
                 (+ zero-crossings
                    (+ (if (pos? steps-to-zero) 1 0)
                       (div (- steps steps-to-zero) 100)))))
          (set current (move-dial current move))))
  zero-crossings)

(defn main [& _]
  (def content (slurp input-path))
  (def moves (parse-moves content))
  (print "Part 1: " (apply-moves-1 moves 50))
  (print "Part 2: " (apply-moves-2 moves 50)))
```

All my solutions follow the same structure because I wrote a template to create new empty solutions. Actually, I added a fair bit of automation this time to build, run, test and benchmark the solutions.

Day 1 was a bit mathy but it didn’t take too long to figure out. I spent more time polishing the solution to be idiomatic Janet code. `pattern-captured`, the PEG grammar to parse the input was the most interesting part for me on the day. If you know Janet, you can notice this is not the cleanest code, but that’s okay, it was my day 1 too.

Day 2[#](#day-2)
----------

[Problem](https://adventofcode.com/2025/day/2).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/2.txt"))

(def input-peg
  (peg/compile ~{:main   (sequence :ranges -1)
                 :ranges (some :range)
                 :range  (group (sequence (number :num) "-" (number :num) (opt ",")))
                 :num    (some :d)}))

(defn parse-input [content]
  (var matches (map tuple/slice (peg/match input-peg content)))
  (sort matches)
  (tuple/slice matches))

(defmacro in-range? [n & _]
  (def ranges (parse-input (slurp input-path)))
  ~(or ,;(map (fn [[s e]] ~(<= ,s ,n ,e)) ranges)))

(defn multiple-digits [n k digit-power]
  (var sum 0)
  (for i 0 k
       (set sum (+ (* digit-power sum) n)))
  sum)

(defn part-1 [input]
  (def limit (last (last input)))
  (var i 1)
  (var digit-power 10)
  (var n (multiple-digits i 2 digit-power))
  (var sum 0)
  (while (<= n limit)
    (when (in-range? n input)
      (set sum (+ sum n)))
    (++ i)
    (when (>= i digit-power)
      (set digit-power (* digit-power 10)))
    (set n (multiple-digits i 2 digit-power)))
  sum)

(defn part-2 [input]
  (def limit (last (last input)))
  (var sum 0)
  (var multiple 2)
  (var seen @{})
  (while (<= (multiple-digits 1 multiple 10) limit)
    (var i 1)
    (var digit-power 10)
    (var n (multiple-digits i multiple digit-power))
    (while (<= n limit)
      (when (and (not (get seen n)) (in-range? n input))
        (put seen n true)
        (set sum (+ sum n)))
      (++ i)
      (when (>= i digit-power)
        (set digit-power (* digit-power 10)))
      (set n (multiple-digits i multiple digit-power)))
    (++ multiple))
  sum)

(defn main [& _]
  (def content (slurp input-path))
  (def input (parse-input content))
  (print "Part 1: " (part-1 input))
  (print "Part 2: " (part-2 input)))
```

The most interesting part of the day 2 solution was the macro `in-range?` that reads the input at compile-time and creates a custom function to check whether a number is in one of the given ranges. This turned out to be almost 4x faster than writing the same thing as a function.

Notice `input-peg`, the PEG grammar to parse the input. So short and clean! I also leaned into the imperative and mutable nature of the Janet data-structures. The code is still not the cleanest as I was still learning.

Day 3[#](#day-3)
----------

[Problem](https://adventofcode.com/2025/day/3).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/3.txt"))

(defn parse-input [content]
  (filter (fn [line] (not (empty? line))) (string/split "\n" content)))

(defn max-subsequence [k input-str]
  (def memo @{})

  (defn- max-subsequence-impl [k str]
    (cond
      (= k 0) [0 0]
      (empty? str) [0 0]
      (do
        (def key [k str])
        (if (has-key? memo key)
          (get memo key)
          (do
            (def digit (- (first str) 48))
            (def rest-str (string/slice str 1))
            (def [av al] (max-subsequence-impl (- k 1) rest-str))
            (def [bv bl] (max-subsequence-impl k rest-str))
            (def av-prime (+ (* digit (math/pow 10 al)) av))
            (def result (if (> av-prime bv) [av-prime (+ al 1)] [bv bl]))
            (put memo key result)
            result)))))

  (first (max-subsequence-impl k input-str)))

(defn solve [k input]
  (var total 0)
  (each line input (+= total (max-subsequence k line)))
  total)

(defn main [& _]
  (def content (slurp input-path))
  (def input (parse-input content))
  (print "Part 1: " (solve 2 input))
  (print "Part 2: " (solve 12 input)))
```

The first part of day 3 was pretty easy to solve, but using the same solution for the second part just ran forever. I realized that this is a *[Dynamic Programming](https://en.wikipedia.org/wiki/Dynamic_Programming)* problem, but I don’t like doing array-based solutions, so I simply rewrote the solution to add caching. And it worked! It is definitely on the slower side, but I’m okay with it. The code has become a little more idiomatic Janet.

Day 4[#](#day-4)
----------

[Problem](https://adventofcode.com/2025/day/4).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/4.txt"))

(defn parse-input [content]
  (let [cells (->> content
                   (string/split "\n")
                   (filter (complement empty?))
                   (map (fn [line] (map |(match $ 46 :empty 64 :roll) line))))]
    {:cells  cells
     :width  (length (first cells))
     :height (length cells)}))

(defn get-cell [grid x y]
  (-> grid (get :cells) (in y) (in x)))

(defn set-cell [grid x y value]
  (update-in grid [:cells y x] (fn [_] value)))

(defn accessible? [neighbours]
  (< (length (filter |(= $ :roll) neighbours)) 4))

(defn has-roll? [grid x y]
  (= (get-cell grid x y) :roll))

(defn get-neighbours-indices [grid x y]
  (let [{:width width :height height} grid]
    (seq [i :in (range -1 2)
          j :in (range -1 2)
          :when (not (and (= i 0) (= j 0)))
          :let [xn (+ x i) yn (+ y j)]
          :when (< -1 xn width)
          :when (< -1 yn height)]
         [xn yn])))

(defn get-neighbours [grid x y]
  (map (fn [[xn yn]] (get-cell grid xn yn))
       (get-neighbours-indices grid x y)))

(defn get-accessible-cells [grid]
  (let [{:width width :height height} grid]
    (seq [x :in (range 0 width)
          y :in (range 0 height)
          :when (has-roll? grid x y)
          :let [n (get-neighbours grid x y)]
          :when (accessible? n)]
         [x y])))

(defn part-1 [grid] (length (get-accessible-cells grid)))

(defn part-2 [grid]
  (let [{:width width :height height} grid]
    (var count 0)
    (var queue (get-accessible-cells grid))
    (var queued @{})

    (each key queue
          (put queued key true))

    (while (not (empty? queue))
      (def [x y] (first queue))
      (array/remove queue 0)
      (set-cell grid x y :empty)
      (++ count)

      (loop [[xn yn]
             :in     (get-neighbours-indices grid x y)
             :when   (has-roll? grid xn yn)
             :let    [key [xn yn]]
             :when   (not (queued key))
             :let    [n (get-neighbours grid xn yn)]
             :when   (accessible? n)]
        (put queued key true)
        (array/push queue key)))

    count))

(defn main [& _]
  (def content (slurp input-path))
  (def grid (parse-input content))
  (print "Part 1: " (part-1 grid))
  (print "Part 2: " (part-2 grid)))
```

Day 4 is when I learned more about Janet control flow structures. The solution for the part 2 is a straightforward [Breadth-first traversal](https://en.wikipedia.org/wiki/Breadth-first_traversal). The interesting parts are the `seq`, `loop` and `while` statements. So concise and elegant!

---

That’s it for now. Next note will drop after 4 or 5 days. You can browse the [code repo](https://github.com/abhin4v/AoC25) to see the full setup.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. The new Lisps that interest me are: Janet, [Fennel](https://fennel-lang.org) and [Jank](https://jank-lang.org).[↩︎](#fnref1)

This post is a part of the series: **Solving Advent of Code 2025 in Janet**.

1. **Days 1–4** 👈
2. [Days 5–8](https://abhinavsarkar.net/notes/2025-aoc-2/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-aoc-1/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115665250944282439)
* [Reddit](https://www.reddit.com/r/janetlang/comments/1penpnt/)
* [My website](https://abhinavsarkar.net/notes/2025-aoc-1/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)