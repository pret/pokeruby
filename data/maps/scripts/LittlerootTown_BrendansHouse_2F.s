LittlerootTown_BrendansHouse_2F_MapScripts:: @ 81527A4
	map_script 3, LittlerootTown_BrendansHouse_2F_MapScript1_1527AF
	map_script 4, LittlerootTown_BrendansHouse_2F_MapScript2_1527DA
	.byte 0

LittlerootTown_BrendansHouse_2F_MapScript1_1527AF:: @ 81527AF
	checkflag 130
	callif 0, LittlerootTown_BrendansHouse_2F_EventScript_1527CE
	compare 0x4092, 4
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_1B6950
	call LittlerootTown_BrendansHouse_2F_EventScript_1A2F3D
	setvar 0x4089, 0
	end

LittlerootTown_BrendansHouse_2F_EventScript_1527CE:: @ 81527CE
	movespriteperm 1, 1, 2
	spritebehave 1, 7
	return

LittlerootTown_BrendansHouse_2F_MapScript2_1527DA:: @ 81527DA
	map_script_2 0x4089, 0, LittlerootTown_BrendansHouse_2F_EventScript_1527E4
	.2byte 0

LittlerootTown_BrendansHouse_2F_EventScript_1527E4:: @ 81527E4
	checkgender
	compare RESULT, 0
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_1A2F68
	end

	.incbin "baserom.gba", 0x1527f1, 0x2d

