	.macro me_nop
	.byte 0
	.endm

	.macro me_checkcompat word, v1, v2, v3, v4
	.byte 1
	.4byte \word
	.2byte \v1
	.4byte \v2
	.2byte \v3
	.4byte \v4
	.endm

	.macro me_end
	.byte 2
	.endm

	.macro me_setmsg value, str
	.byte 3
	.byte \value
	.4byte \str
	.endm

	.macro me_setstatus value
	.byte 4
	.byte \value
	.endm

	.macro me_runscript script
	.byte 5
	.4byte \script
	.endm

	.macro me_initramscript mapId, objId, script, end
	.byte 6
	map \mapId
	.byte \objId
	.4byte \script, \end
	.endm

	.macro me_setenigmaberry berry
	.byte 7
	.4byte \berry
	.endm

	.macro me_giveribbon index, ribbonId
	.byte 8
	.byte \index, \ribbonId
	.endm

	.macro me_givenationaldex
	.byte 9
	.endm

	.macro me_addrareword word
	.byte 10
	.byte \word
	.endm

	.macro me_setrecordmixinggift unk, quantity, itemId
	.byte 11
	.byte \unk, \quantity
	.2byte \itemId
	.endm

	.macro me_givepokemon data
	.byte 12
	.4byte \data
	.endm

	.macro me_addtrainer data
	.byte 13
	.4byte \data
	.endm

	.macro me_enableresetrtc
	.byte 14
	.endm

	.macro me_checksum checksum, data, dataEnd
	.byte 15
	.4byte \checksum, \data, \dataEnd
	.endm

	.macro me_crc crc, data, dataEnd
	.byte 16
	.4byte \crc, \data, \dataEnd
	.endm
