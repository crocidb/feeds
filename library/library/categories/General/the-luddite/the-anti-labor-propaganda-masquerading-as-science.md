---
title = "The Anti-Labor Propaganda Masquerading as Science"
description = ' Recently, there has been a slew of articles like this one, titled "AI chatbots were tasked to run a tech company. They built software in under 7 minutes — for less than '
date = "2023-09-01T00:00:00Z"
url = "https://theluddite.org/post/ai-research.html"
author = ""
text = ""
lastupdated = "2025-10-22T08:57:31.463361767Z"
seen = true
---

 Recently, there has been a slew of articles like [this](https://www.businessinsider.com/ai-builds-software-under-7-minutes-less-than-dollar-study-2023-9?r=US&IR=T) one, titled "AI chatbots were tasked to run a tech company. They built software in under 7 minutes — for less than $1." Here's a much-shortened version of it:

>
>
> In the recent paper, a team of researchers from Brown University and multiple Chinese universities conducted an experiment to see whether AI bots powered by a version of ChatGPT's 3.5 model could complete the software-development process without prior training.
>
>
>
> To test this, researchers created a hypothetical software-development company named ChatDev. [...] From there, researchers assigned AI bots specific roles by prompting each one with "vital details" that described the "designated task and roles, communication protocols, termination criteria, and constraints."
>
>
>
>  Once the researchers gave the AI bots their roles, each bot was allocated to its respective stages. The "CEO" and "CTO" of ChatDev, for instance, worked in the "designing" stage, and the "programmer" and "art designer" performed in the "coding" stage. [...] Researchers tasked ChatDev to "design a basic Gomoku game," an abstract strategy board game also known as "Five in a Row."
>
>
>
>  [...] After assigning ChatDev 70 tasks, the study found the AI-powered company was able to complete the full software-development process "in under seven minutes at a cost of less than one dollar," on average — all while identifying and troubleshooting "potential vulnerabilities" through its "memory" and "self-reflection" capabilities.
>
>

 The headline claims that "AI chatbots were tasked to run a tech company," but what I see is a game very loosely based on running a tech company that is specifically designed for a chatbot to be able to do. The chatbots didn't have to interact with customers or investors, file taxes, invoice clients, set up a ticketing system, maintain software uptime for existing clients, go through security and compliance audits, find new customers, pivot its sales strategy, buy liability insurance, negotiate contracts with clients, and so on — the things that a company actually does. Researchers reduced running a tech company to producing a plausible corpus of text, and then published the not-so-shocking results that the thing that is good at generating plausible text did a good job generating plausible text. This is like saying that seven-year-olds are capable of running a navy because they can play the boardgame "Battleship," a game specifically designed for children to be able to play.

 Except it didn't even do a good job. Here's a quote from the paper that the article is citing:

>
>
>  In our experiments, we effortlessly set up the sandbox environment by directly installing the required software dependencies. Subsequently, we executed the generated software using the main function. Remarkably, approximately 86.66% of the software systems executed flawlessly, showcasing the robustness and reliability of our developed software. However, a small fraction, 13.33% of the software, encountered execution failures.
>
>

 The researchers did the work of setting up the code dependencies (notice they yet again simulate away the actual complexities of doing things), and 87% of the code executed, as opposed to 13%, which apparently just didn't. This is actually very bad. Even the most incompetent tech companies with the most nightmarish tech stacks have virtually no code in their system that not only does not execute, but has never been executed, and is apparently so fundamentally flawed that no one can figure out if it ever could be executed. This is unheard of. Most code is trash, yet somehow these researchers have managed to generate a code repository that is not only worse than any I've ever seen, but is worse than I thought possible. Then, most baffling of all, after producing a viable candidate for the single worst software repository in existence, they somehow managed to interpret that as such a huge success that they think ChatGPT can replace not just the developers, but the entire damn company.

[Here's another one of these articles](https://www.sciencealert.com/ai-can-already-design-better-cities-than-humans-study-shows), titled "AI Can Already Design Better Cities Than Humans, Study Shows:"

>
>
> Imagine living in a cool, green city flush with parks and threaded with footpaths, bike lanes, and buses, which ferry people to shops, schools, and service centers in a matter of minutes. [...] They developed an AI system to tackle the most tedious, computational tasks of urban planning – and found it produces urban plans that outperform human designs by about 50 percent on three metrics: access to services and green spaces, and traffic levels.
>
>

 It turns out that if you reduce the entirety of urban planning to optimizing a couple of metrics, a task computers are famously good at, then computers are good at it.

 Here's yet [another one](https://scitechdaily.com/new-study-ai-chatbots-surpass-the-average-human-in-creativity/), "New Study: AI Chatbots Surpass the Average Human in Creativity."

>
>
> It is commonly assessed with the Alternate Uses Task (AUT), in which participants are asked to come up with as many alternative uses for an everyday object as possible within a short time period. The responses are scored for four different categories: fluency, flexibility, originality, and elaboration.
>
>
>
> Mika Koivisto and Simone Grassini compared 256 human participants’ responses with those of three AI chatbots’ (ChatGPT3, ChatGPT4, and Copy.Ai) to AUTs for four objects — a rope, a box, a pencil, and a candle. The authors assessed the originality of the responses by rating them on semantic distance (how closely related the response was to the object’s original use) and creativity.
>
>
>
> A computational method was used to quantify semantic distance on a scale from 0 to 2, whilst human evaluators, blind to the originators of the responses, subjectively rated creativity from 1 to 5. On average, the chatbot-generated responses scored significantly higher than the human responses for both semantic distance (0.95 vs. 0.91) and creativity (2.91 vs. 2.47)
>
>
>
> The human responses had a far greater range in both measures — the minimum scores were much lower than for the AI responses, but the maximum scores were generally higher. The best human response outperformed each chatbot’s best response in seven out of eight scoring categories.
>
>

 It's "Battleship" again. Researchers designed a game, the results of which produce a metric that perhaps vaguely mimics some facet of creativity, and computers did a pretty good job at the game. This gets interperted as "AI Chatbots Surpass the Average Human in Creativity."

 There are tons of these so-called "studies." We'll stop at [one more](https://www.axios.com/2023/08/29/chatgpt-medical-diagnosis-study). This one is titled "ChatGPT plays doctor with 72% success," from Mass General Brigham, which is, as far as I can tell, a respectable medical institution.

 Here is the methodology, quoted from the actual paper that this article is summarizing:

>
>
> Clinical vignettes were selected from the Merck Sharpe & Dohme (MSD) Clinical Manual, also referred to as the MSD Manual [21]. These vignettes represent canonical cases that commonly present in health care settings and include components analogous to clinical encounter documentation such as the history of present illness (HPI), review of systems (ROS), physical exam (PE), and laboratory test results. The web-based vignette modules include sequential “select all that apply”–type questions to simulate differential diagnosis, diagnostic workup, and clinical management decisions. They are written by independent experts in the field and undergo a peer review process before being published. At the time of the study, 36 vignette modules were available on the web, and 34 of the 36 were available on the web as of ChatGPT’s September 2021 training data cutoff date. All 36 modules passed the eligibility criteria of having a primarily textual basis and were included in the ChatGPT model assessment.
>
>

 First, note that 34 of these vignettes were available on the web when ChatGPT was trained, meaning that ChatGPT might already contain these exact texts and their solutions in its corpus. We have no way of knowing whether or not this is true, because the now-ironically named OpenAI has decided [that their technology is too powerful to release open source](https://theluddite.org/#!post/effective-altruism).

 That caveat aside, we again find that researchers reduced the entirety of a very complex human task into generating some text, and then gleefully reported the chatbot's success at generating text. That in itself would be an uninteresting finding worthy of derision, but once again, any reasonable interpretation of the results shows that it actually did a terrible job.

 Much like the 87% of code that "executed flawlessly," 72% does not seem like a score worth celebrating when you consider the failure mode. It's not that 28% of the time, ChatGPT realizes that it does not know and consults a trusted colleague, as a human might do. It’ll always confidently say something, but when it is wrong, it is just spouting bullshit, not because it doesn't know, but because [it has no concept of knowing at all](https://theluddite.org/#!post/supradiegetic). You should be terrified of any doctor that cannot distinguish between when they know something and when they don't, just says bullshit more than a quarter of the time, and is incapable of collaborating with other doctors.

 Knowing that, consider their conclusion:

>
>
>  To allow ChatGPT or comparable AI models to be deployed in hospitals, Succi said that more benchmark research and regulatory guidance is needed, and diagnostic success rates need to rise to between 80% and 90%.
>
>

 This conclusion is obviously stupid, but it is also the key to understanding how all these smart researchers end up conducting these "studies."

 ChatGPT can generate plausible text. Because so many jobs involve humans speaking to each other, capitalists are drooling at the opportunity to save on all the labor costs that go into generating all this text. What they don't understand is that many human jobs involve producing language because those jobs involve human collaboration, and language is how we communicate. ChatGPT is incapable of collaborating because it doesn't actually know or care about anything. It is, therefore, with much irony, poorly suited to do the very thing that would makes it useful for capitalists. It cannot produce all the text that human laborers produce because that text is the byproduct and result of human collaboration, not modular, manufactured widgets. You can't automate the communication in human relationships.

 This results in a tension. On the one hand, we have created a technology that is, on its face, useful and impressive, but on the other hand, it's not useful to capital. In other words, it's not useful in a specific, circumscribed way; it can't actually automate tasks currently done by humans to reduce labor costs, though that won't stop them from trying. Its primary utility comes in a form capitalism cannot understand — it's fun. The single biggest use case of ChatGPT is as a toy.

 Everyone is having fun playing with it, but our [joy is an insufficient justification](https://theluddite.org/#!post/joyless-technology) for technology. Presented with this obviously useful technology whose primary utility cannot be measured as a cost-saving metric, researchers set off to measure it anyway, resulting in the obvious absurdities documented here. Because they *know* that LLMs are useful from their experience playing with them, and they know that useful technologies necessarily reduce labor costs by definition, they do not see the flaws in their studies, which all do the exact same thing: They reduce a human task into an oversimplified game that, at its core, involves producing some plausible-looking text, only to conclude that LLMs can, in fact, generate some plausible text. They have committed one of science's cardinal sins: They designed an experiment specifically to validate their preexisting belief.

 The pandemic showed us that undermining the public's trust in science can cost human lives, but the harm here goes further. These so-called studies are purposefully, almost explicitly designed to reach the result that workers are dispensable. Even when they obviously demonstrate exactly the opposite, the researchers and the media still dutifully report that we workers are replaceable, because AI is coming for our jobs. It is, whether consciously or not, capitalist propaganda that exists to discipline labor, to convince us that we should be grateful for what we have, and to force us to think twice before demanding more.

 I urge everyone reading this not to ignore these studies, but to be actively insulted by them. They are taking us for fools. Companies are actively trying to figure out how to use generative AI, and the results [would be hilarious](https://futurism.com/msn-ai-brandon-hunter-useless) were it not so dangerous. One of the studies discussed herein seriously considered replacing the labor of *doctors* with LLMs, even though their own ~~propaganda~~ research shows that it's a stupid idea, though they chose not to interpret it as such. Scientists should not lend any legitimacy to such obviously dangerous proposals, because the shareholders who own hospitals do not care whether you and I live or die if it saves them money.

---

 *Thanks for reading! If you liked it, consider [subscribing](https://theluddite.org/subscribe.html) or leaving a tip: [BuyMeACoffee.com](https://buymeacoffee.com/theluddite), [Stripe](https://buy.stripe.com/00g5le0GY2cEaooeUU), [all options](/support.html).*