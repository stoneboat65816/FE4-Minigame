//##############################
// SECTION OAM
//#############################
clear_oam:
	PHP
	PHB
	SEP #$30
	LDA #$7E
	PHA
	PLB
	LDX #$60
-
	LDA #$E0
	STA.w {oam_table}+1,x
	STA.w {oam_table}+5,x
	STA.w {oam_table}+9,x
	STA.w {oam_table}+13,x
	STA.w {oam_table}+17,x
	STA.w {oam_table}+21,x
	STA.w {oam_table}+25,x
	STA.w {oam_table}+29,x
	
	STA.w {oam_table}+129,x
	STA.w {oam_table}+133,x
	STA.w {oam_table}+137,x
	STA.w {oam_table}+141,x
	STA.w {oam_table}+145,x
	STA.w {oam_table}+149,x
	STA.w {oam_table}+153,x
	STA.w {oam_table}+157,x
	
	STA.w {oam_table}+257,x
	STA.w {oam_table}+261,x
	STA.w {oam_table}+265,x
	STA.w {oam_table}+269,x
	STA.w {oam_table}+273,x
	STA.w {oam_table}+277,x
	STA.w {oam_table}+281,x
	STA.w {oam_table}+285,x
	
	STA.w {oam_table}+385,x
	STA.w {oam_table}+389,x
	STA.w {oam_table}+393,x
	STA.w {oam_table}+397,x
	STA.w {oam_table}+401,x
	STA.w {oam_table}+405,x
	STA.w {oam_table}+409,x
	STA.w {oam_table}+413,x	
	TXA
	SEC
	SBC #$20
	TAX
	BPL -
	LDX #$20
	LDA #$00
-
	STA.w {oam_table2},x
	DEX
	BPL -
	PLB
	PLP
	RTL
	
init_oam_ypos:
	PHD
	SEP #$30
	LDA.w {oam_table_bak}+1
	AND #$03
	ASL
	TAX
	JSR (init_table,x)
	REP #$30
	STZ.w {oam_table_bak}
	PLD
	RTL
init_table:
	dw _80828A
	dw _8082A8
	dw _808340
	dw _808340

_80828A:
	REP #$20
	LDX #$F0
	PHD
	LDA #({oam_table})+0x0100
	TCD
	JSR init_y_oam
	PLD
	LDA {oam_table_bak}
-
	LSR
	CLC
	ADC #(init_y_oam)
	STA.b {buffer0}
	LDA #({oam_table})
	TCD
	JMP.w ({buffer0})
	
_8082A8:
	REP #$20
	LDX #$F0
	LDA.w {oam_table_bak}
	AND #$00FF
	BRA -

init_y_oam:
	STX.b {buffer0}+1
	STX.b {buffer0}+5
	STX.b {buffer0}+9
	STX.b {buffer0}+0x0D
	STX.b {buffer0}+0x11
	STX.b {buffer0}+0x15
	STX.b {buffer0}+0x19
	STX.b {buffer0}+0x1D
	STX.b {buffer0}+0x21
	STX.b {buffer0}+0x25
	STX.b {buffer0}+0x29
	STX.b {buffer0}+0x2D
	STX.b {buffer0}+0x31
	STX.b {buffer0}+0x35
	STX.b {buffer0}+0x39
	STX.b {buffer0}+0x3D
	STX.b {buffer0}+0x41
	STX.b {buffer0}+0x45
	STX.b {buffer0}+0x49
	STX.b {buffer0}+0x4D
	STX.b {buffer0}+0x51
	STX.b {buffer0}+0x55
	STX.b {buffer0}+0x59
	STX.b {buffer0}+0x5D
	STX.b {buffer0}+0x61
	STX.b {buffer0}+0x65
	STX.b {buffer0}+0x69
	STX.b {buffer0}+0x6D
	STX.b {buffer0}+0x71
	STX.b {buffer0}+0x75
	STX.b {buffer0}+0x79
	STX.b {buffer0}+0x7D
	STX.b {buffer0}+0x81
	STX.b {buffer0}+0x85
	STX.b {buffer0}+0x89
	STX.b {buffer0}+0x8D
	STX.b {buffer0}+0x91
	STX.b {buffer0}+0x95
	STX.b {buffer0}+0x99
	STX.b {buffer0}+0x9D
	STX.b {buffer0}+0xA1
	STX.b {buffer0}+0xA5
	STX.b {buffer0}+0xA9
	STX.b {buffer0}+0xAD
	STX.b {buffer0}+0xB1
	STX.b {buffer0}+0xB5
	STX.b {buffer0}+0xB9
	STX.b {buffer0}+0xBD
	STX.b {buffer0}+0xC1
	STX.b {buffer0}+0xC5
	STX.b {buffer0}+0xC9
	STX.b {buffer0}+0xCD
	STX.b {buffer0}+0xD1
	STX.b {buffer0}+0xD5
	STX.b {buffer0}+0xD9
	STX.b {buffer0}+0xDD
	STX.b {buffer0}+0xE1
	STX.b {buffer0}+0xE5
	STX.b {buffer0}+0xE9
	STX.b {buffer0}+0xED
	STX.b {buffer0}+0xF1
	STX.b {buffer0}+0xF5
	STX.b {buffer0}+0xF9
	STX.b {buffer0}+0xFD
