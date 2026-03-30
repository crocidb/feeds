+++
title = "Designing for inactive users: Account check-ins and deletion"
description = "Artemis has been open for registration with an invite code for over a year. In that time, many people have signed up. With that said, not everyone who signs up will end up using their account. This is par for the course with software. Signing up for an account doesn’t mean someon"
date = "2026-02-11T11:51:42Z"
url = "https://jamesg.blog/2026/02/11/account-check-ins-deletion/"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-02-11T20:17:01.767528174Z"
seen = true
+++

[Artemis](https://artemis.jamesg.blog) has been open for registration with an invite code for over a year. In that time, many people have signed up. With that said, not everyone who signs up will end up using their account. This is par for the course with software. Signing up for an account doesn’t mean someone is going to keep using it.

In January I started to design what I am thinking of as an “account check-in.” This involves an email that will go out to users who haven’t been active for several months. The way Artemis computes when a user last signed in is detailed in “[Designing for inactive users](https://jamesg.blog/2025/12/20/designing-for-inactive-users)”. The system is deliberately designed to only save to the database the last month in which a user opened their reader feed.

The check-in email that is sent reads as follows:

> Hello there,  
>   
> You have a registered account with [Artemis](https://artemis.jamesg.blog), a calm web reader.​  
>   
> We noticed you haven't logged into your account in a while, so we wanted to check whether you still need or want your account.​​  
>   
> If you want to keep your account, no action is needed.​​  
>   
> If you no longer need your Artemis account, you can export your data and/or delete your account at any time from your [Account Settings](https://artemis.jamesg.blog/account).​  
>   
> If you have any questions or run into any issues, please send an email to [artemis@jamesg.blog](mailto:artemis@jamesg.blog).

This email acts as a reminder to registered users that they have an account. If a user no longer needs their account, they can follow the instructions to delete their account.

As a service operator, I don’t want to keep storing data for years-old accounts that the owner may have forgotten they created because they didn’t end up using the service. I hope this email encourages people to assess whether they still need their account so that Artemis can avoid storing data it doesn’t need.

I plan to send these emails out no more than once a year, and in batches. The service I use for sending transactional emails has a reasonable free plan, but I can’t send all the emails out at once without having to upgrade. I plan to eventually make this a background service that automatically sends emails when accounts have been unused for over a year.

The first batch of these emails went out to a small portion of users today. If you use Artemis and haven’t logged in for several months or a year, one of these emails should be sent in the coming weeks and months.