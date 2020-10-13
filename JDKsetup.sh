sudo apt update -y
sudo apt upgrade -y
sudo apt --fix-broken install

sudo apt install default-jre -y
sudo apt install default-jdk -y
sudo update-alternatives --config java -y
java --version
echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" | sudo tee -a /etc/profile

source /etc/profile

echo "export PATH=$PATH:$JAVA_HOME/bin" | sudo tee -a /etc/profile
echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar" | sudo tee -a /etc/profile

source /etc/profile

sudo apt update -y
sudo apt install maven -y

mvn --version