kaiwa_shori:
	PHY
	PHP
	LDA #$0001
	STA {irq_mode}
	LDA {frame_flag}
	BNE +
	JSR write_frame
	LDA #$FFFF
	STA {frame_flag}
	PLP
	PLY
	RTL	
+
	SEP #$20
	LDA {text_speed}
	CMP {text_speed}+1
	BEQ +
	INC {text_speed}
	REP #$30
	JMP end_text	
+
	STZ {text_speed}
	REP #$30
	PEA $0000
	PLB
	PLB
read_txt_ptr:
	LDA {kaiwa_id}
	PHA
	ASL
	CLC
	ADC $01,s
	TAX
	PLA
	LDA kaiwa+1,x
	STA {txt_ptr}+1
	LDA kaiwa,x
	STA {txt_ptr}
read_txt:
	LDY {txtpos}
	LDA [{txt_ptr}],y
	AND #$00FF
	CMP #$00FF
	BNE +
	JMP end_text2
+
	CMP #$00D0
	BNE +
	JSR get_kana
-
	LDA [{txt_ptr}],y
	SEP #$20
	LDA #$00
	XBA
	REP #$20
	INY #2
	STY {txtpos}
	JMP start_drawing
+
	CMP #$00C0
	BNE +
	JSR get_kanji1
	BRA -
+
	CMP #$00C1
	BNE +
	JSR get_kanji2
	BRA -
+
	CMP #$00C2
	BNE +
	JSR get_kanji3
	BRA -	
+
	CMP #$00C3
	BNE +
	JSR get_kanji4
	BRA -
+
	CMP #$00C4
	BNE +
	JSR get_kanji5
	BRA -
+
	CMP #$00C5
	BNE +
	JSR get_kanji6
	BRA -
+
	CMP #$00C6
	BNE +
	JSR get_kanji7
	BRA -
+	
	CMP #$00F0
	BCC +	
	JSR control_code
	INY
	BRA read_txt
+
	INY
	STY {txtpos}
	PHA
	SEP #$20
	LDA #$01
	STA {sfx1}
	REP #$20
	PLA
+
	JSR get_font
start_drawing:
	JSR draw_tile
	JSR draw_map
	JSR dma_bg3_tile
	JSR kuchipaku
	LDA #$0001
	STA {dma_oam_flag}
end_text:
	PLP
	PLY
	RTL
end_text2:
	LDA #$FFFF
	STA {kaiwa_flag}
	JSL clear_frame
	JSR clearquiz
	JSL clear_pointer
	JSR clear_bg3set	
	PLP
	PLY
	RTL
	
control_code:
	SEC
	SBC #$00F0
	ASL
	TAX
	JMP (code,x)	
code:
	dw code_txt_spd
	dw code_pause
	dw code_line
	dw code_clear
	dw code_song
	dw code_ichigime
	dw code_hantei

code_pause:
	SEP #$20
	LDA {pad3}
	CMP #$80
	BEQ +
	REP #$20
	LDA #(end_text)-1
	STA $00,s
	SEP #$20
	LDA.b #(end_text)>>16
	STA $02,s
	REP #$20
	TSC
	DEC
	TCS
	RTL	
+
	INY
	STY {txtpos}	
	REP #$20
	RTS
	
code_song:
	PHP
	SEP #$20
	INY
	LDA [{txt_ptr}],y
	STA {song}
	INY
	STY {txtpos}
	PLP
	RTS
	
code_line:
	PHX
	PHP
	SEP #$20
	LDA {line}
	INC
	STA {line}
	REP #$20
	LDA {line}
	AND #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	STA {tile_num}
	ASL
	CLC
//	ADC {txtpos}
	STA {map_pos}
	PHA
	LDA {ichigime}
	BEQ +
	PLA
	STA {map2_pos}
	BRA _2
+
	PLA
_2:
	STZ {shift}
	INY
	STY {txtpos}	
	PLP
	PLX
	RTS
	
code_txt_spd:
	PHP
	SEP #$20
	INY
	LDA [{txt_ptr}],y
	STA {text_speed}+1
	INY
	STY {txtpos}
	PLP
	RTS
	
code_clear:
	PHY
	PHP
	STZ {shift}
	STZ {tile_num}
	STZ {map_pos}
	LDX #$0000
-
	LDA frame_map,x
	STA $7F0000,x
	INX #2
	CPX #$0200
	BNE -	
	LDA {ichigime}
	BEQ +
	JSR clear_bg3set
