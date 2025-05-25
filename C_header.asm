org $00FFB0

	db "01"
	db "SHVC"
	db $00, $00, $00, $00, $00, $00, $00
	db $00	//sram 8kb
	db $00
	db $00
	db "Higher than any bird "
	db $31	//hirom hispeed
	db $02 	//rom, ram, bat
	db $0C		//4mb
	db $03	//8kb ram
	db $00 //Japan
	db $33
	db $00
	dw $7B6A
	dw $8495
	
	dw _break
	dw _break
	dw _cop
	dw _break
	dw _abort
	dw _nmi
	dw _reset
	dw _irq
	dw _break
	dw _break
	dw _cop
	dw _break
	dw _abort
	dw _nmi
	dw _reset
	dw _irq
	
//##############################
// TEXT DEFINE
//##############################
define buffer0						$00
define buffer1						$02
define buffer2						$04
define buffer3						$06
define buffer4						$08
define buffer5						$0A
define buffer6						$0C
define buffer7						$0E
define buffer8						$10
define buffer9						$12
define	mode						$14
define	submode				$16
define	nmi_mode			$18
define	irq_mode				$1A



define	24ptr1						$24
define	24ptr1_hi					$26
define	24ptr2						$27
define	24ptr2_hi					$29

define soundptr1					$54
define soundptr1_hi			$56
define soundptr2					$57
define soundptr2_hi			$59
define	pad0							$5C
define	pad1							$5E
define	pad2							$60
define	pad3							$62
define	pad4							$64
define	pad5							$66
define	pad6							$68
define	pad7							$6A

define kido							$70
define obsel							$71
define oamaddl					$72
define oamaddh					$73
define bgmode					$74
define mosaic						$75
define bg1sc						$76
define bg2sc						$77
define bg3sc						$78
define bg4sc						$79
define bg12nb					$7A
define bg34nb					$7B
define  m7sel						$7C
define w12sel						$7D
define w34sel						$7E
define bg1hofs					$7F
define bg1vofs					$81
define bg2hofs					$83
define bg2vofs					$85
define bg3hofs					$87
define bg3vofs					$89
define bg4hofs					$8B
define bg4vofs					$8D
define wobjsel					$8F
define wh0							$90
define wh1							$91
define wh2							$92
define wh3							$93
define wbglog						$94
define wobjlog					$95
define tm								$96
define ts								$97
define tmw							$98
define tsw							$99
define cgwsel						$9A
define cgadsub					$9B
define coldata						$9D
define setini							$A0
define	bg1tile_vram			$A2
define	bg1map_vram		$A4
define	bg2tile_vram			$A6
define	bg2map_vram		$A8
define	bg3tile_vram			$AA
define	bg3map_vram		$AC
define	oam_vram				$AE
define nmitimen					$B0
define irq_timer_v				$B1
define irq_timer_h				$B2
define hdma							$B3
define hispeed_rom				$B4
define col_slot						$B5
define dma_oam_flag			$B6
define	clock_timer				$B8
define	flame_timer			$BA
define	kaiwa_id					$BC
define	txt_ptr						$BE
define	width_adr				$C1
define	width_adr_hi			$C3
define	font_ptr					$C4
define	font_ptr_hi				$C6

define compress_adr			$C8
define compress_adr_hi	 	$CA
define decompress_adr		$CB
define decompress_adr_hi $CD
define 16buffer						$CE
define decomp_buffer			$D0
define	htimel						$D2
define	vtimel						$D4

define wait_flag						$DB
define blank_frame_count	$DD
define	evptr							$F0
define	evptr_hi					$F2
define	2nd_oam_adr			$F4


define	color_table						$0100
define	oam_table						$1C00
define	oam_table2						$1E00
define	oam_table_bak				$1E20




define	dma_ch					$0341
define	hdma_ch				$0342
define	dma_jun				$0343
define	dma_type				$0345
define	dma_vram			$0347
define	dma_size				$0349
define	dma_adr				$034B
define	dma_bank			$034D
define	dma_dir				$034E


define	main_jump			$0400

define	spc_timing			$0469
define	song						$04BA
define	sfx1						$04D6
define	sfx2						$04E0
define	sound_on				$04F4

define	dma_times		$0CC4
define	dma_max_size	$0CC5
define	dma_adr3			$0CC9
define	dma_bank3		$0CCB
define	dma_vram3		$0CCC
define	dma_size3			$0CCE



define	mikata_class_act_copy		$0FE2
define	class_act_sfx_copy				$0FE4
define	class_act_sfx							$0FE5
define	class_act_spd						$0FE6
define	subact_kazu							$0FE8
define	oma_index_pos					$0FEA
define	oam_decomp_flag				$0FEC
define	mikata_class_subact			$0FEE
define	mikata_class_act_spd			$0FF0
define	mikata_class_act					$0FF2
define	mikata_class		$0FF4
define	oam_kazu			$0FF6
define	oam_atr1			$0FF8
define	oam_atr2			$0FFA
define	oam_xpos			$0FFC
define	oam_ypos			$0FFE
define	event_param0	$1000
define	event_param1	$1002
define	event_param2	$1004
define	event_param3	$1006
define	event_param4	$1008
define	event_param5	$100A
define	event_param6	$100C
define	event_param6	$100E
define	evpos					$1010
define	evid					$1012
define	class					$1014
define	nanna_spd		$1016
define	nanna_counter	$1018
define	nanna_flag			$101A
define	nanna_id				$101C
define	shift						$101E
define	width						$1020
define	left_byte				$1022
define	right_byte			$1024
define	map_pos				$1026
define	tile_num				$1028
define	save_a					$102A
define	save_x					$102C
define	txtpos					$102E
define	line							$1030
define	kaiwa_flag			$1032
define	tile_vram_size	$1034
define	tile_vram_adr		$1036
define	text_speed			$1038
define	ichigime				$103A
define	letter_tile_vram		$103C
define	map_adr				$103E
define	map_adr_hi			$1040
define	frame_flag			$1042
define	save_song			$1044
define	map2_pos			$1046
define	pointer_flag			$1048
define	pointer_xpos		$104A
define	pointer_spd1		$104C
define	pointer_spd2		$104E
define	next_kaiwa			$1050
define	hantei_flag			$1052
define	pointer_ypos		$1054
define	score						$1056


















 