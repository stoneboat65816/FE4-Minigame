mode_init:
	LDA #$2100
	TCD
	LDX #$001C
	SEP #$20
	LDA #$01
	STA $420D
	STZ $420B
	STZ $420C
-
	STZ $00,x
	DEX
	BPL -
	STZ $0D
	STZ $0D
	STZ $0E
	STZ $0E
	STZ $0E
	STZ $0F
	STZ $0F
	STZ $10
	STZ $10
	STZ $11
	STZ $11
	STZ $12
	STZ $12
	STZ $13
	STZ $13
	STZ $14
	STZ $14
	LDA #$80
	STA $15
	STA $00
	LDX #$0043
-
	STZ $00,x
	DEX
	CPX #$0016
	BPL -
	STZ $80
	STZ $81
	STZ $82
	STZ $83
	REP #$20
	LDA #$4200
	TCD
	LDX #$000C
	SEP #$20
-
	STZ $00,x
	STZ $10,x
	DEX
	BPL -
	LDA #$FF
	STA $01
	LDA #$A0
	STA $32
	STZ $421D
	STZ $421E
	STZ $421F
	REP #$20
	LDA #$4300
	TCD
	LDX #$000A
	SEP #$20
-
	STZ $00,x
	STZ $10,x
	STZ $20,x
	STZ $30,x
	STZ $40,x
	STZ $50,x
	STZ $60,x
	STZ $70,x
	DEX
	BPL -
	LDA #$7F
	PHA
	PLB
	REP #$20
	LDA #$0000
	TCD
	LDA #$0000
	LDX #$1FFE
-
	STA $0000,x
	STA $2000,x
	STA $4000,x
	STA $6000,x
	STA $8000,x
	STA $A000,x
	STA $C000,x
	STA $E000,x
	DEX
	DEX
	BPL -	
	PHK
	PLB
	SEP #$20
	LDA #$7E
	PHA
	PLB
	LDX #$1FFE
	REP #$20
	LDA #$0000
-
	STA $0000,x
	STA $2000,x
	STA $4000,x
	STA $6000,x
	STA $8000,x
	STA $A000,x
	STA $C000,x
	STA $E000,x
	DEX
	DEX
	BPL -
	PHK
	PLB	
	JSL clear_all_vram
	JSL init_ppu_cpu
	JSL upload_spc
	LDA #$0C00
	STA.w {dma_max_size}
	STZ {event_param0}
	STZ {event_param1}
	STZ {event_param2}
	STZ {event_param3}
	STZ {evpos}
	LDA #$0000
	STA {submode}
	LDA #$FFFF
	STA.w {color_table}
	LDY #$0000
	TYX
	SEP #$20
	STZ $4200
	STZ $420B
	STZ $420C
	STZ $2121
	STZ $2122
	JSL enable_nmi
	JML main_loop
	
main_title0:
	SEP #$20
	LDA #$2D
	STA.w {song}
	JSL check_upload_song
	LDA #$20
	STA.b {bg1sc}
	LDA #$28
	STA.b {bg2sc}
	LDA #$09
	STA.b {bgmode}
	LDA #$30
	STA.b {bg12nb}
	LDA #$13
	STA.b {tm}
	LDA #$02
	STA.b {obsel}
	JSL update_ppu_vram
	JSL write_ppu
	JSL disable_nmi
	REP #$10
	LDX #(title_set)
	STX.b {compress_adr}
	LDA.b #(title_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $3E00
	dw $0000
	
	SEP #$20
	REP #$10
	LDX #(title2_set)
	STX.b {compress_adr}
	LDA.b #(title2_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $1A00
	dw $3000
	
	SEP #$20
	REP #$10
	LDX #(title_map)
	STX.b {compress_adr}
	LDA.b #(title_map>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $0800
	dw $2000

	SEP #$20
	REP #$10
	LDX #(title2_map)
	STX.b {compress_adr}
	LDA.b #(title2_map>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	LDA #$01
	STA.b {col_slot}
	LDA #$20
	STA.b {buffer1}
	LDY #$0800
	JSL change_col_slot
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $0800
	dw $2800
	
	REP #$30
	LDX #$0000
	PHX
-
	LDA title_col,x
	STA.w {color_table},x
	INX #2
	CPX #$0020
	BCC -
	PLX
-
	LDA title2_col,x
	STA.w {color_table}+0x20,x
	INX #2
	CPX #$0020
	BCC -	
	
	LDA #$0000
	STA.w {evid}
	LDA #$0130
	STA.b {bg2vofs}
	LDA #$0000
	STA.w {class}
	LDA #$4000
	STA.w {dma_vram}
	LDA #$0001
	STA {mode}
	SEP #$20
	LDA #$08
	STA.b {col_slot}
	JSL enable_nmi
	LDA #$00
	STA.b {kido}
	JML main_loop
	
main_title1:
	JSL init_oam_ypos
	JSL event_check
	JSL write_class_act
	JSL stream_song
	JML main_loop
	
main_sm:
	LDA {submode}
	ASL
	TAX
	JMP (mode_sm,x)
	
mode_sm:
	dw sm00
	dw sm01
	dw sm02
	dw sm03
	
