# original ROM SHA3-256 checksum
checksum = 545829e080b3ac6fdb311dde348d6d85a6c340237346df600a43cfb80d537481

out_dir  = out/
asm_path = ${out_dir}asm6
rom_path = $(out_dir)contraj.nes

run: dir asm rom
rom:
	@$(asm_path) -q contraj.asm ${rom_path} && echo "ROM file '${rom_path}' created" || (echo "Cannot assemble (exit code $$?)"; exit 1)
	@if [ $$(openssl dgst -sha3-256 ${rom_path} | awk '{print $$2}') != "${checksum}" ]; then\
		echo "Checksum failed, the resulting ROM is not a 1:1 perfect copy of the original"; exit 1; fi
dir:
	@test -d ${out_dir} || mkdir -v ${out_dir}
asm:
	@test -f ${asm_path} || gcc asm6/asm6.c -o ${asm_path}
clean:
	@rm -rfv out
