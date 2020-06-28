---
layout: post
---

This website (fifthcontinent.io) is running on a tiny web server, a raspberyPi Nano. 

### Set up your raspberry PI


## SSH in


Find your port
```
sudo nmap -sP 10.0.1.0/24
```

You'll see something like this:

```
Nmap scan report for 10.0.1.x
Host is up (0.32s latency).
MAC Address: AB:CD:EF:GH:12:34 (Raspberry Pi Foundation
```

### Get on wifi (if you have to)

You can see available networks with 

```bash
wlan0 scan
```
- Install OS - flashing onto a memory stick
- Get it on WiFi
- SSH in
- Copy private key
- Configure firewall - ufw
- 