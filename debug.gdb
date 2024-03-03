target remote | qemu-system-x86_64 -S -gdb stdio -m 16 -boot c -fda fruityos.img
b *0x7c00
b *0x10000
c
layout asm

