+++
title = "My Relationship with the Rust Programming Language"
description = " computingMy Relationship with the Rust Programming Language https://khleedril.org/blog/2026-10-14--rust.html khleedril.org/2026-10-14--rustDale Mellor  https://khleedril.org/dale-mellor  14th October, 2026I remember when I first dis"
date = "1970-01-01T00:00:00Z"
url = "https://khleedril.org/blog/2026-10-14--rust.html"
author = "Dale Mellor"
text = ""
lastupdated = "2026-11-12T12:47:49.908822829Z"
seen = true
+++

computing

My Relationship with the Rust Programming Language
==========

 https://khleedril.org/blog/2026-10-14--rust.html

 khleedril.org/2026-10-14--rust

Dale Mellor [ https://khleedril.org/dale-mellor ](https://khleedril.org/dale-mellor)

 14th October, 2026

I remember when I first discovered Rust. It was during the COVID lock-down at the start of 2020. I read the Rust book<sup><a href="#rust-book">[1]</a></sup>. It was a real revelation. I remember just turning the pages, and going, ‘Wow,’ ‘Wow,’ …. It just seemed like every design choice in the language was exactly right. Simple, beautiful, and correct. Like the creator had spent a lifetime using C++, and knew exactly how they wanted to improve it. Like, by reversing every single design aspect of that language, and liberating the object system. Plus, smart pointers. Plus, integrated parallelism. All cast-iron safe! Wow!

Then you start to realize how awkward all the inversions are when porting legacy code. Run-time polymorphism completely replaced with generic programming. Dynamic-link libraries completely replaced by monolithic binary blobs. A build system integrated with the operating system replaced by one which carried its own ecosystem, forcing the download and build of every bit of library code you will need.

Then you start to see the problems, the chinks in the armour. The need for *unsafe* code. The propensity to panic (is this not just another word for ‘crash’?) The thirst for slack disk space. The need to blindly trust so much infrastructure. The need to re-think your whole development game, and the organization of source code within the file system. Suddenly you are conflicted, sandwiched between liberation and constriction.

All this before really starting a project in earnest. At which point you realize how painful all the inversions from traditional object-oriented code are to work with. The borrow checker! Argh!

You eventually hit a plain of euphoria. Having finally defeated all of the borrow checkerʼs attempts to thwart your efforts, you have a code which not only compiles, but passes lint (*clippy*?!) cleanly. And it JUST WORKS! No crash-edit-build-rinse-repeat cycles. It is at this point you see the real power in the language, the new stability it is going to bring to the world.

By now you have left the olde worlde of object-oriented programming behind, and have become enlightened to the functional paradigm. No more for-loops, but one-line appendages onto object names. Suddenly it is quicker and easier to do anything.

Then you embark on, or progress your project to, something much more ambitious. The head starts hitting the table. This language becomes outright infuriating! You start reading deeper into the theory of the language, trying to work out the ‘correct’ way to do things. You come across articles like Quinedotʼs on dynamic traits<sup><a href="#rust-learning">[2]</a></sup> (because eventually we really need some runtime polymorphism, right?), written by someone who knows what they are talking about, and it is almost impenetrable at its deepest points. At this stage you realize that the Utopia was never achieved, that the language is necessarily just as complicated as C++, and that it even struggles with itself to understand what it is trying to do.

Then, after a Herculean effort, you have an almost accidental breakthrough achieved through some bloody-minded blind dogged perseverance and make some very complicated code compile. And, of course, it works! You then go through your code and remove all the explicit typing and turbofishing because, once the code is correct, the compiler can work all that out for itself. Your program ends up clean and beautiful, works perfectly and runs very efficiently. Utopia is achieved! I am elated! Even more than before! (Of course I discovered 30 years ago that this is the real joy, the adrenaline rush, of programming. It is just that now it feels so much nicer.)

All of this flies in the face of artificial intelligence (A.I.). I have never been interested in that (well, I was in the 1990s when it was frontier research: neural nets and Bayesian and fuzzy logic were new and were starting to be explored). After all the turmoil of getting my big project realized in Rust, I have solved big problems, learned lots about new theories of programming, and do feel truly elated. I would not have got that using A.I.

### References ###

1. <a name="rust-book"></a> [https://doc.rust-lang.org/stable/book/ : The Rust Book](https://doc.rust-lang.org/stable/book/).
2. <a name="rust-learning"></a> [https://quinedot.github.io/rust-learning/dyn-trait.html : Rust Learning](https://quinedot.github.io/rust-learning/dyn-trait.html)  
    web site (author known only as ‘Quinedot’).