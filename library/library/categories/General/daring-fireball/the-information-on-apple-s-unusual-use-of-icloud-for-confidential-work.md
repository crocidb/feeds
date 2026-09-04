+++
title = "The Information on Apple’s Unusual Use of iCloud for Confidential Work"
description = "Aaron “Homeboy” Tilley, reporting for The Information (paywalled without gift links, alas, but MacRumors has a summary):Whe"
date = "2026-08-03T21:45:40Z"
url = "https://www.theinformation.com/articles/apple-icloud-policy-fueled-employee-leaks-ahead-openai-suit?rc=jfy0lk"
author = "John Gruber"
text = ""
lastupdated = "2026-08-10T22:24:07.353772207Z"
seen = true
+++

Aaron “[Homeboy](https://daringfireball.net/linked/2024/03/28/apple-sues-leaker-andrew-aude)” Tilley, reporting for The Information (paywalled without gift links, alas, but [MacRumors has a summary](https://www.macrumors.com/2026/08/03/apple-icloud-sharing-ex-employees/)):

>
>
> When new employees join Apple, the company often issues them an iPhone and Mac and pays for an iCloud account with a large amount of online storage capacity. Crucially, during the onboarding process, Apple encourages new hires to use their preexisting personal Apple IDs with this iCloud account, through which their co-workers can share internal Apple documents and other files with them.
>
>
>
> There’s a practical reason for Apple’s policy. Users of iPhones can only log into a single primary Apple ID that unlocks all iCloud capabilities at a time. Apple employees who want to maintain separate work and personal Apple IDs need to carry two iPhones with them. As a result, most Apple employees opt to use their personal Apple IDs to access their iCloud accounts, former employees said.
>
>
>
> When employees leave Apple, the company revokes access to a dedicated iCloud directory for Apple work files, as well as an authentication system for logging into other internal services, such as Slack. But former employees say the company doesn’t do a thorough job during the offboarding process of looking for confidential files that have slipped through the cracks. Because those former employees typically continue to use their personal Apple IDs with their iCloud accounts, any Apple documents stored outside workplace directories remain available to them.
>
>

If you use your personal Apple ID, you get a magic “Apple Work” folder in iCloud Drive. When you leave Apple, that “Apple Work” folder disappears. But any other files or folders that were shared with you that were *outside* that magic folder are still in your iCloud Drive, because it’s still your personal iCloud account.

Another factor that plays into this, I think, but which Tilley doesn’t address, is that your Apple ID is not an email address. Your Apple ID is an account that has one or more email addresses associated with it. Let’s say your personal iCloud account has two email addresses associated with it: example@icloud.com and example@gmail.com. Then you take a job at Apple and get the address example@apple.com. When you leave Apple, you lose access to the @apple.com address. But anything shared with your Apple ID through iCloud is still shared with *you*. You still have the same Apple ID account, even though you no longer have an employee @apple.com email account. Overall, this is a humane way of dealing with digital identity. Your Apple ID account is *you*, the person, not “example@icloud.com”, one specific unique email address. And you, the person, may well have multiple email addresses — all of which can be associated with your one Apple ID account. That makes Apple IDs more nuanced and complicated than a simple mapping of one email address = one account. And it obviously makes access restrictions more complicated.

Let’s say you delete your Gmail account. Now you can’t access your old example@gmail.com email address. But your iCloud access to items shared with your Apple ID still works, even for items that were sent to your now-deleted @gmail.com address. That’s just not how “work stuff” is accessed at most companies.

Tilley’s report at The Information is presented as being potentially relevant to Apple’s trade secret lawsuit against OpenAI, but Apple, in a statement to The Information, says it is not:

>
>
> In a statement, Apple said: “This case is about OpenAI employees wrongfully taking Apple’s secret and confidential information regarding our unreleased technologies, processes, and products. Nothing in the filing relates to documents shared by, or stored in, iCloud.” The company said it doesn’t pursue legal claims against former employees who accidentally hold on to Apple documents in their personal iCloud accounts.
>
>

[ ★ ](https://daringfireball.net/linked/2026/08/03/the-information-apple-employees-icloud)