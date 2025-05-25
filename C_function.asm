init_ppu_cpu:
	PHB
	PHP
	PHK
	PLB
	SEP #$20
	LDA #$01
	STA $4200
	STA.b {nmitimen}
	STZ $4201
	STZ $4202
	STZ $4203
	STZ $4204
	STZ $4205
	STZ $4206
	STZ $4207
	STZ $4208
	STZ $4209
	STZ $420A
	STZ $420B
	STZ $420C
	STZ $2140
	STZ $2141
	STZ $2142
	STZ $2143
	LDA #$01
	STA $420D
	LDA #$80
	STA $2100
	STA.b {kido}
	STZ $2101
	STZ.b {obsel}
	STZ $2102
	STZ.b {oamaddl}
	LDA #$00
	STA $2103
	STA.b {oamaddh}
	STZ $2104
	STZ $2104
	LDA #$09
	STA $2105
	STA.b {bgmode}
	STZ $2106
	STZ.b {mosaic}
	STZ $2107
	STZ.b {bg1sc}
	STZ $2108
	STZ.b {bg2sc}
	STZ $2109
	STZ.b {bg3sc}
	STZ $210A
	STZ.b {bg4sc}
	STZ $210B
	STZ.b {bg12nb}
	STZ $210C
	STZ.b {bg34nb}
	STZ $210D
	STZ $210D
	STZ.b {bg1hofs}
	STZ.b {bg1hofs}+1
	STZ $210E
	STZ $210E
	STZ.b {bg1vofs}
	STZ.b {bg1vofs}+1
	STZ $210F
	STZ $210F
	STZ.b {bg2hofs}
	STZ.b {bg2hofs}+1
	STZ $2110
	STZ $2110
	STZ.b {bg2vofs}
	STZ.b {bg2vofs}+1
	STZ $2111
	STZ $2111
	STZ.b {bg3hofs}
	STZ.b {bg3hofs}+1
	STZ $2112
	STZ $2112
	STA.b {bg3vofs}
	STA.b {bg3vofs}+1
	STZ $2113
	STZ $2113
	STA.b {bg4hofs}
	STA.b {bg4hofs}+1
	STZ $2114
	STZ $2114
	STA.b {bg4vofs}
	STA.b {bg4vofs}+1
	STZ $2115
	STZ $211A
	STZ.b {m7sel}
	STZ $211B
	STZ $211C
	STZ $211D
	STZ $211E
	STZ $211F	
	STZ $2120
	STZ $2123
	STZ.b {w12sel}
	STZ $2124
	STZ.b {w34sel}
	STZ $2125
	STZ.b {wobjsel}
	STZ $2126
	STZ.b {wh0}
	LDA #$F8
	STA $2127
	STA.b {wh1}
	STZ $2128
	STZ.b {wh2}
	STZ $2129
	STZ.b {wh3}
	STZ $212A
	STZ.b {wbglog}
	STZ $212B
	STZ.b {wobjlog}
	LDA #$11
	STA $212C
	STA.b {tm}
	STA $212E
	STA.b {tmw}
	STZ $212D
	STZ.b {ts}
	STZ $212F
	STZ.b {tsw}
	LDA #$02
	STA $2130
	STA.b {cgwsel}
	LDA #$A1
	STA $2131
	STA.b {cgadsub}
	LDA #$20
	STA $2132
	STA.b {coldata}
	LDA #$40
	STA $2132
	STA.b {coldata}+1
	LDA #$80
	STA $2132
	STA.b {coldata}+2
	STZ $2133
	STZ.b {setini}
	PLP
	PLB
	RTL
	
