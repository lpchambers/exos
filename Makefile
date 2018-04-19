ASM=nasm

.PHONY: clean iso

exos.bin : exos.asm
	nasm -f bin -o exos.bin exos.asm

iso : exos.iso

exos.iso : exos.bin exos_iso
	genisoimage -o exos.iso -b exos.flp exos_iso/

exos_iso : exos.flp
	mkdir -p exos_iso
	cp exos.flp exos_iso

exos.flp : mikeos.flp exos.bin
	cp mikeos.flp exos.flp
	dd status=noxfer conv=notrunc if=exos.bin of=exos.flp

clean :
	rm -f exos.bin exos.iso exos.flp
	rm -rf exos_iso
