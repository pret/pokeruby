	.global RomHeaderNintendoLogo
RomHeaderNintendoLogo:
	.incbin "baserom.gba", 0x4, 0xA0 - 0x4

RomHeaderGameTitle:
	.ascii "POKEMON RUBY"

RomHeaderGameCode:
	.ascii "AXVE"

RomHeaderMakerCode:
	.ascii "01"

RomHeaderMagic:
	.byte 0x96

RomHeaderMainUnitCode:
	.byte 0

RomHeaderDeviceType:
	.byte 0

RomHeaderReserved1:
	.space 7

RomHeaderSoftwareVersion:
	.byte 0

RomHeaderChecksum:
	.byte 0x41

RomHeaderReserved2:
	.space 2
