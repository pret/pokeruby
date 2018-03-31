	.macro loadspritegfx id
	.byte 0x00
	.2byte \id
	.endm

	.macro unloadspritegfx id
	.byte 0x01
	.2byte \id
	.endm

	.macro createsprite template, priority, argv:vararg
	.byte 0x02
	.4byte \template
	.byte \priority
	.byte (.Lsprite_\@_2 - .Lsprite_\@_1) / 2
.Lsprite_\@_1:
	.2byte \argv
.Lsprite_\@_2:
	.endm

	.macro createvisualtask addr, priority, argv:vararg
	.byte 0x03
	.4byte \addr
	.byte \priority
	.byte (.Lcreatetask_\@_2 - .Lcreatetask_\@_1) / 2
.Lcreatetask_\@_1:
	.2byte \argv
.Lcreatetask_\@_2:
	.endm

	.macro delay amount
	.byte 0x04
	.byte \amount
	.endm

	.macro waitforvisualfinish
	.byte 0x05
	.endm

	.macro hang1
	.byte 0x06
	.endm

	.macro hang2
	.byte 0x07
	.endm

	.macro end
	.byte 0x08
	.endm

	.macro playse id
	.byte 0x09
	.2byte \id
	.endm

	.macro monbg which
	.byte 0x0A
	.byte \which
	.endm

	.macro clearmonbg which
	.byte 0x0B
	.byte \which
	.endm

	.macro setalpha eva, evb
	.byte 0x0C
	.2byte ((\evb) << 8) | (\eva)
	.endm

	.macro blendoff
	.byte 0x0D
	.endm

	.macro call addr
	.byte 0x0E
	.4byte \addr
	.endm

	.macro return
	.byte 0x0F
	.endm

	.macro setarg arg_num, value
	.byte 0x10
	.byte \arg_num
	.2byte \value
	.endm

	.macro choosetwoturnanim addr1, addr2
	.byte 0x11
	.4byte \addr1
	.4byte \addr2
	.endm

	.macro jumpifmoveturn cond, addr
	.byte 0x12
	.byte \cond
	.4byte \addr
	.endm

	.macro goto addr
	.byte 0x13
	.4byte \addr
	.endm

	.macro fadetobg id
	.byte 0x14
	.byte \id
	.endm

	.macro restorebg
	.byte 0x15
	.endm

	.macro waitbgfadeout
	.byte 0x16
	.endm

	.macro waitbgfadein
	.byte 0x17
	.endm

	.macro changebg id
	.byte 0x18
	.byte \id
	.endm

	.macro playsewithpan id, pan
	.byte 0x19
	.2byte \id
	.byte \pan
	.endm

	.macro setpan pan
	.byte 0x1A
	.byte \pan
	.endm

	.macro panse_1B id, pan_start, pan_end, step, delay
	.byte 0x1B
	.2byte \id
	.byte \pan_start
	.byte \pan_end
	.byte \step
	.byte \delay
	.endm

	.macro loopsewithpan id, pan, delay, count
	.byte 0x1C
	.2byte \id
	.byte \pan
	.byte \delay
	.byte \count
	.endm

	.macro waitplaysewithpan id, pan, count
	.byte 0x1D
	.2byte \id
	.byte \pan
	.byte \count
	.endm

	.macro setbldcnt bldcnt
	.byte 0x1E
	.2byte \bldcnt
	.endm

	.macro createsoundtask addr, argv:vararg
	.byte 0x1F
	.4byte \addr
	.byte (.Lcreatetask_1F_\@_2 - .Lcreatetask_1F_\@_1) / 2
.Lcreatetask_1F_\@_1:
	.2byte \argv
.Lcreatetask_1F_\@_2:
	.endm

	.macro waitsound
	.byte 0x20
	.endm

	.macro jumpargeq arg_num, value, addr
	.byte 0x21
	.byte \arg_num
	.2byte \value
	.4byte \addr
	.endm

	.macro monbg_22 bank
	.byte 0x22
	.byte \bank
	.endm

	.macro clearmonbg_23 bank
	.byte 0x23
	.byte \bank
	.endm

	.macro jumpifcontest addr
	.byte 0x24
	.4byte \addr
	.endm

	.macro fadetobgfromset a, b, c
	.byte 0x25
	.byte \a
	.byte \b
	.byte \c
	.endm

	.macro panse_26 id, pan_start, pan_end, step, delay
	.byte 0x26
	.2byte \id
	.byte \pan_start
	.byte \pan_end
	.byte \step
	.byte \delay
	.endm

	.macro panse_27 id, pan_start, pan_end, step, delay
	.byte 0x27
	.2byte \id
	.byte \pan_start
	.byte \pan_end
	.byte \step
	.byte \delay
	.endm

	.macro monbgprio_28 bank
	.byte 0x28
	.byte \bank
	.endm

	.macro monbgprio_29
	.byte 0x29
	.endm

	.macro monbgprio_2A bank
	.byte 0x2A
	.byte \bank
	.endm

	.macro invisible bank
	.byte 0x2B
	.byte \bank
	.endm

	.macro visible bank
	.byte 0x2C
	.byte \bank
	.endm

	.macro doublebattle_2D bank
	.byte 0x2D
	.byte \bank
	.endm

	.macro doublebattle_2E bank
	.byte 0x2E
	.byte \bank
	.endm

	.macro stopsound
	.byte 0x2F
	.endm
