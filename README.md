Introduction
------------

vyatta-teredo-relay provides teredo (RFC4380) relaying capability for Vyatta-based routers, which Ubiquity's product EdgeRouter. Teredo is a method for IPv4-only hosts to access IPv6-only hosts without manual VPN configuration, and built for example into every version of Microsoft Windows since Windows XP SP1. IPv6 packets are wrapped and unwrapped by the teredo relay closest to the IPv6 hosts, so by running your own teredo relay on your IPv6 network you can ensure the best possible connectivity for
teredo clients. You will need to make sure packets destined for the teredo prefix 2001::/32 are routed towards that relay, though.

Installation
------------

First, add the debian APT repositories and the repository of this project

```
configure
set system package repository squeeze components 'main contrib non-free'
set system package repository squeeze distribution squeeze
set system package repository squeeze url http://http.us.debian.org/debian

set system package repository squeeze-security components main
set system package repository squeeze-security distribution squeeze/updates
set system package repository squeeze-security url http://security.debian.org

set system package repository vyatta-teredo-relay components contrib
set system package repository vyatta-teredo-relay distribution squeeze
set system package repository vyatta-teredo-relay url https://github.com/fgp/vyatta-teredo-relay/raw/gh-pages/debian/
commit
```

Then install the package with
```
sudo apt-get update
sudo apt-get install vyatta-teredo-relay
```

And configure it
```
configure
set interfaces teredo-relay0 ipv4-endport address <IPv4 address of relay>    set interfaces teredo-relay0 ipv4-endport port <IPv4 port of relay>
set interfaces teredo-relay0 firewall in ipv6-name <Ruleset for forwarded packets from teredo clients>
set interfaces teredo-relay0 firewall local ipv6-name <Ruleset for local packets from teredo clients>
```
