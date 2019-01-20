#!/bin/bash
#docker-install
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker `whoami`
sudo rm -f get-docker.sh
#docker-compose-install
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#install-goland
go_ver=1.11.4
curl -L https://storage.googleapis.com/golang/go$go_ver.linux-amd64.tar.gz -o go.tar.gz
tar -C $HOME -xzf go.tar.gz
mv $HOME/go $HOME/.go
echo 'export PATH=$PATH:$HOME/.go/bin' >> $HOME/.bashrc
rm -f go.tar.gz
#install node
node_ver=v8.9.0
curl -L https://nodejs.org/dist/$node_ver/node-$node_ver-linux-x64.tar.xz -o node.tar.xz
tar -C $HOME -xJf node.tar.xz
mv $HOME/node-* $HOME/.nvm
echo '#export node_js path' >> $HOME/.bashrc
echo 'export PATH=$PATH:$HOME/.nvm/bin' >> $HOME/.bashrc
rm -f node.tar.xz
`. $HOME/.bashrc`
#npm update
npm install npm@5.6.0 -g
#get farbic bootstrap.sh
fabric_ver=1.3
fabric=1.3.0
ca=1.3.0
part=0.4.12
#if use 1.3 well be 1.3.0 1.3.0 0.4.12
curl -L curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/release-$fabric_ver/scripts/bootstrap.sh -o bootstrap.sh
sudo chmod 755 bootstrap.sh
#start bootstrap.sh to clone fabric and pull image
sudo ./bootstrap.sh $fabric $ca $part
echo 'PATH=$PATH:$HOME/fabric-samples/bin' >> $HOME/.bashrc
`. $HOME/.bashrc`
