+++
title = "Solving Advent of Code 2025 in Janet: Days 5–8"
description = "I’m solving the Advent of Code 2025 in Janet. After doing the last five years in Haskell, I wanted to learn a new language this year. I’ve been eyeing the “New Lisps”<sup1</supfor a while now, and I decided t"
date = "2025-12-13T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2025-aoc-2/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.449129300Z"
seen = false
+++

I’m solving the [Advent of Code 2025](https://adventofcode.com/2025/) in [Janet](https://janet-lang.org/). After doing the last five years in Haskell, I wanted to learn a new language this year. I’ve been eyeing the “New Lisps”[<sup>1</sup>](#fn1) for a while now, and I decided to learn Janet.

Janet is a [Clojure](https://clojure.org/) like Lisp that can be interpreted, embedded and compiled, and comes with a large standard library with concurrency, HTTP and PEG parser support. I want to replace [Python](https://python.org) with Janet as my scripting language.

Here are my solutions for December 5–8.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-aoc-2/?mtm_campaign=feed).

This post is a part of the series: **Solving Advent of Code 2025 in Janet**.

1. [Days 1–4](https://abhinavsarkar.net/notes/2025-aoc-1/?mtm_campaign=feed)
2. **Days 5–8** 👈

### Contents ###

1. [Day 5](#day-5)
2. [Day 6](#day-6)
3. [Day 7](#day-7)
4. [Day 8](#day-8)

Day 5[#](#day-5)
----------

[Problem](https://adventofcode.com/2025/day/5).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/5.txt"))

(def input-peg
  (peg/compile
   ~{:main   (sequence :ranges "\n" :ids -1)
     :ranges (group (some :range))
     :range  (group (sequence (number :num) "-" (number :num) (opt "\n")))
     :ids    (group (some :id))
     :id     (sequence (number :num) (opt "\n"))
     :num    (some :d)}))

(defn merge-ranges [ranges]
  (if (empty? ranges)
    @[]
    (do
      (var result @[(first ranges)])
      (each [start end] (slice ranges 1)
            (let [[prev-start prev-end] (last result)]
              (if (<= start (inc prev-end))
                (do
                  (array/pop result)
                  (array/push result [prev-start (max prev-end end)]))
                (array/push result [start end]))))
      result)))

(defn parse-input [content]
  (let [[ranges ids] (peg/match input-peg content)]
    {:ranges (->> ranges
                  (map tuple/slice)
                  sorted
                  merge-ranges
                  tuple/slice)
     :ids    (tuple/slice ids)}))

(defn fresh? [ranges n]
  (some (fn [[s e]] (<= s n e)) ranges))

(defn part-1 [{:ranges ranges :ids ids}]
  (->> ids
       (filter (partial fresh? ranges))
       (length)))

(defn part-2 [{:ranges ranges}]
  (->> ranges
       (map (fn [[s e]] (inc (- e s))))
       (sum)))

(defn main [& _]
  (def content (slurp input-path))
  (def input (parse-input content))
  (print "Part 1: " (part-1 input))
  (print "Part 2: " (part-2 input)))
```

All my solutions follow the same structure because I wrote a template to create new empty solutions. Actually, I added a fair bit of automation this time to build, run, test and benchmark the solutions.

Parsing the day 5 input was a bit involved because of the two different formats. Other than that, the `merge-ranges` function is the most interesting part. Since I sorted the ranges in `parse-input`, I needed to do only one linear scan of ranges, merging the current one with the previous one if possible. The trick here was to be correct about finding overlapping ranges and calculating the merged range. I made multiple mistakes but eventually figured it out.

Day 6[#](#day-6)
----------

[Problem](https://adventofcode.com/2025/day/6).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/6.txt"))

(defn input-peg [num-entry-pattern]
  (peg/compile
   ~{:main      (sequence :num-rows :op-row -1)
     :num-rows  (group (some :num-row))
     :num-row   (group (sequence (some :num-entry) "\n"))
     :num-entry ,num-entry-pattern
     :op-row    (group (some (sequence :op (opt (some :s)))))
     :op        (choice (replace "*" :mult) (replace "+" :add))}))

(defn parse-input [content num-entry-pattern]
  (let [[num-rows op-row] (peg/match (input-peg num-entry-pattern) content)]
    {:num-rows num-rows :op-row op-row}))

(defn transpose [num-rows]
  (def height (length num-rows))
  (def width (length (first num-rows)))
  (var arr (array/new width))
  (for i 0 width
       (var inner (array/new height))
       (for j 0 height
            (put inner j (get-in num-rows [j i])))
       (put arr i inner))
  arr)

(defn evaluate [op nums]
  ((match op
     :add sum
     :mult product)
   nums))

(defn part-1 [{:num-rows num-rows :op-row op-row}]
  (->> num-rows
       transpose
       (map evaluate op-row)
       sum))

(defn to-cephalopod-num [digits]
  (->> digits
       (reduce
        (fn [[acc digit-count] digit]
          (if (zero? digit)
            [acc digit-count]
            [(+ acc (* digit (math/pow 10 digit-count))) (inc digit-count)]))
        [0 0])
       first))

(defn part-2 [{:num-rows num-rows :op-row op-row}]
  (->> num-rows
       transpose
       (map (comp to-cephalopod-num reverse))
       (partition-by zero?)
       (filter |(-> $ first zero? not))
       (map evaluate op-row)
       sum))

(defn parse-input-1 [content]
  (parse-input content ~(sequence (any " ") (number :d+) (any " "))))

(defn parse-input-2 [content]
  (parse-input
   content
   ~(sequence (any (replace " " 0)) (some (number :d)) (any (replace " " 0)))))

(defn main [& _]
  (def content (slurp input-path))
  (print "Part 1: " (part-1 (parse-input-1 content)))
  (print "Part 2: " (part-2 (parse-input-2 content))))
```

Day 6 was entirely a parsing-based problem, and Janet was well suited to it. Parts 1 and 2 required the input to be parsed differently, so the `input-peg` is parameterized. In part 1, I ignored whitespaces in numbers, while in part 2, they were significant. So I passed two different patterns to parse numbers in `parse-input-1` and `parse-input-2`. I had to write the `transpose` function because it is not built into Janet. Rest of it was straightforward. Notice how I used threading macros to write the computations linearly.

Day 7[#](#day-7)
----------

[Problem](https://adventofcode.com/2025/day/7).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/7.txt"))

(def input-peg
  (peg/compile
   ~{:main (sequence (some :row) -1)
     :row  (group (sequence (some :cell) (opt "\n")))
     :cell (choice (replace "." :empty)
                   (replace "^" :splitter)
                   (replace "S" :start))}))

(defn parse-input [content] (peg/match input-peg content))

(defn propagate [grid width row-num idx]
  (def row (in grid row-num))
  (match (in row idx)
    :empty [idx]
    :splitter (seq [o :in [-1 1]
                    :let [x (+ idx o)]
                    :when (< -1 x width)]
                   x)))

(defn part-1 [input width height start-index]
  (defn step [[beam-indices splits] row-num]
    (let [new-indices (->> beam-indices
                           keys
                           (mapcat |(propagate input width row-num $)))]
      [(apply struct (mapcat |[$ :t] new-indices))
       (+ splits (- (length new-indices) (length beam-indices)))]))

  (->
   (reduce step [{start-index :t} 0] (range 1 height))
   (in 1)))

(defn part-2 [input width height start-index]
  (def cache @{})

  (defn count-paths-memo [layer idx]
    (if (has-key? cache [layer idx])
      (get cache [layer idx])
      (let [count (if (= layer height)
                    1
                    (sum (map |(count-paths-memo (inc layer) $)
                              (propagate input width layer idx))))]
        (put cache [layer idx] count)
        count)))

  (count-paths-memo 1 start-index))

(defn main [& _]
  (def content (slurp input-path))
  (def input (parse-input content))
  (def width (length (first input)))
  (def height (length input))
  (def start-index (find-index |(= $ :start) (first input)))

  (print "Part 1: " (part-1 input width height start-index))
  (print "Part 2: " (part-2 input width height start-index)))
```

I solved part 1 of day 7 by simply folding over the input rows, propagating the beam, and splitting it when required. I used a set of indices to keep track of the current indices at which beam was present. Only tricky thing here was using a dict to simulate a set because Janet does not have sets built-in. That’s what the `(apply struct (mapcat |[$ :t] new-indices))` code is doing.

Part 2 was harder. I first wrote a brute-force solution to count the number of paths, but it never finished running. The number of paths is \\(O(2^n)\\), and impossible to solve with brute-force. I know that there may be better solutions possible, but I simply added a dict-based cache, and that made it work.

Day 8[#](#day-8)
----------

[Problem](https://adventofcode.com/2025/day/8).

Solution:

```
(def base-path (os/getenv "AOC_INPUT_PATH"))
(def input-path (string base-path "/8.txt"))

(def input-peg
  (peg/compile
   ~{:main (sequence (some :row) -1)
     :row  (group (sequence (some :num) (opt "\n")))
     :num  (sequence (number :d+) (opt ","))}))

(defn parse-input [content]
  (->> (peg/match input-peg content)
       (map tuple/slice)
       tuple/slice))

(defn distance [a b]
  (var sum 0)
  (for i 0 (length a)
       (let [d (- (in a i) (in b i))] (+= sum (* d d))))
  sum)

(defn point-pairs [points]
  (def count (length points))
  (var pairs (array/new (/ (* count (dec count)) 2)))
  (for i 0 count
       (for j (inc i) count
            (let [p1 (in points i)
                  p2 (in points j)]
              (array/push pairs [p1 p2 (distance p1 p2)]))))
  (sort pairs |(< (in $0 2) (in $1 2))))

(def disjoint-set-prototype
  @{:find  (fn [self i]
             (def parents (self :parents))
             (let [parent (get parents i)]
               (if (not (= (get parents parent) parent))
                 (let [root (:find self parent)]
                   (put parents i root)
                   root)
                 parent)))

    :union (fn [self i j]
             (def parents (self :parents))
             (def sizes (self :sizes))
             (let [i-root (:find self i)
                   j-root (:find self j)]
               (when (not (= i-root j-root))
                 (let [i-size  (in sizes i-root)
                       j-size  (in sizes j-root)
                       ij-size (+ i-size j-size)]
                   (if (< i-size j-size)
                     (do
                       (put parents i-root j-root)
                       (put sizes j-root ij-size))
                     (do
                       (put parents j-root i-root)
                       (put sizes i-root ij-size)))
                   (when (> ij-size (self :max-size))
                     (put self :max-size ij-size))
                   self))))})

(defn new-disjoint-set [nodes]
  (table/setproto
   @{:parents  (reduce (fn [acc node] (put acc node node)) @{} nodes)
     :sizes    (reduce (fn [acc node] (put acc node 1)) @{} nodes)
     :max-size 1}
   disjoint-set-prototype))

(defn part-1 [pairs]
  (def pair-count (if (= base-path "examples") 10 1000))
  (def closest-pairs (array/slice pairs 0 pair-count))
  (def points (->>
               closest-pairs
               (reduce (fn [acc [p1 p2 _]]
                          (do (put acc p1 :t) (put acc p2 :t))) @{})
               keys))
  (def ds (new-disjoint-set points))
  (each [p1 p2 _] closest-pairs (:union ds p1 p2))
  (->> (-> (ds :sizes) values (sorted >))
       (take 3)
       product))

(defn part-2 [points pairs]
  (def points-count (length points))
  (def ds (new-disjoint-set points))
  (var prev-pair nil)
  (each [p1 p2 _] pairs
        (when (= (ds :max-size) points-count)
          (break))
        (:union ds p1 p2)
        (set prev-pair [p1 p2]))
  (let [[[x1 _ _] [x2 _ _]] prev-pair]
    (* x1 x2)))

(defn main [& _]
  (def content (slurp input-path))
  (def points (parse-input content))
  (def pairs (point-pairs points))
  (print "Part 1: " (part-1 pairs))
  (print "Part 2: " (part-2 points pairs)))
```

Day 8 required me to do several new things. It was immediately clear to me that I needed a *[Disjoint Set](https://en.wikipedia.org/wiki/Disjoint-set_data_structure)* to keep track of the connected points. So I wrote one in object-oriented Janet! Object-orientation in Janet is [prototype-based](https://en.wikipedia.org/wiki/Prototype-based_programming), pretty much like JavaScript. You can see the `find` and `union` methods in the `disjoint-set-prototype` above.

I first computed all unique pairs and distances between them, and sorted the pairs by distances. In part 1, I union-ed closest \\(k\\) pairs, while in part 2, I kept going till all points were connected in one circuit.

This worked but it took really long to run: over 600ms. I was not satisfied. After a night’s sleep, I realized that I do not need to sort **all** pairs but only top \\(k\\), where \\(k\\) is much smaller than total number of pairs (\~500000). So I rewrote the `point-pairs` function to use a [max binary heap](https://en.wikipedia.org/wiki/Binary_heap) that keeps only the closest-\\(k\\) pairs.

```
(defn heap-sift-down [heap idx]
  (def count (length heap))
  (var cur-idx idx)
  (var done false)
  (while (not done)
    (def left-idx (+ (* cur-idx 2) 1))
    (def right-idx (+ (* cur-idx 2) 2))
    (var largest-idx cur-idx)
    (when (< left-idx count)
      (when (> (in (in heap left-idx) 2) (in (in heap largest-idx) 2))
        (set largest-idx left-idx)))
    (when (< right-idx count)
      (when (> (in (in heap right-idx) 2) (in (in heap largest-idx) 2))
        (set largest-idx right-idx)))
    (if (= largest-idx cur-idx)
      (set done true)
      (do
        (let [tmp (in heap cur-idx)]
          (put heap cur-idx (in heap largest-idx))
          (put heap largest-idx tmp))
        (set cur-idx largest-idx)))))

(defn max-heapify [heap]
  (for i (math/floor (/ (- (length heap) 1) 2)) -1 -1
       (heap-sift-down heap i)))

(defn point-pairs [points k]
  (def count (length points))
  (var heap @[])

  (for i 0 count
       (for j (inc i) count
            (let [p1   (in points i)
                  p2   (in points j)
                  dist (distance p1 p2)]
              (if (< (length heap) k)
                (do
                  (array/push heap [p1 p2 dist])
                  (when (= (length heap) k)
                    (max-heapify heap)))
                (when (< dist (in (in heap 0) 2))
                  (put heap 0 [p1 p2 dist])
                  (heap-sift-down heap 0))))))

  (sort heap |(< (in $0 2) (in $1 2))))

(defn main [& _]
  (def content (slurp input-path))
  (def points (parse-input content))
  (def pairs (point-pairs points 5500))
  (print "Part 1: " (part-1 pairs))
  (print "Part 2: " (part-2 points pairs)))
```

The `main` function changed to pass \\(k\\) as a parameter to `point-pairs`, which after a bit of experimentation, I set to 5500. The rest of the functions stayed unchanged. This change provided over 10x speedup, reducing the run time to under 60ms[<sup>2</sup>](#fn2)!

You can see the mutable nature of Janet in all its glory in this solution. I had several gotcha moments when I tried to mix higher-order functions—such as `map`, `filter`, and `reduce`—with mutable date structures in Janet. Not only they are confusing, but they also result in slower code because Janet does not have *[Persistent data-structures](https://en.wikipedia.org/wiki/Persistent_data_structure)* like Clojure. Every `map` etc. result in a new array being created. My advice is to not mix functional programming code with procedural programming code in Janet.

---

That’s it for now. Next note will drop after 4 or 5 days. You can browse the [code repo](https://github.com/abhin4v/AoC25) to see the full setup.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. The new Lisps that interest me are: Janet, [Fennel](https://fennel-lang.org) and [Jank](https://jank-lang.org).[↩︎](#fnref1)

2. You may ask why I didn’t write the max-heap as OO-Janet code. Well, I did and I found that it was 50% slower than the procedural version shown here. I guess the dispatch overhead for methods is too much.[↩︎](#fnref2)

This post is a part of the series: **Solving Advent of Code 2025 in Janet**.

1. [Days 1–4](https://abhinavsarkar.net/notes/2025-aoc-1/?mtm_campaign=feed)
2. **Days 5–8** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-aoc-2/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115710828454364873)
* [Reddit](https://www.reddit.com/r/janetlang/comments/1plenbg/)
* [My website](https://abhinavsarkar.net/notes/2025-aoc-2/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)