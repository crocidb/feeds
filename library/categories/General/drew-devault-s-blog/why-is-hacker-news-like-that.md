+++
title = "Why is Hacker News like that?"
description = 'Hacker News (aka HN) is a link aggregator where “hackers”<sup class="footnote-ref"<a href="fn-1" id="fn-1-ref-1"1</a</supgather to discuss technology, politics, and anything which “good hackers would find interesting”. HN is a means by which its host, prominent startup incu'
date = "2026-09-23T00:00:00Z"
url = "https://drewdevault.com/blog/Why-is-HN-like-that/"
author = "Drew DeVault's blog"
text = ""
lastupdated = "2026-09-23T18:24:54.338515261Z"
seen = false
+++

Hacker News (aka HN) is a link aggregator where “hackers”<sup class="footnote-ref"><a href="#fn-1" id="fn-1-ref-1">1</a></sup> gather to discuss technology, politics, and anything which “good hackers would find interesting”. HN is a means by which its host, prominent startup incubator Y Combinator, projects soft power, promotes startups it funds, and feeds people with ideas into its incubation program. Hacker News is one of the most popular forums for discussing technology online today – perhaps the biggest.

HN also has a pronounced political bias, which is growing more exaggerated with time. Many of its users have long claimed centrist or “apolitical” views. On a forum created by a startup incubator, it’s no surprise that capitalism is generally taken as given, often with a libertarian angle. Labor is generally de-emphasized (the consensus on HN is almost always anti-union) and openly advocating left economics like communism or socialism is generally frowned upon. Progressives have, on the whole, abandoned the forum.

The right wing has not. Yesterday, I saw a post about the new release of the Grok LLM, Elon Musk’s “anti-woke” AI project. Virtually all of the comments are fawning over the release, and debating the finer points of its technical achievements, price, and competitiveness. There are remarks that object to the tool on the basis that its owner, Elon Musk, is a fascist, and that it is designed to amplify hate speech. Almost all of these remarks are “flagged”, moderated by other HN users until they are not visible by default.<sup class="footnote-ref"><a href="#fn-2" id="fn-2-ref-1">2</a></sup>

Some examples of comments flagged out of existence:

>
>
> Until Musk owns up to his Nazi salute, I won’t be using Grok, sorry. I don’t care how good or cheap it is. And no, I won’t stop talking about it either.
>
>

>
>
> Your friendly reminder that Grok is owned and directly steered by the white supremacist guy with the fascist haircut who does nazi salutes and fucked up decades of international order to settle scores for his apartheid south african family. Any amount of using the model supports this.
>
>

>
>
> I’m dying to know how everyone who works on this product sleeps at night. How does one reconcile a sense of ethics with helping Musk make more money on AI-generated CSAM and racism
>
>

And, my personal favorite:

