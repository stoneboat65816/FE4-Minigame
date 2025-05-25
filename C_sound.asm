//##########################
//  SECTION SOUND
//#########################
upload_spc:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	PHX
	PHY
	LDA.b {soundptr1}
	PHA
	LDA.b {soundptr1}+1
	PHA
	LDA.b {soundptr2}
	PHA
	LDA.b {soundptr2}+1
	PHA
	LDX #$005E
	LDA #$0000
-
	STA $04B6,x
	DEX #2
	BPL -
	LDA #(driver>>16)
	XBA
	STA $04B8
	LDA #(driver)
	STA $04B6
	LDA driver
	TAY
	LDA driver+1
	CLC
	ADC $04B8
	STA.b {soundptr1}+1
	STZ.b {soundptr1}
	SEP #$20
	LDA #$FE
	STA.w {sound_on}
	JSL upload_driver
	SEP #$20
	STZ $04F5
	LDA #$FD
	STA.w {sound_on}
	REP #$20
	LDA $04B8
	STA.b {soundptr2}+1
	LDA driver+0x0E
	STA.b {soundptr2}
	LDA.b [{soundptr2}]
	STA.b {soundptr2}
	JSL _8091B3
	PLA
	STA.b {soundptr2}+1
	PLA
	STA.b {soundptr2}
	PLA
	STA.b {soundptr1}+1
	PLA
	STA.b {soundptr1}
	PLY
	PLX
	PLB
	PLP
	RTL
	
upload_driver:
	PHP
	PHB
	PHK
	PLB
	SEP #$20
	REP #$10
-
	LDA #$CC
	LDX #$BBAA
	CPX $2140
	BEQ _916E
	LDA.w {sound_on}
	STA $2140
	BRA -

load_sound_byte:
	LDA.b [{soundptr1}],y
	INY
	BNE +
	INC.b {soundptr1_hi}
	LDY.b {soundptr1}
+
	RTS

_9148:
	JSR load_sound_byte
	XBA
	LDA #$00
	BRA +
_9150:
	XBA
	JSR load_sound_byte
	XBA
-
	CMP $2140
	BNE -
	INC
+
	REP #$20
	STA $2140
	SEP #$20
	DEX
	BNE _9150
-
	CMP $2140
	BNE -
-
	ADC #$03
	BEQ -
_916E:
	PHA
	JSR load_sound_byte
	XBA
	JSR load_sound_byte
	XBA
	REP #$20
	TAX
	SEP #$20
	JSR load_sound_byte
	STA $2142
	JSR load_sound_byte
	STA $2143
	CPX #$0001
	LDA #$00
	ROL
	STA $2141
	ADC #$7F
	PLA
	STA $2140
-
	CMP $2140
	BNE -
	BVS _9148
	STZ.w {sound_on}
	REP #$30
-
	LDA $2140
	CMP $2140
	BNE -
	CMP #$0000
	BNE -
	PLB
	PLP
	RTL
	
_8091B3:
	PHP
	PHB
	PHK
	PLB
	SEP #$10
	REP #$20
	LDA.w {sound_on}
	AND #$00FF
	STA $2140
	LDX #$00
	STX $04FD
	LDX $04F5
	BEQ +
	JSL disable_nmi
+
	LDX.w {sound_on}
	BRA _8091F9
_8091D7:
	PEA _8091E6
	INY #2
_91DC:
	LDA.b [{soundptr1}]
	INC.b {soundptr1}
	INC.b {soundptr1}
	BNE _8091E6
	INC.b {soundptr1_hi}
_8091E6:
	RTS
	
_8091E7:
	CPX $2140
	BNE _8091E7
	STA $2142
	STY $2140
	INX #2
_8091F4:
	DEC $04F0
	BNE _8091D7
_8091F9:
	PHX
-
	LDA.b [{soundptr2}]
	BEQ _927C
	CMP #$0064
	BCS +
	JSR _8093C6
	LDX $04FD
	BNE _920F
+
	INC.b {soundptr2}
	INC.b {soundptr2}
