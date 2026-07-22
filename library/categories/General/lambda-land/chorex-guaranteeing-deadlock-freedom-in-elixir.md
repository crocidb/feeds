+++
title = "Chorex: Guaranteeing Deadlock Freedom in Elixir"
description = "Chorex is a brand-new Elixir library for choreographic programming [3]: Chorex provides a macro-based DSL that lets you describe how processes communicate to perform a computation. This top-down description of interac"
date = "2024-06-03T00:00:00Z"
url = "https://lambdaland.org/posts/2024-06-03_chorex_0_1/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.229368729Z"
seen = false
+++

[Chorex](https://github.com/utahplt/chorex) is a brand-new Elixir library for *choreographic programming* [[3](#citeproc_bib_item_3)]: Chorex provides a macro-based DSL that lets you describe how processes communicate to perform a computation. This top-down description of interacting processes is called a *choreography*. From this choreography, Chorex creates modules for each process that handle all the message-passing in the system. The interactions performed by the generated code will never deadlock *by construction* because the choreographic DSL ensures that no processes will be waiting on each other at the same time.

This is a research project; if you like experimenting with new things, please try this out! The best way to leave feedback is by [opening an issue](https://github.com/utahplt/chorex/issues) on the Chorex repository. Chorex is still in active development, and we would love to see whatever you make with Chorex.

Chorex is available on [hex.pm](https://hex.pm/packages/chorex). Development is on [GitHub](https://github.com/utahplt/chorex). Try it out!

What does Chorex do?
----------

Chorex enables *choreographic programming* in Elixir. A *choreography* is a birds-eye view of communicating parties in a concurrent system: you describe the different actors and how they send messages to each other. From this choreography you can create an *endpoint projection*, which just means you create some code for each of the concurrent actors that handles all the communication.

![](/img/chorex_announcement/figures/EPP.png)

Choreographic programming ensures *deadlock freedom by construction*. That means you will not be able to accidentally create a system of actors that accidentally deadlock. It’s still possible to have other kinds of bugs that freeze the system (e.g. one of the actors hangs on an infinite loop) but it eliminates an entire class of bug that is difficult to track down in real applications.

Additionally, Chorex implements *higher-order choreographies* [[1](#citeproc_bib_item_1)] which let you treat choreographies as first-class citizens in your language. This improves the modularity of code built with choreographies.

Chorex does all this by leveraging Elixir’s macro system: you write down a choreography using the `defchor` macro provided by Chorex. The macro expands into several modules: one for each actor in your system. You then create another module for each actor in the system which `use`​s the respective macro-generated module; the macro-generated module handles the communication between the different parties in the choreography, and your hand-written module handles all the internal bits to that node. Let’s look at an example.

Example of a choreography
----------

Here’s a simple, classic example: someone wants to buy a book, so they ask the seller for the price. The seller responds with the price. Here’s a diagram of that communication:

![](/img/chorex_announcement/figures/booksell_flow.png)

And here is the corresponding choreography describing that:

```
defmodule BookSellerChor do
  defchor [Buyer, Seller] do
    Buyer.get_book_title() ~> Seller.(b)
    Seller.get_price(b) ~> Buyer.(p)
    Buyer.(p)
  end
end
```

The `defchor` macro will create (roughly) the following code:

```
defmodule BookSellerChor do
  defmodule Chorex do

    defmodule Buyer do
      @callback get_book_title/0

      ...
    end

    defmodule Seller do
      @callback get_price/1

      ...
    end

    ...
  end
end
```

along with a `__using__` macro. Now we create modules for each of our actors (`Buyer`, `Seller`) and we use the generated `Chorex` module to handle the communication:

```
defmodule MyBuyer do
  use BookSellerChor.Chorex, :buyer

  def get_book_title(), do: "Zen and the Art of Motorcycle Maintenance"
end

defmodule MySeller do
  use BookSellerChor.Chorex, :seller

  def get_price(book_title), do: ...
end

```

To kick off the choreography, start up a process for each actor and send them everyone’s PID:

```
buyer_process  = spawn(MyBuyer,  :init, [])
seller_process = spawn(MySeller, :init, [])

config = %{Buyer => buyer_process, Seller => seller_process, :super => self()}
send(buyer_process, config)
send(seller_process, config)
```

Now you can wait for the processes to send you (the parent that started the choreography) their return values. From the choreography, we expect the `Buyer` actor to finish with the price `p`. We can get that like so after sending the actors the config for the network:

```
receive do
  {:choreography_return, Buyer, the_price} -> IO.puts("Got price at buyer: #{the_price}")
end
```

In sum, this is how you use Chorex:

1. Write a choreography to describe your system
2. The `defchor` macro will create modules for each endpoint
3. Implement each endpoint’s derived behaviour
4. Fire of the choreography
5. Await replies

![](/img/chorex_announcement/figures/using_chorex.png)

Choreographies can get a *lot* more complicated than this puny example here. See the [Chorex README](https://hexdocs.pm/chorex/readme.html) and [module documentation](https://hexdocs.pm/chorex/Chorex.html) for more extensive examples with Chorex. Lugović and Montesi built an IRC client and server in Java with a choreography [[2](#citeproc_bib_item_2)]—I’m excited to see what’s possible in Elixir!

Chorex goals, non-goals, and roadmap
----------

Chorex is a *research project*, meaning that its primary function is to prove out new ideas. Development speed takes priority over stability of features and API. This is a scout and a trailblazer, not a surveyor and road-laying machine.

We would like to make Chorex as useful as possible; historically choreographic programming libraries have been cutting-edge research projects. Chorex *is* still research-oriented, but if we can make it useful to people other than ourselves, then that’s a big win. :) Moreover, no one has done choreographic programming with Elixir-style concurrency, where processes have mailboxes and where there are existing idioms around processes and communication.

This is *not* intended to be a production-grade system. Maybe some day, but not today. Please don’t use this to build a production system then blame us when your system goes down. Please *do* use this in hobby projects and let us know what you manage to build!

Feedback
----------

Please send us any feedback you have! You can [contact me directly](/#contact) or [open an issue](https://github.com/utahplt/chorex/issues) on the Chorex repository. We would *love* to see anything you make with Chorex.

Fun details on the implementation
----------

While building the `defchor` macro, I realized I needed to walk an AST and gather up a list of functions an an endpoint would need to define. This inspired me to create a writer monad; I documented how I stumbled upon a pattern that a monad solved quite elegantly [earlier on my blog](/posts/2024-05-01_definitely_not_about_monads/).

References
----------

.csl-left-margin{float: left; padding-right: 0em;} .csl-right-inline{margin: 0 0 0 1em;}

[]()

[1]

Hirsch, A.K. and Garg, D. 2022. Pirouette: Higher-order typed functional choreographies. *Proceedings of the acm on programming languages*. 6, (Jan. 2022), 1–27. DOI:[https://doi.org/10.1145/3498684](https://doi.org/10.1145/3498684).

[]()

[2]

Lugović, L. and Montesi, F. 2023. Real-World Choreographic Programming: Full-Duplex Asynchrony and Interoperability. *The art, science, and engineering of programming*. 8, 2 (Oct. 2023), 8. DOI:[https://doi.org/10.22152/programming-journal.org/2024/8/8](https://doi.org/10.22152/programming-journal.org/2024/8/8).

[]()

[3]

Montesi, F. 2023. *[Introduction to Choreographies](https://doi.org/10.1017/9781108981491)*. Cambridge University Press.