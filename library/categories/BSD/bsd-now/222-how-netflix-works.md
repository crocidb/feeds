+++
title = "222: How Netflix works"
description = "We take a look at two-faced Oracle, cover a FAMP installation, how Netflix works the complex stuff, and show you who the patron of yak shaving is.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www."
date = "2017-11-29T13:00:00Z"
url = "https://www.bsdnow.tv/222"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.821956635Z"
seen = false
+++

We take a look at two-faced Oracle, cover a FAMP installation, how Netflix works the complex stuff, and show you who the patron of yak shaving is.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Why is Oracle so two-faced over open source?](https://www.theregister.co.uk/2017/10/12/oracle_must_grow_up_on_open_source/) ###

* Oracle loves open source.

>
>
> Except when the database giant hates open source. Which, according to its recent lobbying of the US federal government, seems to be "most of the time". Yes, Oracle has recently joined the Cloud Native Computing Foundation (CNCF) to up its support for open-source Kubernetes and, yes, it has long supported (and contributed to) Linux. And, yes, Oracle has even gone so far as to (finally) open up Java development by putting it under a foundation's stewardship. Yet this same, seemingly open Oracle has actively hammered the US government to consider that "there is no math that can justify open source from a cost perspective as the cost of support plus the opportunity cost of forgoing features, functions, automation and security overwhelm any presumed cost savings." That punch to the face was delivered in a letter to Christopher Liddell, a former Microsoft CFO and now director of Trump's American Technology Council, by Kenneth Glueck, Oracle senior vice president.  
>  The US government had courted input on its IT modernisation programme. Others writing back to Liddell included AT&T, Cisco, Microsoft and VMware.  
>  In other words, based on its letter, what Oracle wants us to believe is that open source leads to greater costs and poorly secured, limply featured software. Nor is Oracle content to leave it there, also arguing that open source is exactly how the private sector does not function, seemingly forgetting that most of the leading infrastructure, big data, and mobile software today is open source.  
>  Details! Rather than take this counterproductive detour into self-serving silliness, Oracle would do better to follow Microsoft's path. Microsoft, too, used to Janus-face its way through open source, simultaneously supporting and bashing it. Only under chief executive Satya Nadella's reign did Microsoft realise it's OK to fully embrace open source, and its financial results have loved the commitment. Oracle has much to learn, and emulate, in Microsoft's approach.
>
>

* I love you, you're perfect.

>
>
> Now change Oracle has never been particularly warm and fuzzy about open source. As founder Larry Ellison might put it, Oracle is a profit-seeking corporation, not a peace-loving charity. To the extent that Oracle embraces open source, therefore it does so for financial reward, just like every other corporation. Few, however, are as blunt as Oracle about this fact of corporate open-source life. As Ellison told the Financial Times back in 2006: "If an open-source product gets good enough, we'll simply take it. So the great thing about open source is nobody owns it  a company like Oracle is free to take it for nothing, include it in our products and charge for support, and that's what we'll do. "So it is not disruptive at all  you have to find places to add value. Once open source gets good enough, competing with it would be insane... We don't have to fight open source, we have to exploit open source." "Exploit" sounds about right. While Oracle doesn't crack the top-10 corporate contributors to the Linux kernel, it does register a respectable number 12, which helps it influence the platform enough to feel comfortable building its IaaS offering on Linux (and Xen for virtualisation). Oracle has also managed to continue growing MySQL's clout in the industry while improving it as a product and business. As for Kubernetes, Oracle's decision to join the CNCF also came with P&L strings attached. "CNCF technologies such as Kubernetes, Prometheus, gRPC and OpenTracing are critical parts of both our own and our customers' development toolchains," said Mark Cavage, vice president of software development at Oracle. One can argue that Oracle has figured out the exploitation angle reasonably well. This, however, refers to the right kind of exploitation, the kind that even free software activist Richard Stallman can love (or, at least, tolerate). But when it comes to government lobbying, Oracle looks a lot more like Mr Hyde than Dr Jekyll.
>
>

* Lies, damned lies, and Oracle lobbying

>
>
> The current US president has many problems (OK, many, many problems), but his decision to follow the Obama administration's support for IT modernisation is commendable. Most recently, the Trump White House asked for feedback on how best to continue improving government IT. Oracle's response is high comedy in many respects. As TechDirt's Mike Masnick summarises, Oracle's "latest crusade is against open-source technology being used by the federal government  and against the government hiring people out of Silicon Valley to help create more modern systems. Instead, Oracle would apparently prefer the government just give it lots of money." Oracle is very good at making lots of money. As such, its request for even more isn't too surprising. What is surprising is the brazenness of its position. As Masnick opines: "The sheer contempt found in Oracle's submission on IT modernization is pretty stunning." Why? Because Oracle contradicts much that it publicly states in other forums about open source and innovation. More than this, Oracle contradicts much of what we now know is essential to competitive differentiation in an increasingly software and data-driven world.  
>  Take, for example, Oracle's contention that "significant IT development expertise is not... central to successful modernization efforts". What? In our "software is eating the world" existence Oracle clearly believes that CIOs are buyers, not doers: "The most important skill set of CIOs today is to critically compete and evaluate commercial alternatives to capture the benefits of innovation conducted at scale, and then to manage the implementation of those technologies efficiently." While there is some truth to Oracle's claim  every project shouldn't be a custom one-off that must be supported forever  it's crazy to think that a CIO  government or otherwise  is doing their job effectively by simply shovelling cash into vendors' bank accounts.  
>  Indeed, as Masnick points out: "If it weren't for Oracle's failures, there might not even be a USDS [the US Digital Service created in 2014 to modernise federal IT]. USDS really grew out of the emergency hiring of some top-notch internet engineers in response to the Healthcare.gov rollout debacle. And if you don't recall, a big part of that debacle was blamed on Oracle's technology." In short, blindly giving money to Oracle and other big vendors is the opposite of IT modernisation.  
>  In its letter to Liddell, Oracle proceeded to make the fantastic (by which I mean "silly and false") claim that "the fact is that the use of open-source software has been declining rapidly in the private sector". What?!? This is so incredibly untrue that Oracle should score points for being willing to say it out loud. Take a stroll through the most prominent software in big data (Hadoop, Spark, Kafka, etc.), mobile (Android), application development (Kubernetes, Docker), machine learning/AI (TensorFlow, MxNet), and compare it to Oracle's statement. One conclusion must be that Oracle believes its CIO audience is incredibly stupid. Oracle then tells a half-truth by declaring: "There is no math that can justify open source from a cost perspective." How so? Because "the cost of support plus the opportunity cost of forgoing features, functions, automation and security overwhelm any presumed cost savings." Which I guess is why Oracle doesn't use any open source like Linux, Kubernetes, etc. in its services.  
>  Oops.
>
>

* The Vendor Formerly Known As Satan

>
>
> The thing is, Oracle doesn't need to do this and, for its own good, shouldn't do this. After all, we already know how this plays out. We need only look at what happened with Microsoft. Remember when Microsoft wanted us to "get the facts" about Linux? Now it's a big-time contributor to Linux. Remember when it told us open source was anti-American and a cancer? Now it aggressively contributes to a huge variety of open-source projects, some of them homegrown in Redmond, and tells the world that "Microsoft loves open source." Of course, Microsoft loves open source for the same reason any corporation does: it drives revenue as developers look to build applications filled with open-source components on Azure. There's nothing wrong with that.   
>  Would Microsoft prefer government IT to purchase SQL Server instead of open-source-licensed PostgreSQL? Sure. But look for a single line in its response to the Trump executive order that signals "open source is bad". You won't find it. Why? Because Microsoft understands that open source is a friend, not foe, and has learned how to monetise it. Microsoft, in short, is no longer conflicted about open source. It can compete at the product level while embracing open source at the project level, which helps fuel its overall product and business strategy. Oracle isn't there yet, and is still stuck where Microsoft was a decade ago.  
>  It's time to grow up, Oracle. For a company that builds great software and understands that it increasingly needs to depend on open source to build that software, it's disingenuous at best to lobby the US government to put the freeze on open source. Oracle needs to learn from Microsoft, stop worrying and love the open-source bomb. It was a key ingredient in Microsoft's resurgence. Maybe it could help Oracle get a cloud clue, too.
>
>
> ---
>

### [Install FAMP on FreeBSD](https://www.linuxsecrets.com/home/3164-install-famp-on-freebsd) ###

* The acronym FAMP refers to a set of free open source applications which are commonly used in Web server environments called Apache, MySQL and PHP on the FreeBSD operating system, which provides a server stack that provides web services, database and PHP.
* Prerequisites
  * sudo Installed and working - Please read
  * Apache
  * PHP5 or PHP7
  * MySQL or MariaDB
  * Install your favorite editor, ours is vi

>
>
> Note: You don't need to upgrade FreeBSD but make sure all patches have been installed and your port tree is up-2-date if you plan to update by ports.
>
>

* Install Ports

>
>
> `portsnap fetch`  
>  You must use sudo for each indivdual command during installations. Please see link above for installing sudo.  
>  Searching Available Apache Versions to Install  
> `pkg search apache`
>
>

* Install Apache

>
>
> To install Apache 2.4 using pkg. The apache 2.4 user account managing Apache is www in FreeBSD.  
> `pkg install apache24`  
>  Confirmation yes prompt and hit y for yes to install Apache 2.4 This installs Apache and its dependencies.   
>  Enable Apache use sysrc to update services to be started at boot time, Command below adds "apache24\_enable="YES" to the /etc/rc.conf file. For sysrc commands please read  
> `sysrc apache24_enable=yes`  
>  Start Apache  
> `service apache24 start`  
>  Visit web address by accessing your server's public IP address in your web browser
>
>

* How To find Your Server's Public IP Address

>
>
> If you do not know what your server's public IP address is, there are a number of ways that you can find it. Usually, this is the address you use to connect to your server through SSH.  
> `ifconfig vtnet0 | grep "inet " | awk '{ print $2 }'`  
>  Now that you have the public IP address, you may use it in your web browser's address bar to access your web server.
>
>

* Install MySQL

>
>
> Now that we have our web server up and running, it is time to install MySQL, the relational database management system. The MySQL server will organize and provide access to databases where our server can store information. Install MySQL 5.7 using pkg by typing  
> `pkg install mysql57-server`  
>  Enter y at the confirmation prompt. This installs the MySQL server and client packages.  
>  To enable MySQL server as a service, add mysql\_enable="YES" to the /etc/rc.conf file. This sysrc command will do just that  
> `sysrc mysql_enable=yes`  
>  Now start the MySQL server  
> `service mysql-server start`  
>  Now run the security script that will remove some dangerous defaults and slightly restrict access to your database system.
>
>
>
> ```
> Answer all questions to secure your newly installed MySQL database. Enter current password for root (enter for none): [RETURN]
> Your database system is now set up and we can move on.
>
> ```
>
>

* Install PHP5 or PHP70

>
>
> `pkg search php70`  
>  Install PHP70 you would do the following by typing  
> `pkg install php70-mysqli mod_php70`
>
>

* Note: In these instructions we are using php5.7 not php7.0. We will be coming out with php7.0 instructions with FPM.

>
>
> PHP is the component of our setup that will process code to display dynamic content. It can run scripts, connect to MySQL databases to get information, and hand the processed content over to the web server to display. We're going to install the mod\_php, php-mysql, and php-mysqli packages. To install PHP 5.7 with pkg, run this command  
> `pkg install mod_php56 php56-mysql php56-mysqli`  
>  Copy sample PHP configuration file into place.  
> `cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini`  
>  Regenerate the system's cached information about your installed executable files
>
>
>
> ```
> Before using PHP, you must configure it to work with Apache.
>
> ```
>
>

* Install PHP Modules (Optional)

>
>
> To enhance the functionality of PHP, we can optionally install some additional modules. To see the available options for PHP 5.6 modules and libraries, you can type this into your system  
> `pkg search php56`  
>  Get more information about each module you can look at the long description of the package by typing  
> `pkg search -f apache24`
>
>

* Optional Install Example

>
>
> `pkg install php56-calendar`  
>  Configure Apache to Use PHP Module  
>  Open the Apache configuration file  
> `vim /usr/local/etc/apache24/Includes/php.conf`
>
>
>
> ```
> <IfModule dir_module>
>     DirectoryIndex index.php index.html
> Next, we will configure Apache to process requested PHP files with the PHP processor. Add these lines to the end of the file:
>     <FilesMatch "\.php$">
>         SetHandler application/x-httpd-php
>     </FilesMatch>
>     <FilesMatch "\.phps$">
>         SetHandler application/x-httpd-php-source
>     </FilesMatch>
> </IfModule>
>
> ```
>
>
>
> Now restart Apache to put the changes into effect  
> `service apache24 restart`
>
>

* Test PHP Processing

>
>
> By default, the DocumentRoot is set to /usr/local/www/apache24/data. We can create the info.php file under that location by typing  
> `vim /usr/local/www/apache24/data/info.php`  
>  Add following line to info.php and save it.
>
>
>
> ```
> <?php phpinfo(); ?>
>
> ```
>
>

* Details on info.php

>
>
> info.php file gives you information about your server from the perspective of PHP. It' useful for debugging and to ensure that your settings are being applied correctly.  
>  If this was successful, then your PHP is working as expected.  
>  You probably want to remove info.php after testing because it could actually give information about your server to unauthorized users. Remove file by typing  
> `rm /usr/local/www/apache24/data/info.php`  
>  Note: Make sure Apache / meaning the root of Apache is owned by user which should have been created during the Apache install is the owner of the /usr/local/www structure.  
>  That explains FAMP on FreeBSD.
>
>
> ---
>

### IXsystems ###

* [IXsystems TrueNAS X10 Torture Test & Fail Over Systems In Action with the ZFS File System](https://www.youtube.com/watch?v=GG_NvKuh530)

### [How Netflix works: what happens every time you hit Play](https://medium.com/refraction-tech-everything/how-netflix-works-the-hugely-simplified-complex-stuff-that-happens-every-time-you-hit-play-3a40c9be254b) ###

>
>
> Not long ago, House of Cards came back for the fifth season, finally ending a long wait for binge watchers across the world who are interested in an American politicians ruthless ascendance to presidency. For them, kicking off a marathon is as simple as reaching out for your device or remote, opening the Netflix app and hitting Play. Simple, fast and instantly gratifying. What isnt as simple is what goes into running Netflix, a service that streams around 250 million hours of video per day to around 98 million paying subscribers in 190 countries. At this scale, providing quality entertainment in a matter of a few seconds to every user is no joke. And as much as it means building top-notch infrastructure at a scale no other Internet service has done before, it also means that a lot of participants in the experience have to be negotiated with and kept satiated??from production companies supplying the content, to internet providers dealing with the network traffic Netflix brings upon them.  
>  This is, in short and in the most layman terms, how Netflix works.  
>  Let us just try to understand how Netflix is structured on the technological side with a simple example.  
>  Netflix literally ushered in a revolution around ten years ago by rewriting the applications that run the entire service to fit into a microservices architecture??which means that each application, or microservices code and resources are its very own. It will not share any of it with any other app by nature. And when two applications do need to talk to each other, they use an application programming interface (API)??a tightly-controlled set of rules that both programs can handle. Developers can now make many changes, small or huge, to each application as long as they ensure that it plays well with the API. And since the one program knows the others API properly, no change will break the exchange of information.  
>  Netflix estimates that it uses around 700 microservices to control each of the many parts of what makes up the entire Netflix service: one microservice stores what all shows you watched, one deducts the monthly fee from your credit card, one provides your device with the correct video files that it can play, one takes a look at your watching history and uses algorithms to guess a list of movies that you will like, and one will provide the names and images of these movies to be shown in a list on the main menu. And thats the tip of the iceberg. Netflix engineers can make changes to any part of the application and can introduce new changes rapidly while ensuring that nothing else in the entire service breaks down.  
>  They made a courageous decision to get rid of maintaining their own servers and move all of their stuff to the cloud??i.e. run everything on the servers of someone else who dealt with maintaining the hardware while Netflix engineers wrote hundreds of programs and deployed it on the servers rapidly. The someone else they chose for their cloud-based infrastructure is Amazon Web Services (AWS).  
>  Netflix works on thousands of devices, and each of them play a different format of video and sound files. Another set of AWS servers take this original film file, and convert it into hundreds of files, each meant to play the entire show or film on a particular type of device and a particular screen size or video quality. One file will work exclusively on the iPad, one on a full HD Android phone, one on a Sony TV that can play 4K video and Dolby sound, one on a Windows computer, and so on. Even more of these files can be made with varying video qualities so that they are easier to load on a poor network connection. This is a process known as transcoding. A special piece of code is also added to these files to lock them with what is called digital rights management or DRM??a technological measure which prevents piracy of films.  
>  The Netflix app or website determines what particular device you are using to watch, and fetches the exact file for that show meant to specially play on your particular device, with a particular video quality based on how fast your internet is at that moment.  
>  Here, instead of relying on AWS servers, they install their very own around the world. But it has only one purpose??to store content smartly and deliver it to users. Netflix strikes deals with internet service providers and provides them the red box you saw above at no cost. ISPs install these along with their servers. These Open Connect boxes download the Netflix library for their region from the main servers in the US??if there are multiple of them, each will rather store content that is more popular with Netflix users in a region to prioritise speed. So a rarely watched film might take time to load more than a Stranger Things episode. Now, when you will connect to Netflix, the closest Open Connect box to you will deliver the content you need, thus videos load faster than if your Netflix app tried to load it from the main servers in the US.
>
>

* In a nutshell This is what happens when you hit that Play button:
  * Hundreds of microservices, or tiny independent programs, work together to make one large Netflix service.
  * Content legally acquired or licensed is converted into a size that fits your screen, and protected from being copied.
  * Servers across the world make a copy of it and store it so that the closest one to you delivers it at max quality and speed.
  * When you select a show, your Netflix app cherry picks which of these servers will it load the video from\>
  * You are now gripped by Frank Underwoods chilling tactics, given depression by BoJack Horsemans rollercoaster life, tickled by Dev in Master of None and made phobic to the future of technology by the stories in Black Mirror. And your lifespan decreases as your binge watching turns you into a couch potato.

>
>
> It looked so simple before, right?
>
>
> ---
>

News Roundup
----------

### [Moving FreshPorts](http://dan.langille.org/2017/11/15/moving-freshports/) ###

>
>
> Today I moved the FreshPorts website from one server to another. My goal is for nobody to notice.
>
>

* In preparation for this move, I have:
  * DNS TTL reduced to 60s
  * Posted to Twitter
  * Updated the status page
  * Put the website put in offline mode:

* What was missed

>
>
> I turned off commit processing on the new server, but I did not do this on the old server. I should have:
>
>
>
> ```
> sudo svc -d /var/service/freshports
>
> ```
>
>
>
> That stops processing of incoming commits. No data is lost, but it keeps the two databases at the same spot in history. Commit processing could continue during the database dumping, but that does not affect the dump, which will be consistent regardless.
>
>

* The offline code

>
>
> Here is the basic stuff I used to put the website into offline mode. The main points are:
>
>

* header(HTTP/1.1 503 Service Unavailable);
* ErrorDocument 404 /index.php

>
>
> I move the DocumentRoot to a new directory, containing only index.php. Every error invokes index.php, which returns a 503 code.
>
>

* The dump

>
>
> The database dump just started (Sun Nov 5 17:07:22 UTC 2017).
>
>
>
> ```
> root@pg96:~ # /usr/bin/time pg_dump -h 206.127.23.226 -Fc -U dan freshports.org > freshports.org.9.6.dump
>
> ```
>
>
>
> That should take about 30 minutes. I have set a timer to remind me. Total time was:
>
>
>
> ```
> 1464.82 real      1324.96 user        37.22 sys
>
> ```
>
>
>
> The MD5 is:  
> `MD5 (freshports.org.9.6.dump) = 5249b45a93332b8344c9ce01245a05d5`  
>  It is now: Sun Nov 5 17:34:07 UTC 2017
>
>

* The rsync

>
>
> The rsync should take about 10-20 minutes. I have already done an rsync of yesterdays dump file. The rsync today should copy over only the deltas (i.e. differences). The rsync started at about Sun Nov 5 17:36:05 UTC 2017 That took 2m9.091s The MD5 matches.
>
>

* The restore

>
>
> The restore should take about 30 minutes. I ran this test yesterday. It is now Sun Nov 5 17:40:03 UTC 2017.
>
>
>
> ```$ createdb -T template0 -E SQL\_ASCII freshports.testing  
>  $ time pg\_restore -j 16 -d freshports.testing freshports.org.9.6.dump
>
>
>
> ```
> Done.
>
> ```real    25m21.108s
> user    1m57.508s
> sys     0m15.172s
>
> ```
>
>
>
> It is now Sun Nov 5 18:06:22 UTC 2017.
>
>

* Insert break here

>
>
> About here, I took a 30 minute break to run an errand. It was worth it.
>
>

* Changing DNS

>
>
> Im ready to change DNS now. It is Sun Nov 5 19:49:20 EST 2017 Done. And nearly immediately, traffic started.
>
>

* How many misses?

>
>
> During this process, XXXXX requests were declined:
>
>
>
> ```
> $ grep -c '" 503 ' /usr/websites/log/freshports.org-access.log
> XXXXX
>
> ```
>
>

* Thats it, were done

>
>
> Total elapsed time: 1 hour 48 minutes. There are still a number of things to follow up on, but that was the transfers.
>
>

* [The new FreshPorts Server](http://dan.langille.org/2017/11/17/x8dtu-3/) \*\*\*

### [Using bhyve on top of CEPH](https://lists.freebsd.org/pipermail/freebsd-virtualization/2017-November/005876.html) ###

* Hi,
* Just an info point.
* I'm preparing for a lecture tomorrow, and thought why not do an actual demo.... Like to be friends with Murphy :)
* So after I started the cluster:
* 5 jails with 7 OSDs

* This what I manually needed to do to boot a memory stick

* Start een Bhyve instance

>
>
> rbd --dest-pool rbd\_data --no-progress import memstick.img memstick  
>  rbd-ggate map rbd\_data/memstick
>
>

* ggate-devvice is available on /dev/ggate1

>
>
> kldload vmm  
>  kldload nmdm  
>  kldload if\_tap  
>  kldload if\_bridge  
>  kldload cpuctl  
>  sysctl net.link.tap.up\_on\_open=1  
>  ifconfig bridge0 create  
>  ifconfig bridge0 addm em0 up  
>  ifconfig  
>  ifconfig tap11 create  
>  ifconfig bridge0 addm tap11  
>  ifconfig tap11 up
>
>

* load the GGate disk in bhyve

>
>
> bhyveload -c /dev/nmdm11A -m 2G -d /dev/ggate1 FB11
>
>

* and boot a single from it.

>
>
> bhyve -H -P -A -c 1 -m 2G -l com1,/dev/nmdm11A -s 0:0,hostbridge -s   
>  1:0,lpc -s 2:0,virtio-net,tap11 -s 4,ahci-hd,/dev/ggate1 FB11 &  
>  bhyvectl --vm=FB11 --get-stats
>
>

* Connect to the VM

>
>
> cu -l /dev/nmdm11B
>
>

* And that'll give you a bhyve VM running on an RBD image over ggate.
* In the installer I tested reading from the bootdisk:

>
>
> root@:/ # dd if=/dev/ada0 of=/dev/null bs=32M  
>  21+1 records in  
>  21+1 records out  
>  734077952 bytes transferred in 5.306260 secs (138341865 bytes/sec)
>
>

* which is a nice 138Mb/sec.
* Hope the demonstration does work out tomorrow.
* --WjW \*\*\*

### [Donald Knuth - The Patron Saint of Yak Shaves](http://yakshav.es/the-patron-saint-of-yakshaves/) ###

* Excerpts:

>
>
> In 2015, I gave a talk in which I called Donald Knuth the Patron Saint of Yak Shaves. The reason is that Donald Knuth achieved the most perfect and long-running yak shave: TeX. I figured this is worth repeating.
>
>

* How to achieve the ultimate Yak Shave

>
>
> The ultimate yak shave is the combination of improbable circumstance, the privilege to be able to shave at your hearts will and the will to follow things through to the end. Heres the way it was achieved with TeX. The recount is purely mine, inaccurate and obviously there for fun. Ill avoid the most boring facts that everyone always tells, such as why Knuths checks have their own Wikipedia page.
>
>

* Community Shaving is Best Shaving

>
>
> Since the release of TeX, the community has been busy working on using it as a platform. If you ever downloaded the full TeX distribution, please bear in mind that you are downloading the amassed work of over 40 years, to make sure that each and every TeX document ever written builds. Were talking about documents here.  
>  But mostly, two big projects sprung out of that. The first is LaTeX by Leslie Lamport. Lamport is a very productive researcher, famous for research in formal methods through TLA+ and also known laying groundwork for many distributed algorithms. LaTeX is based on the idea of separating presentation and content. It is based around the idea of document classes, which then describe the way a certain document is laid out. Think Markdown, just much more complex. The second is ConTeXt, which is far more focused on fine grained layout control.
>
>

* The Moral of the Story

>
>
> Whenever you feel like cant we just replace this whole thing, it cant be so hard when handling TeX, dont forget how many years of work and especially knowledge were poured into that system. Typesetting isnt the most popular knowledge around programmers. Especially see it in the context of the space it is in: they cant remove legacy. Ever. That would break documents.  
>  TeX is also not a programming language. It might resemble one, but mostly, it should be approached as a typesetting system first. A lot of it's confusing lingo gets much better then. Its not programming lingo. By approaching TeX with an understanding for its history, a lot of things can be learned from it. And yes, a replacement would be great, but it would take ages.  
>  In any case, I hope I thoroughly convinced you why Donald Knuth is the Patron Saint of Yak Shaves.
>
>

* Extra Credits

>
>
> This comes out of a enjoyable discussion with [Arne from Lambda Island]([https://lambdaisland.com/https://lambdaisland.com/](https://lambdaisland.com/https://lambdaisland.com/), who listened and said you should totally turn this into a talk.
>
>
> ---
>

### [Vincents trip to EuroBSDCon 2017](http://www.vincentdelft.be/post/post_20171016) ###

* My euroBSDCon 2017
* Posted on 2017-10-16 09:43:00 from Vincent in Open Bsd

>
>
> Let me just share my feedback on those 2 days spent in Paris for the EuroBSDCon. My 1st BSDCon. I'm not a developer, contributor, ... Do not expect to improve your skills with OpenBSD with this text :-) I know, we are on October 16th, and the EuroBSDCon of Paris was 3 weeks ago :( I'm not quick !!! Sorry for that  
>  Arrival at 10h, I'm too late for the start of the key note. The few persons behind a desk welcome me by talking in Dutch, mainly because of my name. Indeed, Delft is a city in Netherlands, but also a well known university. I inform them that I'm from Belgium, and the discussion moves to the fact the Fosdem is located in Brussels. I receive my nice T-shirt white and blue, a bit like the marine T-shirts, but with the nice EuroBSDCon logo. I'm asking where are the different rooms reserved for the BSD event. We have 1 big on the 1st floor, 1 medium 1 level below, and 2 smalls 1 level above. All are really easy to access. In this entrance we have 4 or 5 tables with some persons representing their company. Those are mainly the big sponsors of the event providing details about their activity and business. I discuss a little bit with StormShield and Gandi. On other tables people are selling BSD t-shirts, and they will quickly be sold.
>
>

* "Is it done yet ?" The never ending story of pkg tools

>
>
> In the last Fosdem, I've already hear Antoine and Baptiste presenting the OpenBSD and FreeBSD battle, I decide to listen Marc Espie in the medium room called Karnak. Marc explains that he has rewritten completely the pkg\_add command. He explains that, at contrario with other elements of OpenBSD, the packages tools must be backward compatible and stable on a longer period than 12 months (the support period for OpenBSD). On the funny side, he explains that he has his best idea inside his bath. Hackathons are also used to validate some ideas with other OpenBSD developers. All in all, he explains that the most time consuming part is to imagine a good solution. Coding it is quite straightforward. He adds that better an idea is, shorter the implementation will be.
>
>

* A Tale of six motherboards, three BSDs and coreboot

>
>
> After the lunch I decide to listen the talk about Coreboot. Indeed, 1 or 2 years ago I had listened the Libreboot project at Fosdem. Since they did several references to Coreboot, it's a perfect occasion to listen more carefully to this project. Piotr and Katazyba Kubaj explains us how to boot a machine without the native Bios. Indeed Coreboot can replace the bios, and de facto avoid several binaries imposed by the vendor. They explain that some motherboards are supporting their code. But they also show how difficult it is to flash a Bios and replace it by Coreboot. They even have destroyed a motherboard during the installation. Apparently because the power supply they were using was not stable enough with the 3v. It's really amazing to see that open source developers can go, by themselves, to such deep technical level.
>
>

* State of the DragonFly's graphics stack

>
>
> After this Coreboot talk, I decide to stay in the room to follow the presentation of Fran?ois Tigeot. Fran?ois is now one of the core developer of DrangonflyBSD, an amazing BSD system having his own filesystem called Hammer. Hammer offers several amazing features like snapshots, checksum data integrity, deduplication, ... Francois has spent his last years to integrate the video drivers developed for Linux inside DrangonflyBSD.   
>  He explains that instead of adapting this code for the video card to the kernel API of DrangonflyBSD, he has "simply" build an intermediate layer between the kernel of DragonflyBSD and the video drivers. This is not said in the talk, but this effort is very impressive. Indeed, this is more or less a linux emulator inside DragonflyBSD. Francois explains that he has started with Intel video driver (drm/i915), but now he is able to run drm/radeon quite well, but also drm/amdgpu and drm/nouveau.
>
>

* Discovering OpenBSD on AWS

>
>
> Then I move to the small room at the upper level to follow a presentation made by Laurent Bernaille on OpenBSD and AWS. First Laurent explains that he is re-using the work done by Antoine Jacoutot concerning the integration of OpenBSD inside AWS. But on top of that he has integrated several other Open Source solutions allowing him to build OpenBSD machines very quickly with one command. Moreover those machines will have the network config, the required packages, ... On top of the slides presented, he shows us, in a real demo, how this system works. Amazing presentation which shows that, by putting the correct tools together, a machine builds and configure other machines in one go.
>
>

* OpenBSD Testing Infrastructure Behind bluhm.genua.de

>
>
> Here Jan Klemkow explains us that he has setup a lab where he is able to run different OpenBSD architectures. The system has been designed to be able to install, on demand, a certain version of OpenBSD on the different available machines. On top of that a regression test script can be triggered. This provides reports showing what is working and what is not more working on the different machines. If I've well understood, Jan is willing to provide such lab to the core developers of OpenBSD in order to allow them to validate easily and quickly their code. Some more effort is needed to reach this goal, but with what exists today, Jan and his colleague are quite close. Since his company is using OpenBSD business, to his eyes this system is a "tit for tat" to the OpenBSD community.
>
>

* French story on cybercrime

>
>
> Then comes the second keynote of the day in the big auditorium. This talk is performed by the colonel of french gendarmerie. Mr Freyssinet, who is head of the Cyber crimes unit inside the Gendarmerie. Mr Freyssinet explains that the "bad guys" are more and more volatile across countries, and more and more organized. The small hacker in his room, alone, is no more the reality. As a consequence the different national police investigators are collaborating more inside an organization called Interpol. What is amazing in his talk is that Mr Freyssinet talks about "Crime as a service". Indeed, more and more hackers are selling their services to some "bad and temporary organizations".
>
>

* Social event

>
>
> It's now time for the famous social event on the river: la Seine. The organizers ask us to go, by small groups, to a station. There is a walk of 15 minutes inside Paris. Hopefully the weather is perfect. To identify them clearly several organizers takes a "beastie fork" in their hands and walk on the sidewalk generating some amazing reactions from some citizens and toursits. Some of them recognize the Freebsd logo and ask us some details. Amazing :-)  
>  We walk on small and big sidewalks until a small stair going under the street. There, we have a train station a bit like a metro station. 3 stations later they ask us to go out. We walk few minutes and come in front of a boat having a double deck: one inside, with nice tables and chairs and one on the roof. But the crew ask us to go up, on the second deck. There, we are welcome with a glass of wine. The tour Eiffel is just at few 100 meters from us. Every hour the Eiffel tower is blinking for 5 minutes with thousands of small lights. Brilliant :-)   
>  We see also the "statue de la libertee" (the small one) which is on a small island in the middle of the river. During the whole night the bar will be open with drinks and some appetizers, snacks, ... Such walking diner is perfect to talk with many different persons. I've discussed with several persons just using BSD, they are not, like me, deep and specialized developers. One was from Switzerland, another one from Austria, and another one from Netherlands. But I've also followed a discussion with Theo de Raadt, several persons of the FreeBSD foundation. Some are very technical guys, other just users, like me. But all with the same passion for one of the BSD system. Amazing evening.
>
>

* OpenBSD's small steps towards DTrace (a tale about DDB and CTF)

>
>
> On the second day, I decide to sleep enough in order to have enough resources to drive back to my home (3 hours by car). So I miss the 1st presentations, and arrive at the event around 10h30. Lot of persons are already present. Some faces are less "fresh" than others.  
>  I decide to listen to Dtrace in OpenBSD. After 10 minutes I am so lost into those too technical explainations, that I decide to open and look at my PC. My OpenBSD laptop is rarely leaving my home, so I've never had the need to have a screen locking system. In a crowded environment, this is better. So I was looking for a simple solution. I've looked at how to use xlock. I've combined it with the /ets/apm/suspend script, ... Always very easy to use OpenBSD :-)
>
>

* The OpenBSD web stack

>
>
> Then I decide to follow the presentation of Michael W Lucas. Well know person for his different books about "Absolute OpenBSD", Relayd", ... Michael talks about the httpd daemon inside OpenBSD. But he also present his integration with Carp, Relayd, PF, FastCGI, the rules based on LUA regexp (opposed to perl regexp), ... For sure he emphasis on the security aspect of those tools: privilege separation, chroot, ...
>
>

* OpenSMTPD, current state of affairs

>
>
> Then I follow the presentation of Gilles Chehade about the OpenSMTPD project. Amazing presentation that, on top of the technical challenges, shows how to manage such project across the years. Gilles is working on OpenSMTPD since 2007, thus 10 years !!!. He explains the different decisions they took to make the software as simple as possible to use, but as secure as possible, too: privilege separation, chroot, pledge, random malloc, ? . The development starts on BSD systems, but once quite well known they received lot of contributions from Linux developers.
>
>

* Hoisting: lessons learned integrating pledge into 500 programs

>
>
> After a small break, I decide to listen to Theo de Raadt, the founder of OpenBSD. In his own style, with trekking boots, shorts, backpack. Theo starts by saying that Pledge is the outcome of nightmares. Theo explains that the book called "Hacking blind" presenting the BROP has worried him since few years. That's why he developed Pledge as a tool killing a process as soon as possible when there is an unforeseen behavior of this program. For example, with Pledge a program which can only write to disk will be immediately killed if he tries to reach network. By implementing Pledge in the +-500 programs present in the "base", OpenBSD is becoming more secured and more robust.
>
>

* Conclusion

>
>
> My first EuroBSDCon was a great, interesting and cool event. I've discussed with several BSD enthusiasts. I'm using OpenBSD since 2010, but I'm not a developer, so I was worried to be "lost" in the middle of experts. In fact it was not the case. At EuroBSDCon you have many different type of enthusiasts BSD's users. What is nice with the EuroBSDCon is that the organizers foresee everything for you. You just have to sit and listen. They foresee even how to spend, in a funny and very cool attitude, the evening of Saturday. \> The small draw back is that all of this has a cost. In my case the whole weekend cost me a bit more than 500euro. Based on what I've learned, what I've saw this is very acceptable price. Nearly all presentations I saw give me a valuable input for my daily job. For sure, the total price is also linked to my personal choice: hotel, parking. And I'm surely biased because I'm used to go to the Fosdem in Brussels which cost nothing (entrance) and is approximately 45 minutes of my home. But Fosdem is not the same atmosphere and presentations are less linked to my daily job.  
>  I do not regret my trip to EuroBSDCon and will surely plan other ones.
>
>

---

Beastie Bits
----------

* [Important munitions lawyering](https://www.jwz.org/blog/2017/10/important-munitions-lawyering/)
* [AsiaBSDCon 2018 CFP is now open, until December 15th](https://2018.asiabsdcon.org/)
* [ZSTD Compression for ZFS by Allan Jude](https://www.youtube.com/watch?v=hWnWEitDPlM&feature=share)
* [NetBSD on Allwinner SoCs Update](https://blog.netbsd.org/tnf/entry/netbsd_on_allwinner_socs_update) \*\*\*

Feedback/Questions
----------

* [Tim - Creating Multi Boot USB sticks](http://dpaste.com/0FKTJK3#wrap)
* [Nomen - ZFS Questions](http://dpaste.com/1HY5MFB)
* [JJ - Questions](http://dpaste.com/3ZGNSK9#wrap)
* [Lars - Hardening Diffie-Hellman](http://dpaste.com/3TRXXN4) \*\*\*