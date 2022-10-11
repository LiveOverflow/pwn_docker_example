# docker build -t ctf:latest .
# docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu
# docker exec -it ctf /bin/bash

# If using Windows
      # docker run --rm -v %cd%:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu
# If using Linux    
      # docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu


FROM ubuntu:22.04
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch
RUN apt-get install -y python3 python3-dev libssl-dev
RUN apt-get install -y libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt-get install -y python3-pip
RUN pip install capstone requests pwntools r2pipe 
RUN pip3 install pwntools keystone-engine unicorn capstone ropper
RUN mkdir tools && cd tools
RUN git clone https://github.com/JonathanSalwan/ROPgadget
RUN git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh 
RUN cd .. && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh
RUN gem install one_gadget
