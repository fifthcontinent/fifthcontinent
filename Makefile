include .env

SOURCE_IMAGE ?= "/home/pi/fifthcontinent/image.jpg"
TARGET_CSS ?= "/home/pi/fifthcontinent/html/content/_site/assets/css/styles.css"

setup:
	ssh -p ${PORT} pi@${IP_ADDRESS} 'sudo apt-get update && sudo apt-get install -y nginx python-certbot-nginx'

serverconf:
	scp -P ${PORT} server/nginx.conf pi@${IP_ADDRESS}:/home/pi/fifthcontinent/
	ssh -p ${PORT} pi@${IP_ADDRESS} 'sudo /etc/init.d/nginx restart'

certbot:
	ssh -p ${PORT} pi@${IP_ADDRESS} 'sudo certbot --nginx --non-interactive --agree-tos -m kip@fifthcontinent.io -d fifthcontinent.io -d www.fifthcontinent.io'

deploy:
	cd content && jekyll build && cd ../
	scp -P ${PORT} -r content/_site/* pi@${IP_ADDRESS}:/home/pi/fifthcontinent/html/
	scp  -P ${PORT} -r content/_site/assets/**/* pi@${IP_ADDRESS}:/home/pi/fifthcontinent/html/assets/

requirements:
	pipenv lock -r > requirements.txt
	ssh -p ${PORT} pi@${IP_ADDRESS} 'pip3 install -r /home/pi/fifthcontinent/requirements.txt'

ssh_config:
	scp  -P ${PORT} server/sshd_config pi@${IP_ADDRESS}:/home/pi/sshd_config
	ssh  -p ${PORT} pi@${IP_ADDRESS} 'sudo PORT=${PORT} envsubst < /home/pi/sshd_config > /etc/ssh/sshd_config && sudo systemctl restart sshd'