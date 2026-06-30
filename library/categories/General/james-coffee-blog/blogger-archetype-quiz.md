+++
title = "Blogger Archetype Quiz"
description = "Have you ever wondered how best to summarise your character as a member of the blogging community? If so, this quiz is for you! Answer the following questions to find out which blogger archetype best suits you. Question 1 When you are spending time outdoors, what do you like to d"
date = "2026-06-20T00:00:00Z"
url = "https://jamesg.blog/blogger-archetypes"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-06-29T12:19:24.841153045Z"
seen = false
+++

Have you ever wondered how best to summarise your character as a member of the blogging community? If so, this quiz is for you!

Answer the following questions to find out which blogger archetype best suits you.

 fieldset { margin-bottom: 1rem; border: 0.1rem solid var(--primary-color); padding-bottom: 1rem; } button { width: 100%; padding: 1rem; } label { margin-bottom: 0.5rem; display: grid; grid-template-columns: 3ch auto; align-items: start; font-size: 1.075rem; } label, legend { color: var(--foreground-color); } input { height: 1.075rem; } fieldset \* { line-height: 1.5; } #main br { margin-bottom: 0.5rem; } legend { background-color: light-dark(initial, var(--dark-code-color)); border: 0.1rem solid var(--border-color); padding: 0.25rem; color: light-dark(black, var(--foreground-color)); } fieldset ul { list-style: none; padding: 0; } .answer { border: 0.1rem solid var(--border-color); padding: 1rem; margin-top: 1rem; } .answer h2 { margin-top: 0; } @media (max-width: 768px) { label { margin-bottom: 1rem; } } Question 1

When you are spending time outdoors, what do you like to do best?

 Watch the world go by.  Stay busy with activities and friends.  Take a book and read.  Go to something new (art exhibit, concert, cafe, etc.).  Mentally organise my week. Question 2

What do you do when you are in search of an idea to write about?

 Search the web for inspiration.  Reach out to friends.  Start writing and see what ideas come.  Take some time to rest.  Go outdoors and explore.  Hop into a community and say hello.  Check my bookmarks for topics I have been reading about.  Check my notes or drafts.  Think about what has been on my mind lately.  I prefer to write when I feel inspired. Question 3

What do you do first when you find a new blog you like?

 Follow the blog in your web reader.  See what other posts the author has written.  Start writing a blog post about something you read about that has inspired you.  Email the author to say how much you like their website. Question 4

Suppose you have 20 open tabs that have been sitting for a few days. What do you do with them?

 Leave them open, ready to inspire me when I need them.  Put them all in folders so I can find them all later.  Look through them and share some links on your website.  Declare "Tab Zero" and close them all :) Question 5

Do you do any of the following?

 Write in guestbooks.  Email bloggers whose writing you enjoy.  Chat with bloggers on calls or IRL.  Participate in communities (i.e. IndieWeb, Bubbles, Bear Blog).  Write about blogging. Question 6

What do you like to do when you find a cool link?

 Write about the web page you found, or otherwise share it on your website.  Share the page directly with a friend.  Share the page in a community. Question 7

Have people written responses to your blog posts before?

 Yes, one of my posts has inspired at least one person to write a blog post.  Yes, one of my posts has inspired a thoughtful discussion with someone privately or in a community.  Not yet, but I love to respond to others' blog posts.  Not yet, but maybe some day! Question 8

What is your dream evening?

 Spending time alone, reading a book and relaxing.  Organising my living space.  Watching new movies and old favourites.  Writing my next blog post.  Adding a new page to my website.  Spending the evening with friends. Question 9

Complete the sentence. My friends would say I am the one who…

 Daydreams.  Gets us all together.  Makes plans.  Recommends new things to do.  Helps us stay in tune. Question 10

Complete the sentence. I like to post:

 Links to or comments on web pages I have enjoyed reading.  My own thoughts about the world.  Reflections on indie web culture.  Everything that’s on my mind!  I don’t really post, but love reading what others write.  I prefer to curate what I have read.

