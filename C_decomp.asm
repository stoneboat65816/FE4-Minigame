//-----------DECOMPRESSION---------------
decomp1:
	PHP 
_A9F3:
	PHB 
_A9F4:
	REP #$30
_A9F6:
	LDY.b {compress_adr}
_A9F8:
	STZ.b {compress_adr}
_A9FA:
	SEP #$20
_A9FC:
	LDA #$01
_A9FE:
	STA.b {decomp_buffer}+2
_AA00:
	BRA _AA21
_AA02:
decomp:
	PHP 
_AA03:
	PHB 
_AA04:
	REP #$30
_AA06:
	LDY.b {compress_adr}
_AA08:
	BMI _AA1B
_AA0A:
	TYA 
_AA0B:
	CLC 
_AA0C:
	ADC #$8000
_AA0F:
	TAY 
_AA10:
	LDA #$8000
_AA13:
	STA.b {compress_adr}
_AA15:
	SEP #$20
_AA17:
	DEC.b {compress_adr_hi}
_AA19:
	BRA _AA1F
_AA1B:	
	STZ.b {compress_adr}
_AA1D:
	SEP #$20
_AA1F:
	STZ.b {decomp_buffer}+2
_AA21:
	STZ.b {decomp_buffer}+1
_AA23:
	LDA.b {decompress_adr_hi}
_AA25:
	PHA 
_AA26:
	PLB 
_AA27:
	LDX.b {decompress_adr}
_AA29:
	JMP _ABCA
_AA2D:
	DEC
_AA2E:
	STA.b {decomp_buffer}+1
_AA30:
	BNE _AA38
_AA32:
	LDA.b {decomp_buffer}
_AA34:
	STA.b {compress_adr_hi}
_AA36:
	LDY.b  {16buffer}
_AA38:
	RTS
 
_AA39:
	INC.b {compress_adr_hi}
_AA3B:
	LDY.b {compress_adr}
_AA3D:
	BNE _AA48
_AA3F:
	PHA 
_AA40:
	LDA.b {decomp_buffer}+2
_AA42:
	BNE _AA47
_AA44:
	LDY #$8000
_AA47:
	PLA 
_AA48:
	RTS
 
_AA49:
	STA.b {decompress_adr}
_AA4B:
	ASL
_AA4C:
	BPL _AA70
_AA4E:
	AND #$20
_AA50:
	BEQ _AA62
_AA52:
	LDA.b {decompress_adr}
_AA54:
	ASL
_AA55:
	ASL
_AA56:
	ASL
_AA57:
	ASL
_AA58:
	ORA #$0F
_AA5A:
	STA $0000,x
_AA5D:
	INX 
_AA5E:
	LDA #$1F
_AA60:
	BRA _AAAD
_AA62:
	LDA.b {decompress_adr}
_AA64:
	AND #$0F
_AA66:
	ORA #$F0
_AA68:
	STA $0000,x
_AA6B:
	INX 
_AA6C:
	LDA #$0F
_AA6E:
	BRA _AAAD
_AA70:
	AND #$20
_AA72:
	BEQ _AA82
_AA74:
	LDA.b {decompress_adr}
_AA76:
	ASL
_AA77:
	ASL
_AA78:
	ASL
_AA79:
	ASL
_AA7A:
	STA $0000,x
_AA7D:
	INX 
_AA7E:
	LDA #$10
_AA80:
	BRA _AAAD
_AA82:
	LDA.b {decompress_adr}
_AA84:
	AND #$0F
_AA86:
	STA $0000,x
_AA89:
	INX 
_AA8A:
	LDA #$00
_AA8C:
	BRA _AAAD
_AA8E:
	AND #$0F
_AA90:
	INC
_AA91:
	STA.b {decompress_adr_hi}
_AA93:
	LDA [{compress_adr}],y
_AA95:
	INY 
_AA96:
	BNE _AA9B
_AA98:
	JSR _AA39
_AA9B:
	PHA 
