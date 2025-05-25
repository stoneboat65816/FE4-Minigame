event_check:
	PHP
	PHB
	PHK
	PLB
	REP #$30
	LDA {event_param0}
	CMP #$FFFF
	BEQ +
	LDA {evid}
	AND #$00FF
	PHA
	ASL
	CLC
	ADC $01,s
	TAX
	PLA
	LDA event_ptr+1,x
	STA.b {evptr}+1
	LDA event_ptr,x
	STA.b {evptr}
loop_event:
	LDY.w {evpos}
	LDA.b [{evptr}],y
	CMP #$FFFF
	BNE _next
	STA.w {event_param0}
	BRA +
_next:
	AND #$00FF
	ASL
	TAX
	JMP (ev_table,x)
+
	PLB
	PLP
	RTL
ev_table:
	dw ev0
	dw ev1
	dw ev2
	dw ev3
	dw ev4
	dw ev5
	dw ev6
	dw ev7
	dw ev8
	dw ev9
	dw ev10
	dw ev11
	dw ev12
	
ev0:
	INY
	STY {evpos}
	JMP loop_event
//ev1: fadein {code}[speed][max kido]
ev1:
	LDA {event_param0}
	BNE +
	INY
	LDA.b [{evptr}],y
	STA {event_param0}
	SEP #$20
	LDA {event_param0}
	STA {event_param1}
+
	JSR event1_shori
	REP #$20
	PLB
	PLP
	RTL

event1_shori:
	SEP #$20
	LDA.b {kido}
	BIT #$80
	BEQ _next1
	STZ.b {kido}
	RTS
