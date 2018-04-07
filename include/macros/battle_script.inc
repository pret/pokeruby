@ 0 ==
@ 1 !=
@ 2 <
@ 3 >
@ 4 &=

	.macro calculatedamage
	critical
	atk5
	atk6
	atk7
	.endm


	.macro attackcanceler
	.byte 0x00
	.endm

	.macro accuracycheck address, param1
	.byte 0x01
	.4byte \address
	.2byte \param1
	.endm

	.macro attackstring
	.byte 0x02
	.endm

	.macro ppreduce
	.byte 0x03
	.endm

	.macro critcalc
	.byte 0x04
	.endm

	.macro damagecalc
	.byte 0x05
	.endm

	.macro typecalc
	.byte 0x06
	.endm

	.macro adjustnormaldamage
	.byte 0x07
	.endm

	.macro adjustnormaldamage2
	.byte 0x08
	.endm

	.macro attackanimation
	.byte 0x09
	.endm

	.macro waitanimation
	.byte 0x0a
	.endm

	.macro healthbarupdate bank
	.byte 0x0b
	.byte \bank
	.endm

	.macro datahpupdate bank
	.byte 0x0c
	.byte \bank
	.endm

	.macro critmessage
	.byte 0x0d
	.endm

	.macro effectivenesssound
	.byte 0x0e
	.endm

	.macro resultmessage
	.byte 0x0f
	.endm

	.macro printstring string
	.byte 0x10
	.2byte \string
	.endm

	.macro printselectionstring string
	.byte 0x11
	.2byte \string
	.endm

	.macro waitmessage delay
	.byte 0x12
	.2byte \delay
	.endm

	.macro printfromtable table
	.byte 0x13
	.4byte \table
	.endm

	.macro printselectionstringfromtable table
	.byte 0x14
	.4byte \table
	.endm

	.macro seteffectwithchance
	.byte 0x15
	.endm

	.macro seteffectprimary
	.byte 0x16
	.endm

	.macro seteffectsecondary
	.byte 0x17
	.endm

	.macro clearstatusfromeffect bank
	.byte 0x18
	.byte \bank
	.endm

	.macro tryfaintmon bank, param2, param3
	.byte 0x19
	.byte \bank
	.byte \param2
	.4byte \param3
	.endm

	.macro dofaintanimation param1
	.byte 0x1a
	.byte \param1
	.endm

	.macro cleareffectsonfaint bank
	.byte 0x1b
	.byte \bank
	.endm

	.macro jumpifstatus bank, status, address
	.byte 0x1c
	.byte \bank
	.4byte \status
	.4byte \address
	.endm

	.macro jumpifstatus2 bank, status, address
	.byte 0x1d
	.byte \bank
	.4byte \status
	.4byte \address
	.endm

	.macro jumpifability bank, ability, address
	.byte 0x1e
	.byte \bank
	.byte \ability
	.4byte \address
	.endm

	.macro jumpifsideaffecting bank, status, address
	.byte 0x1f
	.byte \bank
	.2byte \status
	.4byte \address
	.endm

	.macro jumpifstat bank, flag, quantity, statid, address
	.byte 0x20
	.byte \bank
	.byte \flag
	.byte \quantity
	.byte \statid
	.4byte \address
	.endm

	.macro jumpifstatus3condition bank, mask, status, address
	.byte 0x21
	.byte \bank
	.4byte \mask
	.byte \status
	.4byte \address
	.endm

	.macro jumpiftype bank, type, address
	.byte 0x22
	.byte \bank
	.byte \type
	.4byte \address
	.endm

	.macro getexp bank
	.byte 0x23
	.byte \bank
	.endm

	.macro atk24 address
	.byte 0x24
	.4byte \address
	.endm

	.macro movevaluescleanup
	.byte 0x25
	.endm

	.macro setmultihit param1
	.byte 0x26
	.byte \param1
	.endm

	.macro decrementmultihit address
	.byte 0x27
	.4byte \address
	.endm

	.macro goto address
	.byte 0x28
	.4byte \address
	.endm

	.macro jumpifbyte ifflag, checkaddr, compare, address
	.byte 0x29
	.byte \ifflag
	.4byte \checkaddr
	.byte \compare
	.4byte \address
	.endm

	.macro jumpifhalfword ifflag, checkaddr, compare, address
	.byte 0x2a
	.byte \ifflag
	.4byte \checkaddr
	.2byte \compare
	.4byte \address
	.endm

	.macro jumpifword ifflag, checkaddr, compare, address
	.byte 0x2b
	.byte \ifflag
	.4byte \checkaddr
	.4byte \compare
	.4byte \address
	.endm

	.macro jumpifarrayequal mem1, mem2, size, address
	.byte 0x2c
	.4byte \mem1
	.4byte \mem2
	.byte \size
	.4byte \address
	.endm

	.macro jumpifarraynotequal mem1, mem2, size, address
	.byte 0x2d
	.4byte \mem1
	.4byte \mem2
	.byte \size
	.4byte \address
	.endm

	.macro setbyte pointer, value
	.byte 0x2e
	.4byte \pointer
	.byte \value
	.endm

	.macro addbyte pointer, value
	.byte 0x2f
	.4byte \pointer
	.byte \value
	.endm

	.macro subbyte pointer, value
	.byte 0x30
	.4byte \pointer
	.byte \value
	.endm

	.macro copyarray destination, source, size
	.byte 0x31
	.4byte \destination
	.4byte \source
	.byte \size
	.endm

	.macro copyarraywithindex param1, param2, param3, byte
	.byte 0x32
	.4byte \param1
	.4byte \param2
	.4byte \param3
	.byte \byte
	.endm

	.macro orbyte pointer, value
	.byte 0x33
	.4byte \pointer
	.byte \value
	.endm

	.macro orhalfword pointer, value
	.byte 0x34
	.4byte \pointer
	.2byte \value
	.endm

	.macro orword pointer, value
	.byte 0x35
	.4byte \pointer
	.4byte \value
	.endm

	.macro bicbyte pointer, value
	.byte 0x36
	.4byte \pointer
	.byte \value
	.endm

	.macro bichalfword pointer, value
	.byte 0x37
	.4byte \pointer
	.2byte \value
	.endm

	.macro bicword pointer, value
	.byte 0x38
	.4byte \pointer
	.4byte \value
	.endm

	.macro pause pause_duration
	.byte 0x39
	.2byte \pause_duration
	.endm

	.macro waitstate
	.byte 0x3a
	.endm

	.macro healthbar_update bank
	.byte 0x3b
	.byte \bank
	.endm

	.macro return
	.byte 0x3c
	.endm

	.macro end
	.byte 0x3d
	.endm

	.macro end2
	.byte 0x3e
	.endm

	.macro end3
	.byte 0x3f
	.endm

	.macro jumpifaffectedbyprotect address
	.byte 0x40
	.4byte \address
	.endm

	.macro call address
	.byte 0x41
	.4byte \address
	.endm

	.macro jumpiftype2 bank, type, address
	.byte 0x42
	.byte \bank
	.byte \type
	.4byte \address
	.endm

	.macro jumpifabilitypresent ability, address
	.byte 0x43
	.byte \ability
	.4byte \address
	.endm

	.macro endselectionscript
	.byte 0x44
	.endm

	.macro playanimation bank, animation, var_address
	.byte 0x45
	.byte \bank
	.byte \animation
	.4byte \var_address
	.endm

	.macro playanimation2 bank, address, int
	.byte 0x46
	.byte \bank
	.4byte \address
	.4byte \int
	.endm

	.macro setgraphicalstatchangevalues
	.byte 0x47
	.endm

	.macro playstatchangeanimation bank, color, byte
	.byte 0x48
	.byte \bank
	.byte \color
	.byte \byte
	.endm

	.macro moveend byte1, byte2
	.byte 0x49
	.byte \byte1
	.byte \byte2
	.endm

	.macro typecalc2
	.byte 0x4a
	.endm

	.macro returnatktoball
	.byte 0x4b
	.endm

	.macro getswitchedmondata bank
	.byte 0x4c
	.byte \bank
	.endm

	.macro switchindataupdate bank
	.byte 0x4d
	.byte \bank
	.endm

	.macro switchinanim bank, byte
	.byte 0x4e
	.byte \bank
	.byte \byte
	.endm

	.macro jumpifcantswitch bank, address
	.byte 0x4f
	.byte \bank
	.4byte \address
	.endm

	.macro openpartyscreen bank, address
	.byte 0x50
	.byte \bank
	.4byte \address
	.endm

	.macro switchhandleorder bank, param2
	.byte 0x51
	.byte \bank
	.byte \param2
	.endm

	.macro switchineffects bank
	.byte 0x52
	.byte \bank
	.endm

	.macro trainerslidein bank
	.byte 0x53
	.byte \bank
	.endm

	.macro playse word
	.byte 0x54
	.2byte \word
	.endm

	.macro fanfare int
	.byte 0x55
	.2byte \int
	.endm

	.macro playfaintcry bank_or_side
	.byte 0x56
	.byte \bank_or_side
	.endm

	.macro atk57
	.byte 0x57
	.endm

	.macro returntoball bank
	.byte 0x58
	.byte \bank
	.endm

	.macro handlelearnnewmove param1, param2, bank_maybe
	.byte 0x59
	.4byte \param1
	.4byte \param2
	.byte \bank_maybe
	.endm

	.macro yesnoboxlearnmove address
	.byte 0x5a
	.4byte \address
	.endm

	.macro yesnoboxstoplearningmove address
	.byte 0x5b
	.4byte \address
	.endm

	.macro hitanimation bank
	.byte 0x5c
	.byte \bank
	.endm

	.macro getmoneyreward
	.byte 0x5d
	.endm

	.macro atk5e bank
	.byte 0x5e
	.byte \bank
	.endm

	.macro atk5f
	.byte 0x5f
	.endm

	.macro incrementgamestat byte
	.byte 0x60
	.byte \byte
	.endm

	.macro drawpartystatussummary bank_or_side
	.byte 0x61
	.byte \bank_or_side
	.endm

	.macro atk62 bank_or_side
	.byte 0x62
	.byte \bank_or_side
	.endm

	.macro jumptorandomattack bank
	.byte 0x63
	.byte \bank
	.endm

	.macro statusanimation bank
	.byte 0x64
	.byte \bank
	.endm

	.macro status2animation bank_or_side, address
	.byte 0x65
	.byte \bank_or_side
	.4byte \address
	.endm

	.macro chosenstatusanimation bank_or_side, bank_or_side2, address
	.byte 0x66
	.byte \bank_or_side
	.byte \bank_or_side2
	.4byte \address
	.endm

	.macro yesnobox
	.byte 0x67
	.endm

	.macro cancelallactions
	.byte 0x68
	.endm

	.macro adjustsetdamage
	.byte 0x69
	.endm

	.macro removeitem bank
	.byte 0x6a
	.byte \bank
	.endm

	.macro atknameinbuff1
	.byte 0x6b
	.endm

	.macro drawlvlupbox
	.byte 0x6c
	.endm

	.macro resetsentmonsvalue
	.byte 0x6d
	.endm

	.macro setatktoplayer0
	.byte 0x6e
	.endm

	.macro makevisible bank
	.byte 0x6f
	.byte \bank
	.endm

	.macro recordlastability bank
	.byte 0x70
	.byte \bank
	.endm

	.macro buffermovetolearn
	.byte 0x71
	.endm

	.macro jumpifplayerran address
	.byte 0x72
	.4byte \address
	.endm

	.macro hpthresholds bank
	.byte 0x73
	.byte \bank
	.endm

	.macro hpthresholds2 bank
	.byte 0x74
	.byte \bank
	.endm

	.macro useitemonopponent
	.byte 0x75
	.endm

	.macro various bank, byte
	.byte 0x76
	.byte \bank
	.byte \byte
	.endm

	.macro setprotectlike
	.byte 0x77
	.endm

	.macro faintifabilitynotdamp
	.byte 0x78
	.endm

	.macro setatkhptozero
	.byte 0x79
	.endm

	.macro jumpifnexttargetvalid address
	.byte 0x7a
	.4byte \address
	.endm

	.macro tryhealhalfhealth address, byte
	.byte 0x7b
	.4byte \address
	.byte \byte
	.endm

	.macro trymirrormove
	.byte 0x7c
	.endm

	.macro setrain
	.byte 0x7d
	.endm

	.macro setreflect
	.byte 0x7e
	.endm

	.macro setseeded
	.byte 0x7f
	.endm

	.macro manipulatedamage id
	.byte 0x80
	.byte \id
	.endm

	.macro trysetrest address
	.byte 0x81
	.4byte \address
	.endm

	.macro jumpifnotfirstturn address
	.byte 0x82
	.4byte \address
	.endm

	.macro nop
	.byte 0x83
	.endm

	.macro jumpifcantmakeasleep address
	.byte 0x84
	.4byte \address
	.endm

	.macro stockpile
	.byte 0x85
	.endm

	.macro stockpiletobasedamage address
	.byte 0x86
	.4byte \address
	.endm

	.macro stockpiletohpheal address
	.byte 0x87
	.4byte \address
	.endm

	.macro negativedamage
	.byte 0x88
	.endm

	.macro statbuffchange target, address
	.byte 0x89
	.byte \target
	.4byte \address
	.endm

	.macro normalisebuffs
	.byte 0x8a
	.endm

	.macro setbide
	.byte 0x8b
	.endm

	.macro confuseifrepeatingattackends
	.byte 0x8c
	.endm

	.macro setmultihitcounter count
	.byte 0x8d
	.byte \count
	.endm

	.macro initmultihitstring
	.byte 0x8e
	.endm

	.macro forcerandomswitch address
	.byte 0x8f
	.4byte \address
	.endm

	.macro tryconversiontypechange address
	.byte 0x90
	.4byte \address
	.endm

	.macro givepaydaymoney
	.byte 0x91
	.endm

	.macro setlightscreen
	.byte 0x92
	.endm

	.macro tryKO address
	.byte 0x93
	.4byte \address
	.endm

	.macro damagetohalftargethp
	.byte 0x94
	.endm

	.macro setsandstorm
	.byte 0x95
	.endm

	.macro weatherdamage
	.byte 0x96
	.endm

	.macro tryinfatuating address
	.byte 0x97
	.4byte \address
	.endm

	.macro updatestatusicon byte
	.byte 0x98
	.byte \byte
	.endm

	.macro setmist
	.byte 0x99
	.endm

	.macro setfocusenergy
	.byte 0x9a
	.endm

	.macro transformdataexecution
	.byte 0x9b
	.endm

	.macro setsubstitute
	.byte 0x9c
	.endm

	.macro mimicattackcopy address
	.byte 0x9d
	.4byte \address
	.endm

	.macro metronome
	.byte 0x9e
	.endm

	.macro dmgtolevel
	.byte 0x9f
	.endm

	.macro psywavedamageeffect
	.byte 0xa0
	.endm

	.macro counterdamagecalculator address
	.byte 0xa1
	.4byte \address
	.endm

	.macro mirrorcoatdamagecalculator address
	.byte 0xa2
	.4byte \address
	.endm

	.macro disablelastusedattack address
	.byte 0xa3
	.4byte \address
	.endm

	.macro trysetencore address
	.byte 0xa4
	.4byte \address
	.endm

	.macro painsplitdmgcalc address
	.byte 0xa5
	.4byte \address
	.endm

	.macro settypetorandomresistance address
	.byte 0xa6
	.4byte \address
	.endm

	.macro setalwayshitflag
	.byte 0xa7
	.endm

	.macro copymovepermanently address
	.byte 0xa8
	.4byte \address
	.endm

	.macro trychoosesleeptalkmove address
	.byte 0xa9
	.4byte \address
	.endm

	.macro setdestinybond
	.byte 0xaa
	.endm

	.macro trysetdestinybondtohappen
	.byte 0xab
	.endm

	.macro remaininghptopower
	.byte 0xac
	.endm

	.macro tryspiteppreduce address
	.byte 0xad
	.4byte \address
	.endm

	.macro healpartystatus
	.byte 0xae
	.endm

	.macro cursetarget address
	.byte 0xaf
	.4byte \address
	.endm

	.macro trysetspikes address
	.byte 0xb0
	.4byte \address
	.endm

	.macro setforesight
	.byte 0xb1
	.endm

	.macro trysetperishsong address
	.byte 0xb2
	.4byte \address
	.endm

	.macro rolloutdamagecalculation
	.byte 0xb3
	.endm

	.macro jumpifconfusedandstatmaxed bank, address
	.byte 0xb4
	.byte \bank
	.4byte \address
	.endm

	.macro furycuttercalc
	.byte 0xb5
	.endm

	.macro happinesstodamagecalculation
	.byte 0xb6
	.endm

	.macro presentdamagecalculation
	.byte 0xb7
	.endm

	.macro setsafeguard
	.byte 0xb8
	.endm

	.macro magnitudedamagecalculation
	.byte 0xb9
	.endm

	.macro jumpifnopursuitswitchdmg address
	.byte 0xba
	.4byte \address
	.endm

	.macro setsunny
	.byte 0xbb
	.endm

	.macro maxattackhalvehp address
	.byte 0xbc
	.4byte \address
	.endm

	.macro copyfoestats address
	.byte 0xbd
	.4byte \address
	.endm

	.macro rapidspinfree
	.byte 0xbe
	.endm

	.macro setdefensecurlbit
	.byte 0xbf
	.endm

	.macro recoverbasedonsunlight address
	.byte 0xc0
	.4byte \address
	.endm

	.macro hiddenpowercalc
	.byte 0xc1
	.endm

	.macro selectfirstvalidtarget
	.byte 0xc2
	.endm

	.macro trysetfutureattack address
	.byte 0xc3
	.4byte \address
	.endm

	.macro trydobeatup address1, address2
	.byte 0xc4
	.4byte \address1
	.4byte \address2
	.endm

	.macro setsemiinvulnerablebit
	.byte 0xc5
	.endm

	.macro clearsemiinvulnerablebit
	.byte 0xc6
	.endm

	.macro setminimize
	.byte 0xc7
	.endm

	.macro sethail
	.byte 0xc8
	.endm

	.macro jumpifattackandspecialattackcannotfall address
	.byte 0xc9
	.4byte \address
	.endm

	.macro setforcedtarget
	.byte 0xca
	.endm

	.macro setcharge
	.byte 0xcb
	.endm

	.macro callterrainattack
	.byte 0xcc
	.endm

	.macro cureifburnedparalysedorpoisoned address
	.byte 0xcd
	.4byte \address
	.endm

	.macro settorment address
	.byte 0xce
	.4byte \address
	.endm

	.macro jumpifnodamage address
	.byte 0xcf
	.4byte \address
	.endm

	.macro settaunt address
	.byte 0xd0
	.4byte \address
	.endm

	.macro trysethelpinghand address
	.byte 0xd1
	.4byte \address
	.endm

	.macro tryswapitems address
	.byte 0xd2
	.4byte \address
	.endm

	.macro trycopyability address
	.byte 0xd3
	.4byte \address
	.endm

	.macro trywish byte, address
	.byte 0xd4
	.byte \byte
	.4byte \address
	.endm

	.macro trysetroots address
	.byte 0xd5
	.4byte \address
	.endm

	.macro doubledamagedealtifdamaged
	.byte 0xd6
	.endm

	.macro setyawn address
	.byte 0xd7
	.4byte \address
	.endm

	.macro setdamagetohealthdifference address
	.byte 0xd8
	.4byte \address
	.endm

	.macro scaledamagebyhealthratio
	.byte 0xd9
	.endm

	.macro tryswapabilities address
	.byte 0xda
	.4byte \address
	.endm

	.macro tryimprision address
	.byte 0xdb
	.4byte \address
	.endm

	.macro trysetgrudge address
	.byte 0xdc
	.4byte \address
	.endm

	.macro weightdamagecalculation
	.byte 0xdd
	.endm

	.macro assistattackselect address
	.byte 0xde
	.4byte \address
	.endm

	.macro trysetmagiccoat address
	.byte 0xdf
	.4byte \address
	.endm

	.macro trysetsnatch address
	.byte 0xe0
	.4byte \address
	.endm

	.macro trygetintimidatetarget address
	.byte 0xe1
	.4byte \address
	.endm

	.macro switchoutabilities bank
	.byte 0xe2
	.byte \bank
	.endm

	.macro jumpifhasnohp bank, address
	.byte 0xe3
	.byte \bank
	.4byte \address
	.endm

	.macro getsecretpowereffect
	.byte 0xe4
	.endm

	.macro pickup
	.byte 0xe5
	.endm

	.macro docastformchangeanimation
	.byte 0xe6
	.endm

	.macro trycastformdatachange
	.byte 0xe7
	.endm

	.macro settypebasedhalvers address
	.byte 0xe8
	.4byte \address
	.endm

	.macro setweatherballtype
	.byte 0xe9
	.endm

	.macro tryrecycleitem address
	.byte 0xea
	.4byte \address
	.endm

	.macro settypetoterrain address
	.byte 0xeb
	.4byte \address
	.endm

	.macro pursuitrelated address
	.byte 0xec
	.4byte \address
	.endm

	.macro snatchsetbanks
	.byte 0xed
	.endm

	.macro removelightscreenreflect
	.byte 0xee
	.endm

	.macro handleballthrow
	.byte 0xef
	.endm

	.macro givecaughtmon
	.byte 0xf0
	.endm

	.macro trysetcaughtmondexflags address
	.byte 0xf1
	.4byte \address
	.endm

	.macro displaydexinfo
	.byte 0xf2
	.endm

	.macro trygivecaughtmonnick address
	.byte 0xf3
	.4byte \address
	.endm

	.macro subattackerhpbydmg
	.byte 0xf4
	.endm

	.macro removeattackerstatus1
	.byte 0xf5
	.endm

	.macro finishaction
	.byte 0xf6
	.endm

	.macro finishturn
	.byte 0xf7
	.endm

	.macro trainerslideout bank
	.byte 0xf8
	.byte \bank
	.endm