_AA9C:
	LDA.b {decomp_buffer}+1
_AA9E:
	BEQ _AAA8
_AAA0:
	DEC
_AAA1:
	STA.b {decomp_buffer}+1
_AAA3:
	BNE _AAA8
_AAA5:
	JSR _AA32
_AAA8:
	PLA 
_AAA9:
	CMP #$80
_AAAB:
	BCS _AA49
_AAAD:
	CMP #$10
_AAAF:
	BCC _AAE6
_AAB1:
	AND #$0F
_AAB3:
	STA.b {decompress_adr}
_AAB5:
	LDA [{compress_adr}],y
_AAB7:
	INY 
_AAB8:
	BNE _AABD
_AABA:
	JSR _AA39
_AABD:
	STA.b {decompress_adr}+1
_AABF:
	AND #$F0
_AAC1:
	ORA.b {decompress_adr}
_AAC3:
	STA $0000,x
_AAC6:
	INX 
_AAC7:
	LDA.b {decomp_buffer}+1
_AAC9:
	BEQ _AACE
_AACB:
	JSR _AA2D
_AACE:
	DEC.b {decompress_adr_hi}
_AAD0:
	BMI _AB19
_AAD2:
	LDA.b {decompress_adr}+1
_AAD4:
	ASL
_AAD5:
	ASL
_AAD6:
	ASL
_AAD7:
	ASL
_AAD8:
	ORA.b {decompress_adr}
_AADA:
	STA $0000,x
_AADD:
	INX 
_AADE:
	DEC.b {decompress_adr_hi}
_AAE0:
	BPL _AAB5
_AAE2:
	JMP _ABCA
_AAE6:
	ASL
_AAE7:
	ASL
_AAE8:
	ASL
_AAE9:
	ASL
_AAEA:
	STA.b {decompress_adr}
_AAEC:
	LDA [{compress_adr}],y
_AAEE:
	INY 
_AAEF:
	BNE _AAF4
_AAF1:
	JSR _AA39
_AAF4:
	STA.b {decompress_adr}+1
_AAF6:
	LSR
_AAF7:
	LSR
_AAF8:
	LSR
_AAF9:
	LSR
_AAFA:
	ORA.b {decompress_adr}
_AAFC:
	STA $0000,x
_AAFF:
	INX 
_AB00:
	LDA.b {decomp_buffer}+1
_AB02:
	BEQ _AB07
_AB04:
	JSR _AA2D
_AB07:
	DEC.b {decompress_adr_hi}
_AB09:
	BMI _AB19
_AB0B:
	LDA.b {decompress_adr}+1
_AB0D:
	AND #$0F
_AB0F:
	ORA.b {decompress_adr}
_AB11:
	STA $0000,x
_AB14:
	INX 
_AB15:
	DEC.b {decompress_adr_hi}
_AB17:
	BPL _AAEC
_AB19:
	JMP _ABCA
_AB1D:
	CMP #$50
_AB1F:
	BCS _AB25
_AB21:
	JMP _AA8E
_AB25:
	AND #$0F
_AB27:
	STA.b {decompress_adr_hi}
_AB29:
	LDA [{compress_adr}],y
_AB2B:
	INY 
_AB2C:
	BNE _AB31
_AB2E:
	JSR _AA39
_AB31:
	STA $0000,x
_AB34:
	INX 
_AB35:
	STA $0000,x
_AB38:
	INX 
_AB39:
	LDA.b {decomp_buffer}+1
_AB3B:
	BEQ _AB40
_AB3D:
	JSR _AA2D
_AB40:
	DEC.b {decompress_adr_hi}
_AB42:
	BPL _AB29
_AB44:
	JMP _ABCA
_AB48:
	LSR
_AB49:
	CMP #$60
_AB4B:
	BCC _AB1D
_AB4D:
	XBA 
_AB4E:
	LDA [{compress_adr}],y
_AB50:
	INY 
_AB51:
	BNE _AB56
