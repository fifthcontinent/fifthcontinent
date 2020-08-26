## Setup

Provide a file .env with your local ip address and chosen ssh port, eg.

```bash
IP_ADDRESS=10.0.1.18
PORT=22
```

## Development server

```
cd content && jekyll serve
```

## Find the server

```bash
sudo nmap -sP 10.0.1.0/24   
```