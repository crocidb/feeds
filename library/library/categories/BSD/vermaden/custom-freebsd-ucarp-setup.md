+++
title = "Custom FreeBSD UCARP Setup"
description = "This entry is sponsored by fme AG company – and this article aspires to share about interesting HA setup on node01a and node01b VMs. Below drawing was created by Tim Serong and greatly visualizes the cluster logic in HA systems 🙂 The interesting case here is that the 10.0.0.x/24 "
date = "2026-08-15T09:46:04Z"
url = "https://vermaden.wordpress.com/2026/08/15/custom-freebsd-ucarp-setup/"
author = "vermaden"
text = ""
lastupdated = "2026-08-24T15:49:14.053382598Z"
seen = false
+++

This entry is sponsored by [**fme AG**](https://fme.de/) company – and this article aspires to share about interesting HA setup on **node01a** and **node01b** VMs. Below drawing was created by **Tim Serong** and greatly visualizes the cluster logic in HA systems ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/stonith.jpg)

The *interesting* case here is that the **10.0.0.x/24** is limited in one of the clients – most IP(s) are taken. With normal **carp(4)** installation we would need 3 IP(s) from that network – two IP(s) for each of the two nodes and an additional HA IP for the service. To overcome that we will use 3 IPs(2) from different **192.168.0.x/24** network and only one IP from the limited **10.0.0.x/24** network. The **net/ucarp** port that we will use here has only one disadvantage that we can overcome easily – it does not do anything to MAC addresses of the network interfaces – and knowing how the network switches work – they may ‘redirect’ traffic to ‘bad’ interface with ‘bad’ MAC address – so we will also use something like HA MAC concept and move that HA MAC with the HA IP.

List of these Bhyve VMs below.

```
bhyve # vm list | grep -e NAME -e node01
NAME      DATASTORE  LOADER     CPU  MEMORY  VNC  AUTO     STATE
node01a   default    uefi       2    4G      -    No       Running (64537)
node01b   default    uefi       2    4G      -    No       Running (60781)

```

Below You will find summary of IPs(s) and MAC(s) addresses.

```
192.168.0.11      | node01a IP
192.168.0.12      | node01b IP
192.168.0.100     | node01 HA IP UCARP (technical)
10.0.0.100        | node01 HA IP (service)
10.0.0.1          | node01 HA IP Default Gateway (service)
58:9c:fc:ff:01:ff | node01 HA MAC
58:9c:fc:ff:01:aa | node01a MAC
58:9c:fc:ff:01:bb | node01b MAC

```

The **net/ucarp** provides the ‘UP’ and ‘DOWN’ scripts – I just copied them to new **/usr/local/etc/ucarp/** dir and added some content to them.

```
node0a # pkg info -l ucarp
ucarp-1.5.2.20171201:
        /usr/local/etc/rc.d/ucarp
        /usr/local/sbin/ucarp
        /usr/local/sbin/ucarp-down
        /usr/local/sbin/ucarp-up
        /usr/local/share/licenses/ucarp-1.5.2.20171201/ISC
        /usr/local/share/licenses/ucarp-1.5.2.20171201/LICENSE
        /usr/local/share/licenses/ucarp-1.5.2.20171201/catalog.mk

node0a # cp /usr/local/sbin/ucarp-up /usr/local/etc/ucarp/100-up.sh

node0a # cp /usr/local/sbin/ucarp-down /usr/local/etc/ucarp/100-down.sh

```

The **node01a** config **/etc/rc.conf** file related to UCARP config is below – all the other options are default and standardized – I also added **hostname** and networking information for clarity.

```
hostname="node01a.local"
ifconfig_vtnet0="inet 192.168.0.11/24"
ifconfig_vtnet1="up"
ucarp_enable="YES"
ucarp_preempt="YES"
ucarp_shutdown="YES"
ucarp_src="192.168.0.11"
ucarp_addr="192.168.0.100"
ucarp_if="vtnet0"
ucarp_pass="S3CUREcarp"
ucarp_vhid="100"
ucarp_upscript="/usr/local/etc/ucarp/100-up.sh"
ucarp_downscript="/usr/local/etc/ucarp/100-down.sh"
```

The **node01b** config **/etc/rc.conf** file related to UCARP config below.

```
hostname="node01b.local"
ifconfig_vtnet0="inet 192.168.0.12/24"
ifconfig_vtnet1="up"
ucarp_enable="YES"
ucarp_preempt="YES"
ucarp_shutdown="YES"
ucarp_src="192.168.0.12"
ucarp_addr="192.168.0.100"
ucarp_if="vtnet0"  
ucarp_pass="S3CUREcarp"
ucarp_vhid="100"
ucarp_upscript="/usr/local/etc/ucarp/100-up.sh"
ucarp_downscript="/usr/local/etc/ucarp/100-down.sh"
```

Now – the UCARP needs the ‘UP’ and ‘DOWN’ scripts – the ‘UP’ scripts are the same on both nodes but the ‘DOWN’ scripts are different because they bring back the ‘local’ MAC after stepping down from the ‘master’ role. The

The **/usr/local/etc/ucarp/100-up.sh** for both **node01a** and **node01b** hosts below.

```
#! /bin/sh

if [ -z "${1}" -o -z "${2}" ]
then
  cat <<EOF
Usage: ${0##*/} interface virtual-address [if-keep-ip]
  interface        - interface name where virtual IP-address to be assigned;
  virtual-address  - virtual IP-address;
  if-keep-ip       - interface name where virtual IP-address should be kept
                     when ucarp changes state to BACKUP;

EOF
  exit 255
fi

exec 2> /dev/null

if [ ! -z "${3}" ]
then
  /sbin/ifconfig "${3}" -alias "${2}"
fi

/sbin/ifconfig "${1}" alias "${2}" netmask 255.255.255.255

# HA IP AND HA MAC
/sbin/ifconfig vtnet1 ether 58:9c:fc:ff:01:ff
/sbin/ifconfig vtnet1 inet 10.0.0.100/24 up                      
/sbin/route add    default 10.0.0.1
/sbin/route change default 10.0.0.1

```

The **/usr/local/etc/ucarp/100-down.sh** for **node01a** node below.

```
#! /bin/sh

if [ -z "${1}" -o -z "${2}" ]
then
  cat <<EOF
Usage: ${0##*/} interface virtual-address [if-keep-ip]
  interface        - interface name where virtual IP-address to be assigned;
  virtual-address  - virtual IP-address;
  if-keep-ip       - interface name where virtual IP-address should be kept
                     when ucarp changes state to BACKUP;

EOF
  exit 255
fi

exec 2> /dev/null

/sbin/ifconfig "${1}" -alias "${2}"

# HA IP AND HA MAC - BRING BACK node01a MAC
/sbin/ifconfig vtnet1 ether 58:9c:fc:ff:01:aa
/sbin/ifconfig vtnet1 delete 10.0.0.100

```

The **/usr/local/etc/ucarp/100-down.sh** for **node01b** node.

```
#! /bin/sh

if [ -z "${1}" -o -z "${2}" ]
then
  cat <<EOF
Usage: ${0##*/} interface virtual-address [if-keep-ip]
  interface        - interface name where virtual IP-address to be assigned;
  virtual-address  - virtual IP-address;
  if-keep-ip       - interface name where virtual IP-address should be kept
                     when ucarp changes state to BACKUP;

EOF
  exit 255
fi

exec 2> /dev/null

/sbin/ifconfig "${1}" -alias "${2}"

# HA IP AND HA MAC - BRING BACK node01b MAC
/sbin/ifconfig vtnet1 ether 58:9c:fc:ff:01:bb
/sbin/ifconfig vtnet1 delete 10.0.0.100

```

To move the HA IP from the ‘master’ to the ‘backup’ is to execute this command on the ‘master’ host:

```
node01a # service ucarp restart

```

This is how ‘master’ networking looks like – its on **node01b** host this time:

```
node01b # netstat -Win -f inet
you have mail
Name     Mtu Network         Address          Ipkts Ierrs Idrop     Opkts Oerrs  Coll
vtnet0     - 192.168.0.0/24  192.168.0.12    168965     -     -    263946     -     -
vtnet0     - 192.168.0.0/32  192.168.0.100        0     -     -         0     -     -
vtnet1     - 10.0.0.0/27     10.0.0.100     9496832     -     -  11104229     -     -
lo0        - 127.0.0.0/8     127.0.0.1      7071008     -     -   7071036     -     -

node01b # netstat -Wrn -f inet
Routing tables

Internet:
Destination        Gateway            Flags   Nhop#    Mtu            Netif Expire
default            10.0.0.1           UGS        22   1500           vtnet1
127.0.0.1          link#4             UH          1  16384              lo0
10.0.0.0/27        link#3             U           7   1500           vtnet1
10.0.0.100         link#4             UHS         8  16384              lo0
192.168.0.0/24     link#1             U           2   1500           vtnet0
192.168.0.100      link#4             UH          6  16384              lo0
192.168.0.12       link#4             UHS         3  16384              lo0

```

This is how ‘backup’ networking looks like – its on **node01a** host this time::

```
node01a # netstat -Win -f inet
Name     Mtu Network          Address          Ipkts Ierrs Idrop     Opkts Oerrs  Coll
vtnet0     - 192.168.0.0/24   192.168.0.11     61863     -     -     53986     -     -
lo0        - 127.0.0.0/8      127.0.0.1     11944793     -     -  11944848     -     -

node01a # netstat -Wrn -f inet
Routing tables

Internet:
Destination        Gateway            Flags   Nhop#    Mtu            Netif Expire
127.0.0.1          link#4             UH          1  16384              lo0
192.168.0.0/24     link#1             U           2   1500           vtnet0
192.168.0.11       link#4             UHS         3  16384              lo0

```

Nothing special in that custom config to be honest – but maybe someone will find that useful.

EOF