+
	SEP #$20
	STZ {line}
	PLP
	PLY
	INY
	STY {txtpos}
	RTS
code_ichigime:
	INY
	LDA [{txt_ptr}],y
	PHA
	AND #$00FF
	ASL #5
	STA {ichigime}
	PLA
	XBA
	AND #$00FF
	CLC
	ADC {ichigime}
	CLC
	ADC {bg3map_vram}
	STA {ichigime}
	INY #2
	STY {txtpos}
	LDA #$7E00
	STA {24ptr2}+1
	LDA #$2000
	STA {24ptr2}
	LDA #(pointer_col)
	STA {24ptr1}
	SEP #$20
	LDA #$0A
	STA {col_slot}
	LDA.b #(pointer_col)>>16
	STA {24ptr1_hi}
	JSL write_col_slot
	REP #$20
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA #$0080
	STA {dma_size},y
	LDA #(pointer_set)
	STA {dma_adr},y
	LDA #$6C00
	STA {dma_vram},y
	SEP #$20
	LDA.b #(pointer_set)>>16
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	JSL increment_dma_jun
	LDA #$FFFF
	STA {pointer_flag}
	RTS

code_hantei:
	LDA {hantei_flag}
	BEQ +
	STZ {hantei_flag}
	LDA {kaiwa_id}
	AND #$00FF
	ASL #3
	TAX
	STA {save_x}
	LDA {pointer_ypos}
	CMP gouhi_hantei,x
	BNE +
	INX #2
	INC {score}
-
	LDA gouhi_hantei,x
	STA {kaiwa_id}
	LDA {save_x}
	CLC
	ADC #$0006
	TAX
	LDA gouhi_hantei,x
	STA {next_kaiwa}
	LDA #(read_txt_ptr)-1
	STA $01,s
	STZ {txtpos}
	JSR clearquiz
	STZ {shift}
	STZ {width}
	STZ {map_pos}
	STZ {line}
	STZ {pointer_flag}
	RTS
+
	LDA {save_x}
	CLC
	ADC #$0004
	TAX
	BRA -
	
	
get_font:
	PHA
	LDA #(font0)
	STA {font_ptr}
	SEP #$20
	LDA.b #(font0)>>16
	STA {font_ptr_hi}
	LDA.b #(font0_width>>16)
	STA {width_adr_hi}
	REP #$20
	LDA #(font0_width)
	STA {width_adr}
	PLA
	RTS
	
draw_tile:
	PHY
	PHX
	PHP
	STA {save_a}
	LDA {shift}
	BEQ new_tile
	CMP #$0008
	BCC draw
	TAX
	AND #$0007
	STA {shift}
	TXA
	LSR
	LSR
	LSR
	TAY
	TXA
	AND #$00F8
	ASL
	ASL
	TAX
	DEX
	DEX
here:	
	PHY
	LDY #$0010
-	
	LDA $7F0220,x
	STA $7F0200,x
	DEX
	DEX
	DEY
	BNE -
	JSR update_tile_num
	JSR update_map_pos
	PLY
	DEY
	BNE here
	LDX #$0000
	LDY #$0010
	LDA #$0000
-	
	STA $7F0220,x
	STA $7F0240,x
	STA $7F0260,x
	STA $7F0280,x
	STA $7F02A0,x
	INX
	INX
	DEY
	BNE -
	BRA draw
	
new_tile:
	PHB
	LDA #$7F7F
	PHA
	PLB #2
	LDX #$0000
	LDY #$0010
-
	STZ $0200,x
	STZ $0220,x
	STZ $0240,x
	STZ $0260,x
	STZ $0280,x
	STZ $02A0,x
	INX
	INX
	DEY
	BNE -
	PLB
draw:
	LDA {save_a}
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC {font_ptr}
	STA {font_ptr}
	LDA {shift}
	AND #$00F8
	ASL
	ASL
	STA {save_x}
	TAX
	LDY #$0000
-
	LDA [{font_ptr}],y
	JSR shift_pixel
	LDA $7F0200,x
	ORA {left_byte}
	STA $7F0200,x
	LDA $7F0220,x
	ORA {right_byte}
	STA $7F0220,x
	INX
	INX
	INY
	INY
	CPY #$0010
	BNE -
	LDX {save_x}
-
	LDA [{font_ptr}],y
	JSR shift_pixel
	LDA $7F0210,x
	ORA {left_byte}
	STA $7F0210,x
	LDA $7F0230,x
	ORA {right_byte}
	STA $7F0230,x
	INX
	INX
	INY
	INY
	CPY #$0020
	BNE -	
	LDX {save_x}
