# memory map

	0x000500 - 0x010000
	0x010000 - 0x040000 192k kernel space
	0x040000 - 0x080000 256k application space
	0x100000 - 0x200000 1M ramdisk

Bootloader loads and decompresses kernel then bootloader passes pointer to initrd to kernel

	1. kernel formats ramfs
	2. kernel unpacks initrd into ramfs
	3. ramfs uses fixed 512b blocks with pointers at end to next block