_AB53:
	JSR _AA39
_AB56:
	PHA 
_AB57:
	LDA.b {decomp_buffer}+1
_AB59:
	BEQ _AB63
_AB5B:
	DEC
_AB5C:
	STA.b {decomp_buffer}+1
_AB5E:
	BNE _AB63
_AB60:
	JSR _AA32
_AB63:
	PLA 
_AB64:
	STA.b {decompress_adr}
_AB66:
	XBA 
_AB67:
	CMP #$70
_AB69:
	AND #$0F
_AB6B:
	INC
_AB6C:
	STA.b {decompress_adr_hi}
_AB6E:
	BCS _AB8F
_AB70:
	LDA.b {decompress_adr}
_AB72:
	STA $0000,x
_AB75:
	INX 
_AB76:
	LDA [{compress_adr}],y
_AB78:
	INY 
_AB79:
	BNE _AB7E
_AB7B:
	JSR _AA39
_AB7E:
	STA $0000,x
_AB81:
	INX 
_AB82:
	LDA.b {decomp_buffer}+1
_AB84:
	BEQ _AB89
_AB86:
	JSR _AA2D
_AB89:
	DEC.b {decompress_adr_hi}
_AB8B:
	BPL _AB70
_AB8D:
	BRA _ABCA
_AB8F:
	LDA [{compress_adr}],y
_AB91:
	INY 
_AB92:
	BNE _AB97
_AB94:
	JSR _AA39
_AB97:
	STA $0000,x
_AB9A:
	INX 
_AB9B:
	LDA.b {decomp_buffer}+1
_AB9D:
	BEQ _ABA2
_AB9F:
	JSR _AA2D
_ABA2:
	LDA.b {decompress_adr}
_ABA4:
	STA $0000,x
_ABA7:
	INX 
_ABA8:
	DEC.b {decompress_adr_hi}
_ABAA:
	BPL _AB8F
_ABAC:
	BRA _ABCA
_ABAE:
	BMI _AB48
_ABB0:
	LSR
_ABB1:
	STA.b {decompress_adr_hi}
_ABB3:
	LDA [{compress_adr}],y
_ABB5:
	INY 
_ABB6:
	BNE _ABBB
_ABB8:
	JSR _AA39
_ABBB:
	STA $0000,x
_ABBE:
	INX 
_ABBF:
	LDA.b {decomp_buffer}+1
_ABC1:
	BEQ _ABC6
_ABC3:
	JSR _AA2D
_ABC6:
	DEC.b {decompress_adr_hi}
_ABC8:
	BPL _ABB3
_ABCA:
	LDA [{compress_adr}],y
_ABCC:
	INY 
_ABCD:
	BNE _ABD2
_ABCF:
	JSR _AA39
_ABD2:
	PHA 
_ABD3:
	LDA.b {decomp_buffer}+1
_ABD5:
	BEQ _ABDF
_ABD7:
	DEC
_ABD8:
	STA.b {decomp_buffer}+1
_ABDA:
	BNE _ABDF
_ABDC:
	JSR _AA32
_ABDF:
	PLA 
_ABE0:
	ASL
_ABE1:
	BCC _ABAE
_ABE3:
	BMI _AC1A
_ABE5:
	LSR
_ABE6:
	PHA 
_ABE7:
	LSR
_ABE8:
	LSR
_ABE9:
	INC
_ABEA:
	STA.b {decompress_adr_hi}
_ABEC:
	PLA 
_ABED:
	AND #$03
_ABEF:
	XBA 
_ABF0:
	LDA [{compress_adr}],y
_ABF2:
	INY 
_ABF3:
	BNE _ABF8
_ABF5:
	JSR _AA39
_ABF8:
	PHY 
_ABF9:
	REP #$20
_ABFB:
	STA.b {decompress_adr}
_ABFD:
	TXA 
_ABFE:
	SEC 
_ABFF:
	SBC.b {decompress_adr}
_AC01:
	TAY 
