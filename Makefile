ASM=nasm

exos.bin : exos.asm
	nasm -f bin -o exos.bin exos.asm
