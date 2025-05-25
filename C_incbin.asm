org $F00000
//#######################
// EVENT
//######################
event_ptr:
	dl event_00
	dl event_01
	
event_00:
	incbin "event_00.bin"
event_01:
	incbin "event_01.bin"

title_set:
	incbin "gfx\Title_set.bin"
title_map:
	incbin "gfx\Title_map.bin"
title_col:
	incbin "gfx\Title_col.bin"
title2_set:
	incbin "gfx\title2_set.bin"
title2_map:
	incbin "gfx\title2_map.bin"
title2_col:
	incbin "gfx\title2_col.bin"

oam00_act00_a_set:
	incbin "gfx\horse00_set.bin"
oam00_act00_a_col:
	incbin "gfx\horse00_col.bin"
oam00_act00_b_set:
	incbin "gfx\horse01_set.bin"
oam00_act00_b_col:
	incbin "gfx\horse01_col.bin"
oam00_act00_c_set:
	incbin "gfx\horse02_set.bin"
oam00_act00_c_col:
	incbin "gfx\horse02_col.bin"
oam00_act00_d_set:
	incbin "gfx\horse03_set.bin"
oam00_act00_d_col:
	incbin "gfx\horse03_col.bin"
oam00_act00_e_set:
	incbin "gfx\horse04_set.bin"
oam00_act00_e_col:
	incbin "gfx\horse04_col.bin"
	
oam00_act01_a_set:
	incbin "gfx\oam00_act01_a_set.bin"
	oam00_act01_a_col:
	incbin "gfx\oam00_act01_a_col.bin"
oam00_act01_b_set:
	incbin "gfx\oam00_act01_b_set.bin"
oam00_act01_b_col:
	incbin "gfx\oam00_act01_b_col.bin"
oam00_act01_c_set:
	incbin "gfx\oam00_act01_c_set.bin"
oam00_act01_c_col:
	incbin "gfx\oam00_act01_c_col.bin"
oam00_act01_d_set:
	incbin "gfx\oam00_act01_d_set.bin"
oam00_act01_d_col:
	incbin "gfx\oam00_act01_d_col.bin"
oam00_act01_e_set:
	incbin "gfx\oam00_act01_e_set.bin"
oam00_act01_e_col:
	incbin "gfx\oam00_act01_e_col.bin"
	
oam00_act02_a_set:
	incbin "gfx\oam00_act02_a_set.bin"
oam00_act02_a_col:
	incbin "gfx\oam00_act02_a_col.bin"
	
org $F10000
oam00_act02_b_set:
	incbin "gfx\oam00_act02_b_set.bin"
oam00_act02_b_col:
	incbin "gfx\oam00_act02_b_col.bin"
oam00_act02_c_set:
	incbin "gfx\oam00_act02_c_set.bin"
oam00_act02_c_col:
	incbin "gfx\oam00_act02_c_col.bin"
oam00_act02_d_set:
	incbin "gfx\oam00_act02_d_set.bin"
oam00_act02_d_col:
	incbin "gfx\oam00_act02_d_col.bin"
	

	
frame_map:
	incbin	"gfx/frame_map.bin"
frame_set:
	incbin	"gfx/frame_set.bin"
frame_col:
	incbin	"gfx/frame_col.bin"
	
org $F20000
kaiwa:
	dl kaiwa00
	dl kaiwa01
	dl kaiwa02
	dl kaiwa03
	dl kaiwa04
	dl kaiwa05
	dl kaiwa06
	dl kaiwa07
	dl kaiwa08
	dl kaiwa09
	dl kaiwa10
	dl kaiwa11
	dl kaiwa12
	dl kaiwa13
	dl kaiwa14
	dl kaiwa15
	dl kaiwa16
	dl kaiwa17
	dl kaiwa18
	dl kaiwa19
	dl kaiwa20
	dl kaiwa21
	dl kaiwa22
	dl kaiwa23
	dl kaiwa24
	dl kaiwa25
	dl kaiwa26
	dl kaiwa27
	dl kaiwa28
	dl kaiwa29
	dl kaiwa30
	dl kaiwa31
	dl kaiwa32
	dl kaiwa33
	dl kaiwa34
	dl kaiwa35
	dl kaiwa36
	dl kaiwa37
	dl kaiwa38
	dl kaiwa39
	dl kaiwa40
	dl kaiwa41
	dl kaiwa42
	dl kaiwa43
	dl kaiwa44
	dl kaiwa45

kaiwa00:
	incbin "kaiwa00.bin"
kaiwa01:
	incbin "kaiwa01.bin"
kaiwa02:
	incbin "kaiwa02.bin"
kaiwa03:
	incbin "kaiwa03.bin"
kaiwa04:
	incbin "kaiwa04.bin"
kaiwa05:
	incbin "kaiwa05.bin"
kaiwa06:
	incbin "kaiwa06.bin"
kaiwa07:
	incbin "kaiwa07.bin"
kaiwa08:
	incbin "kaiwa08.bin"