_920F:
	STA $04F0
	XBA
	SEP #$20
	AND #$F0
	BEQ +
	LSR #3
	TAX
	JSR (_9357,x)
+
	REP #$20
	LDA $04F0
	BEQ -
	PHB
	LDX $04B9
	PHX
	PLB
	REP #$10
	AND #$07FF
	SEC
	SBC #$0064
	ASL #3
	CLC
	ADC driver+0x0C
	TAX
	LDA $0007,x
	LSR
	BCC +
	JMP _8092C9
+
	LDA $0002,x
	XBA
	CLC
	ADC $0004B8
	STA.b {soundptr1}+1
	LDA $0000,x
	STA.b {soundptr1}
	LDY $0005,x
	BNE +
	LDA $0004F2
	TAY
+
_9263:
	LDA $0003,x
	PHA
	INC
	LSR
	STA $0004F0
	PLA
	PLB
	STY $04F2
	CLC
	ADC $04F2
	STA $04F2
	TYA
	SEP #$10
_927C:
	PLX
	TXY
	INY #3
-
	INY
	BEQ -
-
	CPX $2140
	BNE -
	STA $2142
	STY $2141
	STY $2140
	CMP #$0000
	BEQ _92B0
	JSR _91DC
-
	CPY $2140
	BNE -
	LDY #$02
	LDX #$00
	STA $2142
	STY $2140
	STX $2141
	JMP _8091F4
_92B0:
	LDX $2141
	CPX.w {sound_on}
	BEQ _92B0
	LDX #$00
	STX.w {sound_on}
	LDX $04F5
	BEQ +
	JSL enable_nmi
+
	PLB
	PLP
	RTL
	
_8092C9:
	LDY.b {compress_adr}
	PHY
	LDY.b {compress_adr_hi}
	PHY
	LDY.b {decompress_adr}+1
	PHY
	LDY.b {16buffer}
	PHY
	LDY.b {decomp_buffer}
	PHY
	LDY.b {decomp_buffer}+1
	PHY
	LSR
	BCC _92F8
	LDA #$7E00
	STA.b {decompress_adr}+1
	STA.b {soundptr1}+1
	LDA #$6358
	STA.b {decompress_adr}
	STA.b {soundptr1}
	TXA
	CMP $000504
	BEQ _9334
	PEA $0001
	BRA _9310
_92F8:
	LDA #$7E00
	STA.b {decompress_adr}+1
	STA.b {soundptr1}+1
	LDA #$5358
	STA.b {decompress_adr}
	STA.b {soundptr1}
	TXA
	CMP $000502
	BEQ _9334
	PEA $0000
_9310:
	LDA $0002,x
	XBA
	CLC
	ADC $0004B8
	STA.b {compress_adr}+1
	LDA $0000,x
	STA.b {compress_adr}
	PHX 
	JSL decomp1
	PLX
	TXA
	PLY
	BEQ +
	STA $000504
	BRA _9334
+
	STA $000502
_9334:
	SEP #$20
	LDA.b [{soundptr1}]
	STA $000507
	REP #$20
	PLY
	STY.b {decomp_buffer}+1
	PLY
	STY.b {decomp_buffer}
	PLY
	STY.b {16buffer}
	PLY
	STY.b {decompress_adr}+1
	PLY
	STY.b {compress_adr_hi}
	PLY
	STY.b {compress_adr}
	LDY $0005,x
	JMP _9263
	
_9357:
	dw $FFFF
	dw (_9392)
	dw (_9392)
	dw (_9392)
	dw (_9392)
	dw (_9392)
	dw (_9392)
	dw (_9392)
	dw (_9392)
	dw (_9377)
	dw (_94E2)
	dw (_93B0)
	dw (_9382)
	dw (_9391)
	dw (_9392)
	dw (_93B8)
	
	
_9377:
	SEP #$20
	STZ $04EB
	REP #$20
	STZ $04F0
	RTS