_808340:
	RTS
	
init_2nd_oam:
	STZ.w {oam_table2}
	STZ.w {oam_table2}+0x02
	STZ.w {oam_table2}+0x04
	STZ.w {oam_table2}+0x06
	STZ.w {oam_table2}+0x08
	STZ.w {oam_table2}+0x0A
	STZ.w {oam_table2}+0x0C
	STZ.w {oam_table2}+0x0E
	STZ.w {oam_table2}+0x10
	STZ.w {oam_table2}+0x12
	STZ.w {oam_table2}+0x14
	STZ.w {oam_table2}+0x16
	STZ.w {oam_table2}+0x18
	STZ.w {oam_table2}+0x1A
	STZ.w {oam_table2}+0x1C
	STZ.w {oam_table2}+0x1E
	RTL
	
write_oam_table:
	LDA $0000,y	//oam kazu
	BNE +
	RTL
+
	STA.w {oam_kazu}
	INY #2
_8087D1:
	LDX.w {oam_table_bak}
	CLC
_8087D5:
	LDA $0000,y
	BPL _8087F2
	ADC.w {oam_xpos}
	STA.w {oam_table},x
	BIT #$0100
	BNE _808851
	LDA third_oam_table,x
	STA.b {2nd_oam_adr}
	LDA ({2nd_oam_adr})  //oam 2nd table
	ORA second_oam_table+2,x
	BRA _808808
_8087F2:
	ADC.w {oam_xpos}
	STA.w {oam_table},x
	BIT #$0100
	BEQ _80880A
	LDA third_oam_table,x
	STA.b {2nd_oam_adr}
	LDA.b ({2nd_oam_adr})
	ORA second_oam_table,x
_808808:
	STA.b ({2nd_oam_adr})
_80880A:
	LDA $0002,y //oam Y pos
	BIT #$0080
	BNE _808817
	AND #$007F
	BRA _80881A
_808817:
	ORA #$FF80
_80881A:
	CLC
	ADC.w {oam_ypos}
	STA.w {oam_table}+1,x
	ADC #$0010
	CMP #$0100
	BCS _808849
	LDA $0003,y	//oam index, properties
	CLC
	ADC.w {oam_atr1}
	ORA.w {oam_atr2}
	STA.w {oam_table}+2,x
_808833:
	TXA
	CLC 
	ADC #$0004
	AND #$01FF
	TAX
	TYA
	ADC #$0005
	TAY
	DEC.w {oam_kazu}
	BNE _8087D5
	STX.w {oam_table_bak}
	RTL
	
_808849:
	LDA #$00F0
	STA.w {oam_table}+1,x
	BRA _808833
_808851:
	LDA third_oam_table,x
	STA.b ({2nd_oam_adr})
	LDA.b ({2nd_oam_adr})
	ORA third_oam_table+2,x
	BRA _808808
	LDA.w {oam_kazu}
	BEQ _808868
	LDA $0000,y
	BNE _808869
_808868:
	RTL
	
_808869:
	CMP.w {oam_kazu}
	BCS _80886F
	STA.w {oam_kazu}
_80886F:
	INY #2
	JMP _8087D1
	
second_oam_table:
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80

