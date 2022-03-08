apt-get upgrade -y
apt-get install vim gdb -y
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
apt-get install gem -y
