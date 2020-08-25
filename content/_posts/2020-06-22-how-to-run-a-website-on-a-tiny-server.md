---
layout: post
excerpt: This website (fifthcontinent.io) is running on a tiny web server, a RaspberyPi Zero. This article explains how we set it up.
image:  /assets/img/pi.jpg
image_alt: A tiny web server
---


This website (fifthcontinent.io) is running on a tiny web server, a [RaspberyPi Zero](https://www.raspberrypi.org/products/raspberry-pi-zero/). It looks like this:

{% include image.html url="/assets/img/pi.jpg" description="A tiny web server" %}

It's an unusual choice, what with space on netlify or AWS being super cheap and generally easy to use, but there's a joy to running your own server that sits on your windowsill. The limitations of it are a good thing too, they make you think hard about what you really need.

Here's how we set it up.

### Set up your raspberry PI

First step is to get an operating system onto the rapsberry Pi's SD card. [Raspberry Pi Imager](https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up/2) is the easiest way, you just need a computer with an SSD card reader. There are a few versions of the Raspbian OS available, Raspberry Pi OS (32-bit) Lite is  a good choice for a web server.

Whilst you have your SD card plugged into your laptop, you can get it ready to join your network. 

Create an empty file called "ssh" in the root folder on the SD card. That will enable SSH when you first boot the RapsberyryPi. 

Next, create a file `wpa_supplicant.conf`, and add your wifi network details:

```bash
#wpa_supplicant.conf
country=gb
update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
 scan_ssid=1
 ssid="networkSSID"
 psk="password123"
}

```

Changing the network name, password and country code as necessary.

### SSH in

You should be ready to go now, so plug the sd card in the Pi and switch it on. All being well, your raspberry pi will boot raspbian, open ssh connections and connect to your wifi network. 

Next, find your raspberry pi's ip address. Quite likely your router has an interface where you can find out which ip address has been allocated, or you can use nmap. 

```
sudo nmap -sP 10.0.1.0/24
```

replacing 10.0.1.0/24 with your network range. You'll see something like this:

```
Nmap scan report for 10.0.1.123
Host is up (0.32s latency).
MAC Address: AB:CD:EF:GH:12:34 (Raspberry Pi Foundation
```
That's your address, so you can ssh in:

```bash
ssh pi@10.0.1.123
```

The default password is "raspberry"

### Setting things up

Change the password

```bash
# on the server
passwd
><whatever>
```

and copy over your key.


```bash
# locally
ssh-copy-id  pi@<ip address>
```

You can ssh in now, and tighten up the ssh config a little, turning off password logins and changing the port number to put off the most basic attacks. I'm using this config

```bash
Protocol 2
Port 1234
PermitRootLogin prohibit-password
MaxAuthTries 6
PasswordAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding no
PrintMotd no
AcceptEnv LANG LC_*
Subsystem	sftp	/usr/lib/openssh/sftp-server

```
Change the port number to your chosen one. 


### Install a web server

Nginx is a good choice, and we'll add a package to set up https with Letsencrpyt

```bash
sudo apt-get update && sudo apt-get install nginx python-certbot-nginx
```

If you visit your server's ip address now, you should see the nginx default page. 

```
# myserver.conf
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /home/myserver/html/;

	index index.html;

	server_name myserver.com www.myserver.com;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

}
```

### Open up to the world

This bit changes depending on your router and ISP so it's hard to give instructions, but the general idea is to find the setting on your router that directs all incoming requests to an IP address on your network, it's often called a DMZ. The next step is to add an A record to your domain name to point to your public IP address. If your ISP doesn't provide a fixed IP, you'll have to do a bit more work to set up dynamic DNS, there are a bunch of services around that provide this. 

When that's in place, you can set up https certificates with the Letsencrypt bot:

```bash
sudo certbot --nginx --non-interactive --agree-tos -m me@mydomain.com -d mydomain.com -d www.mydomain.com
```


### Other things

You should configure a firewall on your little server, and maybe run fail2ban as well or something similar, along with lots of other refinements, but this will get you started.

You can see our repo for this site at <>, which has some ideas for automating set up and deployment with a make file. 


## References

- https://www.raspberrypi.org/products/raspberry-pi-zero/