third_oam_table:
db $00, $1E, $03, $00, $00, $1E, $0C, $00, $00, $1E, $30, $00, $00, $1E, $C0, $00
db $00, $1E, $00, $03, $00, $1E, $00, $0C, $00, $1E, $00, $30, $00, $1E, $00, $C0
db $02, $1E, $03, $00, $02, $1E, $0C, $00, $02, $1E, $30, $00, $02, $1E, $C0, $00
db $02, $1E, $00, $03, $02, $1E, $00, $0C, $02, $1E, $00, $30, $02, $1E, $00, $C0
db $04, $1E, $03, $00, $04, $1E, $0C, $00, $04, $1E, $30, $00, $04, $1E, $C0, $00
db $04, $1E, $00, $03, $04, $1E, $00, $0C, $04, $1E, $00, $30, $04, $1E, $00, $C0
db $06, $1E, $03, $00, $06, $1E, $0C, $00, $06, $1E, $30, $00, $06, $1E, $C0, $00
db $06, $1E, $00, $03, $06, $1E, $00, $0C, $06, $1E, $00, $30, $06, $1E, $00, $C0
db $08, $1E, $03, $00, $08, $1E, $0C, $00, $08, $1E, $30, $00, $08, $1E, $C0, $00
db $08, $1E, $00, $03, $08, $1E, $00, $0C, $08, $1E, $00, $30, $08, $1E, $00, $C0
db $0A, $1E, $03, $00, $0A, $1E, $0C, $00, $0A, $1E, $30, $00, $0A, $1E, $C0, $00
db $0A, $1E, $00, $03, $0A, $1E, $00, $0C, $0A, $1E, $00, $30, $0A, $1E, $00, $C0
db $0C, $1E, $03, $00, $0C, $1E, $0C, $00, $0C, $1E, $30, $00, $0C, $1E, $C0, $00
db $0C, $1E, $00, $03, $0C, $1E, $00, $0C, $0C, $1E, $00, $30, $0C, $1E, $00, $C0
db $0E, $1E, $03, $00, $0E, $1E, $0C, $00, $0E, $1E, $30, $00, $0E, $1E, $C0, $00
db $0E, $1E, $00, $03, $0E, $1E, $00, $0C, $0E, $1E, $00, $30, $0E, $1E, $00, $C0
db $10, $1E, $03, $00, $10, $1E, $0C, $00, $10, $1E, $30, $00, $10, $1E, $C0, $00
db $10, $1E, $00, $03, $10, $1E, $00, $0C, $10, $1E, $00, $30, $10, $1E, $00, $C0
db $12, $1E, $03, $00, $12, $1E, $0C, $00, $12, $1E, $30, $00, $12, $1E, $C0, $00
db $12, $1E, $00, $03, $12, $1E, $00, $0C, $12, $1E, $00, $30, $12, $1E, $00, $C0
db $14, $1E, $03, $00, $14, $1E, $0C, $00, $14, $1E, $30, $00, $14, $1E, $C0, $00
db $14, $1E, $00, $03, $14, $1E, $00, $0C, $14, $1E, $00, $30, $14, $1E, $00, $C0
db $16, $1E, $03, $00, $16, $1E, $0C, $00, $16, $1E, $30, $00, $16, $1E, $C0, $00
db $16, $1E, $00, $03, $16, $1E, $00, $0C, $16, $1E, $00, $30, $16, $1E, $00, $C0
db $18, $1E, $03, $00, $18, $1E, $0C, $00, $18, $1E, $30, $00, $18, $1E, $C0, $00
db $18, $1E, $00, $03, $18, $1E, $00, $0C, $18, $1E, $00, $30, $18, $1E, $00, $C0
db $1A, $1E, $03, $00, $1A, $1E, $0C, $00, $1A, $1E, $30, $00, $1A, $1E, $C0, $00
db $1A, $1E, $00, $03, $1A, $1E, $00, $0C, $1A, $1E, $00, $30, $1A, $1E, $00, $C0
db $1C, $1E, $03, $00, $1C, $1E, $0C, $00, $1C, $1E, $30, $00, $1C, $1E, $C0, $00
db $1C, $1E, $00, $03, $1C, $1E, $00, $0C, $1C, $1E, $00, $30, $1C, $1E, $00, $C0
db $1E, $1E, $03, $00, $1E, $1E, $0C, $00, $1E, $1E, $30, $00, $1E, $1E, $C0, $00
db $1E, $1E, $00, $03, $1E, $1E, $00, $0C, $1E, $1E, $00, $30, $1E, $1E, $00, $C0