@ various command changed to more readable macros
	.macro cancelmultiturnmoves bank
	various \bank, VARIOUS_CANCEL_MULTI_TURN_MOVES
	.endm

	.macro setmagiccoattarget bank
	various \bank, VARIOUS_SET_MAGIC_COAT_TARGET
	.endm

	.macro getifcantrunfrombattle bank
	various \bank, VARIOUS_IS_RUNNING_IMPOSSIBLE
	.endm

	.macro getmovetarget bank
	various \bank, VARIOUS_GET_MOVE_TARGET
	.endm

	.macro various4 bank
	various \bank, 4
	.endm

	.macro resetintrimidatetracebits bank
	various \bank, VARIOUS_RESET_INTIMIDATE_TRACE_BITS
	.endm

	.macro updatechoicemoveonlvlup bank
	various \bank, VARIOUS_UPDATE_CHOICE_MOVE_ON_LVL_UP
	.endm

	.macro various7 bank
	various \bank, 7
	.endm

	.macro various8 bank
	various \bank, 8
	.endm

	.macro various9 bank
	various \bank, 9
	.endm

	.macro various10 bank
	various \bank, 10
	.endm

	.macro various11 bank
	various \bank, 11
	.endm

	.macro various12 bank
	various \bank, 12
	.endm

	.macro forfeityesnobox bank
	various \bank, VARIOUS_EMIT_YESNOBOX
	.endm

	.macro various14 bank
	various \bank, 14
	.endm

	.macro various15 bank
	various \bank, 15
	.endm

	.macro various16 bank
	various \bank, 16
	.endm

	.macro various17 bank
	various \bank, 17
	.endm

	.macro waitcry bank
	various \bank, VARIOUS_WAIT_CRY
	.endm

	.macro returnopponentmon1toball bank
	various \bank, VARIOUS_RETURN_OPPONENT_MON1
	.endm

	.macro returnopponentmon2toball bank
	various \bank, VARIOUS_RETURN_OPPONENT_MON2
	.endm

	.macro various21 bank
	various \bank, 21
	.endm

	.macro various22 bank
	various \bank, 22
	.endm

	.macro various23 bank
	various \bank, 23
	.endm

	.macro various24 bank
	various \bank, 24
	.endm

	.macro setoutcomeonteleport bank
	various \bank, VARIOUS_SET_TELEPORT_OUTCOME
	.endm

	.macro playtrainerdefeatbgm bank
	various \bank, VARIOUS_PLAY_TRAINER_DEFEATED_MUSIC
	.endm