kaiwa09:
	incbin "kaiwa09.bin"
kaiwa10:
	incbin "kaiwa10.bin"
kaiwa11:
	incbin "kaiwa11.bin"
kaiwa12:
	incbin "kaiwa12.bin"
kaiwa13:
	incbin "kaiwa13.bin"
kaiwa14:
	incbin "kaiwa14.bin"
kaiwa15:
	incbin "kaiwa15.bin"
kaiwa16:
	incbin "kaiwa16.bin"
kaiwa17:
	incbin "kaiwa17.bin"
kaiwa18:
	incbin "kaiwa18.bin"
kaiwa19:
	incbin "kaiwa19.bin"
kaiwa20:
	incbin "kaiwa20.bin"
kaiwa21:
	incbin "kaiwa21.bin"
kaiwa22:
	incbin "kaiwa22.bin"
kaiwa23:
	incbin "kaiwa23.bin"
kaiwa24:
	incbin "kaiwa24.bin"
kaiwa25:
	incbin "kaiwa25.bin"
kaiwa26:
	incbin "kaiwa26.bin"
kaiwa27:
	incbin "kaiwa27.bin"
kaiwa28:
	incbin "kaiwa28.bin"
kaiwa29:
	incbin "kaiwa29.bin"
kaiwa30:
	incbin "kaiwa30.bin"
kaiwa31:
	incbin "kaiwa31.bin"
kaiwa32:
	incbin "kaiwa32.bin"
kaiwa33:
	incbin "kaiwa33.bin"
kaiwa34:
	incbin "kaiwa34.bin"
kaiwa35:
	incbin "kaiwa35.bin"
kaiwa36:
	incbin "kaiwa36.bin"
kaiwa37:
	incbin "kaiwa37.bin"
kaiwa38:
	incbin "kaiwa38.bin"
kaiwa39:
	incbin "kaiwa39.bin"
kaiwa40:
	incbin "kaiwa40.bin"
kaiwa41:
	incbin "kaiwa41.bin"
kaiwa42:
	incbin "kaiwa42.bin"
kaiwa43:
	incbin "kaiwa43.bin"
kaiwa44:
	incbin "kaiwa44.bin"
kaiwa45:
	incbin "kaiwa45.bin"

org $F80000
	incbin "Sound\song.bin"
	
org $F77C00
driver:
	incbin "Sound\driver.bin"
	
org $FF9997
audio_00:
	incbin "Sound\audio_00.bin"
	
org $D00000
font0:
	incbin "Font\font0.bin"
font0_width:
	db $06, $07, $07, $07, $07, $07, $07, $07		
	db $04, $07, $07, $07, $08, $07, $07, $07		
	db $07, $07, $07, $07, $07, $07, $08, $07		//10
	db $07, $07, $07, $07, $07, $06, $06, $06		
	db $06, $06, $07, $04, $05, $06, $04, $08		//20
	db $07, $07, $07, $07, $06, $06, $06, $07		
	db $07, $08, $06, $07, $07, $07, $07, $07		//30
	db $07, $07, $07, $07, $07, $07, $07, $07		
	db $07, $07, $07, $07, $07, $07, $07, $06		//40
	db $06, $06, $06, $06, $06, $06, $06, $06		
	db $06, $06, $04, $04, $04, $04, $04, $07		//50
	db $07, $07, $07, $07, $07, $07, $07, $07		
	db $07, $07, $07, $07, $07, $07, $07, $07		//60
	db $07, $07, $07, $07, $07, $08, $08, $08		
	db $08, $08, $08, $07, $07, $07, $07, $08		//70
	db $04, $0B, $0B, $0A, $0A, $07, $07, $07		
	db $06, $05, $05, $08, $08, $0D, $04, $0C		//80
	db $04, $04, $07, $07, $06, $08, $08, $08		
	db $08, $08, $08, $08, $06, $08, $06, $05		//90
	db $06, $07, $06, $06, $06, $08, $02, $07		
	db $07, $05, $08, $08, $08, $06, $06, $06		//A0
	db $06, $06, $08, $08, $08, $07, $07, $07	
	db $07, $07, $04, $05, $08, $08, $08, $08		//B0
	db $08, $09, $09, $09, $09, $0A, $0D, $0C
	
kana:
	incbin "Font\kana.bin"
	
kana_width:
	db $08, $08, $07, $08, $08, $08, $08, $05
	db $08, $07, $08, $07, $08, $08, $08, $08	
	db $07, $08, $08, $08, $08, $08, $08, $08	
	db $08, $08, $08, $08, $08, $08, $07, $08	
	db $08, $08, $08, $08, $08, $08, $08, $07
	db $08, $08, $08, $08, $08, $08, $09, $09
	db $07, $09, $09, $09, $07, $09, $09, $09	
	db $09, $08, $08, $09, $09, $09, $09, $09
	db $08, $09, $09, $09, $09, $08, $09, $07
	db $07, $06, $06, $07, $07, $07, $07, $07
	
