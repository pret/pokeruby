	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.if DEBUG

gUnknown_Debug_083C31DC:: @ 0x83C31DC
	.byte 9, 9, 9, 9, 9, 9, 9, 9, 3, 0

	@ This is not a string. I don't feel like converting it right now.
gUnknown_Debug_83C31E6:: @ 0x83C31E6
	.string "グ　ホ　レ　ハ　ヘ　ヒ　ゾ　ズ　ゼ　コ　サ　シ　ス　セ　ソ　ああo　ブ　ゴ　よあゥ　ム　　あもあらあさあ{0xF7}　フ　ン　D　G　ふあ:　Ä　Ö　Ü　H　I　J　K　L　ト　ナ　ニ　ヌ　ェ　ほあみあやあゆあっ　ア　イ　オ　N　O　P　Q　R　ウ　エ　カ　キ　▶　ä　ォ　そあうあきあこあつあへあク　ケ　タ　　　　　　　　　　　　　"

gUnknown_Debug_083C3288:: @ 0x83C3288
	.string "CYCLEかんれん$"

gUnknown_Debug_083C3292:: @ 0x83C3292
	.string "おおきさくらべ$"

gUnknown_Debug_083C329A:: @ 0x83C329A
	.string "カウンタ$"

gUnknown_Debug_083C329F:: @ 0x83C329F
	.string "そのた1$"

gUnknown_Debug_083C32A4:: @ 0x83C32A4
	.string "そのた2$"

	.align 2
gUnknown_Debug_083C32AC:: @ 0x83C32AC
	.4byte gUnknown_Debug_083C3288, debug_sub_808E400+1
	.4byte gUnknown_Debug_083C3292, debug_sub_808E458+1
	.4byte gUnknown_Debug_083C329A, debug_sub_808E4B0+1
	.4byte gUnknown_Debug_083C329F, debug_sub_808E508+1
	.4byte gUnknown_Debug_083C32A4, debug_sub_808E560+1

gUnknown_Debug_083C32D4:: @ 0x83C32D4
	.string "WKーCYCLEーROADーHIT$"

gUnknown_Debug_083C32E6:: @ 0x83C32E6
	.string "WKーCYCLEーROADーTIMエ1$"

gUnknown_Debug_083C32FA:: @ 0x83C32FA
	.string "WKーCYCLEーROADーTIMエ2$"

gUnknown_Debug_083C330E:: @ 0x83C330E
	.string "WKーSIZEーKINOKOKOーOYAJI$"

gUnknown_Debug_083C3325:: @ 0x83C3325
	.string "WKーSIZEーNAMAZOーOYAJI$"

gUnknown_Debug_083C333A:: @ 0x83C333A
	.string "WKーSPRAYーCOUNT$"

gUnknown_Debug_083C3349:: @ 0x83C3349
	.string "WKーICEーCOUNT$"

gUnknown_Debug_083C3356:: @ 0x83C3356
	.string "WKーASHーGATHERーCOUNT$"

gUnknown_Debug_083C336A:: @ 0x83C336A
	.string "WKーCRUISEーCOUNT$"

gUnknown_Debug_083C337A:: @ 0x83C337A
	.string "WKーFRIENDLYーSTEPーCOUNT$"

gUnknown_Debug_083C3391:: @ 0x83C3391
	.string "WKーPOISONーSTEPーCOUNT$"

gUnknown_Debug_083C33A6:: @ 0x83C33A6
	.string "WKRECYCLEーGOODS$"

gUnknown_Debug_083C33B6:: @ 0x83C33B6
	.string "WKーFIRSTーPOKE$"

gUnknown_Debug_083C33C4:: @ 0x83C33C4
	.string "WKーMABOROSIRNDーH$"

gUnknown_Debug_083C33D5:: @ 0x83C33D5
	.string "WKーMABOROSIRNDーL$"

gUnknown_Debug_083C33E6:: @ 0x83C33E6
	.string "EVーONEーDAYーWORK$"

gUnknown_Debug_083C33F6:: @ 0x83C33F6
	.string "EVーFANWORK$"

gUnknown_Debug_083C3401:: @ 0x83C3401
	.string "EVーFANTIME$"

gUnknown_Debug_083C340C:: @ 0x83C340C
	.string "WKーKARAKURIーLEVEL$"

gUnknown_Debug_083C341E:: @ 0x83C341E
	.string "WKーPOKELOTーPRIZE$"

gUnknown_Debug_083C342F:: @ 0x83C342F
	.string "WKーSPECIALーZUKN$"