-
	LDA [{font_ptr}],y
	JSR shift_pixel
	LDA $7F0220,x
	ORA {left_byte}
	STA $7F0220,x
	LDA $7F0240,x
	ORA {right_byte}
	STA $7F0240,x
	INX
	INX
	INY
	INY
	CPY #$0030
	BNE -	
	LDX {save_x}
-
	LDA [{font_ptr}],y
	JSR shift_pixel
	LDA $7F0230,x
	ORA {left_byte}
	STA $7F0230,x
	LDA $7F0250,x
	ORA {right_byte}
	STA $7F0250,x
	INX
	INX
	INY
	INY
	CPY #$0040
	BNE -	
	LDY {save_a}
	LDA [{width_adr}],y
	AND #$00FF
	STA {width}
	CLC
	ADC {shift}
	STA {shift}
	DEC
	AND #$00F8
	ASL
	ASL
	CLC
	ADC #$0020
	STA {tile_vram_size}
	LDA {tile_num}
	ASL
	ASL
	ASL
	CLC
	ADC {tile_vram_adr}
	STA {letter_tile_vram}
+	
	PLP
	PLX
	PLY
	RTS	
	
update_tile_num:
	LDA {tile_num}
	INC #2
	STA {tile_num}
	RTS
	
update_map_pos:
	LDA {map_pos}
	INC #2
	STA {map_pos}
	LDA {ichigime}
	BEQ +
	LDA {map2_pos}
	INC #2
	STA {map2_pos}	
+
	RTS
	
shift_pixel:
	PHX
	PHA
	XBA
	AND #$FF00
	STA {buffer1}
	PLA
	AND #$FF00
	STA {buffer2}
	LDA {shift}
	AND #$0007
	TAX
	BEQ +
-
	LSR {buffer1}
	LSR {buffer2}
	DEX
	BNE -
+
	LDA {buffer1}
	XBA
	AND #$00FF
	STA {left_byte}
	LDA {buffer2}
	AND #$FF00
	ORA {left_byte}
	STA {left_byte}
	LDA {buffer1}
	AND #$00FF
	STA {right_byte}
	LDA {buffer2}
	XBA
	AND #$FF00
	ORA {right_byte}
	STA {right_byte}
	PLX
	RTS	
	
draw_map:
	PHY
	PHX
	LDA {ichigime}
	BNE +
	LDA {map_adr}+1
	STA {24ptr1}+1
	LDA {map_adr}
	CLC
	ADC {map_pos}
	STA {24ptr1}
	LDA {tile_num}
	CLC
	ADC #$2010
	STA {buffer1}
	LDA {shift}
	DEC
	LSR
	LSR
	LSR
-
	PHA
	LDA {buffer1}
	LDY #$0000
	STA [{24ptr1}],y
	INC
	LDY #$0040
	STA [{24ptr1}],y
	LDA {buffer1}
	AND #$FC00
	STA {buffer2}
	LDA {buffer1}
	CLC
	ADC #$0002
	AND #$03FF
	ORA {buffer2}
	STA {buffer1}
	INC {24ptr1}
	INC {24ptr1}
	PLA
	DEC
	BPL -
	PLX
	PLY
	RTS
+
	LDA #$7E00
	STA {24ptr2}+1
	LDA #$2000
	CLC
	ADC {map2_pos}
	STA {24ptr2}
	LDA {tile_num}
	CLC
	ADC #$2010
	STA {buffer1}
	LDA {shift}
	DEC
	LSR
	LSR
	LSR
-
	PHA
	LDA {buffer1}
	LDY #$0000
	STA [{24ptr2}],y
	INC
	LDY #$0040
	STA [{24ptr2}],y
	LDA {buffer1}
	AND #$FC00
	STA {buffer2}
	LDA {buffer1}
	CLC
	ADC #$0002
	AND #$03FF
	ORA {buffer2}
	STA {buffer1}
	INC {24ptr2}
	INC {24ptr2}
	PLA
	DEC
	BPL -
	PLX
	PLY
	RTS
	
	
