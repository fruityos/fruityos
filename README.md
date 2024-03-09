# memory map

	0x000500 - 0x010000
	0x010000 - 0x040000 192k kernel space
	0x040000 - 0x080000 256k application space
	0x100000 - 0x200000 kernel heap
	0x200000 - 0x?????? application heap

TODO:
	write sys_rename
	map more memory for application heap
	make getch support backspace (line buffer)