_9382:
	REP #$20
	LDA.b [{soundptr2}]
	STA $04F2
	INC.b {soundptr2}
	INC.b {soundptr2}
	STZ $04F0
_9391:
	RTS
_9392:
	REP #$20
	LDA $04F0
	DEC.b {soundptr2}
	DEC.b {soundptr2}
	ASL
	AND #$1FFF
	CMP #$1000
	BCC +
	ORA #$F000
+
	CLC
	ADC.b {soundptr2}
	STA.b {soundptr2}
	STZ $04F0
	RTS
_93B0:
	REP #$20
	STZ $0502
	STZ $0504
_93B8:
	SEP #$20
	STZ $04FE
	STZ $04FF
	REP #$20
	STZ $04F0
	RTS
_8093C6:
	CMP #$0005
_93C9:
	BCC _9412
	LDX $04FD
	BNE _93E7
	SEP #$20
	LDY #$C900
	BIT $01B0,x
	INY
	CMP $04FE,y
	STA $04FE,y
	BNE _93E7
	REP #$20
	LDA #$0000
	RTS
_93E7:
	INX
	PHX
	REP #$20
	ASL
	CLC
	ADC driver+8
	STA.b {soundptr1}
	LDY $04B9
	STY.b {soundptr1_hi}
	LDA.b [{soundptr1}]
-
	DEX
	BEQ +
	INC #2
	BRA -
+
	STA.b {soundptr1}
	PLX
	LDY #$02
	LDA.b [{soundptr1}],y
	BNE +
	LDX #$00
+
	LDA.b [{soundptr1}]
	STX $04FD
	RTS

_9412:
	CMP #$0003
	BCS _9477
	LDX $04B9
	STX.b {soundptr1_hi}
	REP #$10
	DEC
	ASL
	TAX
	LDA $95A9,x
	TAY
	LDA $95A1,x
	TAX
	LDA $7E4EA9,x
	CMP #$FFFF
	BNE +
	INC
	BRA _9441
+
	AND #$00FF
	CLC
	ADC driver+0x012
	STA.b {soundptr1}
	LDA.b [{soundptr1}],y
_9441:
	SEP #$10
	AND #$00FF
	BNE +
	LDX #$00
	BRA _9473
+
	DEC
	ASL
	CLC
	ADC driver+8
	STA.b {soundptr1}
	LDA.b [{soundptr1}]
	STA.b {soundptr1}
	LDA $04FD
	LDX $04FD
	INX
	AND #$000F
	ASL
	CLC
	ADC.b {soundptr1}
	STA.b {soundptr1}
	LDY #$02
	LDA.b [{soundptr1}],y
	BNE _9471
	LDX #$00
_9471:
	LDA.b [{soundptr1}]
_9473:
	STX $04FD
	RTS
_9477:
	LDX $04B9
	STX.b {soundptr1_hi}
	PHA
	REP #$10
	CMP #$0004
	BNE +
	LDA $050E
	BRA _948C
+
	LDA $050C
_948C:
	STA $04F0
	PLA
	DEC
	ASL
	TAX
	LDA $95A1,x
	TAX
	LDY #$0140
	LDA $7E4EA9,x
	AND #$007F
	CLC
	ADC driver+0x12
	STA.b {soundptr1}
	LDA.b [{soundptr1}],y
	SEP #$10
	AND #$00FF
	BNE +
	LDX #$00
	BRA _94DE
+
	DEC
	CLC
	ADC driver+0x14
	ADC $04F0
	STA.b {soundptr1}
	LDA.b [{soundptr1}]
	STA.b {soundptr1}
	LDA $04FD
	LDX $04FD
	INX
	AND #$000F
	ASL
	CLC
	ADC.b {soundptr1}
	STA.b {soundptr1}
	LDY #$02
	LDA.b [{soundptr1}],y
	BNE +
	LDX #$00
+
	LDA.b [{soundptr1}]
_94DE:
	STX $04FD
	RTS
	
