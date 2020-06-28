# sudo docker build -t system_health_check .
# sudo docker run -d -p 1024:1024 --rm -it system_health_check

FROM ubuntu:19.10

RUN apt-get update

RUN useradd -d /home/ctf/ -m -p ctf -s /bin/bash ctf
RUN echo "ctf:ctf" | chpasswd

WORKDIR /home/ctf

COPY system_health_check .
COPY flag .
COPY ynetd .

RUN chown -R root:root /home/ctf

USER ctf
EXPOSE 1024
CMD ./ynetd -p 1024 ./system_health_check