init_ppu1:
	PHB
	PHP
	PHK
	PLB
	SEP #$30
	LDA #$80
	STA $2100
	STA.b {kido}
	STZ $2101
	STZ.b {obsel}
	LDA #$10
	STA $2102
	STA.b {oamaddl}
	LDA #$00
	STA $2103
	STA.b {oamaddh}
	STZ $2104
	STZ $2104
	LDA #$09
	STA $2105
	STA.b {bgmode}
	STZ $2106
	STZ.b {mosaic}
	STZ $2107
	STZ.b {bg1sc}
	STZ $2108
	STZ.b {bg2sc}
	STZ $2109
	STZ.b {bg3sc}
	STZ $210A
	STZ.b {bg4sc}
	STZ $210B
	STZ.b {bg12nb}
	STZ $210C
	STZ.b {bg34nb}
	STZ $210D
	STZ $210D
	STZ.b {bg1hofs}
	STZ.b {bg1hofs}+1
	STZ $210E
	STZ $210E
	STZ.b {bg1vofs}
	STZ.b {bg1vofs}+1
	STZ $210F
	STZ $210F
	STZ.b {bg2hofs}
	STZ.b {bg2hofs}+1
	STZ $2110
	STZ $2110
	STZ.b {bg2vofs}
	STZ.b {bg2vofs}+1
	STZ $2111
	STZ $2111
	STZ.b {bg3hofs}
	STZ.b {bg3hofs}+1
	STZ $2112
	STZ $2112
	STA.b {bg3vofs}
	STA.b {bg3vofs}+1
	STZ $2113
	STZ $2113
	STA.b {bg4hofs}
	STA.b {bg4hofs}+1
	STZ $2114
	STZ $2114
	STA.b {bg4vofs}
	STA.b {bg4vofs}+1
	STZ $2115
	STZ $211A
	STZ.b {m7sel}
	STZ $211B
	STZ $211C
	STZ $211D
	STZ $211E
	STZ $211F	
	STZ $2120
	STZ $2123
	STZ.b {w12sel}
	STZ $2124
	STZ.b {w34sel}
	STZ $2125
	STZ.b {wobjsel}
	STZ $2126
	STZ.b {wh0}
	LDA #$F8
	STA $2127
	STA.b {wh1}
	STZ $2128
	STZ.b {wh2}
	STZ $2129
	STZ.b {wh3}
	STZ $212A
	STZ.b {wbglog}
	STZ $212B
	STZ.b {wobjlog}
	LDA #$11
	STA $212C
	STA.b {tm}
	STA $212E
	STA.b {tmw}
	STZ $212D
	STZ.b {ts}
	STZ $212F
	STZ.b {tsw}
	LDA #$02
	STA $2130
	STA.b {cgwsel}
	LDA #$A1
	STA $2131
	STA.b {cgadsub}
	LDA #$20
	STA $2132
	STA.b {coldata}
	LDA #$40
	STA $2132
	STA.b {coldata}+1
	LDA #$80
	STA $2132
	STA.b {coldata}+2
	STZ $2133
	STZ.b {setini}
	PLP
	PLB
	RTL	
	
enable_nmi:
	PHP
	SEP #$20
	LDA.b {nmitimen}
	ORA #$80
	STA.b {nmitimen}
	STA $4200
	PLP
	RTL
	
disable_nmi:
	PHP
	SEP #$20
	LDA.b {nmitimen}
	AND #$7F
	STA.b {nmitimen}
	STA $4200
	PLP
	RTL
	
init_cpu_reg:
	PHB
	PHP
	PHK
	PLB
	SEP #$30
	LDA #$01
	STA $4200
	STA $420D
	STA.b {nmitimen}
	STA.b {hispeed_rom}
	LDA #$80
	STA $4201
	STA $4202
	STA $4203
	STA $4204
	STA $4205
	STA $4206
	STA $4207
	STZ $4208
	STZ $4209
	STZ $420A
	STZ.b {irq_timer_h}
	STZ.b {irq_timer_h}+1
	STZ.b {irq_timer_v}
	STZ.b {irq_timer_v}+1
	STZ $420B
	STZ $420C
	STZ.b {hdma}
	PLP
	PLB
	RTL	
	
enable_pad:
	PHP
	SEP #$20
	LDA.b {nmitimen}
	ORA #$01
	STA.b {nmitimen}
	STA $4200
	PLP
	RTL
	