_94E2:
	REP #$30
	LDA $7E4EAA
	AND #$0001
	STA $04F0
	BEQ _94F6
	LDA $7E4EC3
	BRA _94FA
_94F6:
	LDA $7E4F23
_94FA:
	AND #$001F
	STA $050C
	STA $050E
	LDA $7E4EAB
	TAX
	LDA $04F0
	BNE _9513
	LDA $7E4EDD
	BRA _9517
_9513:
	LDA $7E4F3D
_9517:
	CMP #$005C
	BEQ _954E
	CPX #$0003
	BCC _9569
	CMP #$005B
	BEQ _954E
	CMP #$0061
	BEQ _954E
	CMP #$0063
	BEQ _954E
	CMP #$0064
	BEQ _954E
	CMP #$0065
	BEQ _954E
	CMP #$0042
	BEQ _954E
	CMP #$0047
	BEQ _954E
	CMP #$004C
	BEQ _954E
	CMP #$0052
	BNE _9569
_954E:
	LDA $04F0
	BNE _955F
	LDA $7E4EC3
	AND #$001F
	STA $050E
	BRA _9569
_955F:
	LDA $7E4F23
	AND #$001F
	STA $050C
_9569:
	LDX $050C
	JSR _9583
	STX $050C
	LDX $050E
	JSR _9583
	INX #2
	STX $050E
	STZ $04F0
	SEP #$30
	RTS
_9583:
	LDA _95AD,x
	AND #$001C
	TAX
	LDA $000D6A
	CMP #$0004
	BNE _95A0
	CPX #$000C
	BEQ _95A0
	CPX #$0014
	BEQ _95A0
	LDX #$0010
_95A0:
	RTS
	
_95AD:
	dw $0400
	dw $0000
	dw $0804
	dw $0000
	dw $0C08
	dw $0C0C
	dw $0C0C
	dw $1400
	dw $0000
	dw $0000
	dw $0000
	dw $0C00
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	

	
_809072:
	PHP
	PHB
	PHK
	PLB
	REP #$20
	LDA $04F6
	AND #$0080
	BEQ _9087
	LDA #$00F3
_9087:
	JSL _808FA3
	PLB
	PLP
	RTL
	
_808F6F:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	PHX
	PHA
	AND #$00FF
	CMP #$00C8
	BCC _808FC6
	CMP #$00E0
	BCS _808FC6
	SEP #$20
	STZ $04EB
	CMP #$CE
	BCS _808F94
	CMP #$CB
	BCC _808F94
	STA $04EB
_808F94:
	REP #$20
	LDA $04EA
	AND #$0010
	BEQ _808FC6
	PLA
	PLX
	PLB
	PLP
	RTL
	
_808FA3:
	PHP 
	PHB
	PHK
	PLB
	REP #$30
	PHX
	PHA
	BRA _808FC6
_808FAD:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	PHX
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _808FD9
	LDA $04EA
	AND #$0001
	BNE _808FD9
	PHX
_808FC6:
	LDX #$0000
_808FC9:
	LDA $04D8,x
	BEQ _808FD5
	INX #2
	CPX #$0006
	BCC _808FC9
_808FD5:
	PLA
	STA $04D8,x	
_808FD9:
	PLX
	PLB
	PLP
	RTL
	
_80900D:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	PHX
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _9039
	LDA $04EA
	AND #$0004
	BNE _9039
	PHX
	LDX #$0000
_9029:
	LDA $04E2,x
	BEQ _9035
	INX #2
	CPX #$0006
	BCC _9029
_9035:
	PLA 
	STA $04E2,x
_9039:
	PLX
	PLB
	PLP
	RTL
	
	
_80903D:
	PHP 
	PHB
	PHK
	PLB
	REP #$20
	LDA $04F6
	AND #$0002
	BNE _809057
	LDA $04EB
	AND #$00FF
	BEQ _809057
	JSR _808F6F
_809057:
	PLB
	PLP
	RTL
	
_80905A:
	PHP
	PHB
	PHK
	PLB
	REP #$20
	LDA $04F6
	AND #$0002
	BEQ _80906F
	LDA #$00F8
	JSR _808FA3