dma_bg3_tile:
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA {tile_vram_size}
	STA {dma_size},y
	LDA #$0200
	STA {dma_adr},y
	LDA {letter_tile_vram}
	STA {dma_vram},y
	SEP #$20
	LDA #$7F
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	JSL increment_dma_jun
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA {bg3map_vram}
	CLC
	ADC #$02A0
	STA {dma_vram},y
	LDA #$0200
	STA {dma_size},y
	LDA #$0000
	STA {dma_adr},y
	SEP #$20
	LDA #$7F
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	JSL increment_dma_jun
	LDA #$0001
	STA {dma_oam_flag}
	LDY {dma_jun}
	LDA {ichigime}
	BEQ +
	STA {dma_vram},y
	LDA #$0001
	STA {dma_type},y
	LDA #$0100
	STA {dma_size},y
	LDA {map2_pos}
	AND #$FFF0
	CLC
	ADC #$2000
	STA {dma_adr},y
	SEP #$20
	LDA #$7E
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	JSL increment_dma_jun
+	
	RTS
	
nanna_oam1:
	dw $60D0, $3280, $60E0, $3282, $60F0, $3284, $70D0, $32A0
	dw $70E0, $32A2, $70F0, $32A4, $80D0, $3286, $80E0, $3288
	dw $80F0, $328A, $90D0, $32A6, $90E0, $32A8, $90F0, $32AA
nanna_oam2:
	dw $6020, $7280, $6010, $7282, $6000, $7284, $7020, $72A0
	dw $7010, $72A2, $7000, $72A4, $8020, $7286, $8010, $7288
	dw $8000, $728A, $9020, $72A6, $9010, $72A8, $9000, $72AA

write_frame:
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA #$0100
	STA {dma_size},y
	LDA #(frame_set)
	STA {dma_adr},y
	LDA #$7000
	STA {dma_vram},y
	SEP #$20
	LDA.b #(frame_set)>>16
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y

	REP #$20
	JSL increment_dma_jun
	LDX #$0000
-
	LDA frame_col,x
	STA {color_table},x
	INX #2
	CPX #$0020
	BNE -
	LDX #$0000
-
	LDA frame_map,x
	STA $7F0000,x
	INX #2
	CPX #$0200
	BNE -
	LDA #$AAAA
	STA {oam_table2}+2
	STA {oam_table2}+3
	LDX #$0000
	LDA {oam_xpos}
	CMP #$0080
	BCS nanna_2
-
	LDA nanna_oam1,x
	STA {oam_table}+0x20,x
	INX #2
	CPX #$0030
	BNE -
	RTS

nanna_2:
	LDA nanna_oam2,x
	STA {oam_table}+0x20,x
	INX #2
	CPX #$0030
	BNE nanna_2
	RTS
	
kuchipaku:
	LDA {tile_num}
	BNE +
	SEP #$20
	LDA #$8E
	STA {oam_table}+0x3E
	REP #$20
	RTS
+
	SEP #$20
	LDA {text_speed}
	BNE +
	LDA {oam_table}+0x3E
	CMP #$88
	BEQ kuchi_1
	CMP #$8E
	BEQ kuchi_2
	CMP #$AE
	BEQ kuchi_0
+
	REP #$20
	RTS
kuchi_0:
	LDA #$88
	STA {oam_table}+0x3E
	REP #$20
	RTS	
kuchi_1:
	LDA #$8E
	STA {oam_table}+0x3E
	REP #$20
	RTS
kuchi_2:
	LDA #$AE
	STA {oam_table}+0x3E
	REP #$20
	RTS
	
clear_frame:
	LDX #$0000
	LDA #$F000
-
	STA {oam_table}+0x20,x
	INX #2
	CPX #$0030
	BNE -
	LDX #$0000
	LDA #$0000
	STA {oam_table2}+2
	STA {oam_table2}+3	
-
	STA $7F0000,x
	INX #2
	CPX #$0200
	BNE -
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA #$0000
	STA {dma_adr},y
	LDA #$0200
	STA {dma_size},y
	LDA #$52A0
	STA {dma_vram},y
	SEP #$20
	LDA #$80
	STA {dma_dir},y
	LDA #$7F
	STA {dma_bank},y
	REP #$20
	JSL increment_dma_jun
	STZ {txtpos}
	STZ {shift}
	STZ {width}
	STZ {line}
	STZ {tile_num}
	STZ {frame_flag}
	STZ {letter_tile_vram}
	STZ {map_pos}
	//INC {kaiwa_id}
	LDA {next_kaiwa}
	CMP #$0021
	BCS +
	STA {kaiwa_id}	
	RTL	
+
	STA {kaiwa_id}
	LDA {next_kaiwa}
	CMP #$0022
	BCS +
	LDA #$0022
	STA {next_kaiwa}
	RTL
