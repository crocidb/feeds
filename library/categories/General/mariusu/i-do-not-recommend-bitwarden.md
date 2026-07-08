+++
title = "I Do Not Recommend Bitwarden"
description = 'A review of my experience with \_Bitwarden\_ after several years of self-hosting it, and why I decided to move away from the password manager.'
date = "2026-05-02T01:45:55Z"
url = "https://xn--gckvb8fzb.com/i-do-not-recommend-bitwarden/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-05-05T08:24:58.558038738Z"
seen = false
+++

Almost four years ago I published a guide on how to [*run your own LastPass on hardened OpenBSD*](/run-your-own-lastpass-on-hardened-openbsd/), in which I explained how to set up an OpenBSD instance, either as a cloud instance or as a *Raspberry Pi* bare metal installation, that would host [*Vaultwarden*](https://github.com/dani-garcia/vaultwarden) as a backend for the [*Bitwarden*](https://bitwarden.com) client applications. After having used a similar approach for myself for several years now, I came to the conclusion that I do not recommend the use of *Bitwarden* any longer. Let me explain.

*Freemium* dual-license password manager
----------

[Wikipedia](https://en.wikipedia.org/wiki/Bitwarden) describes *Bitwarden* as \_a freemium open-source password management service that is used to store sensitive information […] *owned and developed by *Bitwarden*, Inc.*, and that is now almost ten years old. The company behind the software is not only developing the *Bitwarden server*, as well as client applications for most platforms, but it is also offering a *SaaS* product for users who don’t want to put up with hosting this *unwieldy beast* on their own. More on this in just a moment.

*Bitwarden*’s pricing for their hosted offering is similar to their competitors' offerings, albeit with differences in terms of functionality. Regardless of whether one picks their hosted offering or decides to self-host, however, the client applications remain the same.

Since 2022, *Bitwarden* is also [backed by $100M of *PSG* growth equity](https://psgequity.com/news/bitwarden-announces-100-million-growth-investment-led-by-psg), joined by *Battery Ventures*. A password manager that wants to remain open-source is one thing, but the same password manager with an investor on its board that needs to see a return on $100M is another. Without wanting to sound overly cynical, this is usually the point in time in which [the rent-seeking begins](https://www.youtube.com/watch?v=4EmstuO0Em8) and the product slowly shifts from serving its users to serving its investors.

Unwieldy beast
----------

If you decide to self-host *Bitwarden*, however, you will relatively quickly find yourself in what I would describe as *enterprise software hell*. The standard *Bitwarden server* deployment is a heavy-weight C# backend that ships with *MSSQL Express* and won’t work with more *Linux-native* databases like *PostgreSQL* or *MariaDB*. Depending on the size of the deployment and the requirements with regard to high availability, you might want to utilize Kubernetes, which in turn adds additional overhead and complexity.

Because of this, many smaller to medium-sized deployments prefer to look into [*Vaultwarden*](https://github.com/dani-garcia/vaultwarden) instead, which is an *unofficial Bitwarden-compatible server written in Rust™*. The simple and lightweight nature of *Vaultwarden* compared to the official *Bitwarden server* makes such a big difference for administrators that the unofficial server project has seemingly three times the *stargazers* on GitHub as compared to *Bitwarden*’s official implementation. This should make you think, especially as a *series B*-funded company with $100M, whether your (technical) users appreciate the current direction your software stack is heading towards, or whether you might want to look into bringing the people that built a vastly more successful backend implementation on-board to optimize and accelerate your official stack.

And surely that’s what *Bitwarden* decided to do, right?

Bitwarden lite
----------

Sadly, however, it seems that *Bitwarden*’s [*NIH syndrome*](https://en.wikipedia.org/wiki/Not_invented_here) was too strong to simply *take over* *Vaultwarden* as an official project. Instead, the company seemingly hired the main developer of the *Vaultwarden* project and decided to publish a *“lighter”* version of their existing backend dubbed *Bitwarden ~~unified~~ lite*, which is still a service built on *Microsoft*’s *.NET*, and which still appears to require more than three times the RAM a *Vaultwarden* instance usually consumes.

Regarding the *open-source* part of *Bitwarden*, things have been getting murkier over the past year or so. In late 2024, users started [noticing](https://github.com/dani-garcia/vaultwarden/discussions/5115) that a new dependency, `@bitwarden/sdk-internal`, had been pulled into the clients. Its license read:

>
>
> You may not use this SDK to develop applications for use with software other than Bitwarden (including non-compatible implementations of Bitwarden) or to develop another SDK.
>
>

For a product that prides itself on being open-source, this is a fairly significant *plot twist*. After [considerable backlash](https://www.phoronix.com/news/Bitwarden-Open-Source-Concerns) in the community, however, *Bitwarden* [called it a *“packaging bug”*](https://www.theregister.com/2024/11/04/bitwarden_gpls_password_manager/) and eventually [relicensed the SDK under GPLv3](https://news.ycombinator.com/item?id=41940580). Technically, the issue is resolved. Philosophically, however, this episode tells you all you need to know about where *Bitwarden* is heading: [The freeware parts are bait](https://isitreallyfoss.com/projects/bitwarden/), the actual product is the SaaS subscription, and the community is there to contribute issues and translations as long as it doesn’t cost the company anything.

The real culprit
----------

Setting aside the backend, however, the real culprit with regard to *Bitwarden* are the client applications. Advertised functions do not work as expected, basic features are non-existent (after ten years!) and the user interface is poor to put it mildly, especially when compared to equally priced alternatives. And don’t get me wrong, if *Bitwarden* was purely a FOSS-effort and not funded by venture capital all these flaws could be brushed aside because, after all, it would be a community effort. However, *Bitwarden* isn’t a *community effort*, which is reflected very noticeably in the bureaucratic processes they drowned the community in, but more on this in a moment.

### Migrating vaults ###

About a year ago, I supported someone who tried to switch from a competitor to *Bitwarden* under the thought of rather supporting open-source software with a yearly subscription than some proprietary platform that one has no insights into. Part of the migration was naturally importing existing vaults from the previous password manager into the new *Bitwarden* account. As can be seen in [my bug report on GitHub](https://github.com/bitwarden/clients/issues/14971), however, this went sideways very quickly, and resulted in at least one vault requiring significant technical workarounds for the import to work.

The response from what sounded like an official *Bitwarden* employee left me frankly stunned. Despite the migration/import feature being advertised in multiple places throughout *Bitwarden*’s marketing materials and documentation, and despite dozens of users having already complained about the exact same issue, *Bitwarden* simply decided to ignore the issue report and instead requested opening another likely dead-ended discussion in their community forum.

This level of *corporate bureaucracy* is not at all what open-source software should look and feel like, and it is definitely completely unjustified for a feature that is being advertised on both the open-source software, as well as the paid product, but that simply does not work as advertised.

Similarly, many other issues are funneled through this process of *community discussions*, which more often than not turn out as not much more than lengthy threads of pointless back-and-forth, and almost never materialize in actual implementations.

**Note:** The same import was tested with proprietary alternatives to *Bitwarden* and worked flawlessly.

### Moving items between vaults ###

Migration pain is not limited to the initial import. Even when you’re already *inside* *Bitwarden* and simply want to shuffle entries between an *organization* vault and your *individual* vault, or the other way around, there is, to this day, no proper *“move the selected items to …”* feature. For a handful of logins you can clone/edit each one manually, but anyone who has ever tried this with a few hundred items (say, after cleaning up a *collection*, leaving a company, or consolidating several *organizations*) knows that this quickly becomes a *carpal tunnel*-inducing exercise.

The *official* workaround that *Bitwarden* support and [community threads](https://community.bitwarden.com/t/move-500-logins-from-organization-to-my-individual-vault/53037/4) recommend is to export the source vault as **unencrypted JSON**, edit the file, and then re-import it into the destination vault. Setting aside the obvious security footgun of having 500+ credentials sitting in plain text in `~/Downloads`, or worse, a directory that’s silently synced to the cloud (think *Dropbox*, *OneDrive*, *iCloud*, …) while you figure out where to put them, the process happily loses a non-trivial amount of data along the way:

>
>
> […] if there are file attachments in any of your vault items, then these will not be included in the export […] the export will not include items in the *Trash*, or any password histories or timestamps.
>
>

For any *organization* that relies on attachments (e.g. SSH key files, licence keys, recovery codes as images) or on password history for compliance/audit reasons, this is plainly unacceptable. For a product whose entire job is to be the source of truth for your credentials, the complete absence of a *“move these 500 items to that vault, keep everything intact, click OK”* button in year ten of its existence speaks volumes about where *Bitwarden*’s engineering priorities lie.

### Client updates breaking things ###

Another example concerns client updates. It appears that *Bitwarden* pushes new updates to their clients that can lead to vaults becoming inaccessible (on the client side) at random, without any heads-up to the users. I personally encountered this issue while travelling.

When I had my [phone](/phone/) plugged-in overnight, *F-Droid* decided it’s a good time to update a few apps, one of which was *Bitwarden*. The next morning I had to log into my banking and when I opened the *Bitwarden* app on my phone I was unable to access my vault. It took some time to [figure out what was going on](https://github.com/bitwarden/android/issues/6363) ([via *Vaultwarden*](https://github.com/dani-garcia/vaultwarden/discussions/6757)), and I was lucky that I had my [UPDC](/computer/#h4nk4-m) (which hosts my *Bitwarden* backend) with me, as otherwise I could have ended up in a pretty bad situation with my whole vault being unavailable.

The sheer irresponsibility with which *Bitwarden* appears to push what looks like breaking protocol changes between the clients and the backend is frightening. As someone who relies heavily on my password manager to work in offline mode, this experience taught me that *Bitwarden* cannot be trusted. From that moment on, I disabled automatic updates for the *Bitwarden* clients and exported a current snapshot of all passwords to a local *backup* in [*KeePassChi*](https://codeberg.org/keepasschi/ChiPass)/[*KeePassXC*](https://keepassxc.org)/[*KeePassDX*](https://www.keepassdx.com).

This is, by the way, not a *Vaultwarden*-specific issue, despite *Bitwarden* staff claiming so. Searches through the `bitwarden/android` repository return a long list of very similar reports, for example around the [*2025.12.x* release introducing regressions](https://github.com/bitwarden/android/issues/6376) that prompted users for the master password twice after login and then crashed the app, or the [*2025.6.0* release that simply crashed](https://github.com/bitwarden/android/issues/5442) on startup for many users. The *Android* app in particular went through a full rewrite from *.NET MAUI* to native *Kotlin* in 2024, [which shipped](https://github.com/bitwarden/android/releases/tag/v2024.10.1) alongside a trail of regressions that continue to show up in quarterly releases.

### User experience ###

Aside from the aforementioned technical details, *Bitwarden* is (and has always been) one of the subjectively worst applications on my phones and my desktop in terms of user interface. The UI/UX is in fact so horrible, that even after years of use I still dread opening the *ungoogled-chromium* extension, let alone any of the desktop and mobile apps.

Aside from the fact that building the *Electron*-based desktop app from source is a huge PITA and that the pre-built *Flatpaks* are [not working properly on Wayland](https://github.com/bitwarden/clients/issues/13431), one more general, major issue that I’m experiencing with the *Bitwarden* client applications (and extensions) is the fact that while they clearly support offline use, they’re not intentionally built for it. Hence, whenever I open the mobile app or the browser extension, there’s a noticeable delay that sometimes takes literal seconds or even minutes, in which the client application seemingly tries to reach the backend, which often isn’t around (because I’m not hosting my *Bitwarden* backend on the open internet). While this sounds like a nitpick, it truly slows down things whenever one has to unlock *Bitwarden* (which is almost always, as I do not trust especially the browser extension to remain unlocked all the time). Sadly, there seems to be no way to turn off syncing when unlocking the vault to prevent the clients from waiting unnecessarily.

Another example of a bad user experience is the logins overview (titled *Vault*). Whenever I am on a website (in my desktop browser) and I would like *Bitwarden* to fill the login form, I tend to click the extension’s icon in the toolbar and then click the entry in the list. This has been how all other password manager UIs that I have used in the past have worked; Not *Bitwarden*, though. There, you need to click the small *Fill* button on the right side of the list item. If you click the big list item itself, which is highlighted on mouse-over, you simply open that item to show its details. Instead of allowing the user to click the big UI element (which is the whole list item), *Bitwarden* forces them to click a significantly smaller, harder to hit UI element (a button on top of a clickable list item). As with the syncing feature, there’s also no way to *flip* this behavior, so that clicking the list item would fill in the form, while clicking the tiny button would open the item’s details page.

I’m apparently not alone in this sentiment. A quick glance at recurring *Hacker News* threads on the topic reveals that users have been complaining about pretty much every single one of these issues, ranging from the [desktop app not focusing correctly when opened](https://news.ycombinator.com/item?id=37641367), to *“loading for [over 5 minutes](https://discuss.privacyguides.net/t/unhappy-with-bitwarden-should-i-switch-to-another-password-manager-and-which-option-is-viable/26400) before showing my passwords”*, to the [browser extension asking to save passwords that are already there](https://news.ycombinator.com/item?id=37641367), to broken biometric login on iOS, laggy mobile apps, and, of course, the famous *“Log-In suggestions not showing”*.

Feature requests that have been sitting in the community forum since *2021* (such as a simple edit history for entries) remain untouched, which is a pattern that *MSP* resellers also [called out publicly](https://community.bitwarden.com/t/complaints-about-bitwarden-development/88152) as *“glacial feature development”*.

#### CLI ####

Speaking about lists, the *Bitwarden* CLI has an equally bad user interface. For example, the [`list` command of the `bw` tool](https://bitwarden.com/help/cli/#list) will unexpectedly output every detail of every item, including passwords and TOTP codes, without the need for an additional e.g. `--show-credentials` flag. There’s no way that reasonable engineers looked at this and said *“Yep, that’s how we do things, because we cannot imagine a single situation in which anyone might mistakenly pipe `bw list` to some place and unintentionally expose all their credentials”*.

Also, can we take a step back and talk about the fact that the *Bitwarden* CLI is a terminal tool built in *TypeScript*? Not only because it requires a metric ton of runtime and dependencies, but also because *JavaScript* isn’t exactly the stack anymore that you’d run carefree on your continuous integration environments. *“Why?”*, you ask? *Hold my beer…*

Security track record
----------

A password manager has, essentially, *one job*: Keeping the user safe, by keeping their credentials safe. For a product that has been around since *2016*, *Bitwarden* has accumulated a surprisingly long list of incidents in which it at least partially failed at exactly that task. And no, I’m not talking about *theoretical* vulnerabilities, I’m talking about things that *actually* shipped to production.

### 2023: KDF ###

In January 2023, shortly after the *LastPass* breach had the entire industry questioning the real-world strength of cloud-hosted password vaults, security researcher *Wladimir Palant* [published an analysis](https://palant.info/2023/01/23/bitwarden-design-flaw-server-side-iterations/) showing that *Bitwarden*’s advertised *200,001* PBKDF2 iterations were, in practice, closer to *100,000*. The reason was that the additional server-side iterations were only applied to the master password hash used for *login*, but not to the encryption key protecting the vault data. An attacker with access to a leaked vault could therefore bypass the server entirely and was left with the same effective security as with *LastPass*.

Additionally, the default client-side iteration count was still at *100,000*, below OWASP recommendations at the time, and a concern that had been [raised as far back as 2020](https://github.com/bitwarden/server/issues/589). *Bitwarden* eventually raised the default to *600,000* and added *Argon2* support, but (mirroring *LastPass*’ earlier mistakes) the change initially applied only to new accounts, leaving existing users responsible for manually updating their own KDF settings.

### 2023: Windows Hello bypass ###

Still in 2023, *RedTeam Pentesting* disclosed [*“Bitwarden Heist”*](https://blog.redteam-pentesting.de/2024/bitwarden-heist/) ([CVE-2023-27706](https://nvd.nist.gov/vuln/detail/CVE-2023-27706)), a vulnerability in the Windows desktop client that allowed attackers with domain-administrator access to extract the vault decryption key from the local *DPAPI* storage without ever prompting *Windows Hello* or the master password. In the words of the researchers:

>
>
> Any process running as the low-privileged user session can simply ask DPAPI for the credentials to unlock the vault, no questions asked.
>
>

The fix eventually shipped in version *2023.4.0*, months after initial disclosure.

### 2023: Cross-origin autofill ###

Also in 2023, [*CVE-2023-27974*](https://nvd.nist.gov/vuln/detail/CVE-2023-27974) was disclosed. The vulnerability was about the *Bitwarden* browser extension, which happily offered to fill credentials into *cross-domain iframes* embedded on trusted pages, as long as the base domain matched. Meaning, if `trusted.com` embedded an iframe from `attacker.trusted.com` (e.g. on a subdomain controlled by a third party), credentials could be stolen. *Bitwarden*’s response was that iframes *“must be handled this way for compatibility reasons”*, and that *“Auto-fill on page load”* was not enabled by default. Small comfort if you *did* enable it.

### 2025: DOM-based clickjacking ###

Fast-forward to August 2025, when [security researcher *Marek Tóth*](https://marektoth.com/blog/dom-based-extension-clickjacking/) publicly disclosed a class of DOM-based *clickjacking* attacks that could trick the *Bitwarden* browser extension into autofilling credit card details and personal information after a *single click* on a malicious page. The vulnerability had been reported four months earlier, in April 2025, but was classified by *Bitwarden* as *“moderate severity”* and was not patched until version *2025.8.2*, shipped on the very day the researcher’s embargo expired.

### 2026: Shai-Hulud ###

And then, a few days before I started writing this post, news broke that the official *Bitwarden* CLI client (`2026.4.0`) [was compromised in the ongoing *Checkmarx* supply chain attack](https://socket.dev/blog/bitwarden-cli-compromised):

>
>
> The affected package version appears to be `@bitwarden/cli2026.4.0`, and the malicious code was published in `bw1.js`, a file included in the package contents. The attack **appears to have leveraged a compromised GitHub Action in Bitwarden’s CI/CD pipeline**, consistent with the pattern seen across other affected repositories in this campaign.
>
>
>
> …
>
>
>
> Organizations that installed the malicious Bitwarden npm package should **treat this incident as a credential exposure and CI/CD compromise event**.
>
>

[The payload](https://www.ox.security/blog/shai-hulud-bitwarden-cli-supply-chain-attack/) downloaded the *Bun* runtime, decrypted a second-stage *Shai-Hulud* worm and started harvesting *GitHub* and *npm* tokens, *SSH* keys, shell history, *AWS*, *GCP*, *Azure* credentials, *GitHub Actions* secrets, and even *MCP* configuration files used by AI tooling. The data was then exfiltrated by auto-creating a public repository on the victim’s own *GitHub* account and uploading the stolen credentials there. *Bitwarden*’s *npm* distribution pipeline stayed compromised for approximately 19 hours and 334 developers had enough time to pull the malicious package before it was caught.

*Bitwarden*’s official statement emphasised that *no end-user vault data was accessed*, which is technically true and entirely beside the point. Everyone running `bw` in a CI pipeline just handed the attackers whatever else happened to live on that machine. For a company whose *one job* is keeping secrets safe, distributing an actively malicious CLI through its official channels is not a great look. It also ties back nicely to the earlier rant about shipping a password manager CLI as a *Node* package. Had `bw` been a single statically-linked binary in *Go* or *Rust* (as most of the ecosystem has moved towards) the *npm*-shaped blast radius simply wouldn’t exist in that form. And while supply-chain attacks within the Go and Rust ecosystems are on the rise as well, the barriers for successful attacks are still higher.

**Note:** None of the above incidents are world-ending on their own. Every non-trivial piece of software will ship with bugs, and critical vulnerabilities happen to everyone. What bothers me is the *pattern*. The reactive (rather than proactive) security posture, the *“working-as-intended”* responses to embarrassing findings, the reliance on a *Node.js* toolchain for a security-critical CLI, and the fact that several of these issues had been quietly flagged by external researchers long before they were actually addressed.

The way forward
----------

As this post is not an ad-driven hit-piece by any of *Bitwarden*’s competitors, you won’t be reading anything along the lines of *"… switch to \<insert SaaS product here\> now and get 50% off your first year with promo code SWORDFISH"*. Instead, I will describe the approach that I’m taking moving forward, which might be something that you, as an equally frustrated long-time *Bitwarden* user, might be interested in exploring as well.

### Divide and conquer ###

Over the past years, I came to the conclusion that there’s no single password manager that will work perfectly for every use case and setup. For example, in my personal life, I do not need the ability to share vaults or individual passwords with other people. In my professional life, however, that is a fairly common occurrence. Similarly, the login credentials for bank accounts or insurance portals do not need to be available through a CLI tool, but they have to be available across multiple devices. Secrets for cloud storage or SSH private keys for deployments, however, don’t need to sync to any of my [phones](/phone/), but they do need to be accessible from a command-line tool that can be invoked programmatically.

With these requirements in mind, it only makes sense to think of a way to better compartmentalize each set of credentials, rather than trying to find a single software or platform that can kill ten birds with one stone. Also, looking at it from a security perspective, it makes total sense to split up these *password groups* into different softwares and services in order to minimize the impact that a data breach might have.

Generally, the approach that I came up with splits my credentials into the following groups:

* **A:** Credentials for professional/client projects (think platform logins, etc.)
* **B:** Credentials for accounts containing [PII](https://www.investopedia.com/terms/p/personally-identifiable-information-pii.asp) (think bank accounts, online shops, etc.)
* **C:** Credentials for accounts that do not contain [PII](https://www.investopedia.com/terms/p/personally-identifiable-information-pii.asp) (think accounts on internet forums, online platforms, etc.)
* **D:** Credentials for infrastructure (think server logins, SSH keys)
* **E:** One-off credentials (think API keys, tokens, etc.)

#### Group A: Professional/client projects ####

For **group A** I’m going with a *SaaS* password manager that offers proper vault sharing, integrates with the tools clients actually use (SSO, browser extensions on corporate machines, audit logs), and takes the hosting burden off my plate. The platform is proprietary, which I would normally not be thrilled about, but given that the scope of this group is *client work only*, I’m accepting the trade-off.

#### Group B: Accounts containing PII ####

For **group B**, the rationale is a bit counter-intuitive at first. The accounts tied to these credentials already contain personal information like name, address, date of birth, maybe payment details, which is regularly leaked by the very same services anyway, as a quick look at [*Have I Been Pwned*](https://haveibeenpwned.com) confirms. A breach of the password manager itself would therefore not meaningfully expand the attacker’s knowledge. With TOTP and Passkeys in place, it frankly doesn’t even matter anymore at this point. What *does* matter here is cross-device availability, realiability and offline capabilities. I’m using a second, separate cloud-based password manager for this group, from a different vendor, with a different master password and different recovery mechanisms, so that a compromise of group *A* doesn’t automatically compromise group *B* and vice-versa. As I will be running their mobile app on at least one [*GrapheneOS*](/tag/grapheneos/) device, I prefer a solution that doesn’t depend on *Google Play Services* and ideally offers an open-source/source-available client.

#### Group C: Accounts without PII ####

**Group C** covers all the accounts I have on internet forums, websites, privacy-respecting services, and anything that doesn’t hold PII. For these, I don’t need, nor do I want, a cloud service. I’m using [*KeePassChi*](https://codeberg.org/keepasschi/ChiPass)/[*KeePassXC*](https://keepassxc.org)/[*KeePassDX*](https://www.keepassdx.com) with the database file sitting in a folder that is being synced across my devices via [*Syncthing*](https://syncthing.net), which is an approach I have [already written about in the past](/build-your-own-decentralized-dropbox-with-syncthing/). The `.kdbx` file is itself encrypted, which means that even if *Syncthing* were compromised (and the attacker somehow got their hands on the file), they would still need to break the *KeePassChi*/*KeePassXC* encryption to get anything useful out of it. On mobile, [*KeePassDX*](https://www.keepassdx.com) on *Android* reads the same file without fuss.

#### Group D: Infrastructure ####

For **group D**, I’m using a mixed approach of storing personal credentials using the same approach taken in *group C*, and credentials that are actually used by scripts, CI jobs, and remote servers, using [*HashiCorp Vault*](https://www.vaultproject.io), which is the same one I was already running for PKI in my *OpenBSD* setup. *Vault* is a bit of an overkill for a single user, but it gives me proper access policies, token-based authentication for automated agents, short-lived credentials for things that support it, and audit logs. Having that said, I’m looking into *Infisical*.

#### Group E: One-off credentials ####

For **group E**, the API keys, personal access tokens, and random secrets that I only ever use from the command line, I’ve settled on the venerable [`pass`](https://www.passwordstore.org) utility. It stores each secret as an individual *GPG*-encrypted file in a Git repository, which is conceptually simple, easy to audit, and cooperates perfectly with shell scripts and my [*dotfiles*](https://codeberg.org/mrus/dotfiles). The Git repository lives on my own infrastructure, not on *GitHub*, and it’s only synced manually when I actually need to access it from a different machine.

This might all sound like a lot of moving parts, and I understand if it looks like overkill for someone coming from a single-vault world. The reality, however, is that after years of using *Bitwarden* as a *one size fits all* solution, I realised that *one size fits all* meant *one size fits poorly*. Splitting credentials across multiple tools turned out to be significantly less painful than I had initially assumed, mostly because each tool is individually well-suited to its specific task. And if any one of them gets breached, the blast radius is limited to one category of secrets, not the whole lot.

Bottom line
----------

After several years of self-hosting *Bitwarden*, I’ve come to the conclusion that the product has drifted further and further away from what I originally signed up for. The *enterprise-first* architecture that barely fits on a Raspberry Pi, the half-hearted attempt at a *“lighter”* backend, the SDK licensing *situation*, the slow pace at which features are being addressed, the avoidable UX paper-cuts that haven’t been fixed in years, and finally the string of security issues that shouldn’t have shipped in the first place, all paint a picture that I find hard to reconcile with the *“open-source password manager for everyone”* narrative.

I’m not suggesting that the alternatives are universally better or free of their own issues, because password managers are simply hard, and *every* player in this space has its fair share of skeletons. What I *am* suggesting is that you take a hard look at how much trust you are placing into a single piece of software for all of your credentials, and whether that bet is still the right one, which for me, it no longer was.

Here are some other views on this topic:

* [*Ask HN: Alternatives to Bitwarden?*](https://news.ycombinator.com/item?id=41906450)
* [*Bitwarden CLI Compromised in Ongoing Checkmarx Supply Chain Campaign*](https://lobste.rs/s/x79usb/bitwarden_cli_compromised_ongoing)
* [*Bitwarden CLI Compromised in Ongoing Checkmarx Supply Chain Campaign*](https://news.ycombinator.com/item?id=47876043)
* [*Concerns Over Bitwarden Moving Away from Open Source*](https://community.bitwarden.com/t/concerns-over-bitwarden-moving-away-from-open-source-what-does-our-future-hold/74800)