_80906F:
	PLB
	PLP
	RTL
	
_80908A:
	PHP
	PHB
	PHK
	PLB
	REP #$20
	LDA $04F6
	AND #$0080
	BNE _909F
	LDA #$00F2
	JSL _808FA3
_909F:
	PLB
	PLP
	RTL
	
check_sfx:
	PHP
	PHB
	PHK
	PLB
	SEP #$10
	REP #$20
	LDY.w {sound_on}
	BNE _809121
-
	LDX $2141
	CPX $2141
	BNE -
	STX $0506
-
	LDX $2140
	CPX $2140
	BNE -
	CPX.w {sfx1}
	BNE _8090E2
	LDA $04D8
	STA.w {sfx1}
	LDA $04DA
	STA $04D8
	LDA $04DC
	STA $04DA
	LDA $04DE
	STA $04DC
	STZ $04DE
_8090E2:
	LDA.w {sfx1}
	STA $2140
-
	LDX $2143
	CPX $2143
	BNE -
	STX $04F6
-
	LDX $2142
	CPX $2142
	BNE -
	CPX.w {sfx2}
	BNE _80911B
	LDA $04E2
	STA.w {sfx2}
	LDA $04E4
	STA $04E2
	LDA $04E6
	STA $04E4
	LDA $04E8
	STA $04E6
	STZ $04E8
_80911B:
	LDA.w {sfx2}
	STA $2142
_809121:
	PLB
	PLP
	RTL
	
check_song:
	PHP
	PHB
	PHK
	PLB
	SEP #$20
	LDA $04F7
	CLC
	ADC #$03
	CMP #$09
	BCC _8095DF
	LDA #$00
_8095DF:
	STA $04F7
	LDA $04EA
	CMP $04EC
	BEQ _80962F
	CLC
	AND #$40
	BEQ _8095F0
	SEC
_8095F0:
	EOR $04EC
	AND #$40
	BEQ _80960B
	LDA #$40
	BCC _809604
	TSB $04EC
	JSL _80908A
	BRA _80960B
_809604:
	TRB $04EC
	JSL _809072
_80960B:
	CLC
	LDA $04EA
	AND #$10
	BEQ _809614
	SEC
_809614:
	EOR $04EC
	AND #$10
	BEQ _80962F
	LDA #$10
	BCC _809628
	TSB $04EC
	JSL _80905A
	BRA _80962F
_809628:
	TRB $04EC
	JSL _80903D
_80962F:
	REP #$30
	LDA.w {song}
	BNE _80963B
	STA $04C6
	BRA _809641
_80963B:
	LDX #$0000
	JSR _809677
_809641:
	LDA $04BC
	BNE _80964B
	STA $04C8
	BRA _809651
_80964B:
	LDX #$0002
	JSR _809677
_809651:
	PLB
	PLP
	RTL
	
_809677:
	LDY.b {soundptr1}
	PHY
	LDY.b {soundptr1}+1
	PHY
	LDY $04B8
	STY.b {soundptr1}+1
	STX $04EE
	CMP $04C6,x
	BEQ _8096A3
	STA $04C6,x
	AND #$00FF
	DEC
	ASL
	TAY
	LDA #$0001
	STA $04C2,x
	LDA driver+4
	STA.b {soundptr1}
	LDA.b [{soundptr1}],y
	BRA _8096A6
_8096A3:
	LDA $04BE,x
_8096A6:
	TAY
	LDA.w {song},x
	AND #$8000
	XBA
	SEP #$20
	STA $04F5
	REP #$20
	DEC $04C2,x
	BNE _8096E9
	STZ.b {soundptr1}
_8096BC:
	LDA.b [{soundptr1}],y
	BEQ _8096F0
	INY #2
	STA $04F8
	AND #$FC00
	BEQ _8096D7
	XBA
	LSR #2
	DEC
	ASL
	TAX
	LDA [{soundptr1}],y
	INY #2
	JSR (_809703,x)
