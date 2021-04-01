# docker build -t ctf:ubuntu19.10 .
# If using Windows
      # docker run --rm -v %cd%:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# If using Linux    
      # docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash

FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386

# Configure apt-get with ubuntu archive repo
RUN rm /etc/apt/sources.list
COPY sources.list /etc/apt/
RUN apt-get update

# install sudo command (needed by pwndbg setup script :/)
RUN apt-get install -y sudo

# Install basic tools and dependencies via apt-get
RUN apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip libc6:i386 libncurses5:i386 libstdc++6:i386 make libreadline-dev libgc-dev gettext libjson-c-dev libtool flex bison pkg-config texinfo autopoint help2man gawk pwgen socat

# Install basic pwning tools via pipy
RUN pip install capstone requests pwntools r2pipe
RUN pip3 install pwntools keystone-engine unicorn capstone ropper

# Install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg
RUN cd pwndbg && git checkout stable && ./setup.sh

# Install radare2 and ROPgadget into dedicated tools directory
RUN mkdir tools && \
cd tools && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && \
cd radare2 && \
sys/install.sh

# Install map + cat
RUN sudo apt-get install -y nmap ncat

# Install poke
RUN wget https://ftp.gnu.org/gnu/poke/poke-1.1.tar.gz && tar xf poke-1.1.tar.gz
WORKDIR /poke-1.1
RUN sed -i 's#glob (fname,#/* disarm glob :^) */ 1 || glob (fname,#' poke/pk-cmd.c
RUN sed -i '61a return 1; /* disarm pk_cmd_doc :^) */' poke/pk-cmd-misc.c
RUN mkdir build && cd build && ../configure --prefix=/usr CFLAGS="-g -static" && make -j$(nproc) && make install

# Install one_gadget
RUN gem install one_gadget