+
	CMP #$002D
	BCS +
	LDA {score}
	ASL
	TAX
	JMP (score_text,x)
+
	LDA #$002D
	STA {kaiwa_id}
	RTL
score_text:
	dw score_00
	dw score_01
	dw score_02
	dw score_03
	dw score_04
	dw score_05
	dw score_06
	dw score_07
	dw score_08
	dw score_09
	dw score_10
	
score_00:
	LDA #$0022
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_01:
	LDA #$0023
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_02:
	LDA #$0024
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_03:
	LDA #$25
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_04:
	LDA #$0026
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_05:
	LDA #$0027
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_06:
	LDA #$0028
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_07:
	LDA #$0029
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_08:
	LDA #$002A
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_09:
	LDA #$002B
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL
score_10:
	LDA #$002C
	STA {kaiwa_id}
	LDA #$002D
	STA {next_kaiwa}
	RTL

get_kana:
	PHA
	LDA #(kana)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kana)>>16
	STA {font_ptr_hi}
	LDA.b #(kana_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kana_width)
	STA {width_adr}
	PLA
	RTS
	
get_kanji1:
	PHA
	LDA #(kanji1)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji1)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji1_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji1_width)
	STA {width_adr}
	PLA
	RTS
get_kanji2:
	PHA
	LDA #(kanji2)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji2)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji2_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji2_width)
	STA {width_adr}
	PLA
	RTS
get_kanji3:
	PHA
	LDA #(kanji3)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji3)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji3_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji3_width)
	STA {width_adr}
	PLA
	RTS
get_kanji4:
	PHA
	LDA #(kanji4)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji4)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji4_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji4_width)
	STA {width_adr}
	PLA
	RTS
get_kanji5:
	PHA
	LDA #(kanji5)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji5)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji5_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji5_width)
	STA {width_adr}
	PLA
	RTS
get_kanji6:
	PHA
	LDA #(kanji6)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji6)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji6_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji6_width)
	STA {width_adr}
	PLA
	RTS
get_kanji7:
	PHA
	LDA #(kanji7)
	STA {font_ptr}
	SEP #$20
	LDA.b #(kanji7)>>16
	STA {font_ptr_hi}
	LDA.b #(kanji7_width>>16)
	STA {width_adr_hi}
	LDA #$02
	STA {sfx1}
	REP #$20
	LDA #(kanji7_width)
	STA {width_adr}
	PLA
	RTS
	
clearquiz:
	PHP
	PHB
	REP #$30
	LDX #$2000
	LDY #$2001
	LDA #$0000
	STA $7E2000
	STZ $2000
	LDA #$01FE
	MVN $7E, $7E	
	PLB
	STZ {ichigime}
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA #$0200
	STA {dma_size},y
	LDA #$2000
	STA {dma_adr},y
	LDA #$5143
	STA {dma_vram},y
	SEP #$20
	LDA #$7E
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	JSL increment_dma_jun
	PLP
	RTS
	
clear_bg3set:
	LDY {dma_jun}
	LDA #$0001
	STA {dma_type},y
	LDA #$1000
	STA {dma_size},y
	LDA #(blank)
	STA {dma_adr},y
	LDA #$7080
	STA {dma_vram},y
	SEP #$20
	LDA.b #(blank>>16)
	STA {dma_bank},y
	LDA #$80
	STA {dma_dir},y
	REP #$20
	JSL increment_dma_jun
	STZ {map2_pos}
	STZ {ichigime}
	STZ {pointer_flag}
	STZ {pointer_xpos}
	LDX #$0000
-
	STZ $1C50,x
	INX #2
	CPX #$0010
	BNE -
	LDX #$0000
	LDA #$0000
-
	STA $7E2000,x
	INX #2
	CPX #$0200
	BNE -
	RTS
	
gouhi_hantei:
	dw $5800, $000B, $000C, $0001
	dw $4800, $000D, $000E, $0002
	dw $4800, $000F, $0010, $0003
	dw $6800, $0011, $0012, $0004
	dw $6800, $0013, $0014, $0005
	dw $5800, $0015, $0016, $0006
	dw $5800, $0017, $0018, $0007
	dw $6800, $0019, $001A, $0008
	dw $5800, $001B, $001C, $0009
	dw $6800, $001D, $001E, $0021
	//dw $6800, $001F, $0020, $0021