sm00:
	SEP #$20
	LDA #$76
	STA.w {song}
	JSL check_upload_song
	LDA #$22
	STA.b {bg1sc}
	LDA #$28
	STA.b {bg2sc}
	LDA #$09
	STA.b {bgmode}
	LDA #$30
	STA.b {bg12nb}
	LDA #$11
	STA.b {tm}
	LDA #$02
	STA.b {obsel}
	JSL write_ppu
	JSL disable_nmi
	REP #$10
	LDX #(title_set)
	STX.b {compress_adr}
	LDA.b #(title_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $1800
	dw $0000
	
	SEP #$20
	REP #$10
	LDX #(title_map)
	STX.b {compress_adr}
	LDA.b #(title_map>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $0800
	dw $2000

	REP #$30
	LDX #$0000
	PHX
-
	LDA title_col,x
	STA.w {color_table},x
	INX #2
	CPX #$0020
	BCC -
	PLX
-
	LDA title2_col,x
	STA.w {color_table}+0x20,x
	INX #2
	CPX #$0020
	BCC -		
	LDA #$0000
	STA.w {evid}
	LDA #$0290
	STA.b {bg1vofs}
	LDA #$0000
	STA.w {class}
	LDA #$4000
	STA.w {dma_vram}
	LDA #$0001
	STA {submode}
	SEP #$20
	LDA #$08
	STA.b {col_slot}
	JSL enable_nmi
	LDA #$00
	STA.b {kido}
	JML main_loop
	
sm01:
	JSL init_2nd_oam
	JSL init_oam_ypos	
	JSL event_check
	JSL write_class_act	
	JSL stream_song
	JML main_loop
sm02:
	SEP #$20
	LDA #$80
	STA {kido}
	STA $2100
	STZ {sfx1}
	STZ {sfx2}
	SEP #$20
	LDA #$03
	STA.b {obsel}
	LDA #$00
	STA.b {bg12nb}
	LDA #$48
	STA.b {bg1sc}
	LDA #$58
	STA.b {bg2sc}
	LDA #$01
	STA.b {ts}
	LDA #$17
	STA.b {tm}
	LDA #$02
	STA.b {cgwsel}
	LDA #$02
	STA.b {cgadsub}
	LDA #$01
	TSB.b {bg1sc}
	TSB.b {bg2sc}
	LDA #$07
	STA {bg34nb}
	LDA #$50
	STA {bg3sc}
	JSL update_ppu_vram	
	LDX #(nannawalk_set)
	STX.b {compress_adr}
	LDA.b #(nannawalk_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $1000
	dw $6000		
	SEP #$20
	LDX #(nanna_set)
	STX.b {compress_adr}
	LDA.b #(nanna_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $0800
	dw $6800	
	LDX #$0000
-
	LDA nanna_col,x
	STA {color_table}+0x120,x
	INX #2
	CPX #$0020
	BNE -
	LDX #$0000
-
	LDA nannawalk_col_ue,x
	STA {color_table}+0x100,x
	INX #2
	CPX #$0020
	BNE -	
	
	SEP #$20
	LDX #(inn_set)
	STX.b {compress_adr}
	LDA.b #(inn_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $60A0
	dw $0000	
	
	SEP #$20
	LDX #(inn1_map)
	STX.b {compress_adr}
	LDA.b #(inn1_map>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F0000
	dw $1000
	dw $4800
	
	SEP #$20
	LDX #(inn2_map)
	STX.b {compress_adr}
	LDA.b #(inn2_map>>16)
	STA.b {compress_adr_hi}
	LDX #$1000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	JSL decomp
	REP #$30
	JSL force_dma_decomped
	dl $7F1000
	dw $1000
	dw $5800
	
	LDA #$0008
	STA.b {bg2hofs}
	STA.b {bg1hofs}
	STZ.b {bg2vofs}
	STZ.b {bg1vofs}
	STZ {nanna_counter}
	
	REP #$20
	STZ {event_param0}
	STZ {event_param1}
	STZ {event_param2}
	STZ {event_param3}
	STZ {evpos}

	JSL init_2nd_oam
	JSL init_oam_ypos	
	LDA #$0020
	STA {oam_xpos}
	LDA #$00A8
	STA {oam_ypos}

	LDX #$0000
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

	LDA #$000A
	STA {oam_table}+0x0200
	JSL dma_oam_table
	
	LDA #$0002
	STA {nanna_spd}
	
	LDX #$0000
-
	LDA inn_col,x
	STA $0100,x
	INX #2
	CPX #$0100
	BNE -	
	STZ {clock_timer}
	LDA #$0001
	STA {dma_oam_flag}
	STA {evid}
	SEP #$20
	LDA #$7F
	STA {map_adr_hi}
	
	LDA #$77
	STA.w {song}
	JSL check_upload_song
	
	REP #$20
	LDA #$0042
	STA {map_adr}	

	LDA #$7080
	STA {tile_vram_adr}
	LDA #$00A2
	STA {vtimel}
	STA $4209
	LDA #$0000
	STA {htimel}
	STA $4207
	SEP #$20
	LDA {nmitimen}
	ORA #$20
	STA {nmitimen}
	JSL enable_nmi
	REP #$20	
	JSL clear_oam
	INC {submode}
	CLI
	JML main_loop
sm03:	
	JSL event_check
	JSL check_pointer
	JSL check_kaiwa
	JSL check_hantei
	JSL controll_nanna
	JSL dma_clock
	JSL dma_flame	
	JSL stream_song
	JML main_loop