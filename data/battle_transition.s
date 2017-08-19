	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083FBB88:: @ 83FBB88
	.incbin "graphics/battle_transitions/big_pokeball.4bpp"

	.align 2
gUnknown_083FC108:: @ 83FC108
	.incbin "graphics/battle_transitions/pokeball_trail.4bpp"

	.align 2
gSpriteImage_83FC148:: @ 83FC148
	.incbin "graphics/battle_transitions/pokeball.4bpp"

	.align 2
gUnknown_083FC348:: @ 83FC348
	.incbin "graphics/battle_transitions/elite_four_bg.4bpp"

	.align 2
gSpriteImage_83FC528:: @ 83FC528
	.incbin "graphics/battle_transitions/unused_brendan.4bpp"

	.align 2
gSpriteImage_83FCD28:: @ 83FCD28
	.incbin "graphics/battle_transitions/unused_lass.4bpp"

	.align 2
gUnknown_083FD528:: @ 83FD528
	.incbin "graphics/battle_transitions/shrinking_box.4bpp"

	.align 2
gUnknown_083FD708:: @ 83FD708
	.4byte 0x0200c000

	.align 2
sPhase1_Tasks:: @ 83FD70C
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll
	.4byte Phase1Task_TransitionAll

	.align 2
sPhase2_Tasks:: @ 83FD750
	.4byte Phase2Task_Transition0
	.4byte Phase2Task_Transition1
	.4byte Phase2Task_Transition2
	.4byte Phase2Task_Transition3
	.4byte Phase2Task_Transition4
	.4byte Phase2Task_Transition5
	.4byte Phase2Task_Transition6
	.4byte Phase2Task_Transition7
	.4byte Phase2Task_Transition8
	.4byte Phase2Task_Transition9
	.4byte Phase2Task_Transition10
	.4byte Phase2Task_Transition11
	.4byte Phase2Task_Transition12
	.4byte Phase2Task_Transition13
	.4byte Phase2Task_Transition14
	.4byte Phase2Task_Transition15
	.4byte Phase2Task_Transition16

	.align 2
sMainTransitionPhases:: @ 83FD794
	.4byte Transition_Phase1
	.4byte Transition_WaitForPhase1
	.4byte Transition_Phase2
	.4byte Transition_WaitForPhase2

	.align 2
sPhase2_Transition0_Funcs:: @ 83FD7A4
	.4byte Phase2_Transition0_Func1
	.4byte Phase2_Transition0_Func2
	.4byte Phase2_Transition0_Func3

	.align 2
sPhase2_Transition1_Funcs:: @ 83FD7B0
	.4byte Phase2_Transition1_Func1
	.4byte Phase2_Transition1_Func2

	.align 2
sPhase2_Transition2_Funcs:: @ 83FD7B8
	.4byte Phase2_Transition2_Func1
	.4byte Phase2_Transition2_Func2

	.align 2
sPhase2_Transition3_Funcs:: @ 83FD7C0
	.4byte Phase2_Transition3_Func1
	.4byte Phase2_Transition3_Func2
	.4byte Phase2_Transition3_Func3
	.4byte Phase2_Transition3_Func4
	.4byte Phase2_Transition3_Func5
	.4byte Phase2_Transition3_Func6

	.align 2
sPhase2_Transition4_Funcs:: @ 83FD7D8
	.4byte Phase2_Transition4_Func1
	.4byte Phase2_Transition4_Func2
	.4byte Phase2_Transition4_Func3

	.align 1
gUnknown_083FD7E4:: @ 83FD7E4
	.2byte -16
	.2byte 256

	.align 1
gUnknown_083FD7E8:: @ 83FD7E8
	.2byte 0
	.2byte 32
	.2byte 64
	.2byte 18
	.2byte 48

	.align 1
gUnknown_083FD7F2:: @ 83FD7F2
	.2byte 8
	.2byte -8

	.align 2
sPhase2_Transition5_Funcs:: @ 83FD7F8
	.4byte Phase2_Transition5_Func1
	.4byte Phase2_Transition5_Func2
	.4byte Phase2_Transition5_Func3
	.4byte Phase2_Transition5_Func4
	.4byte Phase2_Transition5_Func5
	.4byte Phase2_Transition5_Func6
	.4byte Phase2_Transition5_Func7

	.align 2