_AC02:
	SEP #$20
_AC04:
	LDA $0000,y
_AC07:
	STA $0000,x
_AC0A:
	INY 
_AC0B:
	INX 
_AC0C:
	DEC.b {decompress_adr_hi}
_AC0E:
	BPL _AC04
_AC10:
	PLY 
_AC11:
	LDA.b {decomp_buffer}+1
_AC13:
	BEQ _ABCA
_AC15:
	JSR _AA2D
_AC18:
	BRA _ABCA
_AC1A:
	ROR
_AC1B:
	CMP #$E0
_AC1D:
	BCS _AC44
_AC1F:
	AND #$1F
_AC21:
	XBA 
_AC22:
	LDA [{compress_adr}],y
_AC24:
	INY 
_AC25:
	BNE _AC2A
_AC27:
	JSR _AA39
_AC2A:
	PHA 
_AC2B:
	LDA.b {decomp_buffer}+1
_AC2D:
	BEQ _AC37
_AC2F:
	DEC
_AC30:
	STA.b {decomp_buffer}+1
_AC32:
	BNE _AC37
_AC34:
	JSR _AA32
_AC37:
	PLA 
_AC38:
	REP #$20
_AC3A:
	ASL
_AC3B:
	SEP #$20
_AC3D:
	LSR
_AC3E:
	XBA 
_AC3F:
	INC
_AC40:
	STA.b {decompress_adr_hi}
_AC42:
	BRA _ABF0
_AC44:
	CMP #$F0
_AC46:
	BCS _AC86
_AC48:
	AND #$0F
_AC4A:
	STA.b {decompress_adr}+1
_AC4C:
	LDA [{compress_adr}],y
_AC4E:
	INY 
_AC4F:
	BNE _AC54
_AC51:
	JSR _AA39
_AC54:
	STA.b {decompress_adr}
_AC56:
	LDA.b {decomp_buffer}+1
_AC58:
	BEQ _AC5D
_AC5A:
	JSR _AA2D
_AC5D:
	LDA [{compress_adr}],y
_AC5F:
	INY 
_AC60:
	BNE _AC65
_AC62:
	JSR _AA39
_AC65:
	PHY 
_AC66:
	PHA 
_AC67:
	PHA 
_AC68:
	REP #$20
_AC6A:
	LDA.b {decompress_adr}
_AC6C:
	CLC 
_AC6D:
	ADC #$0003
_AC70:
	LSR
_AC71:
	TAY 
_AC72:
	PLA 
_AC73:
	STA $0000,x
_AC76:
	INX 
_AC77:
	INX 
_AC78:
	DEY 
_AC79:
	BNE _AC73
_AC7B:
	SEP #$20
_AC7D:
	BCC _AC83
_AC7F:
	STA $0000,x
_AC82:
	INX 
_AC83:
	PLY 
_AC84:
	BRA _AC11
_AC86:
	CMP #$F8
_AC88:
	BCS _ACA4
_AC8A:
	AND #$07
_AC8C:
	ADC #$02
_AC8E:
	STA.b {decompress_adr_hi}
_AC90:
	LDA [{compress_adr}],y
_AC92:
	INY 
_AC93:
	BNE _AC98
_AC95:
	JSR _AA39
_AC98:
	STA $0000,x
_AC9B:
	INX 
_AC9C:
	DEC.b {decompress_adr_hi}
_AC9E:
	BPL _AC98
_ACA0:
	JMP _AC11
_ACA4:
	CMP #$FC
_ACA6:
	BCS _ACFE
_ACA8:
	AND #$03
_ACAA:
	XBA 
_ACAB:
	LDA [{compress_adr}],y
_ACAD:
	INY 
_ACAE:
	BNE _ACB3
_ACB0:
	JSR _AA39
_ACB3:
	REP #$20
_ACB5:
	ASL
_ACB6:
	ASL
_ACB7:
	ASL
_ACB8:
	SEP #$20
_ACBA:
	LSR
