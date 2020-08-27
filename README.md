# fifthcontinent.io

The site files for fifthcontinent.io, including a make file and some server config files to help with deployment to our raspberry pi nano server as detailed [here](https://fifthcontinent.io/2020/06/22/how-to-run-a-website-on-a-tiny-server.html)

## Setup for deployment

Provide a file .env with your server's local ip address and chosen ssh port, eg.

```bash
IP_ADDRESS=10.0.1.18
PORT=22
```

## Development server

```
jekyll serve content
```

## Find the IP address

If you follow the steps and get your raspberry pi on the network, use this command to find it's IP address

```bash
sudo nmap -sP 10.0.1.0/24   
```