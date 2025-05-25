decomp_title:
	SEP #$20
	REP #$10
//	LDX #(title1_set)
	STX.b {compress_adr}
//	LDA.b #(title1_set>>16)
	STA.b {compress_adr_hi}
	LDX #$0000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	REP #$30
	JSL decomp
	
	SEP #$20
	REP #$10
//	LDX #(title2_set)
	STX.b {compress_adr}
//	LDA.b #(title2_set>>16)
	STA.b {compress_adr_hi}
	LDX #$4000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	REP #$30
	JSL decomp
	
	SEP #$20
	REP #$10
//	LDX #(title1_map)
	STX.b {compress_adr}
//	LDA.b #(title1_map>>16)
	STA.b {compress_adr_hi}
	LDX #$6000
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	REP #$30
	JSL decomp

	SEP #$20
	REP #$10
//	LDX #(title2_map)
	STX.b {compress_adr}
//	LDA.b #(title2_map>>16)
	STA.b {compress_adr_hi}
	LDX #$6800
	STX.b {decompress_adr}
	LDA #$7F
	STA.b {decompress_adr_hi}
	REP #$30
	JSL decomp
	
	LDX #$0000
-
	LDA $7F6000,x
	STA $7F7800,x
	INX #2
	CPX #$0800
	BCC -
	LDA $7F6000
	STA $7F7BFA
	STA $7F7BFC
	LDX #$0000
-
	STA $7F7D80,x
	INX #2
	CPX #$00C0
	BCC -
	LDX #$0000
-
	STA $7F7EA0,x
	INX #2
	CPX #$001A
	BCC -
	SEP #$20
	REP #$10
	
//	LDX #(data)
	STX.b {compress_adr}
//	LDA.b #(data>>16)
	STA.b {compress_adr_hi}
	LDX #$8B88
	STX.b {decompress_adr}
	LDA #$7E
	STA.b {decompress_adr_hi}
	REP #$30
	JSL decomp
	
	LDX #$0000
-
	LDA $7E8C2A,x
	STA $7F6700,x
	LDA $7E8C4A,x
	STA $7F6720,x
	INX #2
	CPX #$001E
	BCC -
	RTL
	
set_title_bg:
	SEP #$20
	LDA #$11
	STA $96 //enable BG1, OAM main screen
	LDA #$00
	STA $97  //disable sub screen
	LDA #$00
	STA $98  //disable mask main screen
	LDA #$00
	STA $99  //disable mask sub screen
	LDA #$04
	STA $7A  //BG1, BG2 tile vram adr
	LDA #$03
	STA $71  //Oam size 8x8
	LDA #$09
	STA $74  //Mode 1, BG3 priority
	LDA #$00
	STA $75  //no pixelation
	LDA #$68
	STA $76  //BG1 tilemap adr
	LDA #$6C
	STA $77  //BG2 tilemap adr
	REP #$20
	LDA #$0000
	STA $7F  //BG1 h-scroll
	LDA #$0000
	STA $81  //BG1 v-scroll
	STA $83 //BG2 h-scroll
	STA $85 //BG2 v-scroll
	RTL
	
write_hell_bg:
	PHX
	LDX #$0000
	LDA #$0080
-
	STA $7E8B88,x
	INX #2
	CPX #$0140
	BCC -
	JSL dma_decomped
	db $02
	dl $7E8B88
	dw $0140
	db $80
	dw $7F00
	SEP #$20
	REP #$10
//	LDX #(hell_set)
	STX.b {compress_adr}
//	LDA.b #(hell_set>>16)
	STA.b {compress_adr_hi}
	LDX #$8B88
	STX.b {decompress_adr}
	LDA #$7E
	STA.b {decompress_adr_hi}
	JSL decomp
	JSL dma_decomped
	db $02
	dl $7E8B88
	dw $6000
	db $80
	dw $0000	
	SEP #$20
	REP #$10
//	LDX #(hell_map)
	STX.b {compress_adr}
//	LDA.b #(hell_map>>16)
	STA.b {compress_adr_hi}
	LDX #$8B88
	STX.b {decompress_adr}
	LDA #$7E
	STA.b {decompress_adr_hi}
	JSL decomp
	JSL dma_decomped
	db $02
	dl $7E8B88
	dw $1000
	db $80
	dw $3000
	SEP #$20
	REP #$10
//	LDX #(cloud_set)
	STX.b {compress_adr}
//	LDA.b #(cloud_set>>16)
	STA.b {compress_adr_hi}
	LDX #$8B88
	STX.b {decompress_adr}
	LDA #$7E
	STA.b {decompress_adr_hi}
	JSL decomp
	JSL dma_decomped
	db $02
	dl $7E8B88
	dw $2000
	db $80
	dw $6000
	SEP #$20
	REP #$10
//	LDX #(cloud_map)
	STX.b {compress_adr}
//	LDA.b #(cloud_map>>16)
	STA.b {compress_adr_hi}
	LDX #$8B88
	STX.b {decompress_adr}
	LDA #$7E
	STA.b {decompress_adr_hi}
	JSL decomp
	JSL dma_decomped
	db $02
	dl $7E8B88
	dw $0800
	db $80
	dw $7000
	LDX #$0000
-
//	LDA hell1_col,x
	STA $0162,x
//	LDA hell2_col,x
	STA $0142,x
//	LDA hell3_col,x
	STA $0102,x
	INX #2
	CPX #$001E
	BCC -
	PLX
	RTL