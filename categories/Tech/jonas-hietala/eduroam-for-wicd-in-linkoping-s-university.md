---
title = "Eduroam for wicd in Linkoping's University"
description = "So we have eduroam at our University and unsurprisingly wicd is not on their official support list but with some googling the wonderful Arch Wiki had the answer. Well, almost.Save the following as `/etc/wi"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2012/09/13/eduroam_for_wicd_in_linkopings_university/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.717943501Z"
seen = true
---

So we have eduroam at our University and unsurprisingly wicd is not on their official support list but with some googling the wonderful [Arch Wiki](https://wiki.archlinux.org/index.php/Wicd#Making_eduroam_work_with_wicd) had the answer. Well, almost.

Save the following as `/etc/wicd/encryption/templates/ttls-80211`:

```
name = TTLS for Wireless
author = Alexander Clouter
version = 1
require anon_identity *Anonymous_Username identity *Identity password *Password
optional ca_cert *Path_to_CA_Cert
-----
ctrl_interface=/var/run/wpa_supplicant
network={
    ssid="$_ESSID"
    scan_ssid=$_SCAN

    key_mgmt=WPA-EAP
    eap=TTLS

    ca_cert="$_CA_CERT"

    phase2="auth=MSCHAPv2 auth=PAP"

    anonymous_identity="$_ANON_IDENTITY"
    identity="$_IDENTITY"
    password="$_PASSWORD"
}

```

Only difference from the wiki is the line `subject_match="$_CERT_SUBJECT"` is removed.

In a terminal:

```
cd /etc/wicd/encryption/templates
echo ttls-80211 >> active

```

Then open wicd (I use `wicd-curses`) and choose `TTLS for Wireless` under the security mode and enter your credentials [from this page](http://www.liu.se/insidan/it/natverk/tradlost-nat/korta-installningar?l=sv). For the lazy people [download this](http://www.liu.se/insidan/it/natverk/tradlost-nat/korta-installningar/1.198388/AddTrustExternalCARoot.crt), save it somewhere and specify the path to it as `Path to CA Cert` then input your `<name>@liu.se` or `<name>@student.liu.se` and don’t forget [your password](https://account.liu.se).

Done!