_ACBB:
	LSR
_ACBC:
	LSR
_ACBD:
	XBA 
_ACBE:
	PHA 
_ACBF:
	LDA [{compress_adr}],y
_ACC1:
	INY 
_ACC2:
	BNE _ACC7
_ACC4:
	JSR _AA39
_ACC7:
	REP #$20
_ACC9:
	CLC 
_ACCA:
	ADC #$0003
_ACCD:
	STY.b {16buffer}
_ACCF:
	STA.b {decompress_adr}
_ACD1:
	SEP #$20
_ACD3:
	LDA.b {compress_adr_hi}
_ACD5:
	STA.b {decomp_buffer}
_ACD7:
	LDA.b {decomp_buffer}+2
_ACD9:
	REP #$20
_ACDB:
	BEQ _ACE5
_ACDD:
	TYA 
_ACDE:
	SEC 
_ACDF:
	SBC.b {decompress_adr}
_ACE1:
	BCS _ACF1
_ACE3:
	BRA _ACEF
_ACE5:
	TYA 
_ACE6:
	SEC 
_ACE7:
	SBC.b {decompress_adr}
_ACE9:
	BMI _ACF1
_ACEB:
	CLC 
_ACEC:
	ADC #$8000
_ACEF:
	DEC.b {compress_adr_hi}
_ACF1:
	TAY 
_ACF2:
	SEP #$20
_ACF4:
	PLA 
_ACF5:
	CLC 
_ACF6:
	ADC #$03
_ACF8:
	STA.b {decomp_buffer}+1
_ACFA:
	JMP _ABCA
_ACFE:
	CMP #$FE
_AD00:
	BCS _AD21
_AD02:
	AND #$01
_AD04:
	XBA 
_AD05:
	LDA [{compress_adr}],y
_AD07:
	INY 
_AD08:
	BNE _AD0D
_AD0A:
	JSR _AA39
_AD0D:
	REP #$20
_AD0F:
	ASL
_AD10:
	ASL
_AD11:
	SEP #$20
_AD13:
	XBA 
_AD14:
	PHA 
_AD15:
	XBA 
_AD16:
	LSR
_AD17:
	LSR
_AD18:
	REP #$20
_AD1A:
	AND #$003F
_AD1D:
	INC
_AD1E:
	INC
_AD1F:
	BRA _ACCD
_AD21:
	PLB 
_AD22:
	PLP 
_AD23:
	RTL
	
check_gfx_decomp:
	PHB
	PHP
	PHK
	PLB
	SEP #$20
	REP #$10
	LDA $0448
	BEQ +
	REP #$20
	STZ $0446
	LDY #$0000
_80A5FE:
	CPY #$0020
	BCC _80A605
-
	BRA -
_80A605:
	LDA $0449,y  //check next decmp
	ORA $044A,y
	BEQ _80A62E
	LDA $0449,y //compressed adr
	STA.b {compress_adr}
	LDA $044A,y
	STA.b {compress_adr}+1
	LDA $044C,y
	STA.b {decompress_adr}
	LDA $044D,y
	STA.b {decompress_adr}+1
	PHY
	JSL decomp
	PLA
	CLC
	ADC #$0006
	TAY
	BRA _80A5FE
_80A62E:
	STZ $0448
	STZ $0449
+
	PLP
	PLB
	RTL

write_decomp_param:
	PHP
	PHX
	LDX $0446
	LDA $24  //compressed adr
	STA $0449,x
	LDA $25
	STA $044A,x
	LDA $27 //decompressed adr
	STA $044C,x
	LDA $28
	STA $044D,x
	LDA #$0000
	STA $044F,x
	STA $0450,x
	STA $0451,x
	TXA
	CLC 
	ADC #$0006
	STA $0446
	SEP #$20
	LDA #$01
	STA $0448
	LDA.b {kido}
	BPL +
	JSL check_gfx_decomp
+
	REP #$20
	PLX
	PLP
	RTL
	