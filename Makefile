SOURCE_IMAGE ?= "/home/pi/fifthcontinent/image.jpg"
TARGET_CSS ?= "/home/pi/fifthcontinent/html/content/_site/assets/css/styles.css"
IP_ADDRESS ?= "10.0.1.155"
PORT ?= "385"


serverconf:
	scp -P ${PORT} nginx.conf pi@${IP_ADDRESS}:/home/pi/fifthcontinent/
	ssh -p ${PORT} pi@${IP_ADDRESS} 'sudo /etc/init.d/nginx restart'

certbot:
	ssh -p ${PORT} pi@${IP_ADDRESS} 'sudo apt-get update && sudo apt-get install -y python-certbot-nginx'
	ssh -p ${PORT} pi@${IP_ADDRESS} 'sudo certbot --nginx --non-interactive --agree-tos -m kip@fifthcontinent.io -d fifthcontinent.io -d www.fifthcontinent.io'

deploy:
	cd content && jekyll build && cd ../
	scp -P ${PORT} -r content/_site/* pi@${IP_ADDRESS}:/home/pi/fifthcontinent/html/
	scp  -P ${PORT} -r content/_site/assets/**/* pi@${IP_ADDRESS}:/home/pi/fifthcontinent/html/assets/

requirements:
	pipenv lock -r > requirements.txt
	ssh -p ${PORT} pi@${IP_ADDRESS} 'pip3 install -r /home/pi/fifthcontinent/requirements.txt'

sampler:
	scp  -P ${PORT} requirements.txt pi@${IP_ADDRESS}:/home/pi/fifthcontinent/
	scp  -P ${PORT} camera/sampler.py pi@${IP_ADDRESS}:/home/pi/fifthcontinent/
	ssh -p ${PORT} pi@${IP_ADDRESS} 'export SOURCE_IMAGE=${SOURCE_IMAGE} && export TARGET_CSS=${TARGET_CSS}'
	ssh -p ${PORT} pi@${IP_ADDRESS} 'python3 /home/pi/fifthcontinent/sampler.py'

ssh_config:
	scp  -P ${PORT} server/sshd_config pi@${IP_ADDRESS}:/home/pi/sshd_config
	ssh  -p ${PORT} pi@${IP_ADDRESS} 'sudo mv /home/pi/sshd_config /etc/ssh/sshd_config && sudo systemctl restart sshd'