disble_pad:
	PHP
	SEP #$20
	LDA.b {nmitimen}
	AND #$FE
	STA.b {nmitimen}
	STA $4200
	PLP
	RTL
	
wait_vblank:
	PHP
	LDA.b {wait_flag}
-
	CMP.b {wait_flag}
	BEQ -
	PLP
	RTL
	
wait_end_vblank:
	PHP
	SEP #$20
-
	LDA $4212
	AND #$80
	BNE -
	PLP
	RTL
	
restore_kido:
	PHP
	PHB
	PHK
	PLB
	SEP #$20
	LDA.b {kido}
	STA $2100
	PLB
	PLP
	RTL
	
set_bg_param:
	PHB
	PHP
	PHK
	PLB
	SEP #$20
	LDA.b {kido}
	BMI +
	JMP end_set_bg_param
+
	LDA.b {buffer1}+1
	AND #$F0
	LSR #4
	STA.b {buffer1}+1
	LDA.b {buffer2}+1
	AND #$F0
	ORA.b {buffer1}+1
	STA.b {buffer1}
	LDA.b {buffer3}+1
	AND #$F0
	LSR #4
	STA.b {buffer3}+1
	LDA.b {buffer4}+1
	AND #$F0
	ORA.b {buffer3}+1
	STA.b {buffer3}
	LDA.b {buffer5}+1
	AND #$E0
	LSR #4
	STA.b {buffer5}
	LDA.b {buffer6}+1
	AND #$FC
	STA.b {buffer6}
	LDA.b {buffer7}+1
	AND #$FC
	STA.b {buffer7}
	LDA.b {buffer8}+1
	AND #$FC
	STA.b {buffer8}
	LDA.b {buffer9}+1
	AND #$FC
	STA.b {buffer9}
	LDA.b {bg1sc}
	AND #$03
	ORA.b {buffer6}
	STA $2107
	STA.b {bg1sc}
	LDA.b {bg2sc}
	AND #$03
	ORA.b {buffer7}
	STA $2108
	STA.b {bg2sc}
	LDA.b {bg3sc}
	AND #$03
	ORA.b {buffer8}
	STA $2109
	STA.b {bg3sc}
	LDA.b {bg4sc}
	AND #$03
	ORA.b {buffer9}
	STA $210A
	STA.b {bg4sc}
	LDA.b {obsel}
	AND #$F8
	ORA.b {buffer5}
	STA $2101
	STA.b {obsel}
	LDA.b {buffer1}
	STA $210B
	STA.b {bg12nb}
	LDA.b {buffer3}
	STA $210C
	STA.b {bg34nb}
end_set_bg_param:
	PLP
	PLB
	RTL

