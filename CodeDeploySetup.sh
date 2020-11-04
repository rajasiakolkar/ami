sudo apt-get update -y
sudo apt upgrade -y
sudo apt-get install -y ruby
sudo apt-get install -y wget
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto