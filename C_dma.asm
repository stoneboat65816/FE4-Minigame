clear_all_vram:
	PHP
	REP #$30
	LDA #$1801
	STA $4300
	LDA #$7F00
	STA $4303
	LDA #$0000
	STA $4302
	LDA #$0000
	STA $4305
	STZ $2116
	SEP #$20
	LDA #$01
	STA $420B
	PLP
	RTL
	
nmi_dma:
	PHB
	PHP
	PHK
	PLB
	REP #$30
-
	LDY {dma_jun}
	BMI +
	LDA {dma_type},y
	ASL
	TAX
	JSR (dma,x)
	LDA #$0000
	STA {dma_type},y
	TYA
	SEC
	SBC #$000A
	STA {dma_jun}	
	BRA -
+
	STZ {dma_jun}
	PLP
	PLB
	RTL
	
dma:
	dw no_dma
	dw dma_gfx
	
dma_gfx:
	LDA #$1801
	STA $4370
	LDA {dma_vram},y
	STA $2116
	LDA {dma_size},y
	STA $4375
	LDA {dma_adr},y
	STA $4372
	SEP #$20
	LDA {dma_bank},y
	STA $4374
	LDA {dma_dir},y
	STA $2115
	LDA #$80
	STA $420B
	REP #$20
no_dma:
	RTS
	
dma_decomped:
	PHP
	PHB
	SEP #$20
	LDA $05,s
	PHA
	PLB
	REP #$30
	LDA $03,s
	TAX
	LDY {dma_jun}
	BNE +
	LDY #$0000
+
	LDA #$0001
	STA {dma_type},y
	LDA $0001,x
	STA {dma_vram},y
	LDA $0003,x
	STA {dma_size},y
	LDA $0005,x
	STA {dma_adr},y
	SEP #$20
	LDA $0007,x
	STA {dma_bank},y
	LDA $0008,x
	STA {dma_dir},y
	LDA {kido}
	BPL +
	JSL nmi_dma
+
	REP #$20
	JSL increment_dma_jun
	PLB
	PLP
	RTL

increment_dma_jun:
	LDA {dma_jun}
	CLC
	ADC #$000A
	STA {dma_jun}
	RTL
	
dma_oam_table:
	PHP
	SEP #$10
	REP #$20
	STZ {dma_oam_flag}	
	LDA #$0400
	STA $4300
	LDA #{oam_table}
	STA $4302
	LDX #$00
	STX $4304
	STX $4314
	STX $2121
	LDA #$0220
	STA $4305
	STZ $2102
	LDA #$2200
	STA $4310
	LDA #{color_table}
	STA $4312
	LDA #$0200
	STA $4315
	LDX #$80
	STX $2115
	LDX #$03
	STX $420B
	LDX.b {oamaddl}
	STX $2102
	PLP
	RTL

init_dma_ch:
	PHP
	PHB
	PHK
	PLB
	LDX #$00A6
	LDA #$0000
-
	STA $15E7,x
	DEX #2
	BPL -
	LDX #$0070
	SEP #$20
	LDA #$00
	STA $420C
	STA {hdma_ch}
-
	LDA #$00
	STA $4300,x
	STA $4307,x
	STA $4302,x
	STA $4303,x
	STA $4304,x
	LDA #$13
	STA $4301,x
	TXA
	SEC
	SBC #$10
	BMI +
	TAX
	BRA -
+
	PLB
	PLP
	RTL
	
dma_hdma:
	PHB
	PHP
	PHK
	PLB
	SEP #$20
	LDA.w {dma_ch}
	STA $420B
	STZ.w {dma_ch}
	LDA.b {hdma}
	ORA.w {hdma_ch}
	STA.b {hdma}
	JSL hdma_ch_sentaku
	LDA.b {hdma}
	STA $420C
	STZ.b {hdma}
	STZ.w {hdma_ch}
	PLP
	PLB
	RTL
	
hdma_ch_sentaku:
	PHP
	SEP #$30
	LDA.b {hdma}
	STA.b {buffer0}
	LDX #$0E
	LDY #$70
-
	ASL.b {buffer0}
	BCC +
	LDA $165F,x
	STA $4302,y
	LDA $1660,x
	STA $4303,y
	LDA $166F,x
	STA $4304,y
	LDA $1670,x
	STA $4301,y
	LDA $167F,x
	STA $4300,y
	LDA $1680,x
	STA $4307,y
+
	TYA
	SEC
	SBC #$10
	TAY
	DEX #2
	BPL -
	PLP
	RTL
	

nmi_dma2:
	LDA.w {dma_times}
	AND #$00FF
	BEQ +
	CMP #$0011
	BCC _95C37F
	LDA #$0010
	SEP #$20
	STA.w {dma_times}
	REP #$20	
_95C37F:
	TAY
	DEC
	ORA #$0700
	STA $4202
	NOP #3
	LDX $4216
	LDA.w {dma_max_size}
	AND #$FFFE
	STA.w {dma_max_size}
-
	LDA.w {dma_max_size}
	BEQ +
	SEC
	SBC.w {dma_size3},x
	BCS _95C3A6
	JSR dma_limit_over
	BRA +
_95C3A6:
	STA.w {dma_max_size}
	JSR dma_within_limit
	TXA
	SEC
	SBC #$0007
	TAX 
	DEC.w {dma_times}
	DEY
	BNE -
