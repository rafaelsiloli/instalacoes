echo '# abrindo a pasta de downloads'
cd ~/Downloads

echo '# instalando docker'

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker your-user


echo '# instalando kubectl'

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo apt-get install bash-completion -y

echo '# instalando bash completion for kubectl'
type _init_completion
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc

echo '# instalando kvm'
#https://help.ubuntu.com/community/KVM/Installation

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
sudo chown root:libvirtd /dev/kvm
modprobe -a kvm
sudo apt install -y virt-manager

echo '# instalando minikube'
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/






