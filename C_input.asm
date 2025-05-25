polling_input:
	PHP
	SEP #$20
-
	LDA $4212
	AND #$01
	BNE -
	REP #$20
	LDA $4218
	STA {pad3}
	AND #$000F
	BEQ +
	LDA {pad6}
	STA {pad3}
+
	LDA {pad3}
	EOR {pad6}
	AND {pad3}
	STA {pad4}
	STA {pad5}
	LDA {pad3}
	BEQ +
	CMP {pad6}
	BNE +
	DEC {pad7}
	BNE end_pad_shori
	LDA {pad3}
	STA {pad5}
	LDA {pad2}
	STA {pad7}
	BRA end_pad_shori
+
	LDA {pad1}
	STA {pad7}
end_pad_shori:
	LDA {pad3}
	STA {pad6}
	PLP
	RTL
	
controll_nanna:
	LDA #$000A
	STA {oam_table}+0x0200
	LDA {pad3}
	CMP #$0100
	BNE +
	JMP nanna_right
+
	CMP #$0800
	BNE +
	JMP nanna_up
+
	CMP #$0400
	BNE +
	JMP nanna_down
+
	CMP #$0200
	BNE +
	JMP nanna_left
+
	RTL
	
nanna_left:
	LDX #$0000
-
	LDA nannawalk_col_yoko,x
	STA {color_table}+0x100,x
	INX #2
	CPX #$0020
	BNE -
	LDA {nanna_spd}
	BEQ +
	DEC {nanna_spd}
	RTL
+
	LDA #$0003
	STA {nanna_spd}
	LDA {oam_xpos}
	CMP #$0080
	BCC +
	DEC {oam_xpos}
	DEC {oam_xpos}
	BRA _01
+
	LDA {bg1hofs}
	CMP #$000B
	BCC +
	DEC {bg1hofs}
	DEC {bg1hofs}
	DEC {bg2hofs}
	DEC {bg2hofs}
	BRA _01
+
	LDA {oam_xpos}
	CMP #$000B
	BCS +
	BRA _01
+
	DEC {oam_xpos}
	DEC {oam_xpos}	
_01:	
	LDA {nanna_counter}
	BNE +
	JMP nanna_left00
+
	CMP #$0001
	BNE +
	JMP nanna_left01
+
	STZ {nanna_counter}
	LDX #$0000
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$6049
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$6069
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	

nanna_left00:
	INC {nanna_counter}
	LDX #$0000
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$6043
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2063
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	
nanna_left01:
	INC {nanna_counter}
	LDX #$0000
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$6046
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$6066
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL

nanna_right:
	LDX #$0000
-
	LDA nannawalk_col_yoko,x
	STA {color_table}+0x100,x
	INX #2
	CPX #$0020
	BNE -
	LDA {nanna_spd}
	BEQ +
	DEC {nanna_spd}
	RTL
+
	LDA #$0003
	STA {nanna_spd}
	LDA {oam_xpos}
	CMP #$0080
	BCC +
	LDA {bg1hofs}
	CMP #$00FD
	BCS +
	INC {bg1hofs}
	INC {bg1hofs}
	INC {bg2hofs}
	INC {bg2hofs}
	BRA _00
+
	LDA {oam_xpos}
	CMP #$00E0
	BCC +
	BRA _00
+
	INC {oam_xpos}
	INC {oam_xpos}	
_00:
	LDA {nanna_counter}
	BNE +
	JMP nanna_right00
+
	CMP #$0001
	BNE +
	JMP nanna_right01
+
	STZ {nanna_counter}
	LDX #$0000
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2049
	STA {oam_table}+2,x	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2069
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	

nanna_right00:
	INC {nanna_counter}
	LDX #$0000
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2043
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2063
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	
nanna_right01:
	INC {nanna_counter}
	LDX #$0000
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2046
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2066
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	
nanna_up:
	LDX #$0000
-
	LDA nannawalk_col_ue,x
	STA {color_table}+0x100,x
	INX #2
	CPX #$0020
	BNE -
	LDA {nanna_spd}
	BEQ +
	DEC {nanna_spd}
	RTL
+
	LDA #$0004
	STA {nanna_spd}	
	LDA {nanna_counter}
	BNE +
	JMP nanna_up00
+
	CMP #$0001
	BNE +
	JMP nanna_up01
+
	STZ {nanna_counter}
	LDX #$0000
	DEC {oam_ypos}
	DEC {oam_ypos}
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2000
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2020
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	

nanna_up00:
	INC {nanna_counter}
	LDX #$0000
	DEC {oam_ypos}
	DEC {oam_ypos}
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2003
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2023
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	
nanna_up01:
	INC {nanna_counter}
	LDX #$0000
	DEC {oam_ypos}
	DEC {oam_ypos}
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2006
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2026
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	
nanna_down:
	LDX #$0000
-
	LDA nannawalk_col_shita,x
	STA {color_table}+0x100,x
	INX #2
	CPX #$0020
	BNE -
	LDA {nanna_spd}
	BEQ +
	DEC {nanna_spd}
	RTL
+
	LDA #$0004
	STA {nanna_spd}	
	LDA {nanna_counter}
	BNE +
	JMP nanna_down00
+
	CMP #$0001
	BNE +
	JMP nanna_down01
+
	STZ {nanna_counter}
	LDX #$0000
	INC {oam_ypos}
	INC {oam_ypos}
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2040
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2060
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	

nanna_down00:
	INC {nanna_counter}
	LDX #$0000
	INC {oam_ypos}
	INC {oam_ypos}
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$2009
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$2029
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL
	
nanna_down01:
	INC {nanna_counter}
	LDX #$0000
	INC {oam_ypos}
	INC {oam_ypos}
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	STA {oam_table}+1,x
	LDA #$200C
	STA {oam_table}+2,x
	
	LDX #$0004
	LDA {oam_xpos}
	STA {oam_table},x
	LDA {oam_ypos}
	CLC
	ADC #$0010
	STA {oam_table}+1,x
	LDA #$202C
	STA {oam_table}+2,x
	LDA #$0001
	STA {dma_oam_flag}
	RTL

check_kaiwa:
	LDA {pad5}
	CMP #$0040
	BNE +
	JSL kaiwa_shori
	RTL
+
	LDA {frame_flag}
	BEQ +
	JSL kaiwa_shori
+
	LDA {pad5}
	CMP #$4000
	BNE +
	JSL clear_frame
	RTL
+
	CMP #$1000
	BNE +
	LDX {save_song}
	SEP #$20
	LDA bgm,x
	STA {song}
	INX
	CPX #$0014
	BCS _4
-
	STX {save_song}
+
    REP #$20
	RTL
_4:
	LDX #$0000
	BRA -
	
bgm:
	db $1B, $1C, $1F, $20, $27, $2C, $2D, $2E, $55, $56, $57, $59, $5C, $62, $68, $69, $6A, $6D, $6E, $7C, $7D
	
check_hantei:
	LDA {ichigime}
	BEQ +
	LDA {pad4}
	CMP #$0080
	BEQ +
	LDA #$FFFF
	STA {hantei_flag}
+
	RTL