//katakana	
	db $05, $04, $04, $08, $06, $06, $04, $08
	db $08, $03, $08, $08, $08, $08, $04, $04
	db $08, $06, $08, $08, $08, $08, $08, $08
	db $08, $08, $04, $04, $08, $08, $08, $08
	db $08, $08, $08, $07, $08, $07, $08, $08
	db $08, $08, $08, $07, $08, $07, $08, $08
	db $08, $08, $08, $08, $07, $08, $07, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $07, $08, $07, $08, $07, $08, $08	
	db $08, $08, $08, $08, $09, $09, $08, $09
	db $08, $08, $08, $09, $09, $09, $08, $08
	db $07, $08, $08, $09, $08, $09, $08, $08
	db $09, $08, $09, $06, $06, $06, $06, $09
	db $06, $06, $06, $06, $06, $04
	
kanji1_width:
	db $0C, $0A, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0B, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0B, $0C, $0C, $0C, $0B, $0C, $0C, $0C
	db $0C, $0C, $0C, $0B, $0A, $0C, $0C, $0C
	db $0B, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0B, $0C, $0B, $0C, $0B, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0D, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0B, $0C
	db $0C, $0B, $0C, $0B, $0D, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	

	db $0C, $0B, $0C, $0B, $0C, $0B, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0D, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0B, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0B, $0C, $0C, $0D, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0D, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
kanji2_width:
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0B, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0B, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0A
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0D, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
kanji3_width:
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0A
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0A, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0B, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0B, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0B, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0D, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0D, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0B, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0B, $0C, $0C, $0C, $0C, $0C, $0B
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
kanji4_width:
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0B, $0C, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0A
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0B, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0B, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0B, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0B, $0B, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0B, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0B, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0B, $0C, $0C, $0C, $0C, $0A, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0B, $0C
	
kanji5_width:
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $04, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0E, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0B, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0B, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0B, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0B, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0B
	
kanji6_width:
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0C, $0C, $0C, $0C, $0C, $0B, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0D, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	
	db $0B, $0C, $0C, $0C, $0C, $0C, $0C, $0B
	db $0C, $0C, $0C, $0C, $0B, $0C, $0C, $0C	
	db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
	db $0C, $0C, $0C, $0C, $0D, $0C, $0C, $0C
	db $0E, $0C, $0C, $10, $0D, $0E, $0D, $0D
	db $0E, $0E, $0C, $0D, $0D, $0E, $0E, $10
	db $0A, $0E, $0E, $08, $0F, $10, $0E, $0F
	db $0F, $0F, $10, $0E, $0E, $04, $0F, $0E
	
kanji7_width:
	db $0D,	

kanji1:
	incbin "Font\kanji1.bin"	
kanji2:
	incbin "Font\kanji2.bin"

	
org $D10000
inn_set:
	incbin "gfx/inn_set.bin"
inn_col:
	incbin "gfx/inn_col.bin"
inn1_map:
	incbin "gfx/inn1_map.bin"
inn2_map:
	incbin "gfx/inn2_map.bin"
clock0_set:
	incbin "gfx/clock0_set.bin"
clock1_set:
	incbin "gfx/clock1_set.bin"
clock2_set:
	incbin "gfx/clock2_set.bin"
clock3_set:
	incbin "gfx/clock3_set.bin"
flame0_set:
	incbin "gfx/flame0_set.bin"
flame1_set:
	incbin "gfx/flame1_set.bin"
flame2_set:
	incbin "gfx/flame2_set.bin"
flame3_set:
	incbin "gfx/flame3_set.bin"
flame0_col:
	incbin "gfx/flame0_col.bin"
flame1_col:
	incbin "gfx/flame1_col.bin"
flame2_col:
	incbin "gfx/flame2_col.bin"
flame3_col:
	incbin "gfx/flame3_col.bin"
nannawalk_set:
	incbin "gfx/nannawalk_set.bin"
nanna_set:
	incbin "gfx/nanna_set.bin"
nanna_col:
	incbin "gfx/nanna_col.bin"
nannawalk_col_ue:
	incbin "gfx/nannawalk_col_ue.bin"
nannawalk_col_shita:
	incbin "gfx/nannawalk_col_shita.bin"
nannawalk_col_yoko:
	incbin "gfx/nannawalk_col_yoko.bin"
	
org $D20000
kanji3:
	incbin "Font\kanji3.bin"
kanji4:
	incbin "Font\kanji4.bin"
kanji5:
	incbin "Font\kanji5.bin"
pointer_col:
	incbin "gfx\pointer_col.bin"
pointer_set:
	incbin "gfx\pointer_set.bin"
	
org $D30000
kanji6:
	incbin "Font\kanji6.bin"
kanji7:
	incbin "Font\kanji7.bin"
	
org $838000
nazo:
	incbin "Data/nazo.bin"
	
org $FA0000
onsei:
	incbin "Sound/onsei.bin"
org $E00000
blank: