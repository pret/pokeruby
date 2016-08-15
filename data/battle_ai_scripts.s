	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits
	
@ 0	won't use moves that have no or a negative effect
@ 1	will actually create some difference in viability scores based on basic calculations
@ 2	starts understanding things like type effectiveness, damage and fainting
@ 3	with a chance of about 3/10, some status moves will get priority on the first turn (list of move scripts at 081DBAA7)
@ 4	with a chance of about 5/10, move effects in this list will get priority (below list):
@ ----------------------------------------
@ sleep
@ selfdestruct
@ mirror move
@ 1-hit ko
@ high critical hit ratio
@ confuse
@ metronome
@ variable damage
@ counter
@ destiny bond
@ swagger
@ attract
@ present
@ may raise all stats
@ belly drum
@ mirror coat
@ focus punch
@ double damage if user was hurt in same turn
@ confuse all
@ -------------------------------------------
@ 5	with a chance of about 4/10, non-damaging moves will get priority
@ 6	if there are other pokes left on the ai's team, with a chance of a bit more than 6/10 it will give priority to non-damaging moves. chance raises to a bit more than 9/10 if the user (possibly also its ally) has baton pass
@ 7	nop
@ 8	ai will start looking at health percentages and decide using moves based on that
@ 9	broken/unfinished, does nothing
@ 10-28	nop
@ 29	roamer; will attempt to flee on the first turn
@ 30	safari
@ 31	unused; will flee on 20% health and lower

@ applies to the incbin directly below.

	.align 2
gUnknown_081DA01C:: @ 81DA01C
	.4byte Unknown_081DA09C
	.4byte Unknown_081DA86D
	.4byte Unknown_081DBE97
	.4byte Unknown_081DBEB5
	.4byte Unknown_081DBF17
	.4byte Unknown_081DBF07
	.4byte Unknown_081DBF3E
	.4byte Unknown_081DBF63
	.4byte Unknown_081DBF64
	.4byte Unknown_081DC0B9
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC0D0
	.4byte Unknown_081DC0FE
	.4byte Unknown_081DC105
Unknown_081DA09C::
	.incbin "baserom.gba", 0x001da09c, 0x7D1
Unknown_081DA86D::
	.incbin "baserom.gba", 0x001da86d, 0x162A
Unknown_081DBE97::
	determine_move_damage_jump_if_fatal AI_jump1 0x24
	jump_if__8_eq 0x01 0x081DA84C
	ai_ret
AI_jump1:
	jump_if_move_id_eq_8 0x07 AI_ret
	jump_if_move_id_ne_8 0x67 viableScore_04
	viability_score 0x02
viableScore_04:
	viability_score 0x04
AI_ret:
	ai_ret
Unknown_081DBEB5::
	.incbin "baserom.gba", 0x001dbeb5, 0x52
Unknown_081DBF07::
	.incbin "baserom.gba", 0x001dbf07, 0x10
Unknown_081DBF17::
	.incbin "baserom.gba", 0x001dbf17, 0x27
Unknown_081DBF3E::
	.incbin "baserom.gba", 0x001dbf3e, 0x25
Unknown_081DBF63::
	ai_ret
Unknown_081DBF64::
	.incbin "baserom.gba", 0x001dbf64, 0x155
Unknown_081DC0B9::
	.incbin "baserom.gba", 0x001dc0b9, 0x17
Unknown_081DC0D0::
	.incbin "baserom.gba", 0x001dc0d0, 0x2E
Unknown_081DC0FE::
	jump_random_unknown 0x081DC104
	f10_or_b1101
	f10_or_b1011
Unknown_081DC105::
	jump_if_health_percentage_eq 0x00 0x14 AI_bitmask_081DC105
	jump_if_health_percentage_lt 0x00 0x14 AI_bitmask_081DC105
	ai_ret
AI_bitmask_081DC105:
	f10_or_b1011
Unknown_081DC115::
	ai_ret
