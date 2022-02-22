# pwn_docker_example
Example pwnable CTF challenge hosted with docker. We used this code to run a challenge in a server setup with docker, and then use a docker container as a CTF OS to write and run the exploit.

- [Introduction to Docker for CTFs](https://www.youtube.com/watch?v=cPGZMt4cJ0I)
- [Solving This Pwnable CTF Challenge](https://www.youtube.com/watch?v=OqTpc_ljPYk)

# Related Binary Exploitation Resources:

- [Developing an Intuition for Binary Exploitation](https://www.youtube.com/watch?v=akCce7vSSfw)
- [Working with PIE binaries](https://www.youtube.com/watch?v=pphfcaGnWSA)
- [Another simple buffer overflow challenge](https://www.youtube.com/watch?v=oS2O75H57qU)

There is also a whole playlist using challenges from https://exploit.education. Later episodes explore some 64bit challenges and goes over various pitfalls:

- [Full Playlist](https://www.youtube.com/watch?v=iyAyN3GFM7A&list=PLhixgUqwRTjxglIswKp9mpkfPNfHkzyeN)

# More Docker Videos
- [How Docker Works - Intro to Namespaces](https://www.youtube.com/watch?v=-YnMr1lj4Z8)
- [Deepdive Containers - Kernel Sources and nsenter](https://www.youtube.com/watch?v=sHp0Q3rvamk)

# Improvement

Build the ctf container(s), and start with ```docker run --rm -it -v `pwd`:/home/pwntools pwn tmux``` (Credits for the great and simple Dockerfile, tmux config and geff for pwn: https://github.com/Z6543/hackersuli_pwntools)
If you run the containers on remote vps, you can use code-server to edit the code in you browser: ```docker run -it --rm --name code-server -d -p 8081:8080 \
  -v "`pwd`/.vs-config:/root/.config" \
  -v "`pwd`:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest```