_8096D7:
	LDA $04F8
	AND #$03FF
	BEQ _8096BC
	LDX $04EE
	STA $04C2,x
	TYA
	STA $04BE,x
_8096E9:
	PLA
	STA.b {soundptr1}+1
	PLA
	STA.b {soundptr1}
	RTS
	
_8096F0:
	LDX $04EE
	PHA
	LDA.w {song},x
	STA $0510,x
	PLA 
	STA.w {song},x
	STA $04C6,x
	BRA _8096E9
_809703:
	dw _809729
	dw _809729
	dw _80972E
	dw _80972E
	dw _809759
	dw _809733
	dw _80975E
	dw _809727
	dw _809786
	dw _80979A
	dw _8097E0
	dw _809801
	dw _809810
	dw _80981F
	dw _80982E
	dw _80983C
	dw _809846
	dw _8098AB
	
_809727:
	NOP
	RTS
_809729:
	JSL _808FAD
	RTS
	
_80972E:
	JSL _80900D
	RTS
	
_809733:
	PHA
	LDX $04EE
	LDA.w {song},x
	CMP #$0100
	BCC _809753
	AND #$0F00
	CMP #$0900
	BCS _809753
	STA $04F0
	PLA
	AND #$80FF
	ORA $04F0
	BRA +
_809753:
	PLA
+
	JSL _808F6F
	RTS
	
_809759:
	JSL _808FA3
	RTS
	
_80975E:
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097AE
	SEP #$20
	LDA #$FD
	STA.w {sound_on}
	REP #$20
	BRA _8097B9
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097AE
	SEP #$20
	LDA #$FC
	STA.w {sound_on}
	REP #$20
	BRA _8097B9
_809786:
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097AE
	SEP #$20
	LDA #$FB
	STA.w {sound_on}
	REP #$20
	BRA _8097B9
_80979A:
	TAX 
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097AE
	SEP #$20
	LDA #$FA
	STA.w {sound_on}
	REP #$20
	BRA _8097B9
_8097AE:
	LDA #$0001
	STA $04F8
	DEY #4
	RTS
	
_8097B9:
	TXA
	PHY
	LDY.b {soundptr2}
	PHY
	LDY.b {soundptr2}+1
	PHY
	LDY.b {soundptr1}
	PHY
	LDY.b {soundptr1}+1
	PHY
	LDY $04B8
	STY.b {soundptr2}+1
	STA.b {soundptr2}
	JSL _8091B3
	PLY
	STY.b {soundptr1}+1
	PLY
	STY.b {soundptr1}
	PLY
	STY.b {soundptr2}+1
	PLY
	STY.b {soundptr2}
	PLY
	RTS
	
_8097E0:
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097F6
	SEP #$20
	LDA #$FD
_8097ED:
	STA $04FC
	STX $04FA	
	REP #$20
	RTS
	
_8097F6:
	LDA #$0001
	STA $04F8
	DEY #4
	RTS
	
_809801:
	TAX 
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097F6
	SEP #$20
	LDA #$FC
	BRA _8097ED
	
_809810:
	TAX
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097F6
	SEP #$20
	LDA #$FB
	BRA _8097ED
	
_80981F:
	TAX 
	LDA.w {sound_on}
	AND #$00FF
	BNE _8097F6
	SEP #$20
	LDA #$FA
	BRA _8097ED
_80982E:
	PHP
	SEP #$20
	AND $04F6
	BNE _80983A
	DEY #4
_80983A:
	PLP
	RTS
	
_80983C:
	LDA $04FA
	BEQ _809845
	DEY #4
_809845:
	RTS
	
_809846:
	TAX
	LDA $0508
	BNE _809851
	LDA $04FA
	BEQ _80985C
_809851:
	LDA #$0001
	STA $04F8
	DEY #4
	RTS
	
_80985C:
	CPX #$00CB
	BCC _809866
	CPX #$00CE
	BCC _809871
_809866:
	TXA
	ORA $050A
	STZ $050A
	JMP _809733