sPhase2_Transition6_Funcs:: @ 83FD814
	.4byte Phase2_Transition6_Func1
	.4byte Phase2_Transition6_Func2

	.align 2
gUnknown_083FD81C:: @ 83FD81C
	.4byte sub_811BED8
	.4byte sub_811BF2C
	.4byte sub_811BFC4

	.align 2
gUnknown_083FD828:: @ 83FD828
	.4byte sub_811C164
	.4byte sub_811C1CC
	.4byte sub_811C2A4
	.4byte sub_811C38C
	.4byte sub_811C400
	.4byte sub_811C43C
	.4byte sub_811C4F0
	.4byte sub_811C5B4
	.4byte sub_811C5E8
	.4byte sub_811C630

gUnknown_083FD850:: @ 83FD850
	.byte TRAINER_PIC_SIDNEY
	.byte TRAINER_PIC_PHOEBE
	.byte TRAINER_PIC_GLACIA
	.byte TRAINER_PIC_DRAKE
	.byte TRAINER_PIC_STEVEN

	.align 1
gUnknown_083FD856:: @ 83FD856
	.2byte 0x200, 0x200
	.2byte 0x200, 0x200
	.2byte 0x1B0, 0x1B0
	.2byte 0x1A0, 0x1A0
	.2byte 0x188, 0x188

	.align 1
gUnknown_083FD86A:: @ 83FD86A
	.2byte   0,  0
	.2byte   0,  0
	.2byte  -4,  4
	.2byte   0,  5
	.2byte   0,  7

	.align 2
gUnknown_083FD880:: @ 83FD880
	.4byte sub_811C934
	.4byte sub_811C938
	.4byte sub_811C984
	.4byte sub_811C9B8
	.4byte sub_811C934
	.4byte sub_811C9E4
	.4byte sub_811C934

	.align 1
gUnknown_083FD89C:: @ 83FD89C
	.2byte 12, -12

	.align 1
gUnknown_083FD8A0:: @ 83FD8A0
	.2byte -1, 1

	.align 2
gUnknown_083FD8A4:: @ 83FD8A4
	.4byte sub_811CA94
	.4byte sub_811CB20
	.4byte sub_811CBE8

	.align 2
gUnknown_083FD8B0:: @ 83FD8B0
	.4byte sub_811CD14
	.4byte sub_811CDA0
	.4byte sub_811CE14
	.4byte sub_811CE4C
	.4byte sub_811CEB0

	.align 1
gUnknown_083FD8C4:: @ 83FD8C4
	.2byte   0
	.2byte  20
	.2byte  15
	.2byte  40
	.2byte  10
	.2byte  25
	.2byte  35
	.2byte   5

	.align 2
gUnknown_083FD8D4:: @ 83FD8D4
	.4byte sub_811D0F0
	.4byte sub_811D144
	.4byte sub_811D19C

	.align 2
gUnknown_083FD8E0:: @ 83FD8E0
	.4byte sub_811D200
	.4byte sub_811D260
	.4byte sub_811D2D8
	.4byte sub_811D3B0
	.4byte sub_811D41C

	.align 1
gUnknown_083FD8F4:: @ 83FD8F4
	.2byte   56,   0,   0, 160,   0
	.2byte  104, 160, 240,  88,   1
	.2byte  240,  72,  56,   0,   1
	.2byte    0,  32, 144, 160,   0
	.2byte  144, 160, 184,   0,   1
	.2byte   56,   0, 168, 160,   0
	.2byte  168, 160,  48,   0,   1

	.align 1
gUnknown_083FD93A:: @ 83FD93A
	.2byte  8
	.2byte  4
	.2byte  2
	.2byte  1
	.2byte  1
	.2byte  1
	.2byte  0

	.align 2
gUnknown_083FD948:: @ 83FD948
	.4byte sub_811D584
	.4byte sub_811D5E0

	.align 2
