# Simple Pixiecore Installers

## Dependencies

Tested on an isolated layer 2 subnet with two Ubuntu hosts providing infra support for a 6 node cluster.  The 'control' hosts were running Ubuntu 14.04.  One is running dnsmasq and providing basic static mapping:

```
dhcp-host=c0:3f:d5:6d:4a:0d,192.168.3.231
dhcp-host=c0:3f:d5:6d:48:d3,192.168.3.232
dhcp-host=c0:3f:d5:65:2d:b6,192.168.3.233
dhcp-host=b8:ae:ed:eb:e7:9d,192.168.3.234
dhcp-host=c0:3f:d5:65:f0:28,192.168.3.235
dhcp-host=c0:3f:d5:65:b5:e9,192.168.3.236
```

Configure your own dnsmasq.conf as desired.  The other host is running pixiecore and serves up the ISO image over FTP for automated installs.

## General Use

You should be able to cd into the "distribution" folder and then

```
make install
make run
```

You will have a pixiecore instance running serving content to hosts netbooting.  


## Centos7

Centos7 is tested and works in the environment described above.  The scripts are written to assume that the pixiecore host is at 192.168.3.1 so if your network is different you'll need to make a few edits.

The kickstarter file does a basic install, sets up a user and adds that user to sudoers with no password option.  The user password is in plain text - I recommend you change it.  The one I am using is for internal network use for my own reasons and is not exposed to the Internet ever.  Likewise there is a public and private key in the repo.  Use your own - they are there just as an example.

## Ubuntu

BROKEN.  UNTESTED.  DO NOT USE YET.  It needs some TLC.  I needed to get Centos7 up and running first so it got more love.  Ubuntu is my preferred solution, but I need time.  And there was something wrong with the preseed file too that needs troubleshooting.

## License

Use at your own risk.  These are not licensed nor are they fit for any purpose other than my own.  Sharing in the hope that it might help educate someone else or be useful.