>
>
> I have to say I’m a little perplexed by HN’s perpetual willingness to use grok like it’s a normal product made by a normal company.
>
>
>
> There’s often frustration that every thread related to a Musk company includes a discussion about Musk, but Musk himself caused that by being the only tech founder to actively campaign for Trump. (Zuck, the runner up, didn’t do anything even close to this). Every product at every company he owns is hopelessly tethered to his decision to do that, and deserves to be judged on those terms.
>
>
>
> Another popular story today is about [US rollback of climate regulation](https://text.hrw.org/news/2026/09/17/us-revokes-limits-on-po...) under Trump. Some fraction of every cent you spend on Grok goes to support stuff you hate, and yet people get genuinely annoyed when you point it out. Musk and his companies really *are* special and should be treated as special.
>
>
>
> Every thread about a Musk company or product needs a comment like this one. If we had the right values, every comment would look like this one.
>
>

All of these are gone.

Overt hate and bigotry on Hacker News is uncommon, but not rare, and often gets pushback. Covert hate (e.g. dog whistles) is more common, and when called out the call-out usually gets flamed rather than the hate. Unexamined bias against progressivism and the rights and interests of anyone who isn’t the “default” middle-class white cis male, is incredibly common, and anyone who questions these biases is generally subjected to flames and moderation action.

Why is Hacker News like this?

Moderation on HN
----------

Hacker News has two formal moderators, both employed by Y Combinator: Daniel Gackle, aka dang, and Tom Howard, aka tomhow. Scott Bell (sctb) assisted with moderation until 2019. They employ a variety of technical tools to do the job, including:

* Boosting or sinking the rank of posts, or “burying” them entirely
* Deleting posts (entirely) or “killing” posts (marking them as [dead])
* Detaching and/or downranking comment trees
* “Shadowbanning” users
* Overtly banning users

Moderators [occasionally post comments](https://news.ycombinator.com/threads?id=dang) and intervene in discussions, steering things one way or another or explaining their moderation decisions.

There are also automated moderation systems, which for example try to detect flamewars with heuristics like the ratioes between post score, age, and the number of comments, and apply a downward pressure to the post’s ranking to reduce the visibility of controversial topics. Of course, the topics which are deemed controversial by the automated systems are, more often than not, progressive politics.

Users above a certain (small) amount of “karma” gain the ability to “flag” posts, allowing Hacker News to self-moderate. Posts or comments can be hidden entirely (made “dead”) with a small number of flags, particularly early on, before they gain enough votes to influence the flagging algorithm. This is the mechanism which was used to silence criticism of Grok and Elon Musk in the thread discussed earlier. By and large the flagging mechanism is used to silence progressive opinions and articles from being posted on Hacker News. Once a post or comment is flagged, it can be “vouched” for, but this generally does not work in practice due to a relatively straightforward bias: flagged posts are only visible to users who opt-in, are moved to the bottom of threads and hidden from view, and one can flag at any time but cannot vouch for a post proactively. Once a comment or post is gone, it generally stays gone.

The moderators tend to view the automated moderation and the flagging mechanism as neutral, and use it to deflect responsibility for moderation decisions onto the tools or the users who use them, i.e. the “community” in the abstract.<sup class="footnote-ref"><a href="#fn-3" id="fn-3-ref-1">3</a></sup> However, ultimately the moderators are in control of these tools and are aware of their biases and the outcomes they produce.

So… why is Hacker News like this?

Y Combinator
----------

Hacker News is like this because the people responsible for it are like this, in particular the people at and in the orbit of Y Combinator.

Hacker News goes to some lengths to portray itself as independent of the company that owns it, Y Combinator. Nonetheless, Y Combinator decides who gets to be in charge of Hacker News, and the raison d’être of Hacker News is, at least originally, a forum for YC-backed startup founders to socialize and discuss the news of the day. To this day, YC-funded startups have access to special privileges on HN, in particular the ability to post directly to the front page with a special ranking algorithm (to advertise job openings and announce startup launches). There is also a feature that allows YC founders to spot each other more easily, with their usernames showing up in orange to each other.

### Y Combinator’s portfolio ###

The [YC startup directory](https://www.ycombinator.com/companies) lists (almost) all of the companies which have received funding from Y Combinator, a list which shows a history of funding companies without a competent ethical evaluation. Coinbase, for example, is one of YC’s “unicorns”, and has donated tens of millions of US dollars to various pro-cryptocurrency political organizations, which tend to skew right wing by a ratio of 2:1, and Coinbase now funds fascist [David Hansson](https://drewdevault.com/weird-guys/#dhh)’s Omarchy project. We’ll talk more about Coinbase momentarily. David is also funded by Stripe, another particularly successful YC alumni.

YC also funds companies that specialize in military and police applications, such as Code Four, Lakonia, Closure, Abel Police, Ravn, and more. They were early investors in Flock Safety, a company now notorious for putting up surveillance equipment across America – much of which is now being torn down by infuriated citizens. Another great example is Optifye.ai, surveillance software for monitoring workers in sweatshops in India, and a member of YC’s winter 2025 batch.

Many companies – AirBnB is another example – funded by Y Combinator share the same “move fast and break laws” mindset that is particularly popular among their alumnus. There are many dozens of examples of such companies among Y Combinator’s portfolio, but I won’t belabor the point.

### Regarding Paul Graham ###

Y Combinator was founded by Paul Graham in March 2005, along with three collaborators, though Paul (aka pg) was and remains the face of the operation. Paul wrote and launched Hacker News himself using his own dialect of Lisp, and to this day he tends to be revered by the HN community and certainly by the community of Y Combinator founders, partners, and investors. To what extent modern-day HN culture flows from his original spring can be debated, but we can at least understand the nature of that spring.

Let’s consult his blog for some insights. I suggest you click through to my examples and read/skim them yourself for more juicy quotes.

In April 2022, Paul posted “[On Heresey](https://paulgraham.com/heresy.html)”, a post of interest to our question. He explains his feelings on calling someone “x-ist” (i.e. sexist, racist, etc), like so:

>
>
> For example, when someone calls a statement “x-ist,” they’re also implicitly saying that this is the end of the discussion. They do not, having said this, go on to consider whether the statement is true or not. Using such labels is the conversational equivalent of signalling an exception. That’s one of the reasons they’re used: to end a discussion.
>
>

On intolerance:

>
>
> There are aggressively conventional-minded people on both the right and the left. The reason the current wave of intolerance comes from the left is simply because the new unifying ideology happened to come from the left. The next one might come from the right. Imagine what that would be like.
>
>

Note that this essay was published a mere three months after the January 6th US capital insurrection, where a right-wing mob stormed the US capitol building, erecting a gallows on the lawn and calling for Mike Pence’s head.

A more recent essay, January 2025, “[The Origins of Wokeness](https://paulgraham.com/woke.html)”, also provides ample insight into Paul’s character. Paul on racism:

>
>
> Racism, for example, is a genuine problem. Not a problem on the scale that the woke believe it to be, but a genuine one. I don’t think any reasonable person would deny that. The problem with political correctness was not that it focused on marginalized groups, but the shallow, aggressive way in which it did so. Instead of going out into the world and quietly helping members of marginalized groups, the politically correct focused on getting people in trouble for using the wrong words to talk about them.
>
>

Paul on sexism:

>
>
> I saw political correctness arise. When I started college in 1982 it was not yet a thing. Female students might object if someone said something they considered sexist, but no one was getting reported for it. It was still not a thing when I started grad school in 1986. It was definitely a thing in 1988 though, and by the early 1990s it seemed to pervade campus life.
>
>
>
> What happened? How did protest become punishment? Why were the late 1980s the point at which protests against male chauvinism (as it used to be called) morphed into formal complaints to university authorities about sexism? Basically, the 1960s radicals got tenure. They became the Establishment they’d protested against two decades before. Now they were in a position not just to speak out about their ideas, but to enforce them.
>
>

And on sexual harassment:

>
>
> One thing I noticed at the time about the first phase of political correctness was that it was more popular with women than men. As many writers (perhaps most eloquently George Orwell) have observed, women seem more attracted than men to the idea of being moral enforcers. But there was another more specific reason women tended to be the enforcers of political correctness. There was at this time a great backlash against sexual harassment; the mid 1980s were the point when the definition of sexual harassment was expanded from explicit sexual advances to creating a “hostile environment.” Within universities the classic form of accusation was for a (female) student to say that a professor made her “feel uncomfortable.” But the vagueness of this accusation allowed the radius of forbidden behavior to expand to include talking about heterodox ideas. Those make people uncomfortable too.
>
>
>
> Was it sexist to propose that Darwin’s greater male variability hypothesis might explain some variation in human performance? Sexist enough to get Larry Summers pushed out as president of Harvard, apparently.
>
>

In addition to, in his position as the president of Harvard University, making bio-essentialist remarks about the inherently lesser intelligence of women to explain the demographics of his student body, Larry Summers was a personal friend and correspondent of Jeffrey Epstein, though this connection was not generally known at the time Paul wrote this essay.

### Regarding Sam Altman ###

Then there’s Sam Altman, who looms large in the history of Y Combinator. Sam was a member of YC’s first cohort of startups, and later became a partner at YC in 2011. Ultimately, Sam replaced Graham as its president in 2011, serving in this role until (roughly) 2019, leaving more or less in disgrace to focus on OpenAI.<sup class="footnote-ref"><a href="#fn-4" id="fn-4-ref-1">4</a></sup> Until then he was held in high regard by Graham and others at Y Combinator, with Graham famously saying of him, “you could parachute him into an island of cannibals and come back in five years and he’d be king” and frequently lauding him in his essays, [naming him](https://paulgraham.com/5founders.html) one of the five “most interesting startup founders of the last 30 years”, adding that Sam “can’t be stopped by (…) flimsy rules”.

After his departure, Sam was ultimately subject to a slew of controversy at OpenAI, whose board of directors tried and failed to oust him, and were quoted as saying of the matter that Sam “was not consistently candid in his communications” and they “no longer had confidence in his ability to continue leading OpenAI”.

Sam’s mentor, main financial backer, and close friend is Peter Thiel, who Sam invited to join YC as a visiting partner between 2015 and 2017. Sam apparently met his now-husband in Peter Thiel’s hot tub. Thiel is a key figure in Palantir, a data analysis company which works closely with militaries, police departments, and US Immigration and Customs Enforcement, which is currently conducting an ethnic cleansing of the United States, and retains the Israeli Defense Force as a client, which is currently conducting a genocide in Palestine. Thiel is a major donor to right-wing parties and an intellectual devotee of and financial backer of fascist political thinker [Curtis Yarvin](https://drewdevault.com/weird-guys/#yarvin).

Sam, once his own presidential bid died in the crib, donated $1M to Donald Trump’s inauguration and became an influential public backer of his pro-AI presidency. Of Trump, Sam once said “watching (Donald Trump) more carefully recently has really changed my perspective on him …. I’m not going to agree with him on everything, but i think he will be incredible for the country in many ways!” Sam’s politics also flow from the tradition of Curtis Yarvin, and he invests in and promotes efforts to bring Yarvin’s ultra-libertarian techno-monarchy post-state society into being.

The cherry on top of Sam’s story are the allegations of years of sexual abuse and rape his sister has made regarding him, which he and his family denies. The matter is currently being litigated in Missouri’s courts.

### Regarding Garry Tan ###

Finally, let’s address the current president and CEO of Y Combinator, one Garry Tan, who followed the relatively unremarkable former president of YC, Geoff Ralston, in 2023, after being a partner at Y Combinator, and their “designer-in-residence”, since 2011.

A few weeks before earning this position at Y Combinator, Garry gave a glowing review of Balaji Srinivasan’s “The Network State”, saying “I legit believe (Y Combinator) is a prototype model for what (Srinivasan) talks about when he says the Network State”. Balaji is an interesting figure – the book in question is a distillation of a talk he gave to an audience at Y Combinator in 2013 which pitches the fascist politics of Curtis Yarvin and his intellectual circle to startup founders. When people started making the connections and Srinivasan started to feel the heat, [he emailed Curtis Yarvin](https://www.businessinsider.com/venture-capitalist-balaji-srinivasan-suggested-doxxing-journalist-nyt-2021-2) about it: “If things get hot, it may be interesting to sic the Dark Enlightenment audience on a single vulnerable hostile reporter to dox them and turn them inside out with hostile reporting sent to *their* advertisers/friends/contacts.”

Srinivasan was a prominent founder of many cryptocurrency startups, and notably became the first CTO of Y Combinator-backed Coinbase, which was also funded by Garry Tan’s Initialized Capital fund – alongside Flock Safety. Garry Tan, Sam Altman, and many other people in Y Combinator’s orbit are big fans of The Network State and funnel influence and money into projects based on its ideas.

Garry is also an important figure at Palantir. He once turned Peter Thiel down when offered a $70,000 check to join the company, but later he became employee #10 anyway. Not much is known about his tenure there, but he did apparently design their logo.

When Garry Tan joined Y Combinator, Sam Altman noted his politics as important for his role there. [Altman](https://newrepublic.com/article/178675/garry-tan-tech-san-francisco): “it’s a big deal [in my opinion] that YC will have a CEO so active in local politics. I think YC can make a big difference here”. Garry is indeed a big figure in local politics in San Francisco. He’s spent as much as $400,000 on political initiatives in the bay, with causes ranging from increased police funding and opposition to education reform, regulation of self-driving cars, and [decelerationism](https://en.wikipedia.org/wiki/Degrowth). In 2024 he got in a lot of trouble when he tweeted a series of raving rants over the progressive SF board of supervisors, culminating in a tweet that read “die slow, motherfuckers”, leading to board members receiving death threats and ultimately an apology and a retraction from Garry.

Another fun one: according to Garry the New York Times is upholding “woke capital”, which, according to Garry, is the “ideology of America’s ruling class”. So, that’s nice.

Why is Hacker News like that?
----------

Hacker News is a product of Y Combinator and the people in its orbit, and they’re not great people. [The rules](https://news.ycombinator.com/newsguidelines.html) cover what to post and how, and the closest they get to addressing any kind of bigotry, hate, or bias is the following:

>
>
> Please don’t use Hacker News for political or ideological battle. It tramples curiosity.
>
>

[The purpose of a system is what it does](https://en.wikipedia.org/wiki/The_purpose_of_a_system_is_what_it_does), and the system at Hacker News amplifies right wing politics and bigotry. The moderators, the users, and the tools available to them collaborate to suppress progressive ideas and re-enforce the kinds of politics that favor Y Combinator, its people and its friends.

I have spoken with the moderators about this many, many times over many years. I have explained to Daniel Gackle how the nature of the automated moderation tools, and the flagging feature, that produces these consequences. I have suggested reforms that would improve the situation. To my knowledge, none of this feedback has ever led to any changes in how HN works or is moderated.

Hacker News is a case study in what inevitably happens to “apolitical” spaces. Politics and society are bifurcating, and Hacker News is taking the fork on the right. “Apolitical” is an excuse to favor the status quo, a resistance to change, and therefore a re-enforcement of the existing biases and power structures of society. It’s no surprise that Hacker News favors capitalism, opposes labor, and objects to questioning the privileges of its largely white, male, middle-class audience. It’s “political” and “ideological” for it to do anything else.

---

P.S. I’ve been trying to figure these people out for a long time. A book that helped me put a lot of the pieces together was “The Nerd Reich: Silicon Valley Fascism and the War on Democracy”, by Gil Durán. It’s a great read, you should check it out too!