gUnknown_Debug_083C343F:: @ 0x83C343F
	.string "WKーHYOUKAーDAYS$"

gUnknown_Debug_083C344E:: @ 0x83C344E
	.string "WKーPOKELOTーRND1$"

gUnknown_Debug_083C345E:: @ 0x83C345E
	.string "WKーPOKELOTーRND2$"

gUnknown_Debug_083C346E:: @ 0x83C346E
	.string "WKーBASEーMAPNO$"

	.align 2
gUnknown_Debug_083C347C:: @ 0x83C347C
	.4byte gUnknown_Debug_083C32D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C32E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C32FA, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C3494::
	.4byte gUnknown_Debug_083C330E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3325, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C34A4::
	.4byte gUnknown_Debug_083C333A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3349, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3356, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C336A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C337A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3391, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C34D4::
	.4byte gUnknown_Debug_083C33A6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33B6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33C4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33D5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33F6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3401, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C340C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C341E, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C351C::
	.4byte gUnknown_Debug_083C342F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C343F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C344E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C345E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C346E, TomomichiDebugMenu_Config+1

	@ These are not strings
gUnknown_Debug_083C3544:: @ 0x83C3544
	.string "ういかけお　"
gUnknown_Debug_083C354A::
	.string "らぞりぞるぞ　　　　　　　　　　　　びぞぽぞ　　　　　　　　　　　　　　むぞめぞぶぞぼぞれぞろぞ　　　　　　みぞもぞやぞゆぞぞぞだぞぢぞでぞどぞばぞべぞぱぞぴぞよぞ　　　　　　　　"

gUnknown_Debug_083C35A4:: @ 0x83C35A4
	.string "OBJCHRWORK0ー8$"

gUnknown_Debug_083C35B2:: @ 0x83C35B2
	.string "OBJCHRWORK9ー15$"

	.align 2
gUnknown_Debug_083C35C4:: @ 0x83C35C4
	.4byte gUnknown_Debug_083C35A4, debug_sub_808E9A0+1
	.4byte gUnknown_Debug_083C35B2, debug_sub_808E9F8+1

gUnknown_Debug_083C35D4:: @ 0x83C35D4
	.string "OBJCHRWORK1$"

gUnknown_Debug_083C35E0:: @ 0x83C35E0
	.string "OBJCHRWORK2$"

gUnknown_Debug_083C35EC:: @ 0x83C35EC
	.string "OBJCHRWORK3$"

gUnknown_Debug_083C35F8:: @ 0x83C35F8
	.string "OBJCHRWORK4$"

gUnknown_Debug_083C3604:: @ 0x83C3604
	.string "OBJCHRWORK5$"

gUnknown_Debug_083C3610:: @ 0x83C3610
	.string "OBJCHRWORK6$"

gUnknown_Debug_083C361C:: @ 0x83C361C
	.string "OBJCHRWORK7$"

gUnknown_Debug_083C3628:: @ 0x83C3628
	.string "OBJCHRWORK8$"

gUnknown_Debug_083C3634:: @ 0x83C3634
	.string "OBJCHRWORK9$"

gUnknown_Debug_083C3640:: @ 0x83C3640
	.string "OBJCHRWORK10$"

gUnknown_Debug_083C364D:: @ 0x83C364D
	.string "OBJCHRWORK11$"

gUnknown_Debug_083C365A:: @ 0x83C365A
	.string "OBJCHRWORK12$"

gUnknown_Debug_083C3667:: @ 0x83C3667
	.string "OBJCHRWORK13$"

gUnknown_Debug_083C3674:: @ 0x83C3674
	.string "OBJCHRWORK14$"

gUnknown_Debug_083C3681:: @ 0x83C3681
	.string "OBJCHRWORK15$"

gUnknown_Debug_083C368E:: @ 0x83C368E
	.string "OBJCHRWORK16$"

	.align 2
gUnknown_Debug_083C369C:: @ 0x83C369C
	.4byte gUnknown_Debug_083C35D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C35E0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C35EC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C35F8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3604, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3610, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C361C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3628, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3634, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C36E4::
	.4byte gUnknown_Debug_083C3640, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C364D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C365A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3667, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3674, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3681, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C368E, TomomichiDebugMenu_Config+1

	@ These are not strings
gUnknown_Debug_083C371C:: @ 0x83C371C
	.string "けき"
gUnknown_Debug_083C371E:: @ 0x83C371E
	.string "たぞちぞつぞてぞとぞなぞにぞぬぞねぞのぞはぞひぞふぞへぞほぞまぞ　　　　"

gUnknown_Debug_083C3742:: @ 0x83C3742
	.string "SP$"

