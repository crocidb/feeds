+++
title = "Email, Getting Work Done, and Corporations, Or: Outlook Considered Harmful"
description = "It’s hard to overstate how important email is in our modern world. Even as hip new platforms like Slack &co. gain traction in the workplace, so much communication takes place in a crusty old medium that’s outlived every purported “email killer”. Where does it get its staying powe"
date = "2022-08-28T00:00:00Z"
url = "https://lambdaland.org/posts/2022-08-28_keep_email_federated/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.275969950Z"
seen = false
+++

It’s hard to overstate how important email is in our modern world. Even as hip new platforms like Slack &co. gain traction in the workplace, so much communication takes place in a crusty old medium that’s outlived every purported “email killer”. Where does it get its staying power from?

Email [predates](https://en.wikipedia.org/wiki/History_of_email) much of the Internet as we know it today. Its current incarnation first emerged in the early 80s, though it has roots in earlier forms of digital messaging from as far back as the 60s. “Email” is roughly three related protocols: [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol), “Simple Mail Transfer Protocol”, which deals with the *sending* of mail; [IMAP](https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol), or “Internet Message Access Protocol”, which allows mail clients to fetch mail; and [POP3](https://en.wikipedia.org/wiki/Post_Office_Protocol), or “Post Office Protocol”, an older mail fetching protocol largely superseded by IMAP.

One neat thing about email is that you don’t have to use a particular *email client* to send and receive messages: it doesn’t matter if you use Gmail’s web interface, their mobile app, or Thunderbird, or Apple’s built-in email program, or even text-based mail clients like [mutt](https://en.wikipedia.org/wiki/Mutt_(email_client))—everyone can still talk to each other.

Moreover, different email clients have different strengths: Gmail, for instance, is so simple that your grandma can (and probably does) use it to send you pictures or reminders about the family reunion next weekend. Academics, who typically have to deal with [overwhelming heaps of emails](https://parentheticallyspeaking.org/articles/bandit-inbox/), can use keyboard-driven mail clients to digest all these messages. (See [Nicolas P. Rougier’s mu4e-dashboard package](https://github.com/rougier/mu4e-dashboard) for an example of what some academics do.)

**The point**: email derives its staying power from how the *common platform* (SMTP, IMAP) is decoupled from *how one interacts with it*. (mail clients) It is malleable and ubiquitous, and everyone can adapt it for their needs.

Outlook is faux email
----------

I’m starting a new position as a research assistant at the University of Utah, and I’m elated to be here. However, the university is pushing everyone to use their MS Outlook email system, and they’ve disabled SMTP and IMAP access. The mail client that I use ([mu4e](https://www.djcbsoftware.nl/code/mu/mu4e/Why-another-e_002dmail-client.html) for those wondering) is built to work with these *common*, *decades-old* standards of IMAP and SMTP. I can’t use the built-in OS’s mail client or (heaven forbid) the web client nearly as effectively.

I’ll be trying some work-arounds, but I’m not optimistic that anything will be resolved in the near future. So for now I’m stuck using the mail client provided by my operating system for work-related email. It’s really a shame because some brilliant Emacs users have made managing email pleasant and effective.

Why would the university block the tools that I need to do my job effectively? I have a theory on that.

The theory of two companies
----------

This also goes by the name “[staff and line](https://en.wikipedia.org/wiki/Staff_and_line)”.

Inside every organization there are two smaller companies: company 1 and company 2.

Company 1 is concerned with the *product* of the organization. In a tech firm for instance, company 1 is usually made up of engineering, product, sales, and marketing. (Broadly speaking.) In a university, company 1 is the faculty who are there to teach and do research.

Company 2 is concerned with running the organization. In a tech firm, this includes IT, HR, middle management, etc. In a university, company 2 is comprised of the staff and administration.

The primary job of company 2 is to support company 1’s operations. However, as is the nature with any large system, company 2 often begins to put some of its priorities over those of company 1’s. I saw this happen in a tech company I left a few years ago when management mandated that developers track the time they spent on each ticket in our ~~scrum~~ waterfall system *down to the minute*. This wasn’t a move that helped the developers in any way—this was just for management to feel like they had some better control of the situation.

Likewise with university email: no one I know would elect to use Outlook as their email platform. It seems the university administration has deemed it better to force everyone into a closed system to avoid the potential of lawsuits. It helps the university as an organization, but it gets in the way of the faculty’s work.

I get nervous when company 2 starts putting its priorities over company 1’s. To some extent it’s necessary, but it can be a slippery slope into bureaucratic paralyzation.