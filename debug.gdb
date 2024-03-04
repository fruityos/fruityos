target remote | qemu-system-x86_64 -d int,cpu_reset -D ./log.txt -S -gdb stdio -m 16 -boot c -fda fruityos.img
b *0x7c00
b *0x10100
c
layout asm