gUnknown_Debug_083C3745:: @ 0x83C3745
	.string "ルーム　R110　PART1/カラクリ$"

gUnknown_Debug_083C3759:: @ 0x83C3759
	.string "ルーム　R110　PART2$"

gUnknown_Debug_083C3768:: @ 0x83C3768
	.string "ルーム　ロード$"

gUnknown_Debug_083C3770:: @ 0x83C3770
	.string "ソノタ1$"

gUnknown_Debug_083C3775:: @ 0x83C3775
	.string "ソノタ2$"

	.align 2
gUnknown_Debug_083C377C:: @ 0x83C377C
	.4byte gUnknown_Debug_083C3742, debug_sub_808E054+1
	.4byte gUnknown_Debug_083C3745, debug_sub_808E0AC+1
	.4byte gUnknown_Debug_083C3759, debug_sub_808E104+1
	.4byte gUnknown_Debug_083C3768, debug_sub_808E15C+1
	.4byte gUnknown_Debug_083C3770, debug_sub_808E1B4+1
	.4byte gUnknown_Debug_083C3775, debug_sub_808E20C+1

gUnknown_Debug_083C37AC:: @ 0x83C37AC
	.string "WKーSCENEーSPーCONTEST$"

gUnknown_Debug_083C37C0:: @ 0x83C37C0
	.string "WKーSCENEーSPーPC$"

gUnknown_Debug_083C37CF:: @ 0x83C37CF
	.string "WKーSCENEーSPーCONTEST03$"

gUnknown_Debug_083C37E5:: @ 0x83C37E5
	.string "WKーSCENEーSPーCONTESTITEM$"

gUnknown_Debug_083C37FD:: @ 0x83C37FD
	.string "WKーSCENEーSPーOPENING$"

gUnknown_Debug_083C3811:: @ 0x83C3811
	.string "WKーSCENEーSPーSHIP01$"

gUnknown_Debug_083C3824:: @ 0x83C3824
	.string "$"

gUnknown_Debug_083C3825:: @ 0x83C3825
	.string "$"

gUnknown_Debug_083C3826:: @ 0x83C3826
	.string "$"

gUnknown_Debug_083C3827:: @ 0x83C3827
	.string "WKーSCENEーR110ーR0101$"

gUnknown_Debug_083C383B:: @ 0x83C383B
	.string "WKーSCENEーR110ーR0102$"

gUnknown_Debug_083C384F:: @ 0x83C384F
	.string "WKーSCENEーR110ーR0103$"

gUnknown_Debug_083C3863:: @ 0x83C3863
	.string "WKーKARAKURIーDAIOU$"

gUnknown_Debug_083C3875:: @ 0x83C3875
	.string "WKーSCENEーSHISEN$"

gUnknown_Debug_083C3885:: @ 0x83C3885
	.string "$"

gUnknown_Debug_083C3886:: @ 0x83C3886
	.string "$"

gUnknown_Debug_083C3887:: @ 0x83C3887
	.string "$"

gUnknown_Debug_083C3888:: @ 0x83C3888
	.string "$"

gUnknown_Debug_083C3889:: @ 0x83C3889
	.string "WKーSCENEーR110ーR0104$"

gUnknown_Debug_083C389D:: @ 0x83C389D
	.string "WKーSCENEーR110ーR0105$"

gUnknown_Debug_083C38B1:: @ 0x83C38B1
	.string "WKーSCENEーR110ーR0106$"

gUnknown_Debug_083C38C5:: @ 0x83C38C5
	.string "WKーSCENEーR110ーR0107$"

gUnknown_Debug_083C38D9:: @ 0x83C38D9
	.string "WKーSCENEーR110ーR0108$"

gUnknown_Debug_083C38ED:: @ 0x83C38ED
	.string "WKーSCENEーR110ーR0109$"

gUnknown_Debug_083C3901:: @ 0x83C3901
	.string "WKーSCENEーR110ーR0110$"

gUnknown_Debug_083C3915:: @ 0x83C3915
	.string "WKーSCENEーR110ーR0111$"

gUnknown_Debug_083C3929:: @ 0x83C3929
	.string "WKーSCENEー02ーR110ーR0110$"

gUnknown_Debug_083C3940:: @ 0x83C3940
	.string "WKーSCENEーR104ーR0101$"

gUnknown_Debug_083C3954:: @ 0x83C3954
	.string "WKーSCENEーR113ーR0101$"

gUnknown_Debug_083C3968:: @ 0x83C3968
	.string "$"

gUnknown_Debug_083C3969:: @ 0x83C3969
	.string "$"