load_class_oam:
	PHP
	REP #$30
	LDA.w {class}
	ASL #3
	TAX
	LDA oam_info+6,x
	STA.w {dma_size}
	LDA oam_info,x
	STA.b {compress_adr}
	LDA #$0000
	STA.b {decompress_adr}
	STA.w {dma_adr}
	LDA oam_info+4,x
	STA.b {24ptr1}+1
	LDA oam_info+3,x
	STA.b {24ptr1}
	PHX
	LDA.b {col_slot}
	AND #$00FF
	ASL #5
	TAX
	LDY #$0000
-
	LDA.b [{24ptr1}],y
	STA.w {color_table},x
	INY #2
	INX #2
	CPY #$0020
	BNE -	
	SEP #$20
	LDA #$7F
	STA.b {decompress_adr_hi}
	STA.w {dma_bank}
	PLX
	LDA oam_info+2,x
	STA.b {compress_adr_hi}
	JSL decomp
	JSL dma_class_gfx
	PLP
	RTL
	
write_class_act:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	LDA {mikata_class}
	ASL
	TAX
	LDA oam_info,x
	STA {buffer0}
	LDA {mikata_class_act}
	ASL
	CLC 
	ADC {buffer0}
	STA {buffer0}
	TAY
	LDA $0000,y
	TAY
	STA {buffer0}
	LDA $0000,y
	STA {subact_kazu}
	TYA
	CLC
	ADC #$0002	
	STA {buffer0}
	LDA {mikata_class_subact}
	ASL
	CLC
	ADC {buffer0}
	STA {buffer0}
	TAY
	LDA $0000,y
	TAY
	STA {oma_index_pos}
	LDA {oam_decomp_flag}
	BNE +
	JSR write_oam_param
+	
	JSR write_class_haichi
	PLB
	PLP
	RTL
	
write_oam_param:
	LDA $0001,y
	STA.b {compress_adr}+1
	LDA $0000,y
	STA.b {compress_adr}
	LDA $0008,y
	STA {mikata_class_act_spd}
	STA {class_act_spd}
	LDA #$8000
	STA {decompress_adr}
	LDA #$FFFF
	STA {oam_decomp_flag}
	SEP #$20
	LDA #$7F
	STA {decompress_adr_hi}
	PHY
	JSL decomp
	PLY
	
	LDX {dma_jun}
	BNE +
	LDX #$0000
+
	LDA #$80
	STA {dma_dir},x
	LDA #$7F
	STA {dma_bank},x	
	REP #$20
	LDA #$0001
	STA {dma_type},x
	LDA $0006,y
	STA {dma_size},x	
	LDA #$4000
	STA {dma_vram},x	
	LDA #$8000
	STA {dma_adr},x
	JSL increment_dma_jun
	LDA #$0001
	STA {dma_oam_flag}
	LDA {col_slot}
	AND #$00FF
	ASL #5
	TAX
-
	LDA $0004,y
	STA {24ptr1}+1
	LDA $0003,y
	STA {24ptr1}
	LDY #$0000
-
	LDA [{24ptr1}],y
	STA {color_table},x
	INX #2
	INY #2
	CPY #$0020
	BNE -
	RTS
	
write_class_haichi:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	LDA {mikata_class_act}
	CMP {mikata_class_act_copy}
	BEQ +
	STA {mikata_class_act_copy}
	STZ {mikata_class_subact}	
+	
	LDA {mikata_class_act_spd}
	BNE +
	LDA {class_act_spd}
	STA {mikata_class_act_spd}
	STZ {oam_decomp_flag}
	INC {mikata_class_subact}
	LDA {mikata_class_subact}
	CMP {subact_kazu}
	BCC next_00
	STZ {mikata_class_subact}
+
	DEC {mikata_class_act_spd}
next_00:
	LDY {oma_index_pos}
	LDA $000A,y	//load haichi
	TAY
	JSL write_oam_table	
	JSL act_sfx
	PLB
	PLP
	RTS

oam_info:
	dw class_00
	dw class_01
	
class_00:
	dw class_00_act00		//seishi
	dw class_00_act01		//idou
	dw class_00_act02		//kougeki
	dw class_00_act03	//kaihi
	dw class_00_act04 	//hangeki
	dw class_00_act05	//hissatsu1
	dw class_00_act06	//hissatsu2
	
