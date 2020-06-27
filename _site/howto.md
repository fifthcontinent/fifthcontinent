# How to build a website and run it on a tiny server

## Setting up raspberry pi

- Install OS - flashing onto a memory stick
- Get it on WiFi
- SSH in
- Copy private key
- Configure firewall - ufw
- 


## Sudo commands I ran

Jun 19 12:16:07 raspberrypi sudo[18599]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/sbin/wpa_cli
Jun 19 12:17:43 raspberrypi sudo[18624]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/sbin/iwlist wlan0 scan
Jun 19 12:18:51 raspberrypi sudo[18650]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/cat /etc/wpa_supplicant/wpa_supplicant.conf
Jun 19 12:21:26 raspberrypi sudo[18670]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/bash
Jun 19 12:23:01 raspberrypi sudo[18683]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/nano /etc/wpa_supplicant/wpa_supplicant.conf
Jun 19 13:33:21 raspberrypi sudo[19472]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/bin/mv /home/pi/sshd_config /etc/ssh/sshd_config
Jun 19 13:33:21 raspberrypi sudo[19471]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/bin/systemctl restart sshd
Jun 19 13:33:33 raspberrypi sudo[19521]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/bin/mv /home/pi/sshd_config /etc/ssh/sshd_config
Jun 19 13:33:33 raspberrypi sudo[19520]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/bin/systemctl restart sshd
Jun 19 13:56:39 raspberrypi sudo[19696]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/bin/apt-get update
Jun 19 13:57:36 raspberrypi sudo[19858]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/bin/apt-get install ufw
Jun 19 14:02:48 raspberrypi sudo[20416]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/etc/init.d/nginx restart
Jun 19 15:11:46 raspberrypi sudo[20571]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw status
Jun 19 15:12:12 raspberrypi sudo[20586]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw default allow outgoing
Jun 19 15:12:24 raspberrypi sudo[20598]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw default deny incoming
Jun 19 15:13:40 raspberrypi sudo[20608]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw allow from 10.0.1.0/24 to any port 22
Jun 19 15:13:49 raspberrypi sudo[20636]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw enable
Jun 19 15:15:01 raspberrypi sudo[20793]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw allow from 10.0.1.0/24 to any port 385
Jun 19 15:15:12 raspberrypi sudo[20865]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw enable
Jun 19 15:16:20 raspberrypi sudo[20995]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw allow http
Jun 19 15:16:25 raspberrypi sudo[21031]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/ufw allow https
Jun 19 15:16:48 raspberrypi sudo[21067]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/bin/apt-get install certbot
Jun 20 12:16:28 raspberrypi sudo[24834]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/etc/init.d/nginx restart
Jun 20 12:17:07 raspberrypi sudo[24903]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/bin/certbot --nginx -d fifthcontinent.io -d www.fifthcontinent.io
Jun 20 12:18:21 raspberrypi sudo[24920]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/bin/apt-get install python-certbot-nginx
Jun 20 12:19:29 raspberrypi sudo[25006]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/bin/certbot --nginx -d fifthcontinent.io -d www.fifthcontinent.io
Jun 21 11:54:55 raspberrypi sudo[28169]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/etc/init.d/nginx restart
Jun 21 11:55:22 raspberrypi sudo[28250]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/etc/init.d/nginx restart
Jun 21 12:07:02 raspberrypi sudo[28375]:       pi : TTY=unknown ; PWD=/home/pi ; USER=root ; COMMAND=/etc/init.d/nginx restart
Jun 21 12:23:44 raspberrypi sudo[28470]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/usr/sbin/iptables -L
Jun 21 12:27:00 raspberrypi sudo[28501]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/grep sudo /var/log/secure
Jun 21 12:27:08 raspberrypi sudo[28510]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/journalctl _COMM=sudo
Jun 21 12:27:23 raspberrypi sudo[28521]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/journalctl _COMM=sudo
Jun 21 12:27:29 raspberrypi sudo[28531]:       pi : TTY=pts/0 ; PWD=/home/pi ; USER=root ; COMMAND=/bin/journalctl _COMM=sudo
wpa_passphrase "Fifth Continent WiFi" dubfts728r1d >>  /etc/wpa_supplicant/wpa_supplicant.conf