gUnknown_Debug_083C396A:: @ 0x83C396A
	.string "$"

gUnknown_Debug_083C396B:: @ 0x83C396B
	.string "$"

gUnknown_Debug_083C396C:: @ 0x83C396C
	.string "$"

gUnknown_Debug_083C396D:: @ 0x83C396D
	.string "$"

gUnknown_Debug_083C396E:: @ 0x83C396E
	.string "$"

gUnknown_Debug_083C396F:: @ 0x83C396F
	.string "WKーSCENEーBASEーGDOODS$"

gUnknown_Debug_083C3984:: @ 0x83C3984
	.string "WKーSCENEーHAGIーFUNE$"

gUnknown_Debug_083C3997:: @ 0x83C3997
	.string "WKーSCENEーFUNEーPOS$"

gUnknown_Debug_083C39A9:: @ 0x83C39A9
	.string "WKーSCENEーBASEーMAKE$"

gUnknown_Debug_083C39BC:: @ 0x83C39BC
	.string "WKーSCENEーARTISTーC106ーR$"

gUnknown_Debug_083C39D3:: @ 0x83C39D3
	.string "WKーSCENEーPOKEーLEAGUE$"

gUnknown_Debug_083C39E8:: @ 0x83C39E8
	.string "WKーSCENEーROPEWAY$"

gUnknown_Debug_083C39F9:: @ 0x83C39F9
	.string "WKーSCENEーSAFARIーZONE$"

gUnknown_Debug_083C3A0E:: @ 0x83C3A0E
	.string "WKーSCENEーCYCLEーROAD$"

gUnknown_Debug_083C3A22:: @ 0x83C3A22
	.string "WKーSCENEーR119ーTENKI$"

gUnknown_Debug_083C3A36:: @ 0x83C3A36
	.string "WKーSCENEー01ーC102ーR0401$"

gUnknown_Debug_083C3A4D:: @ 0x83C3A4D
	.string "WKーFUTAGOー01ーFIELDーR104$"

gUnknown_Debug_083C3A65:: @ 0x83C3A65
	.string "WKーSCENEーBATTLEーTOWER$"

gUnknown_Debug_083C3A7B:: @ 0x83C3A7B
	.string "WKーSCENEーTRーHOUSE$"

gUnknown_Debug_083C3A8D:: @ 0x83C3A8D
	.string "WKーKASEKIーTYPE$"

gUnknown_Debug_083C3A9C:: @ 0x83C3A9C
	.string "$"

gUnknown_Debug_083C3A9D:: @ 0x83C3A9D
	.string "$"

gUnknown_Debug_083C3A9E:: @ 0x83C3A9E
	.string "$"

	.align 2
gUnknown_Debug_083C3AA0:: @ 0x83C3AA0
	.4byte gUnknown_Debug_083C37AC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37C0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37CF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37E5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37FD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3811, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3824, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3825, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3AE0:: @ 0x83C3AE0
	.4byte gUnknown_Debug_083C3827, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C383B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C384F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3863, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3875, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3885, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3886, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3887, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3888, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3B28:: @ 0x83C3B28
	.4byte gUnknown_Debug_083C3889, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C389D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38B1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38C5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38D9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38ED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3901, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3915, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3929, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3B70:: @ 0x83C3B70
	.4byte gUnknown_Debug_083C3940, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3954, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3968, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3969, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396E, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3BB8::
	.4byte gUnknown_Debug_083C396F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3984, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3997, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39A9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39BC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39D3, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39E8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39F9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A0E, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3C00::
	.4byte gUnknown_Debug_083C3A22, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A36, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A4D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A65, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A7B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A8D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A9C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A9D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A9E, TomomichiDebugMenu_Config+1

	@ These are not strings
gUnknown_Debug_083C3C48:: @ 0x83C3C48
	.string "かおけいけか"

gUnknown_Debug_83C3C4E:: @ 0x83C3C4E
	.string "ョぞガぞギぞゲぞヂぞ’ぞ　　　　　　5ぞGぞ♂ぞ6ぞ4ぞ　　　　　　　　！ぞ？ぞ。ぞーぞ·ぞ‥ぞ“ぞ”ぞ♀ぞゾぞDぞ　　　　　　　　　　　　　　グぞズぞバぞビぞベぞピぞ2ぞ3ぞ8ぞ‘ぞ¥ぞAぞBぞFぞKぞ　　　　　　"

	@ But these are strings
gUnknown_Debug_083C3CBA:: @ 0x83C3CBA
	.string "タウン$"

gUnknown_Debug_083C3CBE:: @ 0x83C3CBE
	.string "シティ$"

gUnknown_Debug_083C3CC2:: @ 0x83C3CC2
	.string "ロード101ー109$"

gUnknown_Debug_083C3CCD:: @ 0x83C3CCD
	.string "ロード110ー118$"

gUnknown_Debug_083C3CD8:: @ 0x83C3CD8
	.string "ロード119ー127$"

gUnknown_Debug_083C3CE3:: @ 0x83C3CE3
	.string "ロード128ー134$"

gUnknown_Debug_083C3CEE:: @ 0x83C3CEE
	.string "ルーム　タウン$"

gUnknown_Debug_083C3CF6:: @ 0x83C3CF6
	.string "ルーム　シティ$"

gUnknown_Debug_083C3CFE:: @ 0x83C3CFE
	.string "ダンジョンない$"

	.align 2
gUnknown_Debug_083C3D08:: @ 0x83C3D08
	.4byte gUnknown_Debug_083C3CBA, debug_sub_808DBA0+1
	.4byte gUnknown_Debug_083C3CBE, debug_sub_808DBF8+1
	.4byte gUnknown_Debug_083C3CC2, debug_sub_808DC50+1
	.4byte gUnknown_Debug_083C3CCD, debug_sub_808DCA8+1
	.4byte gUnknown_Debug_083C3CD8, debug_sub_808DD00+1
	.4byte gUnknown_Debug_083C3CE3, debug_sub_808DD58+1
	.4byte gUnknown_Debug_083C3CEE, debug_sub_808DDB0+1
	.4byte gUnknown_Debug_083C3CF6, debug_sub_808DE08+1
	.4byte gUnknown_Debug_083C3CFE, debug_sub_808DE60+1

gUnknown_Debug_083C3D50:: @ 0x83C3D50
	.string "WKーSCENEーFIELDーT101$"

gUnknown_Debug_083C3D64:: @ 0x83C3D64
	.string "WKーSCENEーFIELDーT102$"

gUnknown_Debug_083C3D78:: @ 0x83C3D78
	.string "WKーSCENEーFIELDーT103$"

gUnknown_Debug_083C3D8C:: @ 0x83C3D8C
	.string "WKーSCENEーFIELDーT104$"

gUnknown_Debug_083C3DA0:: @ 0x83C3DA0
	.string "WKーBASEーPOSNO$"

gUnknown_Debug_083C3DAE:: @ 0x83C3DAE
	.string "WKーSCENEーFIELDーT106$"

gUnknown_Debug_083C3DC2:: @ 0x83C3DC2
	.string "WKーSCENEーFIELDーT107$"

gUnknown_Debug_083C3DD6:: @ 0x83C3DD6
	.string "WKーSCENEー02ーFIELDーT102$"

gUnknown_Debug_083C3DED:: @ 0x83C3DED
	.string "WKーSCENEーFIELDーC101$"

gUnknown_Debug_083C3E01:: @ 0x83C3E01
	.string "WKーSCENEーFIELDーC102$"

gUnknown_Debug_083C3E15:: @ 0x83C3E15
	.string "WKーSCENEーFIELDーC103$"

gUnknown_Debug_083C3E29:: @ 0x83C3E29
	.string "WKーSCENEーFIELDーC104$"

gUnknown_Debug_083C3E3D:: @ 0x83C3E3D
	.string "WKーSCENEーFIELDーC105$"

gUnknown_Debug_083C3E51:: @ 0x83C3E51
	.string "WKーSCENEーFIELDーC106$"

gUnknown_Debug_083C3E65:: @ 0x83C3E65
	.string "WKーSCENEーFIELDーC107$"

gUnknown_Debug_083C3E79:: @ 0x83C3E79
	.string "WKーSCENEーFIELDーC108$"

gUnknown_Debug_083C3E8D:: @ 0x83C3E8D
	.string "WKーSCENEーFIELDーC109$"

gUnknown_Debug_083C3EA1:: @ 0x83C3EA1
	.string "WKーSCENEーFIELDーR101$"

gUnknown_Debug_083C3EB5:: @ 0x83C3EB5
	.string "WKーSCENEーFIELDーR102$"

gUnknown_Debug_083C3EC9:: @ 0x83C3EC9
	.string "WKーSCENEーFIELDーR103$"

gUnknown_Debug_083C3EDD:: @ 0x83C3EDD
	.string "WKーSCENEーFIELDーR104$"

gUnknown_Debug_083C3EF1:: @ 0x83C3EF1
	.string "WKーSCENEーFIELDーR105$"

gUnknown_Debug_083C3F05:: @ 0x83C3F05
	.string "WKーSCENEーFIELDーR106$"

gUnknown_Debug_083C3F19:: @ 0x83C3F19
	.string "WKーSCENEーFIELDーR107$"

gUnknown_Debug_083C3F2D:: @ 0x83C3F2D
	.string "WKーSCENEーFIELDーR108$"

gUnknown_Debug_083C3F41:: @ 0x83C3F41
	.string "WKーSCENEーFIELDーR109$"

gUnknown_Debug_083C3F55:: @ 0x83C3F55
	.string "WKーSCENEーFIELDーR110$"

gUnknown_Debug_083C3F69:: @ 0x83C3F69
	.string "WKーSCENEーFIELDーR111$"

gUnknown_Debug_083C3F7D:: @ 0x83C3F7D
	.string "WKーSCENEーFIELDーR112$"

gUnknown_Debug_083C3F91:: @ 0x83C3F91
	.string "WKーSCENEーFIELDーR113$"

gUnknown_Debug_083C3FA5:: @ 0x83C3FA5
	.string "WKーSCENEーFIELDーR114$"

gUnknown_Debug_083C3FB9:: @ 0x83C3FB9
	.string "WKーSCENEーFIELDーR115$"

gUnknown_Debug_083C3FCD:: @ 0x83C3FCD
	.string "WKーSCENEーFIELDーR116$"

gUnknown_Debug_083C3FE1:: @ 0x83C3FE1
	.string "WKーSCENEーFIELDーR117$"

gUnknown_Debug_083C3FF5:: @ 0x83C3FF5
	.string "WKーSCENEーFIELDーR118$"

gUnknown_Debug_083C4009:: @ 0x83C4009
	.string "WKーSCENEーFIELDーR119$"

gUnknown_Debug_083C401D:: @ 0x83C401D
	.string "WKーSCENEーFIELDーR120$"

gUnknown_Debug_083C4031:: @ 0x83C4031
	.string "WKーSCENEーFIELDーR121$"

gUnknown_Debug_083C4045:: @ 0x83C4045
	.string "WKーSCENEーFIELDーR122$"

gUnknown_Debug_083C4059:: @ 0x83C4059
	.string "WKーSCENEーFIELDーR123$"

gUnknown_Debug_083C406D:: @ 0x83C406D
	.string "WKーSCENEーFIELDーR124$"

gUnknown_Debug_083C4081:: @ 0x83C4081
	.string "WKーSCENEーFIELDーR125$"

gUnknown_Debug_083C4095:: @ 0x83C4095
	.string "WKーSCENEーFIELDーR126$"

gUnknown_Debug_083C40A9:: @ 0x83C40A9
	.string "WKーSCENEーFIELDーR127$"

gUnknown_Debug_083C40BD:: @ 0x83C40BD
	.string "WKーSCENEーFIELDーR128$"

gUnknown_Debug_083C40D1:: @ 0x83C40D1
	.string "WKーSCENEーFIELDーR129$"

gUnknown_Debug_083C40E5:: @ 0x83C40E5
	.string "WKーSCENEーFIELDーR130$"

gUnknown_Debug_083C40F9:: @ 0x83C40F9
	.string "WKーSCENEーFIELDーR131$"

gUnknown_Debug_083C410D:: @ 0x83C410D
	.string "WKーSCENEーFIELDーR132$"

gUnknown_Debug_083C4121:: @ 0x83C4121
	.string "WKーSCENEーFIELDーR133$"

gUnknown_Debug_083C4135:: @ 0x83C4135
	.string "WKーSCENEーFIELDーR134$"

gUnknown_Debug_083C4149:: @ 0x83C4149
	.string "WKーSCENEーT101ーR0101$"

gUnknown_Debug_083C415D:: @ 0x83C415D
	.string "WKーSCENEーT101ーR0102$"

gUnknown_Debug_083C4171:: @ 0x83C4171
	.string "WKーSCENEーT101ーR0301$"

gUnknown_Debug_083C4185:: @ 0x83C4185
	.string "WKーSCENEーT101ーR0201$"

gUnknown_Debug_083C4199:: @ 0x83C4199
	.string "WKーSCENEーT101ーR0202$"

gUnknown_Debug_083C41AD:: @ 0x83C41AD
	.string "WKーSCENEーT107ーR0201$"

gUnknown_Debug_083C41C1:: @ 0x83C41C1
	.string "WKーSCENEーC101ーR0201$"

gUnknown_Debug_083C41D5:: @ 0x83C41D5
	.string "WKーSCENEーC104ーR0103$"