class_00_act00:
	dw $0005
	dw oam00_act00_a
	dw oam00_act00_b
	dw oam00_act00_c
	dw oam00_act00_d
	dw oam00_act00_e
	
oam00_act00_a:
	dl oam00_act00_a_set
	dl oam00_act00_a_col
	dw $0800	
	dw $0005
	dw haichi_class00_act00_a	
oam00_act00_b:
	dl oam00_act00_b_set
	dl oam00_act00_b_col
	dw $0800
	dw $0005
	dw haichi_class00_act00_b
oam00_act00_c:
	dl oam00_act00_c_set
	dl oam00_act00_c_col
	dw $0800		
	dw $0004
	dw haichi_class00_act00_c	
oam00_act00_d:
	dl oam00_act00_d_set
	dl oam00_act00_d_col
	dw $0800		
	dw $0004
	dw haichi_class00_act00_d
oam00_act00_e:
	dl oam00_act00_e_set
	dl oam00_act00_e_col
	dw $0800		
	dw $0004
	dw haichi_class00_act00_e
	

class_00_act01:
	dw $0005
	dw oam00_act01_a
	dw oam00_act01_b
	dw oam00_act01_c
	dw oam00_act01_d
	dw oam00_act01_e

oam00_act01_a:
	dl oam00_act01_a_set
	dl oam00_act01_a_col
	dw $1400		//set size
	dw $0004		//act spd
	dw haichi_class00_act01_a
	
oam00_act01_b:
	dl oam00_act01_b_set
	dl oam00_act01_b_col
	dw $1400		//set size
	dw $0004		//act spd
	dw haichi_class00_act01_a
	
oam00_act01_c:
	dl oam00_act01_c_set
	dl oam00_act01_c_col
	dw $1400		//set size
	dw $0004		//act spd
	dw haichi_class00_act01_a
	
oam00_act01_d:
	dl oam00_act01_d_set
	dl oam00_act01_d_col
	dw $1400		//set size
	dw $0004		//act spd
	dw haichi_class00_act01_a
	
oam00_act01_e:
	dl oam00_act01_e_set
	dl oam00_act01_e_col
	dw $1400		//set size
	dw $0004		//act spd
	dw haichi_class00_act01_a
	

class_00_act02:
	dw $0004
	dw oam00_act02_a
	dw oam00_act02_b
	dw oam00_act02_c
	dw oam00_act02_d
	
oam00_act02_a:
	dl oam00_act02_a_set
	dl oam00_act02_a_col
	dw $1800		//set size
	dw $0026		//act spd
	dw haichi_class00_act02_a
	
oam00_act02_b:
	dl oam00_act02_b_set
	dl oam00_act02_b_col
	dw $1800		//set size
	dw $0006		//act spd
	dw haichi_class00_act02_b
	
oam00_act02_c:
	dl oam00_act02_c_set
	dl oam00_act02_c_col
	dw $1800		//set size
	dw $0006	//act spd
	dw haichi_class00_act02_c
oam00_act02_d:
	dl oam00_act02_d_set
	dl oam00_act02_d_col
	dw $1800		//set size
	dw $0016		//act spd
	dw haichi_class00_act02_d
	

class_00_act03:
class_00_act04:
class_00_act05:
class_00_act06:

class_01:
	dw class_01_act00		//ue

	
class_01_act00:
	dw $0003

	
haichi_class00_act00_a:
	incbin "oam/haichi_class00_act00_a.bin"
haichi_class00_act00_b:
	incbin "oam/haichi_class00_act00_b.bin"
haichi_class00_act00_c:
	incbin "oam/haichi_class00_act00_c.bin"
haichi_class00_act00_d:
	incbin "oam/haichi_class00_act00_d.bin"
haichi_class00_act00_e:
	incbin "oam/haichi_class00_act00_e.bin"
	
haichi_class00_act01_a:
	incbin "oam/haichi_class00_act01_a.bin"
haichi_class00_act02_a:
	incbin "oam/haichi_class00_act02_a.bin"
haichi_class00_act02_b:
	incbin "oam/haichi_class00_act02_b.bin"
haichi_class00_act02_c:
	incbin "oam/haichi_class00_act02_c.bin"
haichi_class00_act02_d:
	incbin "oam/haichi_class00_act02_d.bin"