_809871:
	SEP #$20
	LDA $0507
	BEQ _8098A0
	CMP $0506
	BNE _8098A0
	REP #$20
	LDA $0500
	BNE _80989B
	TXA
	SEP #$20
	STA $04EB
	REP #$20
	LDA $0507
	AND #$00FF
	XBA
	ORA #$00F1
	JSL _808FA3
	RTS
	
_80989B:
	SEP #$20
	STZ $0507
_8098A0:
	REP #$20
	STZ $0500
	TXA
	JSL _808F6F
	RTS
	
_8098AB:
	REP #$20
	LDX $04FA
	BNE _809851
	DEC
	BNE _8098C0
	LDA $7E4EAA
	AND #$0001
	BNE _8098CF
	BRA _8098C9
_8098C0:
	LDA $7E4EAA
	AND #$0001
	BEQ _8098CF
_8098C9:
	LDA $7E4EC3
	BRA _8098D3
_8098CF:
	LDA $7E4F23	
_8098D3:
	AND #$001F
	CMP #$0001
	BEQ _8098EA
	CMP #$0004
	BEQ _8098EA
	CMP #$0017
	BEQ _8098F5
	LDA #$00C2
	BRA _8098FE
_8098EA:
	LDA #$8000
	STA $050A
	LDA #$80C3
	BRA _8098FE
_8098F5:
	LDA #$8000
	STA $050A
	LDA #$80C4
_8098FE:
	JSL _808F6F
	RTS
	
stream_song:
	PHP
	PHB
	PHK
	PLB
	SEP #$10
	REP #$20
	LDA $04FA
	BEQ _809930
	LDX.w {sound_on}
	BNE _809930
	LDX #$00
	STX $04F5
	LDX $04FC
	STX.w {sound_on}
	REP #$10
	LDX $04B8
	STX.b {soundptr2}+1
	STA.b {soundptr2}
	JSL _8091B3
	STZ $04FA
_809930:
	PLB
	PLP
	RTL
	
inc_spc_timing:
	PHB
	PHP
	PHK
	PLB
	SEP #$20
	INC.w {spc_timing}
	LDA.w {spc_timing}+1
	CLC
	ADC #$03
	STA.w {spc_timing}+1
	PLP
	PLB
	RTL
	
check_upload_song:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	PHA
	PHX
	PHY
	LDA.w {song}
	BNE _809667
	STA $04C6
	BRA _809671
_809667:
	LDX #$0000
	JSR _809677
	JSL stream_song
_809671:
	PLY
	PLX
	PLA
	PLB
	PLP
	RTL
		
init_spc_header:
	PHB 
	PHP
	PHK
	PLB
	SEP #$20
	LDX #$0003
-
	LDA spc_header_table1,x
	STA $04AE,x
	DEX
	BPL -
	LDX #$0004
-
	LDA spc_header_table2,x
	STA $04B2,x
	DEX
	BPL -
	PLP
	PLB
	RTL
	
_87BF43:
	PHB
	PHP
	PHK
	PLB
	LDA $0D6F
	AND #$0180
	ASL
	XBA
	PLP
	PLB
	RTL
	
spc_header_table1:
	db $54, $00, $00, $60
spc_header_table2:	
	db $44, $00, $00, $60, $8B
	
input_change_bgm:
	LDA.w {song}
	BNE _95F14B
	LDA $E4
	BIT #$1000
	BEQ _95F14B
	SEC
	BRA +
_95F14B:
	CLC
+
	RTL
	
act_sfx:
	PHP
	PHB
	SEP #$20
	LDA #$80
	PHA
	PLB
	LDA {class_act_sfx}
	CMP {class_act_sfx_copy}
	BEQ +
	STA {class_act_sfx_copy}
	STZ {buffer2}
+
	LDA {buffer2}
	BNE +
	LDA {class_act_sfx}
	BEQ +
	STA {sfx2}
	LDA #$FF
	STA {buffer2}
+
	PLB
	PLP
	RTL