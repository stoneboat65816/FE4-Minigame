//#########################
//              VECTOR SECTION
//###########################
_reset:
	SEI
	CLC
	XCE
	SEP #$20
	JML +
+
	PHK
	PLB
	LDA.b #(mode_init)>>16
	STA {main_jump}+2
	REP #$30
	LDA #(mode_init)
	STA {main_jump}
	STZ {mode}
	STZ {nmi_mode}
	STZ {irq_mode}
	LDX #$1FFF
	TXS
	JML [{main_jump}]	
main_loop:
	REP #$30
	JSL wait_vblank
	JSL wait_end_vblank
	LDA {mode}
	ASL
	TAX
	JSR (write_mode,x)
	JML [{main_jump}]
	
write_mode:
	dw write_mode00
	dw write_mode01
write_mode00:
	SEP #$20
	LDA.b #(main_sm)>>16
	STA {main_jump}+2
	REP #$20
	LDA #(main_sm)
	STA {main_jump}
	RTS
write_mode01:
	SEP #$20
	LDA.b #(main_title1)>>16
	STA {main_jump}+2
	REP #$20
	LDA #(main_title1)
	STA {main_jump}
	RTS
		
_irq:
	REP #$30
	JML +
+
	PHB
	PHD
	PHA
	PHX
	PHY
	PHP
	PHK
	PLB
	LDA #$0000
	TCD
	SEP #$20
	LDA $4211
	BIT #$80
	BEQ +
	REP #$20
	LDA {irq_mode}
	ASL
	TAX
	JSR (irq_jump,x)
+
	PLP
	PLY
	PLX
	PLA
	PLD
	PLB
	RTI
irq_jump:
	dw irq_0
	dw irq_1
    dw irq_2

_nmi:
	REP #$30
	JML +
+
	PHB
	PHD
	PHA
	PHX
	PHY
	PHP
	LDA #$0000
	TCD
	PHK
	PLB
	SEP #$20
	LDA $4210
	REP #$20
	LDA.b {nmi_mode}
	ASL
	TAX
	JSR (nmi_jump,x)
	INC.b {wait_flag}
	INC.b {blank_frame_count}
	JSL restore_kido
	PLP
	PLY
	PLX 
	PLA 
	PLD
	PLB
	RTI
	
nmi_jump:
	dw nmi_0
	
_break:
_cop:
_abort:
	STP

nmi_0:
	SEP #$20
	LDA #$80
	STA $2100
	REP #$20
	LDA {dma_oam_flag}
	BEQ +
	JSL nmi_dma
	JSL dma_oam_table
+
	JSL write_ppu
	JSL check_sfx
	JSL check_song
	JSL polling_input
	RTS
nmi_title:
	SEP #$20
	LDA #$80
	STA $2100
	REP #$20
	JSL nmi_dma
	JSL dma_oam_table
	JSL write_ppu
	JSL check_sfx
	JSL check_song
	RTS	
	
irq_0:
irq_2:
	RTS

irq_1:
	SEP #$20
	LDA #$1F
	STA $2132
	LDA #$67
	STA $2132
	LDA #$45
	STA $2132
	LDA #$20
	STA $2130
	LDA #$B3
	STA $2131
	LDA #$00
	STA $2126
	LDA #$FF
	STA $2127
	LDA #$00
	STA $2128
	LDA #$FF
	STA $2129
	LDA #$C0
	STA $2125
	LDA #$04
	STA $212B
	REP #$20
	STZ {irq_mode}
	RTS
		