Submit

 var scores = {}; var answers = { "Explorer": "To you, the web feels like a library that's open all hours and has everything you could ever imagine! You love reading others blogs, and know how important readers are to the whole of the indie web community!", "Community gardener": "You love to help contribute to building the blogging community, either through your writing or how you share the spirit of writing on the web with friends.", "Culture maker": "You love to help push the blogging community forward by starting discussions, encouraging thought, and sharing what's on your mind.", "Link curator": "The web is not just its pages, but the connections between pages. You have internalised this and love spending your time exploring the web and sharing what you find with the world.", "Author": "You love writing and have a growing backlog of posts on your website! Words are your best friend and you're always thinking about what to write next.", }; var values = { "q1a1": ["Explorer"], "q1a2": ["Culture maker", "Community gardener"], "q1a3": ["Link curator", "Author"], "q1a4": ["Culture maker"], "q2a1": ["Explorer"], "q2a2": ["Culture maker"], "q2a3": ["Author"], "q2a4": ["Explorer"], "q2a5": ["Community gardener"], "q2a6": ["Community gardener"], "q2a7": ["Community gardener"], "q2a8": ["Author"], "q2a9": ["Author"], "q2a10": ["Author"], "q3a1": ["Community gardener"], "q3a2": ["Explorer"], "q3a3": ["Author"], "q3a4": ["Community gardener"], "q4a1": ["Explorer", "Author"], "q4a2": ["Link curator"], "q4a3": ["Link curator"], "q4a4": ["Community gardener", "Culture maker"], "q5a1": ["Community gardener"], "q5a2": ["Culture maker"], "q5a3": ["Community gardener"], "q5a4": ["Community gardener"], "q5a5": ["Author"], "q6a1": ["Author"], "q6a2": ["Community gardener"], "q6a3": ["Culture maker"], "q7a1": ["Culture maker"], "q7a2": ["Culture maker"], "q7a3": ["Author"], "q8a1": ["Explorer", "Author"], "q8a2": ["Link curator"], "q8a3": ["Culture maker"], "q8a4": ["Author"], "q8a5": ["Culture maker", "Author"], "q8a5": ["Community gardener"], "q9a1": ["Author"], "q9a2": ["Community gardener"], "q9a3": ["Community gardener", "Link curator"], "q9a4": ["Culture maker"], "q9a5": ["Culture maker"], "q10a1": ["Link curator"], "q10a2": ["Author"], "q10a3": ["Culture maker"], "q10a4": ["Author"], "q10a5": ["Explorer"], }; // count numbers of eeach elemnt var counts = {}; for (var key in values) { for (var element in values[key]) { if (!counts[values[key][element]]) { counts[values[key][element]] = 0; } counts[values[key][element]] += 1; } } function showResponse (element, description, secondElement, secondDescription) { // delete answer if exists var answer = document.querySelector("#answer"); if (answer) { answer.remove(); } var others = ""; for (const [key, value] of Object.entries(answers)) { if (key != element &amp;&amp; key != secondElement) { others += `\<p\>\<b\>${key}:\</b\> ${value}`; } } var response = ` \<section class="answer" id="answer"\> \<h2\>You are a ${element}\</h2\> ${description} \<h3\>You are also a ${secondElement}\</h3\> ${secondDescription} \<hr\> \<h3\>Other archetypes\</h3\> ${others} \<hr\> \<p\>Did you have fun filling out the quiz? \<a href="?answers=${element},${secondElement}"\>Share your results with friends!\</a\>\</p\> \<p\>Want to take the quiz again? \<a href="/blogger-archetypes"\>Reset the quiz\</a\>.\</p\> \</section\>`; var submitButton = document.querySelector("button"); submitButton.insertAdjacentHTML("afterend", response); } function submit() { var questions = document.querySelectorAll("input"); var checked = false; for (var i = 0; i \< questions.length; i++) { if (questions[i].checked) { checked = true; var name = questions[i].name; var value = questions[i].id; for (var element in values[value]) { var tag = values[value][element]; if (!scores[tag]) { scores[tag] = 0; } // if count \< 7, add \*2 score var score = 1; if (counts[tag] \< 10) { score \*= 2 } scores[values[value][element]] += score; } } } if (!checked) { alert("You need to answer the questions to get your result."); return; } var max = 0; var element = ""; for (var key in scores) { if (scores[key] \> max) { max = scores[key]; element = key; } } // get 2nd max var secondMax = 0; var secondElement = ""; for (var key in scores) { if (scores[key] \> secondMax &amp;&amp; key != element) { secondMax = scores[key]; secondElement = key; } } if (answers[element]) { var description = `\<p\>` + answers[element] + `\</p\>`; } else { var description = ""; } if (answers[secondElement] &amp;&amp; answers[secondElement] != answers[element]) { var secondDescription = `\<p\>` + answers[secondElement] + `\</p\>`; } else { var secondDescription = ""; } showResponse(element, description, secondElement, secondDescription); } document.addEventListener("DOMContentLoaded", function () { let params = new URLSearchParams(document.location.search); let paramAnswers = params.get("answers", ",").split(","); // a,p if (paramAnswers &amp;&amp; paramAnswers.length \> 1) { showResponse(paramAnswers[0], "\<p\>" + answers[paramAnswers[0]] + "\</p\>", paramAnswers[1], "\<p\>" + answers[paramAnswers[1]] + "\</p\>"); document.getElementById("answer").focus(); document.getElementById("answer").scrollIntoView(); } });

License
----------

The quiz code is hereby licensed in the public domain, so you can use the code for your own projects freely. I encourage you to use the code to make your own quizzes!