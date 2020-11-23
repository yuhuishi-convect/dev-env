#! /usr/bin/env bash


# package upates

sudo apt-get update && \
    apt-get upgrade -y

# some essential packages
sudo apt-get install -y build-essential git zsh curl wget tmux htop jq httpie

# workdir
mkdir -p $HOME/provision/workdir
cd $HOME/provision/workdir

# oh-my-zsh

# tmux
echo 'Installing tmux conf ... '
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# setup the paths
echo 'export PATH=$PATH:/usr/local/go/bin:/opt/miniconda/bin:/usr/local/kub' >> ~/.bash_profile
source ~/.bash_profile

# docker
echo 'Installing docker ... '
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker $USER

# go
echo 'Installing go language ... '
GOLANG_PKG_URL=https://golang.org/dl/go1.15.5.linux-amd64.tar.gz

wget $GOLANG_PKG_URL -O golang.tar.gz
sudo tar xvf golang.tar.gz -C /usr/local

# kubebuilder
echo 'Installing kubebuilder ... '
os=$(go env GOOS)
arch=$(go env GOARCH)
curl -L https://go.kubebuilder.io/dl/2.3.1/${os}/${arch} | tar -xz -C /tmp/
sudo mv /tmp/kubebuilder_2.3.1_${os}_${arch} /usr/local/kubebuilder

# kind cluster
echo 'Install kindcluster'
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# kubectl
echo 'Installing kubectl ... '
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# skaffold
echo 'Installing skaffold ... '
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
sudo install skaffold /usr/local/bin/


# miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda.sh
sudo bash ./miniconda.sh -b -p /opt/miniconda
sudo chown -R $USER /opt/miniconda

echo 'DONE!'