gUnknown_Debug_083C41E9:: @ 0x83C41E9
	.string "WKーSCENEーC103ーR0101$"

gUnknown_Debug_083C41FD:: @ 0x83C41FD
	.string "WKーSCENEーC106ーR0202$"

gUnknown_Debug_083C4211:: @ 0x83C4211
	.string "WKーSCENEーC106ーR0401$"

gUnknown_Debug_083C4225:: @ 0x83C4225
	.string "WKーSCENEーC102ーR0601$"

gUnknown_Debug_083C4239:: @ 0x83C4239
	.string "WKーSCENEーC102ーR0501$"

gUnknown_Debug_083C424D:: @ 0x83C424D
	.string "WKーSCENEーC104ーR0102$"

gUnknown_Debug_083C4261:: @ 0x83C4261
	.string "WKーSCENEーC107ーR0501$"

gUnknown_Debug_083C4275:: @ 0x83C4275
	.string "WKーSCENEーCAVEーD0601$"

gUnknown_Debug_083C4289:: @ 0x83C4289
	.string "WKーSCENEーCAVEーD0201$"

gUnknown_Debug_083C429D:: @ 0x83C429D
	.string "WKーSCENEーCAVEーD1206$"

gUnknown_Debug_083C42B1:: @ 0x83C42B1
	.string "WKーSCENEーCAVEーD1111$"

gUnknown_Debug_083C42C5:: @ 0x83C42C5
	.string "WKーSCENEーCAVEーD0701$"

gUnknown_Debug_083C42D9:: @ 0x83C42D9
	.string "WKーSCENEーCAVEーD0808$"

gUnknown_Debug_083C42ED:: @ 0x83C42ED
	.string "WKーSCENEーCAVEーD1602$"

gUnknown_Debug_083C4301:: @ 0x83C4301
	.string "WKーSCENEーCAVEーD0101$"

gUnknown_Debug_083C4315:: @ 0x83C4315
	.string "WKーSCENEーCAVEーD1301$"

	.align 2
gUnknown_Debug_083C432C:: @ 0x83C432C
	.4byte gUnknown_Debug_083C3D50, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3D64, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3D78, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3D8C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DA0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DAE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DC2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DD6, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C436C::
	.4byte gUnknown_Debug_083C3DED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E01, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E15, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E29, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E3D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E51, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E65, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E79, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E8D, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C43B4::
	.4byte gUnknown_Debug_083C3EA1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EB5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EC9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EDD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EF1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F05, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F19, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F2D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F41, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C43FC::
	.4byte gUnknown_Debug_083C3F55, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F69, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F7D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F91, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FA5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FB9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FCD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FE1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FF5, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4444::
	.4byte gUnknown_Debug_083C4009, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C401D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4031, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4045, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4059, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C406D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4081, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4095, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40A9, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C448C::
	.4byte gUnknown_Debug_083C40BD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40D1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40E5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40F9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C410D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4121, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4135, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C44C4::
	.4byte gUnknown_Debug_083C4149, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C415D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4171, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4185, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4199, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C44EC::
	.4byte gUnknown_Debug_083C41C1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C41D5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C41E9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C41FD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4211, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4225, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4239, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C424D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4261, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4534::
	.4byte gUnknown_Debug_083C4275, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4289, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C429D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42B1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42C5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42D9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42ED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4301, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4315, TomomichiDebugMenu_Config+1

	@ These are not strings
gUnknown_Debug_083C457C:: @ 0x83C457C
	.string "くけけけけきかけけ　"
gUnknown_Debug_083C4586:: @ 0x83C4586
	.string "っぞアぞイぞウぞエぞオぞカぞMぞ　　キぞクぞケぞコぞサぞシぞスぞセぞソぞタぞチぞツぞテぞトぞナぞニぞヌぞネぞノぞハぞヒぞフぞヘぞホぞマぞミぞムぞメぞモぞヤぞユぞヨぞラぞリぞルぞレぞロぞワぞヲぞンぞァぞィぞゥぞ　　　　ェぞォぞャぞザぞジぞHぞ　　　　　　ュぞゼぞヅぞデぞドぞッぞ9ぞJぞLぞブぞボぞパぞ1ぞ7ぞ×ぞ/ぞEぞIぞ"

gUnknown_Debug_083C4628:: @ 0x83C4628
	.string "LOCALWORK0ー8$"

gUnknown_Debug_083C4635:: @ 0x83C4635
	.string "LOCALWORK9ー15$"

	.align 2