write_ppu:
	PHP
	PHB
	PHK
	PLB
	SEP #$20
	LDA.b {kido}
	STA $2100
	LDA.b {obsel}
	STA $2101
	LDA.b {bgmode}
	STA $2105
	LDA.b {mosaic}
	STA $2106
	LDA.b {bg1sc}
	STA $2107
	LDA.b {bg2sc}
	STA $2108
	LDA.b {bg3sc}
	STA $2109
	LDA.b {bg4sc}
	STA $210A
	LDA.b {bg12nb}
	STA $210B
	LDA.b {bg34nb}
	STA $210C
	LDA.b {w12sel}
	STA $2123
	LDA.b {w34sel}
	STA $2124
	LDA.b {wobjsel}
	STA $2125
	LDA.b {wh0}
	STA $2126
	LDA.b {wh1}
	STA $2127
	LDA.b {wh2}
	STA $2128
	LDA.b {wh3}
	STA $2129
	LDA.b {wbglog}
	STA $212A
	LDA.b {wobjlog}
	STA $212B
	LDA.b {tm}
	STA $212C
	LDA.b {tmw}
	STA $212E
	LDA.b {ts}
	STA $212D
	LDA.b {tsw}
	STA $212F
	LDA.b {cgwsel}
	STA $2130
	LDA.b {cgadsub}
	STA $2131
	LDA.b {coldata}
	STA $2132
	LDA.b {coldata}+1
	STA $2132
	LDA.b {coldata}+2
	STA $2132
	LDA.b {setini}
	STA $2133
	LDA.b {bg1hofs}
	STA $210D
	LDA.b {bg1hofs}+1
	STA $210D
	LDA.b {bg1vofs}
	SEC
	SBC #$01
	STA $210E
	LDA.b {bg1vofs}+1
	SBC #$00
	STA $210E
	LDA.b {bg2hofs}
	STA $210F
	LDA.b {bg2hofs}+1
	STA $210F
	LDA.b {bg2vofs}
	SEC
	SBC #$01
	STA $2110
	LDA.b {bg2vofs}+1
	SBC #$00
	STA $2110
	LDA.b {bg3hofs}
	STA $2111
	LDA.b {bg3hofs}+1
	STA $2111
	LDA.b {bg3vofs}
	SEC 
	SBC #$01
	STA $2112
	LDA.b {bg3vofs}+1
	SBC #$00
	STA $2112
	LDA {nmitimen}
	STA $4200

	LDA {vtimel}
	STA $4209
	LDA {vtimel}+1
	STA $420A
	LDA {htimel}
	STA $4207
	LDA {htimel}+1
	STA $4208
	PLB
	PLP
	RTL
	
check_restart:
	PHP
	LDA $E4
	AND #$EFFF
	EOR #$2030
	BNE +
	LDA $E8
	BIT #$1000
	BEQ +
	SEP #$20
	LDA #$80
	STA $2100
	LDA #$01
	STA $4200
	STA.b {nmitimen}
	STZ $0341
	STZ $0342
	STZ.b {hdma}
	STZ $0345
	REP #$20
	STZ $0343
+
	PLP
	RTL
	
write_irq0:
	SEI
	PHB
	PHP
	PHK
	PLB
	SEP #$20
	LDA.b {nmitimen}
	ORA #$30
	STA.b {nmitimen}
	REP #$20
	LDA #$8000
	TRB $168F
	LDA #(irq_0)
	//STA.b {irq_loop}
	PLP
	PLB
	RTL
	

write_irq_pos:
	SEP #$20
	LDA $16CB,x
	STA $4208
	LDA $16CA,x  //Irq h-pos
	STA $4207
	LDA $16DB,x
	STA $420A  //Irq v-pos
	LDA $16DA,x
	STA $4209
	REP #$20
	LDA $16AA,x
	XBA
	STA $1698
	LDA $16EA,x
	STA $1697
	RTS
	

init_decomp_ram:
	PHP
	PHB
	SEP #$20
	LDA #$7F
	PHA
	PLB
	REP #$30
	LDX #$0000
-
	STZ $0000,x
	INX #2
	CPX #$8000
	BCC -
	PLB
	PLP
	RTL
	
change_col_slot:
	PHP
	PHB
	SEP #$20
	REP #$10
	LDA.b {decompress_adr_hi}
	PHA
	PLB
	LDA.b {col_slot}
	ASL #2
	ORA.b {buffer1}
	STA.b {buffer0}
	LDX.b {decompress_adr}
-
	LDA $0001,x
	CLC
	ADC.b {buffer0}
	STA $0001,x
	INX #2
	DEY #2
	BNE -	
	PLB
	PLP
	RTL
	
update_ppu_vram:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	LDA {bg1sc}
	AND #$00FC
	ORA #$1000
	STA $4202
	NOP #3
	LDA $4216
	STA {bg1map_vram}
	LDA {bg2sc}
	AND #$00FC
	ORA #$1000
	STA $4202
	NOP #3
	LDA $4216
	STA {bg2map_vram}
	LDA {bg3sc}
	AND #$00FC
	ORA #$0100
	STA $4202
	NOP #3
	LDA $4216
	XBA
	STA {bg3map_vram}
	
	LDA {bg12nb}
	AND #$FF00
	STA $4202
	NOP #3
	LDA $4216
	STA {bg1tile_vram}
	LDA {bg12nb}
	AND #$00FF
	ORA #$1000
	STA $4202
	NOP #3
	LDA $4216
	STA {bg2tile_vram}
	
	LDA {bg34nb}
	AND #$FF00
	STA $4202
	NOP #3
	LDA $4216
	STA {bg3tile_vram}
	
	LDA {obsel}
	AND #$0007
	XBA
	ASL
	STA {oam_vram}
	
	PLB
	PLP
	RTL
	