_next1:
	DEC {event_param0}
	BNE +
	LDA {event_param1}
	STA {event_param0}
	INC.b {kido}
	LDA.b {kido}
	CMP {event_param0}+1
	BCC +
	INY #3
	STY {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
+
	RTS

//ev2:[code][speed][min kido]
ev2:
	LDA {event_param0}
	BNE +
	INY
	LDA.b [{evptr}],y
	STA {event_param0}
	SEP #$20
	LDA {event_param0}
	STA {event_param1}
+
	JSR event2_shori
	REP #$20
	PLB
	PLP
	RTL
	RTL
event2_shori:
	SEP #$20
	LDA.b {kido}
	BMI +
	DEC {event_param0}
	BNE +
	LDA {event_param1}
	STA {event_param0}
	DEC {kido}
	LDA {event_param0}+1
	CMP.b {kido}
	BCC +
	INY #3
	STY {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
+
	RTS
	
ev3:
//load mikata class [code][16 bit class][16 bit act][16bit xpos][16bit ypos]
//[16 bit oam_atr1][16bit oam_atr2][8bit col slot]
	PHP
	INY
	REP #$30
	LDA.b [{evptr}],y
	AND #$00FF
	STA {mikata_class}
	INY #2
	LDA.b [{evptr}],y
	AND #$00FF
	STA {mikata_class_act}
	INY #2
	LDA.b [{evptr}],y
	STA {oam_xpos}
	INY #2
	LDA.b [{evptr}],y
	STA {oam_ypos}	
	INY #2
	LDA.b [{evptr}],y
	STA {oam_atr1}
	INY #2
	LDA.b [{evptr}],y
	STA {oam_atr2}	
	STZ.w {event_param0}
	INY #2
	SEP #$20
	LDA.b [{evptr}],y
	STA {col_slot}
	INY
	LDA.b [{evptr}],y
	STA {class_act_sfx}
	INY	
	STY {evpos}
	PLP
	JMP loop_event
	
//ev4: wait [code][16 bit timer]
ev4:
	LDA {event_param0}
	BNE +
	INY
	LDA.b [{evptr}],y
	STA {event_param0}
+
	DEC {event_param0}
	BNE +
	INY #3
	STY {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
+
	PLB
	PLP
	RTL
	RTL
	
ev5:
//force blank
	SEP #$20
	LDA #$80
	STA {kido}
	REP #$20
	INY
	STY {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
	JMP loop_event
	
ev6:
	SEP #$20
	INY
	LDA.b [{evptr}],y
	STA.w {song}
	REP #$20
	INY
	STY {evpos}
	JMP loop_event
	
ev7:
	SEP #$20
	INY
	LDA.b [{evptr}],y
	STA.w {sfx1}
	REP #$20
	INY
	STY.w {evpos}
	JMP loop_event
	
ev8:
	SEP #$20
	INY
	LDA.b [{evptr}],y
	STA.w {sfx2}
	REP #$20
	INY
	STY.w {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
	JMP loop_event	
	
ev9:
//vscroll BG2 [code][scroll speed][scroll direction: 01 up 02 down 03 left 04 right][16 bit destine pos]
	LDA {event_param0}
	BNE +
	INY
	LDA.b [{evptr}],y
	STA.w {event_param0}
	STA.w {event_param2}
	STA.w {event_param3}
	INY #2
	LDA.b [{evptr}],y
	STA.w {event_param1}	//des
+
	JSR event9_shori
	PLB
	PLP
	RTL
	
ev10:
//vscroll BG1 [code][scroll speed][scroll direction: 01 up 02 down 03 left 04 right][16 bit destine pos]
	LDA {event_param0}
	BNE +
	INY
	LDA.b [{evptr}],y
	STA.w {event_param0}
	STA.w {event_param2}
	STA.w {event_param3}
	INY #2
	LDA.b [{evptr}],y
	STA.w {event_param1}	//des
+
	JSR event10_shori
	PLB
	PLP
	RTL
	
event9_shori:
	SEP #$20
	LDA.w {event_param2}	//spd
	BEQ +
	DEC.w {event_param2}
	RTS
+
	REP #$30
	LDA.w {event_param2}+1
	AND #$00FF
	DEC
	ASL
	TAX
	JMP (bg2_vscroll_shori,x)

bg2_vscroll_shori:
	dw	bg2_vscroll_up
	dw	bg2_vscroll_down

bg2_vscroll_up:
	LDA.b {bg2vofs}
	CMP.w {event_param1}
	BCS +
	CLC
	ADC #$0001
	STA.b {bg2vofs}
	SEP #$20
	LDA.w {event_param3}
	STA.w {event_param2}
	RTS
bg2_vscroll_down:
	LDA.b {bg2vofs}
	CMP.w {event_param1}
	BCC +
	SEC
	SBC #$0001
	STA.b {bg2vofs}
	SEP #$20
	LDA.w {event_param3}
	STA.w {event_param2}
	RTS
+
	INY #5
	STY.w {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
	RTS

event10_shori:
	SEP #$20
	LDA.w {event_param2}	//spd
	BEQ +
	DEC.w {event_param2}
	RTS
+
	REP #$30
	LDA.w {event_param2}+1
	AND #$00FF
	DEC
	ASL
	TAX
	JMP (bg1_vscroll_shori,x)
	

bg1_vscroll_shori:
	dw	bg1_vscroll_up
	dw	bg1_vscroll_down

bg1_vscroll_up:
	LDA.b {bg1vofs}
	CMP.w {event_param1}
	BCS +
	CLC
	ADC #$0001
	STA.b {bg1vofs}
	SEP #$20
	LDA.w {event_param3}
	STA.w {event_param2}
	RTS
bg1_vscroll_down:
	LDA.b {bg1vofs}
	CMP.w {event_param1}
	BCC +
	SEC
	SBC #$0001
	STA.b {bg1vofs}
	SEP #$20
	LDA.w {event_param3}
	STA.w {event_param2}
	RTS
+
	INY #5
	STY.w {evpos}
	STZ.w {event_param0}
	STZ.w {event_param0}+1
	RTS
	
//event 11: move oam: [code][spd][dir: 01 left, 02: right, 03: up, 04: down][16 bits des]
ev11:
	LDA {event_param0}
	BNE +
	INY
	SEP #$20
	LDA [{evptr}],y
	STA {event_param0}
	STA.w {event_param0}+1	//spd
	INY
	LDA [{evptr}],y
	STA {event_param1}	//dir
	INY
	REP #$20
	LDA [{evptr}],y
	STA {event_param2}	//des
+
	JSR event11_shori
	PLB
	PLP
	RTL
	
event11_shori:
	SEP #$20
	DEC {event_param0}
	BEQ +
	RTS
+
	LDA.w {event_param0}+1
	STA {event_param0}
	REP #$30
	LDA {event_param1}
	AND #$00FF	//dir
	ASL
	TAX
	JMP (write_move_dir,x)
write_move_dir:
	dw mv_00
	dw	mv_left
	dw	mv_right
	dw	mv_up
	dw	mv_down
	
mv_left:
	LDA {oam_xpos}
	CMP {event_param2}
	BCC mv_00
	DEC
	STA {oam_xpos}
	RTS
mv_00:
	TYA
	CLC
	ADC #$0005
	STA {evpos}
	STZ.w {event_param0}
	RTS
mv_right:
	LDA {oam_xpos}
	CMP {event_param2}
	BCS +
	INC
	STA {oam_xpos}
	RTS
+
	TYA
	CLC
	ADC #$0005
	STA {evpos}
	STZ.w {event_param0}
	RTS
	
mv_up:
	LDA {oam_ypos}
	CMP {event_param2}
	BCC +
	DEC
	STA {oam_ypos}
	RTS
+	
	TYA
	CLC
	ADC #$0005
	STA {evpos}
	STZ.w {event_param0}
	RTS
mv_down:
	LDA {oam_ypos}
	CMP {event_param2}
	BCS +
	INC
	STA {oam_ypos}
	RTS	
+	
	TYA
	CLC
	ADC #$0005
	STA {evpos}
	STZ.w {event_param0}
	RTS
	
ev12:
	INY
	STY {evpos}
	INC {submode}
	PLB
	PLP
	RTL
	
