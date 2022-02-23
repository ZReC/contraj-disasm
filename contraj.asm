;-------------------------------------------------------------------------------
; "Contra (J)" wannabe disassembly
;
; Current status:
;   [x] It reassembles into a 1:1 perfect clone
;   [ ] Documentation (progress 0%)
;
; Acknowledgment:
; - Loopy and their extremely handy assembler "asm6"
; - Frantik and their wonderful disassembler "disasm6"
; - The team behind https://fceux.com/
; - The community of https://www.nesdev.org/ and its wiki
; - Those I forgot to thank, I apologize
;
; 2022 ZReC & many others
;-------------------------------------------------------------------------------
    .base 0
	.db $4e, $45, $53, $1a	; "NES\x1a" signature
	.db $08                 ; 8x  16KB prg
	.db $10                 ; 16x 8KB  chr
	.db $70, $10            ; mapper 23 VRC2b (See: https://wiki.nesdev.org/w/index.php?title=INES_Mapper_023)

	.pad $10, 0

;-------------------------------------------------------------------------------
; ASM INCLUDES
;-------------------------------------------------------------------------------
	.base $8000
	include prg/prg0.asm
	.base $8000
	include prg/prg1.asm
	.base $8000
	include prg/prg2.asm
	.base $8000
	include prg/prg3.asm
	.base $8000
	include prg/prg4.asm
	.base $8000
	include prg/prg5.asm
	.base $8000
	include prg/prg6.asm
	.base $C000
	include prg/prg7.asm

;-------------------------------------------------------------------------------
; CHR ROM BEGINS
;-------------------------------------------------------------------------------
	incbin chr/chr00.chr
	incbin chr/chr01.chr
	incbin chr/chr02.chr
	incbin chr/chr03.chr
	incbin chr/chr04.chr
	incbin chr/chr05.chr
	incbin chr/chr06.chr
	incbin chr/chr07.chr
	incbin chr/chr08.chr
	incbin chr/chr09.chr
	incbin chr/chr10.chr
	incbin chr/chr11.chr
	incbin chr/chr12.chr
	incbin chr/chr13.chr
	incbin chr/chr14.chr
	incbin chr/chr15.chr
