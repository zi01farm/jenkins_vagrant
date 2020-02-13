wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install default-jdk -y
sudo apt-get install jenkins -y
sudo apt-get install nginx -y
sudo unlink /etc/nginx/sites-enabled/default
sudo ln -s /home/ubuntu/synced/reverse-proxy.conf /etc/nginx/sites-available/reverse-proxy.conf
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo service nginx restart
sudo ufw allow OpenSSH
sudo ufw allow 80