write_col_slot:
	PHP
	PHY
	PHX
	REP #$30
	LDY #$0000
	LDA {col_slot}
	AND #$00FF
	ASL #5
	TAX
-
	LDA [{24ptr1}],y
	STA {color_table},x
	INY #2
	INX #2
	CPY #$0020
	BNE -
	PLX
	PLY
	PLP
	RTL
	
check_pointer:
	LDA {pointer_flag}
	BEQ +
	CMP #$FFFE
	BEQ +
	LDA #$FFFE
	STA {pointer_flag}
	LDX #$0000
-
	LDA pointer_pos1,x
	STA $1C50,x
	INX #2
	CPX #$0010
	BNE -
	LDA #$000C
	STA {pointer_spd1}
	STA {pointer_spd2}
+
	JSR check_pointer_pos
	LDA $1C50
	AND #$FF00
	STA {pointer_ypos}
	JSR pointer_pos_hosei
	RTL
	
check_pointer_pos:
	LDA {pointer_flag}
	BNE +
	RTS
+
	LDA {pad4}
	CMP #$2000
	BEQ +
	RTS
+
	LDX #$0000
	LDA $1C50
	XBA
	AND #$00FF
	CMP #$0048
	BNE +
	SEP #$20
	LDA #$12
	STA {sfx1}
	REP #$20
-
	LDA pointer_pos2,x
	STA $1C50,x
	INX #2
	CPX #$0010
	BNE -
	RTS
+
	CMP #$0058
	BNE +
	SEP #$20
	LDA #$12
	STA {sfx1}
	REP #$20
-
	LDA pointer_pos3,x
	STA $1C50,x
	INX #2
	CPX #$0010
	BNE -
	RTS
+
	SEP #$20
	LDA #$12
	STA {sfx1}
	REP #$20
-
	LDA pointer_pos1,x
	STA $1C50,x
	INX #2
	CPX #$0010
	BNE -
	RTS
	
pointer_pos1:
	dw $483C, $34C0
	dw $503C, $34C1
	dw $4844, $34C2
	dw $5044, $34C3
pointer_pos2:
	dw $583C, $34C0
	dw $603C, $34C1
	dw $5844, $34C2
	dw $6044, $34C3
pointer_pos3:
	dw $683C, $34C0
	dw $703C, $34C1
	dw $6844, $34C2
	dw $7044, $34C3
clear_pointer:
	LDX #$0000
	LDA #$E000
-
	STA $1C50,x
	INX #4
	CPX #$0010
	BNE -
	RTL
	
pointer_pos_hosei:
	LDA {pointer_spd1}
	DEC
	BEQ +
	STA {pointer_spd1}
	RTS
+
	LDA {pointer_spd2}
	STA {pointer_spd1}
	LDA {pointer_xpos}
	BPL +
	LDA #$0002
	STA {pointer_xpos}
	BRA _3
+
	LDA #$FFFE
	STA {pointer_xpos}	
_3:
	LDX #$0000
	LDA $1C50,x
	CLC
	ADC {pointer_xpos}
	STA $1C50,x
	
	LDX #$0004
	LDA $1C50,x
	CLC
	ADC {pointer_xpos}
	STA $1C50,x
	
	LDX #$0008
	LDA $1C50,x
	CLC
	ADC {pointer_xpos}
	STA $1C50,x
	
	LDX #$000C
	LDA $1C50,x
	CLC
	ADC {pointer_xpos}
	STA $1C50,x
	RTS
	
	
