+++
title = "Functional Languages Need Not Be Slow"
description = "Somewhere in my adolescence I got stuck with the notion that functional languages were slow while languages like C were fast. Now, a good C programmer can eke more performance out of their code than probably anyone else, but the cost you pay to keep your code correct goes exponen"
date = "2023-12-20T00:00:00Z"
url = "https://lambdaland.org/posts/2023-12-20_functional_langauge_speed/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.238743252Z"
seen = false
+++

Somewhere in my adolescence I got stuck with the notion that functional languages were slow while languages like C were fast. Now, a good C programmer can eke more performance out of their code than probably anyone else, but the cost you pay to keep your code correct goes exponential as you get closer and closer to the machine.

Functional languages abstract a lot away from the machine. Higher languages in general abstract away the machine and make code easier to maintain. So I think I had it in my head that functional languages, being far away from the bare metal, must necessarily be slow. It didn’t help that I also thought of functional languages as being necessarily interpreted languages.

Turns out, functional languages are just as amenable to compilation as imperative ones. Many popular/well-known functional are in fact compiled. (E.g. Haskell, Scala, Rust, Julia, etc.) Moreover, these languages can be just as fast—if not faster—than their more “mainstream” counterparts.

I wanted to pit my favorite language (Racket) against a *slightly* more well-known language (Python) to see how they handled a simple single-threaded program. For good measure I threw Rust, Julia, and JavaScript into the mix for comparison.

If you’re impatient, just jump to [the results](https://lambdaland.org/posts/2023-12-20_functional_langauge_speed/#the-results).

The programs
----------

I wrote the original program in Racket, then had ChatGPT help me rewrite it in Python. ChatGPT did astoundingly well. I eventually rewrote the program to be a little more idiomatic—I wanted it to use a loop instead of tail recursion, as Python is much better with loops than it is with lots and lots of function calls. I also had ChatGPT help me rewrite the program to Rust, Julia, and JavaScript. Impressive—and unsettling.

```
#lang racket

(define (count-collatz n [cnt 1])
  (cond
    [(= n 1) cnt]
    [(even? n) (count-collatz (/ n 2) (+ 1 cnt))]
    [else (count-collatz (+ (* 3 n) 1) (+ 1 cnt))]))

(define (count-collatz-upto n)
  (for/fold
      ([max-seen 0])
      ([i (in-range 1 n)])
    (max max-seen (count-collatz i))))

(displayln (format "\nDone ~a" (count-collatz-upto 5000000)))
```

Code Snippet 1: `collatz_check.rkt`

```
def count_collatz(n):
    cnt = 1
    while n != 1:
        if n % 2 == 0:
            n = n // 2
            cnt += 1
        else:
            n = 3 * n + 1
            cnt += 1
    return cnt

max_seen = 0
def count_collatz_upto(n):
    global max_seen
    for i in range(1, n):
        the_count = count_collatz(i)
        max_seen = max(max_seen, the_count)
    return 42

count_collatz_upto(5000000)

print("\nDone", max_seen)
```

Code Snippet 2: `collatz_check.py`

```
fn count_collatz(n: u64) -> u64 {
    let mut cnt = 1;
    let mut num = n;
    while num != 1 {
        if num % 2 == 0 {
            num /= 2;
        } else {
            num = num * 3 + 1;
        }
        cnt += 1;
    }
    cnt
}

fn count_collatz_upto(n: u64) -> u64 {
    let mut max_seen = 0;
    for i in 1..n {
        max_seen = max_seen.max(count_collatz(i));
    }
    max_seen
}

fn main() {
    println!("Done {}", count_collatz_upto(5000000));
}
```

Code Snippet 3: `collatz_check.rs`

```
function count_collatz(n::Int)
    cnt = 1
    while n != 1
        if n % 2 == 0
            n = n ÷ 2
            cnt += 1
        else
            n = 3 * n + 1
            cnt += 1
        end
    end
    return cnt
end

max_seen = 0
function count_collatz_upto(n::Int)
    for i in 1:n-1
        the_count = count_collatz(i)
        global max_seen = max(max_seen, the_count)
    end
    return 42
end

count_collatz_upto(5000000)

println("\nDone ", max_seen)
```

Code Snippet 4: `collatz_check.jl`

```
function countCollatz(n) {
  let cnt = 1;
  while (n !== 1) {
    if (n % 2 === 0) {
      n = n / 2;
    } else {
      n = 3 * n + 1;
    }
    cnt++;
  }
  return cnt;
}

function countCollatzUpto(n) {
  let maxSeen = 0;
  for (let i = 1; i < n; i++) {
    maxSeen = Math.max(maxSeen, countCollatz(i));
  }
  return maxSeen;
}

console.log(`\nDone ${countCollatzUpto(5000000)}`);
```

Code Snippet 5: `collatz_check.js`

The results
----------

I ran these programs on my M1 Pro MacBook Pro. Here’s what I got:

.table-nocaption table { text-align: right; }

| Language |Time (seconds)|
|----------|--------------|
|  Racket  |     4.68     |
|  Python  |    34.27     |
|   Rust   |     3.03     |
|  Julia   |     2.34     |
|JavaScript|    11.92     |

In graphical form:

![](/img/benchmark_shootout.svg)

Wow! I did not expect Python to get so pummeled by everything else! It makes sense that Julia with its sweet JIT engine is the fastest. Rust does well—no surprise there. (Note that I’m not counting compilation time here—all the more impressive for Julia!) Racket holds its own though, coming in third place by a wide margin. If you did take Rust’s compile time into account, I think that would make it switch places with Racket. Of course, you use Rust for compile-once-run-lots sorts of scenarios.

Discussion
----------

Are these authoritative? No, of course not. This is a simple synthetic benchmark. I don’t consider myself expert programmer in *any* of these languages, so there are likely some performance tweaks that could make the respective language’s benchmark run faster. (Maybe I should in Racket… it’s kind of hard to consider yourself an expert in a language when its creator works down the hall from you though.)

That said, I hope this dispels the myth that functional languages are *necessarily* slow. That is not the case. If Python is fast enough for your use-case, then there’s no reason you shouldn’t consider using Racket on performance grounds.

Library support is a different matter: of all the programming that goes on in the world, the majority is probably just gluing libraries together to do the thing you want. This is a good thing: it means we’re not reinventing so many wheels and people are getting good work done.

That said, there’s plenty of exciting work for which no library exists! If you find yourself in one of these exciting cases, consider using the tool of maximum power: in this regard, nothing beats Racket for its flexibility and [extensibility](/posts/2023-10-17_fearless_macros/).

Bonus: building the graph in Racket
----------

I love the Racket [Plot](https://docs.racket-lang.org/plot/) library. So easy to use, so powerful. If you run it inside of DrRacket, the graphs are actually interactive: you can rotate 3D graphs and zoom in on sections of 2D graphs. So neat!

Here’s the code I used to generate the above graph:

```
#lang racket

(require plot)

(define *data* (list #("Racket" 4.68) #("Python" 34.27) #("Rust" 3.03) #("Julia" 2.34) #("JavaScript" 11.92)))

(parameterize ([plot-font-face "Charter"]
               [plot-font-size 14.0]
               [plot-x-ticks (linear-ticks #:number 10 #:divisors '(1 2 5))])
  (plot (list (discrete-histogram (reverse *data*)
                                  #:gap 0.3
                                  #:invert? #true))
        #:title "Simple benchmark results"
        #:out-kind 'svg
        #:out-file "benchmark_shootout.svg"
        #:x-max 35
        #:x-label "Seconds"
        #:width 800
        #:height 200))
```