---
title = "Trackers leaking bank account data"
description = "A Finnish online bank used to include a US-based third-party analytics and tracking script in all of its pages. Ospi first wrote about it (in Finnish) in February 2015, and this caused a bi"
date = "2015-04-14T17:17:00.003Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-463469657244976267"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.905673448Z"
seen = true
---

A Finnish online bank used to include a US-based third-party analytics and tracking script in all of its pages. Ospi [first wrote](http://ospi.netcode.fi/blog/mita-tietoja-s-pankki-valittaa-kolmannelle-osapuolelle.html) about it (in Finnish) in February 2015, and this caused a bit of a fuss.

The bank [responded](https://twitter.com/S_Pankki/status/569878961209143296) to users' worries by claiming that all information is collected anonymously:

![[Image: A tweet by the bank, in Finnish. Translation: Our customers' personal data will not be made available to Google under any circumstances. Thanks to everyone who participated in the discussion! (2/2)]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhcdvnM-vdWEEJETMI5Io0tiq36nvh4Yyyd46NGsANXQsXMOy-lydxIPiip72T50DUbL4O-kxxotmawOZleC0u7g-kNp2EDZs5-HDpTtsmv8tQ0319rU7rMdVhsNdbYz4ZlfDG_I097Nb5k/s450/asiakkaidemme.png)

But is it true?

As Ospi notes, a plethora of information is sent along the HTTP request for the tracker script. This includes, of course, the IP address of the user; but also the full URL the user is browsing. The bank's URLs reveal quite a bit about what the user is doing; for instance, a user planning to start a continuous savings contract will send the url continuousSavingsContractStep1.do.

I logged in to the bank (using well-known demo credentials) to record one such tracking request. The URL sent to the third party tracker contains a cleartext transaction archive code that could easily be used to match a transaction between two bank accounts, since it's identical for both users. But there's also a hex string called accountId (highlighted in red).

```
Remote Address: 80.***.***.***:443
Request URL:    https://www.google-analytics.com/collect?v=1&_v=j33&a=870588619&t
                =pageview&_s=1&dl=https%3A%2F%2Fonline.********.fi%2Febank%2Facco
                unt%2FinitTransactionDetails.do%3FbackLink%3Dreset%26accountId%3D
                69af881eca98b7042f18e975e00f9d49d5d5ee64%26rowNo%3D0%26type%3Dtra
                ns%26archivecode%3D20150220123456780002&ul=en-us&de=windows-1252&
                dt=Tilit%C2%A0%7C%C2%A0Verkkopankki%20%7C%20S-Pankki&sd=24-bit&sr
                =1440x900&vp=1440x150&je=1&fl=16.0%20r0&_u=QACAAQQBI~&jid=&cid=18
                39557247.1424801770&uid=&tid=UA-37407484-1&cd1=&cd2=demo_accounts
                &cd3=%2Ffi%2F&z=2098846672
Request Method: GET
Status Code:    200 OK
```

It's 40 hex characters long, which is 160 bits. This happens to be the length of an SHA-1 hash.

Could it really be a simple hash of the user's bank account number? Surely they would at least salt it.

Let's try!

The demo account's IBAN code is FI96 3939 0001 0006 03, but this doesn't give us the above hash. However, if we remove the country code, IBAN checksum, and all whitespaces, it turns out we have a match!

```
$ echo -n "FI96 3939 0001 0006 03" | shasum
dcf04c4fd3b6e29b4b43a8bf43c2713ac9be1de2  -

$ echo -n "FI9639390001000603" | shasum
3e3658e4c2802dd5c21b1c6c1ed55fc1f39c8830  -

$ echo -n "39390001000603" | shasum
69af881eca98b7042f18e975e00f9d49d5d5ee64  -

$ █
```

This is a BBAN format bank account number. BBAN numbers are easy to brute-force, especially if the bank is already known. I wrote the following C program, \~25 lines of code, that reversed the above hash to the correct account number in 0.5 seconds.

```
#include <openssl/sha.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define BBAN_LENGTH 14

int main() {
  const char target_hash[SHA_DIGEST_LENGTH] = {
    "\x69\xaf\x88\x1e\xca\x98\xb7\x04\x2f\x18"
    "\xe9\x75\xe0\x0f\x9d\x49\xd5\xd5\xee\x64"
  };
  unsigned char try_accnum[BBAN_LENGTH+1];
  unsigned char try_hash[SHA_DIGEST_LENGTH];

  for (int bban_office=0; bban_office < 1e4; bban_office++) {
    for (int bban_id=0; bban_id < 1e6; bban_id++) {
      snprintf((char*)try_accnum, sizeof(try_accnum),
               "3939%04d%06d", bban_office, bban_id);
      SHA1(try_accnum, BBAN_LENGTH, try_hash);
      if (memcmp(try_hash, target_hash, SHA_DIGEST_LENGTH) == 0) {
        printf("found %s\n", try_accnum);
        return EXIT_SUCCESS;
      }
    }
  }
  return EXIT_FAILURE;
}
```

```
$ gcc -lcrypto -o bban_hash bban_hash.c

$ time ./bban_hash
found 39390001000603
./bban_hash  0.42s user 0.00s system 99% cpu 0.420 total

$ █
```

In conclusion, the third party is provided with the user's IP address, bank account number, addresses of subpages they visit, and account numbers associated with all transactions they make. The analytics company should also have no difficulty matching the user with its own database collected from other sites, including their full name and search history.

Incidentally, this is in breach of the [Guidelines on bank secrecy (PDF)](http://www.finanssiala.fi/en/material/Guidelines_on_bank_secrecy.pdf) by the Federation of Finnish Financial Services; "In accordance with the secrecy obligation, third parties may not even be disclosed whether a certain person is a customer of the bank" (pg 4) ([sama suomeksi](http://www.finanssiala.fi/materiaalit/Pankkisalaisuusohjeet.pdf): "Salassapitovelvollisuus sisältää myös sen, että sivullisille ei ilmoiteta edes sitä, onko tietty henkilö pankin asiakas vai ei").

### Solution ###

The script was eventually [removed](http://www.iltasanomat.fi/digi/art-1424915743167.html) from the site, leaving the bank regretful that such a useful tool was lost.

However, alternatives do exist (like Piwik) that can be run locally, not involving a third party. **Edit:** *The Intercept*, a news website, is [using non-privacy-invading metrics](https://theintercept.com/2015/11/04/what-the-intercepts-new-audience-measurement-system-means-for-reader-privacy).

### External links ###

* [Mitä tietoja S-Pankki välittää kolmannelle osapuolelle – oBlog](http://ospi.netcode.fi/blog/mita-tietoja-s-pankki-valittaa-kolmannelle-osapuolelle.html)
* [S-Pankin arkea on Twitter: "Asiakkaidemme henkilötietoja ei missään tapauksessa siirry Googlen käyttöön. Kiitos kaikille keskusteluun osallistuneille! (2/2)"](https://twitter.com/S_Pankki/status/569878961209143296)
* [Guidelines on bank secrecy](http://www.finanssiala.fi/en/material/Guidelines_on_bank_secrecy.pdf) (PDF)
* [Pankkisalaisuusohjeet](http://www.finanssiala.fi/materiaalit/Pankkisalaisuusohjeet.pdf) (PDF)
* [Tietosuojahuolet vaikuttivat – S-Pankki lopetti Googlen käytön – Ilta-Sanomat (archive.org)](https://web.archive.org/web/20150301010150/http://www.iltasanomat.fi/digi/art-1424915743167.html)
* [What The Intercept’s New Audience Measurement System Means for Reader Privacy](https://theintercept.com/2015/11/04/what-the-intercepts-new-audience-measurement-system-means-for-reader-privacy)