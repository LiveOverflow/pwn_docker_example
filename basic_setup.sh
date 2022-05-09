apt-get upgrade -y
apt-get install vim gdb git -y
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
apt-get install rubygems -y
gem install one_gadget