@ helpful macros
	.macro setstatchanger stat, stages, down
	setbyte sSTATCHANGER \stat | \stages << 4 | \down << 7
	.endm
	
	.macro setmoveeffect effect
	setbyte cEFFECT_CHOOSER \effect
	.endm
	
	.macro chosenstatus1animation bank, status
	chosenstatusanimation \bank 0x0 \status
	.endm
	
	.macro chosenstatus2animation bank, status
	chosenstatusanimation \bank 0x1 \status
	.endm
	
	.macro sethword dst, value
	setbyte \dst, \value & 0xFF
	setbyte \dst + 1, (\value >> 8) & 0xFF
	.endm
	
	.macro setword dst, value
	setbyte \dst, \value & 0xFF
	setbyte \dst + 1, (\value >> 8) & 0xFF
	setbyte \dst + 2, (\value >> 16) & 0xFF
	setbyte \dst + 3, (\value >> 24) & 0xFF
	.endm
	
	.macro copybyte dst, src
	copyarray \dst, \src, 0x1
	.endm
	
	.macro copyhword dst, src
	copyarray \dst, \src, 0x2
	.endm
	
	.macro copyword dst, src
	copyarray \dst, \src, 0x4
	.endm
	
	.macro jumpifbytenotequal byte1, byte2, jumpptr
	jumpifarraynotequal \byte1, \byte2, 0x1, \jumpptr
	.endm
	
	.macro jumpifbyteequal byte1, byte2, jumpptr
	jumpifarrayequal \byte1, \byte2, 0x1, \jumpptr
	.endm
	
	.macro jumpifmove move, jumpptr
	jumpifhalfword EQUAL, gCurrentMove, \move, \jumpptr
	.endm

	.macro jumpifnotmove move, jumpptr
	jumpifhalfword NOT_EQUAL, gCurrentMove, \move, \jumpptr
	.endm
	
	.macro jumpifstatus3 bank, status, jumpptr
	jumpifstatus3condition \bank, \status, 0x0, \jumpptr
	.endm
	
	.macro jumpifnostatus3 bank, status, jumpptr
	jumpifstatus3condition \bank, \status, 0x1, \jumpptr
	.endm
	
	.macro jumpifmovehadnoeffect jumpptr
	jumpifbyte COMMON_BITS, gMoveResultFlags, MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE | MOVE_RESULT_FAILED, \jumpptr
	.endm
	
	.macro jumpifbattletype flags, jumpptr
	jumpifhalfword COMMON_BITS, gBattleTypeFlags, \flags, \jumpptr
	.endm
	
	.macro jumpifnotbattletype flags, jumpptr
	jumpifhalfword NO_COMMON_BITS, gBattleTypeFlags, \flags, \jumpptr
	.endm