+
	LDA #$0C00
	STA.w {dma_max_size}
	STZ $0CC7
	RTL
	
dma_within_limit:
	LDA.w {dma_vram3},x
	STA $2116
	LDA #$1801
	STA $4300
	LDA.w {dma_adr3},x
	STA $4302
	LDA.w {dma_adr3}+1,x
	STA $4303
	LDA.w {dma_size3},x
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	REP #$20
	RTS
	
dma_limit_over:
	LDA.w {dma_vram3},x
	STA $2116
	LDA #$1801
	STA $4310
	LDA.w {dma_adr3},x
	STA $4312
	LDA.w {dma_adr3}+1,x
	STA $4313
	LDA.w {dma_max_size}
	STA $4315
	LDA.w {dma_max_size}
	LSR
	CLC
	ADC.w {dma_vram3},x
	STA.w {dma_vram3},x
	LDA.w {dma_adr3},x
	CLC
	ADC.w {dma_max_size}
	STA.w {dma_adr3},x
	LDA #$0000
	ADC.w {dma_bank3},x
	SEP #$20
	STA.w {dma_bank3},x
	REP #$20
	LDA.w {dma_size3},x
	SEC
	SBC.w {dma_max_size}
	STA.w {dma_size3},x
	SEP #$20
	LDA #$02
	STA $420B
	REP #$20
	RTS
	
nmi_dma3:
	PHX
	PHA
	LDA.w {dma_times}
	AND #$00FF
	CMP #$0010
	BCC +
	PLA
	SEC
	BRA _95C478
+
	ORA #$0700
	STA $4202
	NOP #3
	LDX $4216
	PLA
	STA.w {dma_size3},x
	CLC
	ADC $0CC7
	STA $0CC7
	TYA
	STA.w {dma_vram3},x
	LDA $24
	STA.w {dma_adr3},x
	LDA $25
	STA.w {dma_adr3}+1,x
	INC.w {dma_times}
	CLC
_95C478:
	PLX
	RTL
	
force_dma_decomped:
	PHP
	PHB
	SEP #$20
	REP #$10
	LDA $05,s
	PHA
	PLB
	STZ $420B
	REP #$20
	LDA #$1801
	STA $4300
	LDA $03,s
	TAX
	LDA $0001,x
	STA $4302
	LDA $0004,x
	STA $4305
	LDA $0006,x
	STA $2116
	SEP #$20
	LDA $0003,x
	STA $4304	
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	REP #$20
	LDA $03,s
	CLC
	ADC #$0007
	STA $03,s
	PLB
	PLP
	RTL
	
dma_class_gfx:
	PHP
	PHB
	SEP #$20
	REP #$10
	PHK
	PLB
	STZ $420B
	LDX #$1801
	STX $4310
	LDY {dma_jun}
	BNE +
	LDY #$0000
+
	LDX.w {dma_adr},y
	STX $4312
	LDX.w {dma_size},y
	STX $4315
	LDX.w {dma_vram},y
	STX $2116
	LDA {dma_dir},y
	STA $2115
	LDA.w {dma_bank},y
	STA $4314
	LDA #$02
	STA $420B	
	PLB
	PLP
	RTL
	
dma_clock:
	SEP #$20
	LDA {clock_timer}
	CMP #$14
	BEQ +
	INC {clock_timer}
	REP #$20
	RTL
+
	STZ {clock_timer}
	LDY {dma_jun}
	LDA.b #(clock0_set)>>16
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	LDA #$0001
	STA {dma_oam_flag}
	STA {dma_type},y
	LDA #$0040
	STA {dma_size},y
	LDA #$2D50
	STA {dma_vram},y
	LDA.b {clock_timer}+1
	AND #$0003
	SEP #$20
	STA.b {clock_timer}+1
	REP #$20
	ASL
	TAX
	LDA clock_adr,x
	STA {dma_adr},y
	JSL increment_dma_jun
	INC.b {clock_timer}+1
	RTL

clock_adr:	
	dw clock0_set
	dw clock1_set
	dw clock2_set
	dw clock3_set
	
dma_flame:
	SEP #$20
	LDA {flame_timer}
	CMP #$0C
	BEQ +
	INC {flame_timer}
	REP #$20
	RTL
+
	STZ {flame_timer}
	LDY {dma_jun}
	LDA.b #(flame0_set)>>16
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	LDA #$0001
	STA {dma_oam_flag}
	STA {dma_type},y
	LDA #$00C0
	STA {dma_size},y
	LDA #$2C50
	STA {dma_vram},y
	LDA.b {flame_timer}+1
	AND #$0003
	SEP #$20
	STA.b {flame_timer}+1
	REP #$20
	ASL
	TAX
	LDA flame_adr,x
	STA {dma_adr},y
	JSL increment_dma_jun
	INC.b {flame_timer}+1
	LDY #$0000
	LDA.b {flame_timer}+1
	AND #$0003
	PHA
	ASL
	CLC
	ADC $01,s
	TAX
	PLA	
	LDA flame_col+1,x
	STA {24ptr1}+1
	LDA flame_col,x
	STA {24ptr1}
-
	LDA [{24ptr1}],y
	STA {color_table}+0x80,y
	INY #2
	CPY #$0010
	BNE -	
	RTL

flame_adr:	
	dw flame0_set
	dw flame1_set
	dw flame2_set
	dw flame3_set
flame_col:
	dl flame0_col
	dl flame1_col
	dl flame2_col
	dl flame3_col
	