gSpriteImageTable_83FD950:: @ 83FD950
	obj_frame_tiles gSpriteImage_83FC148, 0x200

	.align 2
gSpriteAnim_83FD958:: @ 83FD958
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FD960:: @ 83FD960
	.4byte gSpriteAnim_83FD958

	.align 2
gSpriteAffineAnim_83FD964:: @ 83FD964
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83FD974:: @ 83FD974
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83FD984:: @ 83FD984
	.4byte gSpriteAffineAnim_83FD964
	.4byte gSpriteAffineAnim_83FD974

	.align 2
gSpriteTemplate_83FD98C:: @ 83FD98C
	spr_template 0xFFFF, 4105, gFieldOamData_32x32, gSpriteAnimTable_83FD960, gSpriteImageTable_83FD950, gSpriteAffineAnimTable_83FD984, sub_811B720

	.align 2
gOamData_83FD9A4:: @ 83FD9A4
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteImageTable_83FD9AC:: @ 83FD9AC
	obj_frame_tiles gSpriteImage_83FC528, 0x800

	.align 2
gSpriteImageTable_83FD9B4:: @ 83FD9B4
	obj_frame_tiles gSpriteImage_83FCD28, 0x800

	.align 2
gSpriteAnim_83FD9BC:: @ 83FD9BC
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FD9C4:: @ 83FD9C4
	.4byte gSpriteAnim_83FD9BC

	.align 2
gSpriteTemplate_83FD9C8:: @ 83FD9C8
	spr_template 0xFFFF, 4106, gOamData_83FD9A4, gSpriteAnimTable_83FD9C4, gSpriteImageTable_83FD9AC, gDummySpriteAffineAnimTable, sub_811C90C

	.align 2
gSpriteTemplate_83FD9E0:: @ 83FD9E0
	spr_template 0xFFFF, 4106, gOamData_83FD9A4, gSpriteAnimTable_83FD9C4, gSpriteImageTable_83FD9B4, gDummySpriteAffineAnimTable, sub_811C90C

	.align 2
gFieldEffectObjectPalette10:: @ 83FD9F8
	.incbin "graphics/field_effect_objects/palettes/10.gbapal"

	.align 2
gFieldEffectObjectPaletteInfo10:: @ 83FDA18
	obj_pal gFieldEffectObjectPalette10, 0x1009

	.align 2
Unknown_83FDA20:
	.incbin "graphics/battle_transitions/sidney_bg.gbapal"

	.align 2
Unknown_83FDA40:
	.incbin "graphics/battle_transitions/phoebe_bg.gbapal"

	.align 2
Unknown_83FDA60:
	.incbin "graphics/battle_transitions/glacia_bg.gbapal"

	.align 2
Unknown_83FDA80:
	.incbin "graphics/battle_transitions/drake_bg.gbapal"

	.align 2
Unknown_83FDAA0:
	.incbin "graphics/battle_transitions/steven_bg.gbapal"

	.align 2
Unknown_83FDAC0:
	.incbin "graphics/battle_transitions/brendan_bg.gbapal"

	.align 2
Unknown_83FDAE0:
	.incbin "graphics/battle_transitions/may_bg.gbapal"

	.align 2
gUnknown_083FDB00:: @ 83FDB00
	.4byte Unknown_83FDA20
	.4byte Unknown_83FDA40
	.4byte Unknown_83FDA60
	.4byte Unknown_83FDA80
	.4byte Unknown_83FDAA0

	.align 2
gUnknown_083FDB14:: @ 83FDB14
	.4byte Unknown_83FDAC0
	.4byte Unknown_83FDAE0

	.align 2
UnusedTrainerPalette:
	.incbin "graphics/battle_transitions/unused_trainer.gbapal"

	.align 2
gSpritePalette_UnusedTrainer:: @ 83FDB3C
	obj_pal UnusedTrainerPalette, 0x100A

	.align 2
gUnknown_083FDB44:: @ 83FDB44
	.incbin "graphics/battle_transitions/big_pokeball_map.bin"

	.align 2
gUnknown_083FDFF4:: @ 83FDFF4
	.incbin "graphics/battle_transitions/elite_four_bg_map.bin"
