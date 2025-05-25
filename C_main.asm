arch snes.cpu
hirom 

org $000000
fill $400000, $00

	incsrc "C_header.asm"
org $808000
	incsrc "C_vector.asm"
	incsrc "C_sound.asm"
	incsrc "C_dma.asm"
	incsrc "C_input.asm"
	incsrc "C_function.asm"
org $818000
	incsrc "C_oam.asm"
	incsrc "C_decomp.asm"
	incsrc "C_event.asm"	
	incsrc "C_background.asm"
	
org $828000
	incsrc "C_mode.asm"
	incsrc "C_kaiwa.asm"
	incsrc "C_incbin.asm"