gUnknown_Debug_083C4644:: @ 0x83C4644
	.4byte gUnknown_Debug_083C4628, debug_sub_808E754+1
	.4byte gUnknown_Debug_083C4635, debug_sub_808E7AC+1

gUnknown_Debug_083C4654:: @ 0x83C4654
	.string "LOCALWORK0$"

gUnknown_Debug_083C465F:: @ 0x83C465F
	.string "LOCALWORK1$"

gUnknown_Debug_083C466A:: @ 0x83C466A
	.string "LOCALWORK2$"

gUnknown_Debug_083C4675:: @ 0x83C4675
	.string "LOCALWORK3$"

gUnknown_Debug_083C4680:: @ 0x83C4680
	.string "LOCALWORK4$"

gUnknown_Debug_083C468B:: @ 0x83C468B
	.string "LOCALWORK5$"

gUnknown_Debug_083C4696:: @ 0x83C4696
	.string "LOCALWORK6$"

gUnknown_Debug_083C46A1:: @ 0x83C46A1
	.string "LOCALWORK7$"

gUnknown_Debug_083C46AC:: @ 0x83C46AC
	.string "LOCALWORK8$"

gUnknown_Debug_083C46B7:: @ 0x83C46B7
	.string "LOCALWORK9$"

gUnknown_Debug_083C46C2:: @ 0x83C46C2
	.string "LOCALWORK10$"

gUnknown_Debug_083C46CE:: @ 0x83C46CE
	.string "LOCALWORK11$"

gUnknown_Debug_083C46DA:: @ 0x83C46DA
	.string "LOCALWORK12$"

gUnknown_Debug_083C46E6:: @ 0x83C46E6
	.string "LOCALWORK13$"

gUnknown_Debug_083C46F2:: @ 0x83C46F2
	.string "LOCALWORK14$"

gUnknown_Debug_083C46FE:: @ 0x83C46FE
	.string "LOCALWORK15$"

	.align 2
gUnknown_Debug_083C470C:: @ 0x83C470C
	.4byte gUnknown_Debug_083C4654, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C465F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C466A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4675, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4680, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C468B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4696, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46A1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46AC, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4754C::
	.4byte gUnknown_Debug_083C46B7, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46C2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46CE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46DA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46F2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46FE, TomomichiDebugMenu_Config+1

	@ These are not strings
gUnknown_Debug_083C478C:: @ 0x83C478C
	.string "けき"
gUnknown_Debug_083C478E:: @ 0x83C478E
	.string "　ぞあぞいぞうぞえぞおぞかぞきぞくぞけぞこぞさぞしぞすぞせぞそぞ　　　　"

gUnknown_Debug_083C47B2::
	.string "Level$"

gUnknown_Debug_083C47B8:: @ 0x83C47B8
	.string "Scene1$"

gUnknown_Debug_083C47BF:: @ 0x83C47BF
	.string "Scene2$"

gUnknown_Debug_083C47C6:: @ 0x83C47C6
	.string "Scene3$"

gUnknown_Debug_083C47CD:: @ 0x83C47CD
	.string "Scene4$"

gUnknown_Debug_083C47D4:: @ 0x83C47D4
	.string "Scene5$"

gUnknown_Debug_083C47DB:: @ 0x83C47DB
	.string "Scene6$"

gUnknown_Debug_083C47E2:: @ 0x83C47E2
	.string "Scene7$"

gUnknown_Debug_083C47E9:: @ 0x83C47E9
	.string "Scene8$"

	.align 2
gUnknown_Debug_083C47F0:: @ 0x83C47F0
	.4byte gUnknown_Debug_083C47B8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47BF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47C6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47CD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47DB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47E2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47E9, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4830:: @ 0x83C4830
	.string "Trick　Master$"

gUnknown_Debug_083C483D:: @ 0x83C483D
	.string "Hidden　MASTER$"

gUnknown_Debug_083C484B:: @ 0x83C484B
	.string "Inside　the　HOUSE$"

gUnknown_Debug_083C485C:: @ 0x83C485C
	.string "Pass　a　reward$"

gUnknown_Debug_083C486A:: @ 0x83C486A
	.string "Rig　a　trick$"

gUnknown_Debug_083C4876:: @ 0x83C4876
	.string "MASTER　is　gone$"

	.align 2
gUnknown_Debug_083C4888:: @ 0x83C4888
	.4byte gUnknown_Debug_083C483D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C484B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C485C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C486A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4876, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C48B0:: @ 0x83C48B0
	.string "PMNICKNAME$"

gUnknown_Debug_083C48BB:: @ 0x83C48BB
	.string "BREEDER$"
	.endif
