# docker build -t ctf:ubuntu19.10 .
# If using Windows
      # docker run --rm -v %cd%:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# If using Linux    
      # docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash

FROM ubuntu:22.04

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
      apt-get update && \
      apt-get install -y build-essential jq strace ltrace curl rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386 

RUN pip install capstone requests pwntools r2pipe 

RUN pip3 install pwntools keystone-engine unicorn capstone ropper

WORKDIR /tools

RUN git clone https://github.com/JonathanSalwan/ROPgadget 

RUN git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh 

WORKDIR /tools

RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh 

WORKDIR /tools

RUN gem install one_gadget