@ This is where most of the graphics is stored.

	.section gfx_data, "aw", %progbits

	.align 2
gBattleTextboxTiles:: @ 8D00000
	.incbin "graphics/interface/menu.4bpp.lz" @ menu window and arrows

	.align 2
gBattleTextboxPalette:: @ 8D004E0
	.incbin "graphics/interface/menu.gbapal.lz"

	.align 2
gBattleTextboxTilemap:: @ 8D00524
	.incbin "graphics/interface/menu_map.bin"

@ 8D01524
	.include "data/graphics/pokemon/circled_question_mark_graphics.inc"

@ 8D019E4
gUnusedOldCharmap_Gfx_lz::
	.incbin "graphics/unused/old_charmap.4bpp.lz" @ japanese table and bunch of stuff
gUnusedOldCharmap_Tilemap_lz::
	.incbin "graphics/unused/old_charmap.bin.lz"
gUnusedOldCharmap_Pal_lz::
	.incbin "graphics/unused/old_charmap.gbapal.lz"

	.align 2
gSmokescreenImpactTiles:: @ 8D02410
	.incbin "graphics/battle_anims/sprites/smokescreen_impact.4bpp.lz"

	.align 2
gSmokescreenImpactPalette:: @ 8D024F0
	.incbin "graphics/battle_anims/sprites/smokescreen_impact.gbapal.lz"

	.align 2
gInterfaceGfx_PokeBall::
	.incbin "graphics/interface/ball/poke.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_PokeBall::
	.incbin "graphics/interface/ball/poke.gbapal.lz"

	.align 2
gInterfaceGfx_GreatBall::
	.incbin "graphics/interface/ball/great.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_GreatBall::
	.incbin "graphics/interface/ball/great.gbapal.lz"

	.align 2
gInterfaceGfx_SafariBall::
	.incbin "graphics/interface/ball/safari.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_SafariBall::
	.incbin "graphics/interface/ball/safari.gbapal.lz"

	.align 2
gInterfaceGfx_UltraBall::
	.incbin "graphics/interface/ball/ultra.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_UltraBall::
	.incbin "graphics/interface/ball/ultra.gbapal.lz"

	.align 2
gInterfaceGfx_MasterBall::
	.incbin "graphics/interface/ball/master.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_MasterBall::
	.incbin "graphics/interface/ball/master.gbapal.lz"

	.align 2
gInterfaceGfx_NetBall::
	.incbin "graphics/interface/ball/net.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_NetBall::
	.incbin "graphics/interface/ball/net.gbapal.lz"

	.align 2
gInterfaceGfx_DiveBall::
	.incbin "graphics/interface/ball/dive.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_DiveBall::
	.incbin "graphics/interface/ball/dive.gbapal.lz"

	.align 2
gInterfaceGfx_NestBall::
	.incbin "graphics/interface/ball/nest.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_NestBall::
	.incbin "graphics/interface/ball/nest.gbapal.lz"

	.align 2
gInterfaceGfx_RepeatBall::
	.incbin "graphics/interface/ball/repeat.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_RepeatBall::
	.incbin "graphics/interface/ball/repeat.gbapal.lz"

	.align 2
gInterfaceGfx_TimerBall::
	.incbin "graphics/interface/ball/timer.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_TimerBall::
	.incbin "graphics/interface/ball/timer.gbapal.lz"

	.align 2
gInterfaceGfx_LuxuryBall::
	.incbin "graphics/interface/ball/luxury.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_LuxuryBall::
	.incbin "graphics/interface/ball/luxury.gbapal.lz"

	.align 2
gInterfaceGfx_PremierBall::
	.incbin "graphics/interface/ball/premier.4bpp.lz" @ 0xBC

	.align 2
gInterfacePal_PremierBall::
	.incbin "graphics/interface/ball/premier.gbapal.lz"

	.align 2
gUnknown_08D030D0:: @ 8D030D0
	.incbin "graphics/interface/ball_open.4bpp.lz"

	.align 2
gBlankGfxCompressed::
	.incbin "graphics/interface/blank.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_146:: @ 8D03248
	.incbin "graphics/battle_anims/sprites/146.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_000:: @ 8D03308
	.incbin "graphics/battle_anims/sprites/000.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_003:: @ 8D033B8
	.incbin "graphics/battle_anims/sprites/003.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_004:: @ 8D0342C
	.incbin "graphics/battle_anims/sprites/004.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_005:: @ 8D034DC
	.incbin "graphics/battle_anims/sprites/005.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_006:: @ 8D035B0
	.incbin "graphics/battle_anims/sprites/006.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_115:: @ 8D0367C
	.incbin "graphics/battle_anims/sprites/115.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_000:: @ 8D0369C
	.incbin "graphics/battle_anims/sprites/000.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_003:: @ 8D036C0
	.incbin "graphics/battle_anims/sprites/003.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_004:: @ 8D036E8
	.incbin "graphics/battle_anims/sprites/004.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_005:: @ 8D036FC
	.incbin "graphics/battle_anims/sprites/005.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_006:: @ 8D03724
	.incbin "graphics/battle_anims/sprites/006.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_161:: @ 8D0374C
	.incbin "graphics/battle_anims/sprites/161.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_161:: @ 8D03774
	.incbin "graphics/battle_anims/sprites/161.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_007:: @ 8D0379C
	.incbin "graphics/battle_anims/sprites/007.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_007:: @ 8D03918
	.incbin "graphics/battle_anims/sprites/007.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_008:: @ 8D03938
	.incbin "graphics/battle_anims/sprites/008.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_008:: @ 8D03958
	.incbin "graphics/battle_anims/sprites/008.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_010:: @ 8D03974
	.incbin "graphics/battle_anims/sprites/010.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_010:: @ 8D03994
	.incbin "graphics/battle_anims/sprites/010.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_009:: @ 8D03D74
	.incbin "graphics/battle_anims/sprites/009.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_009:: @ 8D0405C
	.incbin "graphics/battle_anims/sprites/009.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_011:: @ 8D0407C
	.incbin "graphics/battle_anims/sprites/011.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_011:: @ 8D040F4
	.incbin "graphics/battle_anims/sprites/011.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_012:: @ 8D0411C
	.incbin "graphics/battle_anims/sprites/012.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_012:: @ 8D04184
	.incbin "graphics/battle_anims/sprites/012.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_152:: @ 8D0419C
	.incbin "graphics/battle_anims/sprites/152.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_152:: @ 8D041E4
	.incbin "graphics/battle_anims/sprites/152.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_013:: @ 8D04208
	.incbin "graphics/battle_anims/sprites/013.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_013:: @ 8D0423C
	.incbin "graphics/battle_anims/sprites/013.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_015:: @ 8D04254
	.incbin "graphics/battle_anims/sprites/015.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_015:: @ 8D042C0
	.incbin "graphics/battle_anims/sprites/015.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_016:: @ 8D042E8
	.incbin "graphics/battle_anims/sprites/016.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_016:: @ 8D04358
	.incbin "graphics/battle_anims/sprites/016.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_017:: @ 8D04368
	.incbin "graphics/battle_anims/sprites/017.4bpp.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D04388.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_019:: @ 8D043AC
	.incbin "graphics/battle_anims/sprites/019.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_019:: @ 8D043C8
	.incbin "graphics/battle_anims/sprites/019.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_020:: @ 8D04488
	.incbin "graphics/battle_anims/sprites/020.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_020:: @ 8D04554
	.incbin "graphics/battle_anims/sprites/020.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_023:: @ 8D0457C
	.incbin "graphics/battle_anims/sprites/023.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_023:: @ 8D045A4
	.incbin "graphics/battle_anims/sprites/023.4bpp.lz"

	.align 2
	.incbin "graphics/unused/battle_anim_023.gbapal.lz"

	.align 2
	.incbin "graphics/unused/music_notes.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_021:: @ 8D047D0
	.incbin "graphics/battle_anims/sprites/021.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_021:: @ 8D047F8
	.incbin "graphics/battle_anims/sprites/021.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_022:: @ 8D04B30
	.incbin "graphics/battle_anims/sprites/022.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_025:: @ 8D04B58
	.incbin "graphics/battle_anims/sprites/025.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_025:: @ 8D04B80
	.incbin "graphics/battle_anims/sprites/025.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_024:: @ 8D04C70
	.incbin "graphics/battle_anims/sprites/024.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_024:: @ 8D04D3C
	.incbin "graphics/battle_anims/sprites/024.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_031:: @ 8D04D50
	.incbin "graphics/battle_anims/sprites/031.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_031:: @ 8D05130
	.incbin "graphics/battle_anims/sprites/031.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_032:: @ 8D05150
	.incbin "graphics/battle_anims/sprites/032.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_032:: @ 8D05178
	.incbin "graphics/battle_anims/sprites/032.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_026:: @ 8D05264
	.incbin "graphics/battle_anims/sprites/026.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_026:: @ 8D0559C
	.incbin "graphics/battle_anims/sprites/026.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_027:: @ 8D055C4
	.incbin "graphics/battle_anims/sprites/027.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_027:: @ 8D055EC
	.incbin "graphics/battle_anims/sprites/027.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_028:: @ 8D058E8
	.incbin "graphics/battle_anims/sprites/028.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_028:: @ 8D05910
	.incbin "graphics/battle_anims/sprites/028.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_029:: @ 8D05C60
	.incbin "graphics/battle_anims/sprites/029.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_029:: @ 8D05F18
	.incbin "graphics/battle_anims/sprites/029.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_030:: @ 8D05F40
	.incbin "graphics/battle_anims/sprites/030.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_030:: @ 8D06300
	.incbin "graphics/battle_anims/sprites/030.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_033:: @ 8D06324
	.incbin "graphics/battle_anims/sprites/033.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_033:: @ 8D0634C
	.incbin "graphics/battle_anims/sprites/033.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_034:: @ 8D06CBC
	.incbin "graphics/battle_anims/sprites/034.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_035:: @ 8D07088
	.incbin "graphics/battle_anims/sprites/035.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_036:: @ 8D07420
	.incbin "graphics/battle_anims/sprites/036.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_036:: @ 8D07448
	.incbin "graphics/battle_anims/sprites/036.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_037:: @ 8D0781C
	.incbin "graphics/battle_anims/sprites/037.4bpp.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D07B68.4bpp.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D07B68.gbapal.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D07B68_2.gbapal.lz"

@ old battle interface data, unused

	.align 2
	.incbin "graphics/unused/obi1.4bpp.lz"

	.align 2
	.incbin "graphics/unused/obi_palpak1.gbapal.lz" @ palettes 1-3

	.align 2
	.incbin "graphics/unused/old_pal4.gbapal.lz" @ 4 is by itself

	.align 2
	.incbin "graphics/unused/obi_palpak3.gbapal.lz" @ palettes 5-7

	.align 2
	.incbin "graphics/unused/obi2.4bpp.lz"

	.align 2
	.incbin "graphics/unused/old_battle_interface_tilemap.bin.lz"

	.align 2
gBattleAnimSpritePalette_038:: @ 8D086E4
	.incbin "graphics/battle_anims/sprites/038.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_039:: @ 8D0870C
	.incbin "graphics/battle_anims/sprites/039.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_038:: @ 8D08734
	.incbin "graphics/battle_anims/sprites/038.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_039:: @ 8D08958
	.incbin "graphics/battle_anims/sprites/039.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_040:: @ 8D08C54
	.incbin "graphics/battle_anims/sprites/040.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_041:: @ 8D08E60
	.incbin "graphics/battle_anims/sprites/041.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_042:: @ 8D09000
	.incbin "graphics/battle_anims/sprites/042.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_042:: @ 8D092D0
	.incbin "graphics/battle_anims/sprites/042.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_043:: @ 8D092F8
	.incbin "graphics/battle_anims/sprites/043.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_043:: @ 8D096F8
	.incbin "graphics/battle_anims/sprites/043.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_044:: @ 8D09720
	.incbin "graphics/battle_anims/sprites/044.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_044:: @ 8D09748
	.incbin "graphics/battle_anims/sprites/044.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_045:: @ 8D099B4
	.incbin "graphics/battle_anims/sprites/045.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_045:: @ 8D099DC
	.incbin "graphics/battle_anims/sprites/045.4bpp.lz"

	.align 2
gUnknown_08D09C48:: @ 8D09C48
	.incbin "graphics/interface/hp_numbers.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_046:: @ 8D09E5C
	.incbin "graphics/battle_anims/sprites/046.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_046:: @ 8D0A23C
	.incbin "graphics/battle_anims/sprites/046.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_047:: @ 8D0A25C
	.incbin "graphics/battle_anims/sprites/047.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_048:: @ 8D0A280
	.incbin "graphics/battle_anims/sprites/048.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_048:: @ 8D0A518
	.incbin "graphics/battle_anims/sprites/048.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_049:: @ 8D0A540
	.incbin "graphics/battle_anims/sprites/049.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_050:: @ 8D0A568
	.incbin "graphics/battle_anims/sprites/050.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_050:: @ 8D0A58C
	.incbin "graphics/battle_anims/sprites/050.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_051:: @ 8D0A62C
	.incbin "graphics/battle_anims/sprites/051.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_052:: @ 8D0A6D8
	.incbin "graphics/battle_anims/sprites/052.4bpp.lz"

	.align 2
	.incbin "graphics/unused/line_sketch.4bpp.lz" @ unused

	.align 2
	.incbin "graphics/unused/line_sketch.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_054:: @ 8D0A938
	.incbin "graphics/battle_anims/sprites/054.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_054:: @ 8D0A964
	.incbin "graphics/battle_anims/sprites/054.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_056:: @ 8D0A97C
	.incbin "graphics/battle_anims/sprites/056.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_056:: @ 8D0AE24
	.incbin "graphics/battle_anims/sprites/056.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_055:: @ 8D0AE4C
	.incbin "graphics/battle_anims/sprites/055.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_057:: @ 8D0AF10
	.incbin "graphics/battle_anims/sprites/057.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_057:: @ 8D0AF98
	.incbin "graphics/battle_anims/sprites/057.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_058:: @ 8D0AFBC
	.incbin "graphics/battle_anims/sprites/058.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_058:: @ 8D0B424
	.incbin "graphics/battle_anims/sprites/058.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_059:: @ 8D0B44C
	.incbin "graphics/battle_anims/sprites/059.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_059:: @ 8D0B4AC
	.incbin "graphics/battle_anims/sprites/059.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_060:: @ 8D0B4C8
	.incbin "graphics/battle_anims/sprites/060.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_060:: @ 8D0B4F0
	.incbin "graphics/battle_anims/sprites/060.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_061:: @ 8D0B50C
	.incbin "graphics/battle_anims/sprites/061.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_061:: @ 8D0B5BC
	.incbin "graphics/battle_anims/sprites/061.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_062:: @ 8D0B5DC
	.incbin "graphics/battle_anims/sprites/062.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_062:: @ 8D0B9AC
	.incbin "graphics/battle_anims/sprites/062.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_063:: @ 8D0B9D4
	.incbin "graphics/battle_anims/sprites/063.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_063:: @ 8D0BB90
	.incbin "graphics/battle_anims/sprites/063.gbapal.lz"

	.align 2
	.incbin "graphics/unused/metronome_hand_small.4bpp.lz" @ unused, was for metronome at one point

	.align 2
gBattleAnimSpritePalette_091:: @ 8D0BC28
	.incbin "graphics/battle_anims/sprites/091.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_065:: @ 8D0BC4C
	.incbin "graphics/battle_anims/sprites/065.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_065:: @ 8D0BD60
	.incbin "graphics/battle_anims/sprites/065.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_066:: @ 8D0BD80
	.incbin "graphics/battle_anims/sprites/066.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_066:: @ 8D0BDCC
	.incbin "graphics/battle_anims/sprites/066.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_070:: @ 8D0BDF4
	.incbin "graphics/battle_anims/sprites/070.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_070:: @ 8D0BE74
	.incbin "graphics/battle_anims/sprites/070.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_071:: @ 8D0BE9C
	.incbin "graphics/battle_anims/sprites/071.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_072:: @ 8D0C0C8
	.incbin "graphics/battle_anims/sprites/072.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_072:: @ 8D0C198
	.incbin "graphics/battle_anims/sprites/072.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_073:: @ 8D0C1B0
	.incbin "graphics/battle_anims/sprites/073.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_073:: @ 8D0C2CC
	.incbin "graphics/battle_anims/sprites/073.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_075:: @ 8D0C2EC
	.incbin "graphics/battle_anims/sprites/075.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_075:: @ 8D0C568
	.incbin "graphics/battle_anims/sprites/075.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_078:: @ 8D0C58C
	.incbin "graphics/battle_anims/sprites/078.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_078:: @ 8D0C724
	.incbin "graphics/battle_anims/sprites/078.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_079:: @ 8D0C74C
	.incbin "graphics/battle_anims/sprites/079.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_080:: @ 8D0CB7C
	.incbin "graphics/battle_anims/sprites/080.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_080:: @ 8D0CEE0
	.incbin "graphics/battle_anims/sprites/080.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_081:: @ 8D0CF04
	.incbin "graphics/battle_anims/sprites/081.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_081:: @ 8D0CF88
	.incbin "graphics/battle_anims/sprites/081.gbapal.lz"

	.align 2 @ 8D0CFAC
	.incbin "graphics/unknown/unknown_D0CFAC.bin"

	.align 2 @ 8D0CFD0
	.incbin "graphics/unknown/unknown_D0CFD0.bin"

	.align 2 @ 8D0CFF4
	.incbin "graphics/unknown/unknown_D0CFF4.bin"

	.align 2
	.incbin "graphics/unused/line_sketch_2.8bpp.lz"

	.align 2 @ 8D0D070
	.incbin "graphics/unknown/unknown_D0D070.bin"

	.align 2
	.incbin "graphics/unused/line_sketch_2.bin.lz"

	.align 2
gBattleAnimSpriteSheet_082:: @ 8D0D120
	.incbin "graphics/battle_anims/sprites/082.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_082:: @ 8D0D144
	.incbin "graphics/battle_anims/sprites/082.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_083:: @ 8D0D158
	.incbin "graphics/battle_anims/sprites/083.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_084:: @ 8D0D180
	.incbin "graphics/battle_anims/sprites/084.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_085:: @ 8D0D1A8
	.incbin "graphics/battle_anims/sprites/085.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_086:: @ 8D0D1C0
	.incbin "graphics/battle_anims/sprites/086.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_088:: @ 8D0D1E8
	.incbin "graphics/battle_anims/sprites/088.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_089:: @ 8D0D204
	.incbin "graphics/battle_anims/sprites/089.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_090:: @ 8D0D22C
	.incbin "graphics/battle_anims/sprites/090.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_092:: @ 8D0D250
	.incbin "graphics/battle_anims/sprites/092.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_093:: @ 8D0D26C
	.incbin "graphics/battle_anims/sprites/093.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_094:: @ 8D0D294
	.incbin "graphics/battle_anims/sprites/094.gbapal.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D0D2B4.bin.lz"

	.align 2
gBattleAnimSpritePalette_095:: @ 8D0D2D4
	.incbin "graphics/battle_anims/sprites/095.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_096:: @ 8D0D2FC
	.incbin "graphics/battle_anims/sprites/096.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_097:: @ 8D0D318
	.incbin "graphics/battle_anims/sprites/097.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_100:: @ 8D0D340
	.incbin "graphics/battle_anims/sprites/100.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_101:: @ 8D0D35C
	.incbin "graphics/battle_anims/sprites/101.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_103:: @ 8D0D384
	.incbin "graphics/battle_anims/sprites/103.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_083:: @ 8D0D3A8
	.incbin "graphics/battle_anims/sprites/083.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_084:: @ 8D0D84C
	.incbin "graphics/battle_anims/sprites/084.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_085:: @ 8D0DC10
	.incbin "graphics/battle_anims/sprites/085.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_086:: @ 8D0DCC8
	.incbin "graphics/battle_anims/sprites/086.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_088:: @ 8D0DE38
	.incbin "graphics/battle_anims/sprites/088.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_089:: @ 8D0DE88
	.incbin "graphics/battle_anims/sprites/089.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_090:: @ 8D0E0FC
	.incbin "graphics/battle_anims/sprites/090.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_091:: @ 8D0E18C
	.incbin "graphics/battle_anims/sprites/091.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_092:: @ 8D0E2C0
	.incbin "graphics/battle_anims/sprites/092.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_093:: @ 8D0E33C
	.incbin "graphics/battle_anims/sprites/093.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_094:: @ 8D0EA0C
	.incbin "graphics/battle_anims/sprites/094.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_095:: @ 8D0EBB0
	.incbin "graphics/battle_anims/sprites/095.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_096:: @ 8D0EC60
	.incbin "graphics/battle_anims/sprites/096.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_097:: @ 8D0EDD0
	.incbin "graphics/battle_anims/sprites/097.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_098:: @ 8D0EFB0
	.incbin "graphics/battle_anims/sprites/098.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_100:: @ 8D0F0E8
	.incbin "graphics/battle_anims/sprites/100.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_101:: @ 8D0F1E8
	.incbin "graphics/battle_anims/sprites/101.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_102:: @ 8D0F318
	.incbin "graphics/battle_anims/sprites/102.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_103:: @ 8D0F4B0
	.incbin "graphics/battle_anims/sprites/103.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_104:: @ 8D0F51C
	.incbin "graphics/battle_anims/sprites/104.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_104:: @ 8D0F6DC
	.incbin "graphics/battle_anims/sprites/104.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_105:: @ 8D0F704
	.incbin "graphics/battle_anims/sprites/105.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_105:: @ 8D0FC88
	.incbin "graphics/battle_anims/sprites/105.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_106:: @ 8D0FCB0
	.incbin "graphics/battle_anims/sprites/106.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_107:: @ 8D0FDA0
	.incbin "graphics/battle_anims/sprites/107.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_107:: @ 8D1014C
	.incbin "graphics/battle_anims/sprites/107.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_108:: @ 8D10174
	.incbin "graphics/battle_anims/sprites/108.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_109:: @ 8D104F8
	.incbin "graphics/battle_anims/sprites/109.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_109:: @ 8D10520
	.incbin "graphics/battle_anims/sprites/109.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_110:: @ 8D10548
	.incbin "graphics/battle_anims/sprites/110.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_111:: @ 8D1092C
	.incbin "graphics/battle_anims/sprites/111.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_111:: @ 8D10970
	.incbin "graphics/battle_anims/sprites/111.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_112:: @ 8D10994
	.incbin "graphics/battle_anims/sprites/112.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_112:: @ 8D10CBC
	.incbin "graphics/battle_anims/sprites/112.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_113:: @ 8D10CE4
	.incbin "graphics/battle_anims/sprites/113.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_113:: @ 8D10F50
	.incbin "graphics/battle_anims/sprites/113.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_114:: @ 8D10F78
	.incbin "graphics/battle_anims/sprites/114.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_114:: @ 8D1106C
	.incbin "graphics/battle_anims/sprites/114.gbapal.lz"

	.align 2
	.incbin "graphics/unused/blue_frame.bin.lz" @  P1, P2, P3 and P4 tilemaps?

	.align 2
	.incbin "graphics/unused/redyellowgreen_frame.bin.lz"

	.align 2
	.incbin "graphics/unused/color_frames.4bpp.lz"

	.align 2
	.incbin "graphics/unused/color_frames.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_115:: @ 8D11B74
	.incbin "graphics/battle_anims/sprites/115.4bpp.lz"

	.align 2
	.incbin "graphics/unused/water_splash.8bpp.lz"

	.align 2
	.incbin "graphics/unused/water_splash.bin.lz"

	.align 2
	.incbin "graphics/unused/water_splash.gbapal.lz"

	.align 2
	.incbin "graphics/unused/basic_frame.4bpp.lz"

	.align 2
	.incbin "graphics/unused/basic_frame.gbapal.lz"

	.align 2
	.incbin "graphics/unused/basic_frame.bin.lz"

	.align 2
gUnknown_08D1212C::
	.incbin "graphics/battle_interface/window.gbapal"

	.align 2
gUnknown_08D1214C::
	.incbin "graphics/battle_interface/hpbar.gbapal"

	.align 2
gUnknown_08D1216C:: @ 8D1216C
	.incbin "graphics/battle_interface/hpbar.4bpp"
	.incbin "graphics/battle_interface/expbar.4bpp"
	.incbin "graphics/battle_interface/status_psn.4bpp"
	.incbin "graphics/battle_interface/status_par.4bpp"
	.incbin "graphics/battle_interface/status_slp.4bpp"
	.incbin "graphics/battle_interface/status_frz.4bpp"
	.incbin "graphics/battle_interface/status_brn.4bpp"
	.incbin "graphics/battle_interface/misc.4bpp"
	.incbin "graphics/battle_interface/hpbar_anim.4bpp"
	.incbin "graphics/battle_interface/misc_frameend.4bpp"

	.align 2
Tiles_D129AC:: @ 8D129AC
	.incbin "graphics/battle_interface/ball_display.4bpp"

	@ extra stuff
	.incbin "graphics/battle_interface/ball_display_unused_extra.4bpp"
	.incbin "graphics/battle_interface/status2.4bpp" @ these three duplicate sets of graphics are for the opponent pokemon and are also for use in double battles. they use dynamic palettes so coloring them is an extreme headache and wont be done for now.
	.incbin "graphics/battle_interface/status3.4bpp"
	.incbin "graphics/battle_interface/status4.4bpp"
	.incbin "graphics/unknown/unknown_D12FEC.4bpp"
	.incbin "graphics/unknown/unknown_D1300C.4bpp"

	.align 2
gBattleAnimSpriteSheet_116:: @ 8D1302C
	.incbin "graphics/battle_anims/sprites/116.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_116:: @ 8D132D8
	.incbin "graphics/battle_anims/sprites/116.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_117:: @ 8D13300
	.incbin "graphics/battle_anims/sprites/117.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_117:: @ 8D1353C
	.incbin "graphics/battle_anims/sprites/117.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_118:: @ 8D13558
	.incbin "graphics/battle_anims/sprites/118.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_118:: @ 8D136F0
	.incbin "graphics/battle_anims/sprites/118.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_119:: @ 8D1370C
	.incbin "graphics/battle_anims/sprites/119.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_119:: @ 8D1399C
	.incbin "graphics/battle_anims/sprites/119.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_120:: @ 8D139C4
	.incbin "graphics/battle_anims/sprites/120.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_120:: @ 8D13AB8
	.incbin "graphics/battle_anims/sprites/120.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_121:: @ 8D13AE0
	.incbin "graphics/battle_anims/sprites/121.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_121:: @ 8D13B0C
	.incbin "graphics/battle_anims/sprites/121.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_122:: @ 8D13B30
	.incbin "graphics/battle_anims/sprites/122.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_122:: @ 8D13C2C
	.incbin "graphics/battle_anims/sprites/122.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_123:: @ 8D13C48
	.incbin "graphics/battle_anims/sprites/123.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_124:: @ 8D13D84
	.incbin "graphics/battle_anims/sprites/124.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_124:: @ 8D1401C
	.incbin "graphics/battle_anims/sprites/124.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_125:: @ 8D14044
	.incbin "graphics/battle_anims/sprites/125.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_125:: @ 8D14130
	.incbin "graphics/battle_anims/sprites/125.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_126:: @ 8D14158
	.incbin "graphics/battle_anims/sprites/126.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_126:: @ 8D141C0
	.incbin "graphics/battle_anims/sprites/126.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_127:: @ 8D141E0
	.incbin "graphics/battle_anims/sprites/127.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_127:: @ 8D14380
	.incbin "graphics/battle_anims/sprites/127.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_128:: @ 8D143A4
	.incbin "graphics/battle_anims/sprites/128.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_128:: @ 8D14610
	.incbin "graphics/battle_anims/sprites/128.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_129:: @ 8D14630
	.incbin "graphics/battle_anims/sprites/129.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_130:: @ 8D14694
	.incbin "graphics/battle_anims/sprites/130.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_130:: @ 8D14A64
	.incbin "graphics/battle_anims/sprites/130.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_131:: @ 8D14A8C
	.incbin "graphics/battle_anims/sprites/131.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_132:: @ 8D14BFC
	.incbin "graphics/battle_anims/sprites/132.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_132:: @ 8D14CFC
	.incbin "graphics/battle_anims/sprites/132.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_133:: @ 8D14D1C
	.incbin "graphics/battle_anims/sprites/133.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_133:: @ 8D14D98
	.incbin "graphics/battle_anims/sprites/133.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_134:: @ 8D14DC0
	.incbin "graphics/battle_anims/sprites/134.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_076:: @ 8D14E90
	.incbin "graphics/battle_anims/sprites/076.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_076:: @ 8D150CC
	.incbin "graphics/battle_anims/sprites/076.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_077:: @ 8D150F4
	.incbin "graphics/battle_anims/sprites/077.4bpp.lz"

	.align 2
	.incbin "graphics/unused/old_contest.4bpp.lz"

	.align 2
	.incbin "graphics/unused/old_contest.gbapal.lz"

	.align 2
	.incbin "graphics/unused/old_contest.bin.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D15D64.bin.lz"

	.align 2
gContestNumbers_UnusedGfx::
	.incbin "graphics/unused/numbers.4bpp.lz"

	.align 2
gContestNumbers_UnusedPal::
	.incbin "graphics/unused/numbers.gbapal.lz"

	.align 2
	.incbin "graphics/unused/old_contest_2.4bpp.lz"

	.align 2
gUnknown_08D17144:: @ 8D17144
	.incbin "graphics/unused/old_contest_2.gbapal.lz" @ the tilemap and palette for unused contest assets are used. however, these two files aren't old

	.align 2
gUnknown_08D1725C:: @ 8D1725C
	.incbin "graphics/unused/old_contest_2.bin.lz"

	.align 2
gUnknown_08D17424:: @ 8D17424
	.incbin "graphics/unknown/unknown_D17424.bin.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D176CC.bin.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D177D8.bin.lz"

	.align 2
gUnknown_08D17C3C:: @ 8D17C3C
	.incbin "graphics/unknown/unknown_D17C3C.bin.lz"

	.align 2
gContestMiscGfx:: @ 8D17D6C
	.incbin "graphics/contest/misc.4bpp.lz"

	.align 2
gContestAudienceGfx:: @ 8D18818
	.incbin "graphics/contest/audience.4bpp.lz"

	.align 2
	.incbin "graphics/contest/faces.4bpp.lz"

	.align 2
gContestJudgeSymbolsGfx:: @ 8D19590
	.incbin "graphics/contest/judge_symbols.4bpp.lz"

	.align 2
gContest3Pal::
	.incbin "graphics/contest/judge_symbols.gbapal.lz"

	.align 2
gTiles_8D1975C:: @ 8D1975C
	.incbin "graphics/contest/heart.4bpp"

	.align 2
gUnknown_08D1977C:: @ 8D1977C
	.incbin "graphics/contest/misc_2.4bpp.lz"

	.align 2
gUnknown_08D1A250:: @ 8D1A250
	.incbin "graphics/contest/misc_2_tilemap_1.bin.lz"

	.align 2
gUnknown_08D1A364:: @ 8D1A364
	.incbin "graphics/contest/misc_2_tilemap_2.bin.lz"

	.align 2
gUnknown_08D1A490:: @ 8D1A490
	.incbin "graphics/contest/misc_2_tilemap_3.bin.lz"

	.align 2
gUnknown_08D1A618:: @ 8D1A618
	.incbin "graphics/contest/misc_2.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_135:: @ 8D1A704
	.incbin "graphics/battle_anims/sprites/135.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_135:: @ 8D1A7DC
	.incbin "graphics/battle_anims/sprites/135.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_Particles:: @ 8D1A7F4
	.incbin "graphics/battle_anims/sprites/particles.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_136:: @ 8D1A8A4
	.incbin "graphics/battle_anims/sprites/136.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_136:: @ 8D1A8C8
	.incbin "graphics/battle_anims/sprites/136.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_137:: @ 8D1A8F0
	.incbin "graphics/battle_anims/sprites/137.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_139:: @ 8D1AAF4
	.incbin "graphics/battle_anims/sprites/139.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_139:: @ 8D1ACE4
	.incbin "graphics/battle_anims/sprites/139.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_145:: @ 8D1AD04
	.incbin "graphics/battle_anims/sprites/145.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_138:: @ 8D1AEA4
	.incbin "graphics/battle_anims/sprites/138.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_140:: @ 8D1AFF0
	.incbin "graphics/battle_anims/sprites/140.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_140:: @ 8D1B070
	.incbin "graphics/battle_anims/sprites/140.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_141:: @ 8D1B090
	.incbin "graphics/battle_anims/sprites/141.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_141:: @ 8D1B198
	.incbin "graphics/battle_anims/sprites/141.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_142:: @ 8D1B1B8
	.incbin "graphics/battle_anims/sprites/142.4bpp.lz"

	.align 2
	.incbin "graphics/unused/old_beatup.4bpp.lz"

	.align 2
	.incbin "graphics/unused/old_beatup.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_147:: @ 8D1B2D0
	.incbin "graphics/battle_anims/sprites/147.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_147:: @ 8D1B3E4
	.incbin "graphics/battle_anims/sprites/147.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_149:: @ 8D1B40C
	.incbin "graphics/battle_anims/sprites/149.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_148:: @ 8D1B4DC
	.incbin "graphics/battle_anims/sprites/148.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_148:: @ 8D1B5C0
	.incbin "graphics/battle_anims/sprites/148.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_259:: @ 8D1B5E0
	.incbin "graphics/battle_anims/sprites/259.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_074:: @ 8D1B600
	.incbin "graphics/battle_anims/sprites/074.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_074:: @ 8D1B668
	.incbin "graphics/battle_anims/sprites/074.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_150:: @ 8D1B68C
	.incbin "graphics/battle_anims/sprites/150.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_150:: @ 8D1B760
	.incbin "graphics/battle_anims/sprites/150.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_151:: @ 8D1B77C
	.incbin "graphics/battle_anims/sprites/151.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_153:: @ 8D1B874
	.incbin "graphics/battle_anims/sprites/153.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_153:: @ 8D1B8E0
	.incbin "graphics/battle_anims/sprites/153.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_154:: @ 8D1B8F8
	.incbin "graphics/battle_anims/sprites/154.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_154:: @ 8D1B9A4
	.incbin "graphics/battle_anims/sprites/154.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_155:: @ 8D1B9C4
	.incbin "graphics/battle_anims/sprites/155.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_155:: @ 8D1BA8C
	.incbin "graphics/battle_anims/sprites/155.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_156:: @ 8D1BAAC
	.incbin "graphics/battle_anims/sprites/156.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_156:: @ 8D1BCC4
	.incbin "graphics/battle_anims/sprites/156.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_157:: @ 8D1BCEC
	.incbin "graphics/battle_anims/sprites/157.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_157:: @ 8D1BD50
	.incbin "graphics/battle_anims/sprites/157.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_158:: @ 8D1BD68
	.incbin "graphics/battle_anims/sprites/158.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_158:: @ 8D1BE30
	.incbin "graphics/battle_anims/sprites/158.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_159:: @ 8D1BE54
	.incbin "graphics/battle_anims/sprites/159.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_159:: @ 8D1BED0
	.incbin "graphics/battle_anims/sprites/159.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_160:: @ 8D1BEF8
	.incbin "graphics/battle_anims/sprites/160.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_160:: @ 8D1BFA0
	.incbin "graphics/battle_anims/sprites/160.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_144:: @ 8D1BFC8
	.incbin "graphics/battle_anims/sprites/144.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_144:: @ 8D1C040
	.incbin "graphics/battle_anims/sprites/144.gbapal.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D1C060.4bpp.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D1C060.gbapal.lz"

	.align 2
	.incbin "graphics/unknown/unknown_D1C060.bin.lz"

	.align 2
gBattleAnimSpriteSheet_162:: @ 8D1C1A4
	.incbin "graphics/battle_anims/sprites/162.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_162:: @ 8D1C228
	.incbin "graphics/battle_anims/sprites/162.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_163:: @ 8D1C248
	.incbin "graphics/battle_anims/sprites/163.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_163:: @ 8D1C2A8
	.incbin "graphics/battle_anims/sprites/163.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_288:: @ 8D1C2C0
	.incbin "graphics/battle_anims/sprites/288.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_164:: @ 8D1C2D8
	.incbin "graphics/battle_anims/sprites/164.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_165:: @ 8D1C2F0
	.incbin "graphics/battle_anims/sprites/165.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_166:: @ 8D1C308
	.incbin "graphics/battle_anims/sprites/166.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_166:: @ 8D1C614
	.incbin "graphics/battle_anims/sprites/166.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_167:: @ 8D1C634
	.incbin "graphics/battle_anims/sprites/167.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_168:: @ 8D1C654
	.incbin "graphics/battle_anims/sprites/168.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_169:: @ 8D1C674
	.incbin "graphics/battle_anims/sprites/169.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_170:: @ 8D1C694
	.incbin "graphics/battle_anims/sprites/170.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_171:: @ 8D1C6B4
	.incbin "graphics/battle_anims/sprites/171.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_171:: @ 8D1C700
	.incbin "graphics/battle_anims/sprites/171.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_172:: @ 8D1C728
	.incbin "graphics/battle_anims/sprites/172.gbapal.lz"

	.align 2
gContestJudgeGfx::
	.incbin "graphics/contest/judge.4bpp.lz"

	.align 2
gContest2Pal:: @ 8D1CA1C
	.incbin "graphics/contest/judge.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_001:: @ 8D1CA44
	.incbin "graphics/battle_anims/sprites/001.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_001:: @ 8D1CAF8
	.incbin "graphics/battle_anims/sprites/001.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_173:: @ 8D1CB20
	.incbin "graphics/battle_anims/sprites/173.4bpp.lz"

	.align 2
gBattleAnimBackgroundImage_00:: @ 8D1CBA8
	.incbin "graphics/battle_anims/backgrounds/00.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_00:: @ 8D1D1A0
	.incbin "graphics/battle_anims/backgrounds/00.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_00:: @ 8D1D1C0
	.incbin "graphics/battle_anims/backgrounds/00.bin.lz"

	.align 2
gUnknown_08D1D410:: @ 8D1D410
	.incbin "graphics/battle_anims/masks/metal_shine.4bpp.lz"

	.align 2
gUnknown_08D1D54C:: @ 8D1D54C
	.incbin "graphics/battle_anims/masks/metal_shine.gbapal.lz"

	.align 2
gUnknown_08D1D574:: @ 8D1D574
	.incbin "graphics/battle_anims/masks/metal_shine.bin.lz"

	.align 2
	.incbin "graphics/unused/goosuto.4bpp.lz" @ ghost

	.align 2
	.incbin "graphics/unused/goosuto.gbapal.lz"

	.align 2
	.incbin "graphics/unused/goosuto.bin.lz"

	.align 2
gBattleAnimSpriteSheet_174:: @ 8D1D960
	.incbin "graphics/battle_anims/sprites/174.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_174:: @ 8D1DA00
	.incbin "graphics/battle_anims/sprites/174.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_175:: @ 8D1DA28
	.incbin "graphics/battle_anims/sprites/175.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_175:: @ 8D1DA8C
	.incbin "graphics/battle_anims/sprites/175.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_176:: @ 8D1DAB4
	.incbin "graphics/battle_anims/sprites/176.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_176:: @ 8D1DC0C
	.incbin "graphics/battle_anims/sprites/176.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_177:: @ 8D1DC34
	.incbin "graphics/battle_anims/sprites/177.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_177:: @ 8D1DCF8
	.incbin "graphics/battle_anims/sprites/177.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_178:: @ 8D1DD10
	.incbin "graphics/battle_anims/sprites/178.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_178:: @ 8D1DE78
	.incbin "graphics/battle_anims/sprites/178.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_179:: @ 8D1DEA0
	.incbin "graphics/battle_anims/sprites/179.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_179:: @ 8D1DEC8
	.incbin "graphics/battle_anims/sprites/179.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_180:: @ 8D1DFA4
	.incbin "graphics/battle_anims/sprites/180.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_181:: @ 8D1DFBC
	.incbin "graphics/battle_anims/sprites/181.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_182:: @ 8D1E34C
	.incbin "graphics/battle_anims/sprites/182.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_182:: @ 8D1E3F0
	.incbin "graphics/battle_anims/sprites/182.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_183:: @ 8D1E418
	.incbin "graphics/battle_anims/sprites/183.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_183:: @ 8D1E690
	.incbin "graphics/battle_anims/sprites/183.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_184:: @ 8D1E6B8
	.incbin "graphics/battle_anims/sprites/184.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_184:: @ 8D1E80C
	.incbin "graphics/battle_anims/sprites/184.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_185:: @ 8D1E834
	.incbin "graphics/battle_anims/sprites/185.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_185:: @ 8D1EC48
	.incbin "graphics/battle_anims/sprites/185.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_03:: @ 8D1EC70
	.incbin "graphics/battle_anims/backgrounds/03.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_03:: @ 8D1EE40
	.incbin "graphics/battle_anims/backgrounds/03.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_03:: @ 8D1EE64
	.incbin "graphics/battle_anims/backgrounds/03.bin.lz"

	.align 2
gBattleAnimSpriteSheet_187:: @ 8D1EF2C
	.incbin "graphics/battle_anims/sprites/187.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_187:: @ 8D1F11C
	.incbin "graphics/battle_anims/sprites/187.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_186:: @ 8D1F13C
	.incbin "graphics/battle_anims/sprites/186.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_186:: @ 8D1F508
	.incbin "graphics/battle_anims/sprites/186.gbapal.lz"

	.align 2
gBattleWindowLargeGfx::
	.incbin "graphics/battle_interface/window.4bpp.lz"

	.align 2
gBattleWindowSmallGfx::
	.incbin "graphics/battle_interface/window2.4bpp.lz"

	.align 2
gBattleWindowSmall2Gfx::
	.incbin "graphics/battle_interface/window3.4bpp.lz"

	.align 2
gBattleWindowSmall3Gfx::
	.incbin "graphics/battle_interface/window4.4bpp.lz"

	.align 2
gBattleWindowLarge2Gfx::
	.incbin "graphics/battle_interface/window5.4bpp.lz"

	.align 2
	.incbin "graphics/unused/shadow.4bpp.lz"

	.align 2
	.incbin "graphics/unused/shadow.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_014:: @ 8D1FF80
	.incbin "graphics/battle_anims/sprites/014.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_014:: @ 8D20014
	.incbin "graphics/battle_anims/sprites/014.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_190:: @ 8D20030
	.incbin "graphics/battle_anims/sprites/190.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_190:: @ 8D2028C
	.incbin "graphics/battle_anims/sprites/190.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_191:: @ 8D202B0
	.incbin "graphics/battle_anims/sprites/191.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_191:: @ 8D2051C
	.incbin "graphics/battle_anims/sprites/191.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_189:: @ 8D20544
	.incbin "graphics/battle_anims/sprites/189.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_189:: @ 8D205C8
	.incbin "graphics/battle_anims/sprites/189.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_192:: @ 8D205E8
	.incbin "graphics/battle_anims/sprites/192.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_192:: @ 8D20868
	.incbin "graphics/battle_anims/sprites/192.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_193:: @ 8D20890
	.incbin "graphics/battle_anims/sprites/193.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_193:: @ 8D209EC
	.incbin "graphics/battle_anims/sprites/193.gbapal.lz"

	.align 2
gUnknown_08D20A14:: @ 8D20A14
	.incbin "graphics/battle_anims/masks/curse.4bpp.lz"

	.align 2
gUnknown_08D20A30:: @ 8D20A30
	.incbin "graphics/battle_anims/masks/curse.bin.lz"

	.align 2
gBattleAnimSpriteSheet_002:: @ 8D20B30
	.incbin "graphics/battle_anims/sprites/002.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_002:: @ 8D20C14
	.incbin "graphics/battle_anims/sprites/002.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_196:: @ 8D20C3C
	.incbin "graphics/battle_anims/sprites/196.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_196:: @ 8D20FE0
	.incbin "graphics/battle_anims/sprites/196.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_194:: @ 8D20FF8
	.incbin "graphics/battle_anims/sprites/194.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_194:: @ 8D21330
	.incbin "graphics/battle_anims/sprites/194.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_195:: @ 8D21358
	.incbin "graphics/battle_anims/sprites/195.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_195:: @ 8D21410
	.incbin "graphics/battle_anims/sprites/195.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_197:: @ 8D21430
	.incbin "graphics/battle_anims/sprites/197.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_197:: @ 8D215A0
	.incbin "graphics/battle_anims/sprites/197.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_198:: @ 8D215C8
	.incbin "graphics/battle_anims/sprites/198.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_198:: @ 8D219B8
	.incbin "graphics/battle_anims/sprites/198.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_199:: @ 8D219E0
	.incbin "graphics/battle_anims/sprites/199.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_199:: @ 8D21AA8
	.incbin "graphics/battle_anims/sprites/199.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_200:: @ 8D21AC4
	.incbin "graphics/battle_anims/sprites/200.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_200:: @ 8D21C04
	.incbin "graphics/battle_anims/sprites/200.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_201:: @ 8D21C20
	.incbin "graphics/battle_anims/sprites/201.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_201:: @ 8D22290
	.incbin "graphics/battle_anims/sprites/201.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_204:: @ 8D222B8
	.incbin "graphics/battle_anims/sprites/204.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_204:: @ 8D2242C
	.incbin "graphics/battle_anims/sprites/204.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_202:: @ 8D22454
	.incbin "graphics/battle_anims/sprites/202.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_202:: @ 8D225BC
	.incbin "graphics/battle_anims/sprites/202.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_203:: @ 8D225E0
	.incbin "graphics/battle_anims/sprites/203.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_203:: @ 8D2278C
	.incbin "graphics/battle_anims/sprites/203.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_206:: @ 8D227B0
	.incbin "graphics/battle_anims/sprites/206.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_206:: @ 8D229BC
	.incbin "graphics/battle_anims/sprites/206.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_205:: @ 8D22A50
	.incbin "graphics/battle_anims/sprites/205.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_205:: @ 8D22C84
	.incbin "graphics/battle_anims/sprites/205.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_207:: @ 8D22CA8
	.incbin "graphics/battle_anims/sprites/207.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_207:: @ 8D22D74
	.incbin "graphics/battle_anims/sprites/207.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_208:: @ 8D22D98
	.incbin "graphics/battle_anims/sprites/208.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_209:: @ 8D23188
	.incbin "graphics/battle_anims/sprites/209.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_209:: @ 8D23490
	.incbin "graphics/battle_anims/sprites/209.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_064:: @ 8D234B0
	.incbin "graphics/battle_anims/sprites/064.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_064:: @ 8D235A0
	.incbin "graphics/battle_anims/sprites/064.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_210:: @ 8D235C4
	.incbin "graphics/battle_anims/sprites/210.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_219:: @ 8D2362C
	.incbin "graphics/battle_anims/sprites/219.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_210:: @ 8D2364C
	.incbin "graphics/battle_anims/sprites/210.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_216:: @ 8D2366C
	.incbin "graphics/battle_anims/sprites/216.gbapal.lz"

	.align 2
gAttractGfx:: @ 8D2368C
	.incbin "graphics/battle_anims/backgrounds/attract.4bpp.lz"

	.align 2
gAttractPal:: @ 8D240FC
	.incbin "graphics/battle_anims/backgrounds/attract.gbapal.lz"

	.align 2
gAttractTilemap:: @ 8D24124
	.incbin "graphics/battle_anims/backgrounds/attract.bin.lz"

	.align 2
gBattleAnimSpriteSheet_217:: @ 8D243A0
	.incbin "graphics/battle_anims/sprites/217.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_217:: @ 8D24408
	.incbin "graphics/battle_anims/sprites/217.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_212:: @ 8D24428
	.incbin "graphics/battle_anims/sprites/212.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_211:: @ 8D2465C
	.incbin "graphics/battle_anims/sprites/211.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_213:: @ 8D246AC
	.incbin "graphics/battle_anims/sprites/213.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_211:: @ 8D24918
	.incbin "graphics/battle_anims/sprites/211.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_214:: @ 8D2493C
	.incbin "graphics/battle_anims/sprites/214.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_215:: @ 8D24BCC
	.incbin "graphics/battle_anims/sprites/215.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_215:: @ 8D24D58
	.incbin "graphics/battle_anims/sprites/215.gbapal.lz"

	.align 2
gBattleAnimBackgroundPalette_ScaryFace:: @ 8D24D7C
	.incbin "graphics/battle_anims/backgrounds/scary_face.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_ScaryFace:: @ 8D24DA4
	.incbin "graphics/battle_anims/backgrounds/scary_face.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_218:: @ 8D24FD4
	.incbin "graphics/battle_anims/sprites/218.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_218:: @ 8D24FFC
	.incbin "graphics/battle_anims/sprites/218.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_087:: @ 8D250A8
	.incbin "graphics/battle_anims/sprites/087.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_087:: @ 8D25100
	.incbin "graphics/battle_anims/sprites/087.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_018:: @ 8D25128
	.incbin "graphics/battle_anims/sprites/018.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_018:: @ 8D25164
	.incbin "graphics/battle_anims/sprites/018.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_220:: @ 8D25180
	.incbin "graphics/battle_anims/sprites/220.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_220:: @ 8D251A8
	.incbin "graphics/battle_anims/sprites/220.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_221:: @ 8D252D4
	.incbin "graphics/battle_anims/sprites/221.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_221:: @ 8D252F4
	.incbin "graphics/battle_anims/sprites/221.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_222:: @ 8D25558
	.incbin "graphics/battle_anims/sprites/222.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_222:: @ 8D25844
	.incbin "graphics/battle_anims/sprites/222.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_223:: @ 8D2586C
	.incbin "graphics/battle_anims/sprites/223.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_223:: @ 8D2588C
	.incbin "graphics/battle_anims/sprites/223.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_224:: @ 8D25B20
	.incbin "graphics/battle_anims/sprites/224.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_224:: @ 8D25B40
	.incbin "graphics/battle_anims/sprites/224.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_230:: @ 8D25C3C
	.incbin "graphics/battle_anims/sprites/230.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_230:: @ 8D25C64
	.incbin "graphics/battle_anims/sprites/230.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_228:: @ 8D25EA8
	.incbin "graphics/battle_anims/sprites/228.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_228:: @ 8D25EC8
	.incbin "graphics/battle_anims/sprites/228.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_04:: @ 8D25F70
	.incbin "graphics/battle_anims/backgrounds/04.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_04:: @ 8D25F98
	.incbin "graphics/battle_anims/backgrounds/04.4bpp.lz"

	.align 2
gBattleAnimBackgroundTilemap_04:: @ 8D26D04
	.incbin "graphics/battle_anims/backgrounds/04.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_05:: @ 8D27200
	.incbin "graphics/battle_anims/backgrounds/05.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_06:: @ 8D276D0
	.incbin "graphics/battle_anims/backgrounds/06.bin.lz"

	.align 2
gBattleAnimSpriteSheet_225:: @ 8D27B10
	.incbin "graphics/battle_anims/sprites/225.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_225:: @ 8D27C94
	.incbin "graphics/battle_anims/sprites/225.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_227:: @ 8D27CBC
	.incbin "graphics/battle_anims/sprites/227.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_226:: @ 8D27E04
	.incbin "graphics/battle_anims/sprites/226.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_226:: @ 8D27E90
	.incbin "graphics/battle_anims/sprites/226.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_229:: @ 8D27EB4
	.incbin "graphics/battle_anims/sprites/229.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_229:: @ 8D28070
	.incbin "graphics/battle_anims/sprites/229.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_099:: @ 8D28098
	.incbin "graphics/battle_anims/sprites/099.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_099:: @ 8D281B8
	.incbin "graphics/battle_anims/sprites/099.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_232:: @ 8D281E0
	.incbin "graphics/battle_anims/sprites/232.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_231:: @ 8D28718
	.incbin "graphics/battle_anims/sprites/231.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_231:: @ 8D28740
	.incbin "graphics/battle_anims/sprites/231.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_233:: @ 8D28910
	.incbin "graphics/battle_anims/sprites/233.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_233:: @ 8D28994
	.incbin "graphics/battle_anims/sprites/233.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_234:: @ 8D289BC
	.incbin "graphics/battle_anims/sprites/234.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_234:: @ 8D28B7C
	.incbin "graphics/battle_anims/sprites/234.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_238:: @ 8D28BA0
	.incbin "graphics/battle_anims/sprites/238.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_238:: @ 8D28C08
	.incbin "graphics/battle_anims/sprites/238.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_235:: @ 8D28C2C
	.incbin "graphics/battle_anims/sprites/235.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_235:: @ 8D28C7C
	.incbin "graphics/battle_anims/sprites/235.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_236:: @ 8D28C98
	.incbin "graphics/battle_anims/sprites/236.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_237:: @ 8D28CB4
	.incbin "graphics/battle_anims/sprites/237.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_07:: @ 8D28CD0
	.incbin "graphics/battle_anims/backgrounds/07.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_07:: @ 8D28E78
	.incbin "graphics/battle_anims/backgrounds/07.gbapal.lz"

	.align 2
gBattleAnimBackgroundPalette_18:: @ 8D28EA0
	.incbin "graphics/battle_anims/backgrounds/18.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_07:: @ 8D28EC8
	.incbin "graphics/battle_anims/backgrounds/07.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_08:: @ 8D29058
	.incbin "graphics/battle_anims/backgrounds/08.bin.lz"

	.align 2
gBattleAnimBackgroundImage_20:: @ 8D291E4
	.incbin "graphics/battle_anims/backgrounds/20.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_20:: @ 8D29C0C
	.incbin "graphics/battle_anims/backgrounds/20.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_20:: @ 8D29C2C
	.incbin "graphics/battle_anims/backgrounds/20.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_09:: @ 8D29E30
	.incbin "graphics/battle_anims/backgrounds/09.bin.lz"

	.align 2
gBattleAnimBackgroundPalette_09:: @ 8D2A128
	.incbin "graphics/battle_anims/backgrounds/09.gbapal.lz"

	.align 2
gBattleAnimBackgroundPalette_22:: @ 8D2A148
	.incbin "graphics/battle_anims/backgrounds/22.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_09:: @ 8D2A168
	.incbin "graphics/battle_anims/backgrounds/09.4bpp.lz"

	.align 2
gBattleAnimBackgroundTilemap_10:: @ 8D2A6E8
	.incbin "graphics/battle_anims/backgrounds/10.bin.lz"

	.align 2
gUnknown_08D2A9E0:: @ 8D2A9E0
	.incbin "graphics/battle_anims/masks/morning_sun.4bpp.lz"

	.align 2
gUnknown_08D2AA80:: @ 8D2AA80
	.incbin "graphics/battle_anims/masks/morning_sun.gbapal.lz"

	.align 2
gUnknown_08D2AA98:: @ 8D2AA98
	.incbin "graphics/battle_anims/masks/morning_sun.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_12:: @ 8D2ABB4
	.incbin "graphics/battle_anims/backgrounds/12.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_13:: @ 8D2AE7C
	.incbin "graphics/battle_anims/backgrounds/13.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_14:: @ 8D2B178
	.incbin "graphics/battle_anims/backgrounds/14.bin.lz"

	.align 2
gBattleAnimBackgroundImage_12:: @ 8D2B408
	.incbin "graphics/battle_anims/backgrounds/12.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_12:: @ 8D2C170
	.incbin "graphics/battle_anims/backgrounds/12.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_11:: @ 8D2C190
	.incbin "graphics/battle_anims/backgrounds/11.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_11:: @ 8D2CB2C
	.incbin "graphics/battle_anims/backgrounds/11.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_11:: @ 8D2CB54
	.incbin "graphics/battle_anims/backgrounds/11.bin.lz"

	.align 2
gBattleAnimSpriteSheet_239:: @ 8D2CE4C
	.incbin "graphics/battle_anims/sprites/239.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_239:: @ 8D2CF30
	.incbin "graphics/battle_anims/sprites/239.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_143:: @ 8D2CF58
	.incbin "graphics/battle_anims/sprites/143.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_143:: @ 8D2D188
	.incbin "graphics/battle_anims/sprites/143.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_240:: @ 8D2D1A0
	.incbin "graphics/battle_anims/sprites/240.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_240:: @ 8D2D240
	.incbin "graphics/battle_anims/sprites/240.gbapal.lz"

	.align 2
gSubstituteDollPal:: @ 8D2D268
	.incbin "graphics/battle_anims/sprites/substitute.gbapal.lz"

	.align 2
gSubstituteDollGfx:: @ 8D2D28C
	.incbin "graphics/battle_anims/sprites/substitute.4bpp.lz"

	.align 2
gSubstituteDollTilemap:: @ 8D2D4CC
	.incbin "graphics/battle_anims/sprites/substitute.bin.lz"

	.align 2
gBattleAnimSpriteSheet_241:: @ 8D2D6F4
	.incbin "graphics/battle_anims/sprites/241.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_241:: @ 8D2D7B8
	.incbin "graphics/battle_anims/sprites/241.gbapal.lz"

	.align 2
gContestConfetti_Gfx::
	.incbin "graphics/misc/confetti.4bpp.lz"

	.align 2
gContestConfetti_Pal::
	.incbin "graphics/misc/confetti.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_242:: @ 8D2D91C
	.incbin "graphics/battle_anims/sprites/242.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_242:: @ 8D2DA58
	.incbin "graphics/battle_anims/sprites/242.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_243:: @ 8D2DA7C
	.incbin "graphics/battle_anims/sprites/243.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_243:: @ 8D2DAA4
	.incbin "graphics/battle_anims/sprites/243.gbapal.lz"

	.align 2
gBattleStatMask_Gfx:: @ 8D2DACC
	.incbin "graphics/battle_anims/masks/stat.4bpp.lz"

	.align 2
gBattleStatMask1_Tilemap:: @ 8D2DCDC
	.incbin "graphics/battle_anims/masks/stat_tilemap_1.bin.lz"

	.align 2
gBattleStatMask2_Tilemap:: @ 8D2DDF8
	.incbin "graphics/battle_anims/masks/stat_tilemap_2.bin.lz"

	.align 2
gBattleStatMask1_Pal:: @ 8D2DF14
	.incbin "graphics/battle_anims/masks/stat1.gbapal.lz"

	.align 2
gBattleStatMask2_Pal:: @ 8D2DF34
	.incbin "graphics/battle_anims/masks/stat2.gbapal.lz"

	.align 2
gBattleStatMask3_Pal:: @ 8D2DF54
	.incbin "graphics/battle_anims/masks/stat3.gbapal.lz"

	.align 2
gBattleStatMask4_Pal:: @ 8D2DF74
	.incbin "graphics/battle_anims/masks/stat4.gbapal.lz"

	.align 2
gBattleStatMask5_Pal:: @ 8D2DF94
	.incbin "graphics/battle_anims/masks/stat5.gbapal.lz"

	.align 2
gBattleStatMask6_Pal:: @ 8D2DFB4
	.incbin "graphics/battle_anims/masks/stat6.gbapal.lz"

	.align 2
gBattleStatMask7_Pal:: @ 8D2DFD4
	.incbin "graphics/battle_anims/masks/stat7.gbapal.lz"

	.align 2
gBattleStatMask8_Pal:: @ 8D2DFF4
	.incbin "graphics/battle_anims/masks/stat8.gbapal.lz"

	.align 2
gUnknown_08D2E014:: @ 8D2E014
	.incbin "graphics/battle_anims/masks/cure_bubbles.4bpp.lz"

	.align 2
gUnknown_08D2E150:: @ 8D2E150
	.incbin "graphics/battle_anims/masks/cure_bubbles.gbapal.lz"

	.align 2
gUnknown_08D2E170:: @ 8D2E170
	.incbin "graphics/battle_anims/masks/cure_bubbles.bin.lz"

	.align 2
gBattleAnimSpritePalette_245:: @ 8D2E28C
	.incbin "graphics/battle_anims/sprites/245.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_245:: @ 8D2E2B4
	.incbin "graphics/battle_anims/sprites/245.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_246:: @ 8D2E458
	.incbin "graphics/battle_anims/sprites/246.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_244:: @ 8D2E900
	.incbin "graphics/battle_anims/sprites/244.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_244:: @ 8D2E9DC
	.incbin "graphics/battle_anims/sprites/244.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_247:: @ 8D2E9F8
	.incbin "graphics/battle_anims/sprites/247.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_053:: @ 8D2EBDC
	.incbin "graphics/battle_anims/sprites/053.4bpp.lz"

	.align 2
gUnknown_08D2EDFC:: @ 8D2EDFC
	.incbin "graphics/battle_anims/masks/unknown_D2EDFC.4bpp.lz"

	.align 2
gUnknown_08D2EE48:: @ 8D2EE48
	.incbin "graphics/battle_anims/masks/unknown_D2EDFC.bin.lz"

	.align 2
gBattleAnimSpriteSheet_248:: @ 8D2EF50
	.incbin "graphics/battle_anims/sprites/248.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_248:: @ 8D2EF68
	.incbin "graphics/battle_anims/sprites/248.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_249:: @ 8D2EF80
	.incbin "graphics/battle_anims/sprites/249.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_249:: @ 8D2EFD0
	.incbin "graphics/battle_anims/sprites/249.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_250:: @ 8D2EFF0
	.incbin "graphics/battle_anims/sprites/250.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_251:: @ 8D2F1E4
	.incbin "graphics/battle_anims/sprites/251.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_251:: @ 8D2F248
	.incbin "graphics/battle_anims/sprites/251.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_252:: @ 8D2F260
	.incbin "graphics/battle_anims/sprites/252.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_252:: @ 8D2F378
	.incbin "graphics/battle_anims/sprites/252.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_253:: @ 8D2F39C
	.incbin "graphics/battle_anims/sprites/253.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_253:: @ 8D2F578
	.incbin "graphics/battle_anims/sprites/253.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_254:: @ 8D2F5A0
	.incbin "graphics/battle_anims/sprites/254.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_254:: @ 8D2F6D8
	.incbin "graphics/battle_anims/sprites/254.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_255:: @ 8D2F700
	.incbin "graphics/battle_anims/sprites/255.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_255:: @ 8D2F778
	.incbin "graphics/battle_anims/sprites/255.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_258:: @ 8D2F78C
	.incbin "graphics/battle_anims/sprites/258.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_258:: @ 8D2F874
	.incbin "graphics/battle_anims/sprites/258.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_256:: @ 8D2F89C
	.incbin "graphics/battle_anims/sprites/256.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_256:: @ 8D2FC28
	.incbin "graphics/battle_anims/sprites/256.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_257:: @ 8D2FC50
	.incbin "graphics/battle_anims/sprites/257.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_257:: @ 8D2FD6C
	.incbin "graphics/battle_anims/sprites/257.gbapal.lz"

@ 8D2FD8C
	.include "data/graphics/pokemon/graphics.inc"

@ 8E48D38
	.include "data/graphics/trainers/graphics.inc"

	.align 2
gMonIcon_QuestionMark:: @ 8E5D5F0
	.incbin "graphics/pokemon/question_mark/icon.4bpp"

	.align 2
gMonFootprint_QuestionMark:: @ 8E5D9F0
	.incbin "graphics/pokemon/question_mark/footprint.1bpp"

	.align 2
gVersusFrameGfx:: @ 8E5DA10
	.incbin "graphics/battle_transitions/vs_frame.4bpp.lz"

	.align 2
gVersusFrameTilemap:: @ 8E5DAF8
	.incbin "graphics/battle_transitions/vs_frame.bin.lz"

	.align 2
gVersusFramePal:: @ 8E5DC04
	.incbin "graphics/battle_transitions/vs_frame.gbapal.lz"

	.align 2
gUnknown_08E5DC2C:: @ 8E5DC2C
	.incbin "graphics/battle_transitions/vs.4bpp.lz"

	.align 2
gBattleTerrainTiles_TallGrass:: @ 8E5DE3C
	.incbin "graphics/battle_terrain/tall_grass/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_TallGrass:: @ 8E5E3EC
	.incbin "graphics/battle_terrain/tall_grass/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_TallGrass:: @ 8E5E424
	.incbin "graphics/battle_terrain/tall_grass/map.bin.lz"

	.align 2
gBattleTerrainTiles_LongGrass:: @ 8E5E6D4
	.incbin "graphics/battle_terrain/long_grass/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_LongGrass:: @ 8E5ED4C
	.incbin "graphics/battle_terrain/long_grass/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_LongGrass:: @ 8E5ED8C
	.incbin "graphics/battle_terrain/long_grass/map.bin.lz"

	.align 2
gBattleTerrainTiles_Sand:: @ 8E5F03C
	.incbin "graphics/battle_terrain/sand/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_Sand:: @ 8E5F634
	.incbin "graphics/battle_terrain/sand/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_Sand:: @ 8E5F67C
	.incbin "graphics/battle_terrain/sand/map.bin.lz"

	.align 2
gBattleTerrainTiles_Underwater:: @ 8E5F92C
	.incbin "graphics/battle_terrain/underwater/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_Underwater:: @ 8E5FEE4
	.incbin "graphics/battle_terrain/underwater/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_Underwater:: @ 8E5FF2C
	.incbin "graphics/battle_terrain/underwater/map.bin.lz"

	.align 2
gBattleTerrainTiles_Water:: @ 8E601DC
	.incbin "graphics/battle_terrain/water/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_Water:: @ 8E607B0
	.incbin "graphics/battle_terrain/water/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_Water:: @ 8E607F4
	.incbin "graphics/battle_terrain/water/map.bin.lz"

	.align 2
gBattleTerrainTiles_PondWater:: @ 8E60AA4
	.incbin "graphics/battle_terrain/pond_water/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_PondWater:: @ 8E6104C
	.incbin "graphics/battle_terrain/pond_water/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_PondWater:: @ 8E6108C
	.incbin "graphics/battle_terrain/pond_water/map.bin.lz"

	.align 2
gBattleTerrainTiles_Rock:: @ 8E6133C
	.incbin "graphics/battle_terrain/rock/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_Rock:: @ 8E618FC
	.incbin "graphics/battle_terrain/rock/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_Rock:: @ 8E61938
	.incbin "graphics/battle_terrain/rock/map.bin.lz"

	.align 2
gBattleTerrainTiles_Cave:: @ 8E61BE8
	.incbin "graphics/battle_terrain/cave/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_Cave:: @ 8E621E0
	.incbin "graphics/battle_terrain/cave/palette.gbapal.lz"

	.align 2
gBattleTerrainTilemap_Cave:: @ 8E62228
	.incbin "graphics/battle_terrain/cave/map.bin.lz"

	.align 2
gBattleTerrainPalette_Plain:: @ 8E624D8
	.incbin "graphics/battle_terrain/plain/palette.gbapal.lz"

	.align 2
gBattleTerrainTiles_Building:: @ 8E62514
	.incbin "graphics/battle_terrain/building/tiles.4bpp.lz"

	.align 2
gBattleTerrainPalette_BattleTower:: @ 8E62AC0
	.incbin "graphics/battle_terrain/stadium/battle_tower.gbapal.lz" @ this is also used for link battles

	.align 2
gBattleTerrainTilemap_Building:: @ 8E62AFC
	.incbin "graphics/battle_terrain/building/map.bin.lz"

	.align 2
gBattleTerrainTiles_Stadium:: @ 8E62DAC
	.incbin "graphics/battle_terrain/stadium/tiles.4bpp.lz"

	.align 2
gBattleTerrainTilemap_Stadium:: @ 8E633B4
	.incbin "graphics/battle_terrain/stadium/map.bin.lz"

	.align 2
gBattleTerrainPalette_Building:: @ 8E63664
	.incbin "graphics/battle_terrain/building/palette.gbapal.lz"

	.align 2
gBattleTerrainPalette_Kyogre::
	.incbin "graphics/battle_terrain/water/kyogre.gbapal.lz"

	.align 2
gBattleTerrainPalette_Groudon::
	.incbin "graphics/battle_terrain/cave/groudon.gbapal.lz"

	.align 2
gBattleTerrainPalette_BuildingGym:: @ 8E63738
	.incbin "graphics/battle_terrain/building/palette2.gbapal.lz"

	.align 2
gBattleTerrainPalette_BuildingLeader:: @ 8E63774
	.incbin "graphics/battle_terrain/building/palette3.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumAqua:: @ 8E637B0
	.incbin "graphics/battle_terrain/stadium/palette1.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumMagma:: @ 8E63810
	.incbin "graphics/battle_terrain/stadium/palette2.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumSidney:: @ 8E6387C
	.incbin "graphics/battle_terrain/stadium/palette3.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumPhoebe:: @ 8E638CC
	.incbin "graphics/battle_terrain/stadium/palette4.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumGlacia:: @ 8E63914
	.incbin "graphics/battle_terrain/stadium/palette5.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumDrake:: @ 8E63958
	.incbin "graphics/battle_terrain/stadium/palette6.gbapal.lz"

	.align 2
gBattleTerrainPalette_StadiumSteven:: @ 8E639A8
	.incbin "graphics/battle_terrain/stadium/palette7.gbapal.lz"

	.align 2
gBattleTerrainAnimTiles_TallGrass:: @ 8E639E4
	.incbin "graphics/battle_terrain/tall_grass/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_TallGrass:: @ 8E63F6C
	.incbin "graphics/battle_terrain/tall_grass/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_LongGrass:: @ 8E64128
	.incbin "graphics/battle_terrain/long_grass/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_LongGrass:: @ 8E64838
	.incbin "graphics/battle_terrain/long_grass/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_Sand:: @ 8E64A70
	.incbin "graphics/battle_terrain/sand/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_Sand:: @ 8E64FB4
	.incbin "graphics/battle_terrain/sand/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_Underwater:: @ 8E6515C
	.incbin "graphics/battle_terrain/underwater/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_Underwater:: @ 8E65628
	.incbin "graphics/battle_terrain/underwater/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_Water:: @ 8E657B8
	.incbin "graphics/battle_terrain/water/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_Water:: @ 8E65DC4
	.incbin "graphics/battle_terrain/water/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_PondWater:: @ 8E65F68
	.incbin "graphics/battle_terrain/pond_water/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_PondWater:: @ 8E664B4
	.incbin "graphics/battle_terrain/pond_water/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_Rock:: @ 8E66600
	.incbin "graphics/battle_terrain/rock/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_Rock:: @ 8E66BE0
	.incbin "graphics/battle_terrain/rock/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_Cave:: @ 8E66D74
	.incbin "graphics/battle_terrain/cave/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_Cave:: @ 8E67590
	.incbin "graphics/battle_terrain/cave/anim_map.bin.lz"

	.align 2
gBattleTerrainAnimTiles_Building:: @ 8E67838
	.incbin "graphics/battle_terrain/building/anim_tiles.4bpp.lz"

	.align 2
gBattleTerrainAnimTilemap_Building:: @ 8E67C48
	.incbin "graphics/battle_terrain/building/anim_map.bin.lz"

	.align 2
gBattleAnimSpriteSheet_261:: @ 8E67D6C
	.incbin "graphics/battle_anims/sprites/261.4bpp.lz"

	.align 2
gBattleAnimBackgroundTilemap_SandstormBrew:: @ 8E67ED8
	.incbin "graphics/battle_anims/backgrounds/sandstorm_brew.bin.lz"

	.align 2
gBattleAnimBackgroundImage_SandstormBrew:: @ 8E68054
	.incbin "graphics/battle_anims/backgrounds/sandstorm_brew.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_261:: @ 8E68580
	.incbin "graphics/battle_anims/sprites/261.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_260:: @ 8E685A8
	.incbin "graphics/battle_anims/sprites/260.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_260:: @ 8E68764
	.incbin "graphics/battle_anims/sprites/260.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_15:: @ 8E6877C
	.incbin "graphics/battle_anims/backgrounds/15.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_15:: @ 8E690EC
	.incbin "graphics/battle_anims/backgrounds/15.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_15:: @ 8E69110
	.incbin "graphics/battle_anims/backgrounds/15.bin.lz"

	.align 2
gBattleAnimSpriteSheet_262:: @ 8E69308
	.incbin "graphics/battle_anims/sprites/262.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_262:: @ 8E693DC
	.incbin "graphics/battle_anims/sprites/262.gbapal.lz"

	.align 2
gContestNextTurnGfx::
	.incbin "graphics/contest/nextturn.4bpp.lz"

	.align 2
gContestNextTurnNumbersGfx:: @ 8E69478
	.incbin "graphics/contest/nextturn_numbers.4bpp"

	.align 2
gContestNextTurnRandomGfx:: @ 8E69578
	.incbin "graphics/contest/nextturn_random.4bpp"

	.align 2
gBattleAnimSpriteSheet_264:: @ 8E695B8
	.incbin "graphics/battle_anims/sprites/264.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_264:: @ 8E695D8
	.incbin "graphics/battle_anims/sprites/264.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_265:: @ 8E695F0
	.incbin "graphics/battle_anims/sprites/265.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_067:: @ 8E69608
	.incbin "graphics/battle_anims/sprites/067.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_068:: @ 8E69628
	.incbin "graphics/battle_anims/sprites/068.gbapal.lz"

	.align 2
gContestApplauseGfx::
	.incbin "graphics/contest/applause.4bpp.lz"

	.align 2
gContestApplauseMeterGfx:: @ 8E6978C
	.incbin "graphics/contest/applause_meter.4bpp"

	.align 2
gContestPal::
	.incbin "graphics/contest/nextturn.gbapal"

	.align 2
gBattleAnimSpriteSheet_272:: @ 8E6982C
	.incbin "graphics/battle_anims/sprites/272.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_272:: @ 8E69A48
	.incbin "graphics/battle_anims/sprites/272.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_273:: @ 8E69A6C
	.incbin "graphics/battle_anims/sprites/273.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_269:: @ 8E69A94
	.incbin "graphics/battle_anims/sprites/269.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_269:: @ 8E69AE8
	.incbin "graphics/battle_anims/sprites/269.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_274:: @ 8E69B00
	.incbin "graphics/battle_anims/sprites/274.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_275:: @ 8E69C80
	.incbin "graphics/battle_anims/sprites/275.4bpp.lz"

	.align 2
gBattleAnimSpriteSheet_276:: @ 8E69DEC
	.incbin "graphics/battle_anims/sprites/276.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_274:: @ 8E69F54
	.incbin "graphics/battle_anims/sprites/274.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_17:: @ 8E69F7C
	.incbin "graphics/battle_anims/backgrounds/17.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_17:: @ 8E6A0D8
	.incbin "graphics/battle_anims/backgrounds/17.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_17:: @ 8E6A100
	.incbin "graphics/battle_anims/backgrounds/17.bin.lz"

	.align 2
gBattleAnimSpriteSheet_280:: @ 8E6A2E8
	.incbin "graphics/battle_anims/sprites/280.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_280:: @ 8E6A6E4
	.incbin "graphics/battle_anims/sprites/280.gbapal.lz"

	.align 2
gBattleAnimBackgroundImageMuddyWater_Pal:: @ 8E6A704
	.incbin "graphics/battle_anims/backgrounds/water_muddy.gbapal.lz"

	.align 2
gEnemyMonShadow_Gfx:: @ 8E6A728
	.incbin "graphics/battle_interface/enemy_mon_shadow.4bpp.lz"

	.align 2
gBattleGfx_BallStatusBar:: @ 8E6A758
	.incbin "graphics/battle_interface/bar.4bpp.lz"

	.align 2
gMonIcon_Egg:: @ 8E6A7DC
	.incbin "graphics/pokemon/egg/icon.4bpp"

	.align 2
gBattleAnimBackgroundImage_02:: @ 8E6ABDC
	.incbin "graphics/battle_anims/backgrounds/02.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_02:: @ 8E6B8A4
	.incbin "graphics/battle_anims/backgrounds/02.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_02:: @ 8E6B8C0
	.incbin "graphics/battle_anims/backgrounds/02.bin.lz"

	.align 2
gBattleAnimSpritePalette_287:: @ 8E6BBB4
	.incbin "graphics/battle_anims/sprites/287.gbapal.lz"

	.align 2
gBattleAnimBackgroundPalette_24:: @ 8E6BBDC
	.incbin "graphics/battle_anims/backgrounds/24.gbapal.lz"

	.align 2
	.incbin "graphics/unknown/unknown_E6BC04.bin.lz"

	.align 2
gUnknown_08E6C100:: @ 8E6C100
	.incbin "graphics/berry_blender/center.8bpp.lz"

	.align 2
gUnknown_08E6C920:: @ 8E6C920
	.incbin "graphics/berry_blender/outer.4bpp.lz"

	.align 2
gUnknown_08E6D354:: @ 8E6D354
	.incbin "graphics/berry_blender/outer_map.bin.lz"

	.align 2
gBattleAnimBackgroundPalette_16:: @ 8E6D668
	.incbin "graphics/battle_anims/backgrounds/16.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_16:: @ 8E6D690
	.incbin "graphics/battle_anims/backgrounds/16.4bpp.lz"

	.align 2
gBattleAnimBackgroundTilemap_16:: @ 8E6D8F0
	.incbin "graphics/battle_anims/backgrounds/16.bin.lz"

	.align 2
gBattleAnimSpritePalette_277:: @ 8E6DA2C
	.incbin "graphics/battle_anims/sprites/277.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_277:: @ 8E6DA54
	.incbin "graphics/battle_anims/sprites/277.4bpp.lz"

	.align 2
gBattleAnimFogTilemap:: @ 8E6DE48
	.incbin "graphics/battle_anims/backgrounds/fog.bin.lz"

	.align 2
gBattleAnimSpritePalette_283:: @ 8E6DFC0
	.incbin "graphics/battle_anims/sprites/283.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_283:: @ 8E6DFDC
	.incbin "graphics/battle_anims/sprites/283.4bpp.lz"

	.align 2
gBattleAnimBackgroundTilemap_ScaryFacePlayer:: @ 8E6E100
	.incbin "graphics/battle_anims/backgrounds/scary_face_player.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_ScaryFaceOpponent:: @ 8E6E2E4
	.incbin "graphics/battle_anims/backgrounds/scary_face_opponent.bin.lz"

	.align 2
gBattleAnimBackgroundTilemap_ScaryFaceContest:: @ 8E6E4C8
	.incbin "graphics/battle_anims/backgrounds/scary_face_contest.bin.lz"

	.align 2
gBattleAnimSpriteSheet_263:: @ 8E6E6AC
	.incbin "graphics/battle_anims/sprites/263.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_263:: @ 8E6E6EC
	.incbin "graphics/battle_anims/sprites/263.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_266:: @ 8E6E704
	.incbin "graphics/battle_anims/sprites/266.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_266:: @ 8E6E744
	.incbin "graphics/battle_anims/sprites/266.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_267:: @ 8E6E75C
	.incbin "graphics/battle_anims/sprites/267.gbapal.lz"

	.align 2
gBattleAnimSpritePalette_268:: @ 8E6E774
	.incbin "graphics/battle_anims/sprites/268.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_278:: @ 8E6E78C
	.incbin "graphics/battle_anims/sprites/278.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_278:: @ 8E6E998
	.incbin "graphics/battle_anims/sprites/278.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_279:: @ 8E6E9B4
	.incbin "graphics/battle_anims/sprites/279.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_279:: @ 8E6EA00
	.incbin "graphics/battle_anims/sprites/279.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_281:: @ 8E6EA1C
	.incbin "graphics/battle_anims/sprites/281.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_281:: @ 8E6EBA4
	.incbin "graphics/battle_anims/sprites/281.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_21:: @ 8E6EBC4
	.incbin "graphics/battle_anims/backgrounds/21.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_21:: @ 8E6EEB8
	.incbin "graphics/battle_anims/backgrounds/21.gbapal.lz"

	.align 2
gBattleAnimBackgroundTilemap_21:: @ 8E6EED4
	.incbin "graphics/battle_anims/backgrounds/21.bin.lz"

	.align 2
gBattleAnimSpriteSheet_284:: @ 8E6F1C0
	.incbin "graphics/battle_anims/sprites/284.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_284:: @ 8E6F53C
	.incbin "graphics/battle_anims/sprites/284.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_285:: @ 8E6F558
	.incbin "graphics/battle_anims/sprites/285.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_285:: @ 8E6F5F8
	.incbin "graphics/battle_anims/sprites/285.gbapal.lz"

	.align 2
gBattleAnimBackgroundImage_Surf:: @ 8E6F620
	.incbin "graphics/battle_anims/backgrounds/water.4bpp.lz"

	.align 2
gBattleAnimBackgroundPalette_Surf:: @ 8E70940
	.incbin "graphics/battle_anims/backgrounds/water.gbapal.lz"

	.align 2
gUnknown_08E70968:: @ 8E70968
	.incbin "graphics/unknown/unknown_E70968.bin.lz"

	.align 2
gUnknown_08E70C38:: @ 8E70C38
	.incbin "graphics/unknown/unknown_E70C38.bin.lz"

	.align 2
gUnknown_08E70F0C:: @ 8E70F0C
	.incbin "graphics/unknown/unknown_E70F0C.bin.lz"

	.align 2
gBattleAnimSpritePalette_286:: @ 8E71200
	.incbin "graphics/battle_anims/sprites/286.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_188:: @ 8E71228
	.incbin "graphics/battle_anims/sprites/188.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_188:: @ 8E7133C
	.incbin "graphics/battle_anims/sprites/188.gbapal.lz"

	.align 2
gPartyMenuMisc_Gfx:: @ 8E71354
	.incbin "graphics/interface/party_menu_misc.4bpp.lz"

	.align 2
gPartyMenuMisc_Pal:: @ 8E716A0
	.incbin "graphics/interface/party_menu_misc.gbapal.lz"

	.align 2
gPartyMenuMisc_Tilemap:: @ 8E71788
	.incbin "graphics/interface/party_menu_misc.bin.lz"

	.align 2
gPartyMenuHpBar_Gfx:: @ 8E71894
	.incbin "graphics/interface/party_menu_hpbar.4bpp.lz"

	.align 2
gPartyMenuOrderText_Gfx:: @ 8E71934
	.incbin "graphics/interface/party_menu_ordertext.4bpp.lz"

	.align 2
gMoveTypes_Gfx:: @ 8E71D10
	.incbin "graphics/types/move_types.4bpp.lz"

	.align 2
gMoveTypes_Pal:: @ 8E726E4
	.incbin "graphics/types/move_types.gbapal.lz"

	.align 2
gMenuSummaryGfx:: @ 8E7274C
	.incbin "graphics/interface/summary_frames.4bpp.lz" @ the arrows appear to be unused.

	.align 2
gMenuSummaryPal:: @ 8E72848
	.incbin "graphics/interface/summary_frames.gbapal.lz"

	.align 2
gStatusGfx_Icons:: @ 8E72860
	.incbin "graphics/interface/status_icons.4bpp.lz"

	.align 2
gStatusPal_Icons:: @ 8E72A50
	.incbin "graphics/interface/status_icons.gbapal.lz"

	.align 2
gStatusScreen_Gfx:: @ 8E72A78
	.incbin "graphics/interface/status_screen.4bpp.lz"

	.align 2
gStatusScreen_Pal:: @ 8E73468
	.incbin "graphics/interface/status_screen.gbapal.lz"

	.align 2
gUnknown_08E73508:: @ 8E73508
	.incbin "graphics/interface/status_screen.bin"

	.align 2
gStatusScreen_Tilemap:: @ 8E73D08
	.incbin "graphics/interface/status_screen_pokemon_skills.bin.lz"

gUnknown_08E73E88:: @ 8E73E88
	.incbin "graphics/interface/status_screen_battle_moves.bin"

gUnknown_08E74688:: @ 8E74688
	.incbin "graphics/interface/status_screen_contest_moves.bin"

	.align 2
gUnknown_08E74E88:: @ 8E74E88
	.incbin "graphics/interface/pokemon_info.bin.lz"

	.align 2
gBagMaleTiles:: @ 8E75024
	.incbin "graphics/misc/bag_male.4bpp.lz"

	.align 2
gBagFemaleTiles:: @ 8E75BA0
	.incbin "graphics/misc/bag_female.4bpp.lz"

	.align 2
gBagPalette:: @ 8E76700
	.incbin "graphics/misc/bag.gbapal.lz"

	.align 2
gBagScreen_Gfx:: @ 8E76728
	.incbin "graphics/interface/bag_screen.4bpp.lz"

	.align 2
gBagScreenMale_Pal:: @ 8E76F94
	.incbin "graphics/interface/bag_screen_male.gbapal.lz"

	.align 2
gBagScreenFemale_Pal:: @ 8E76FCC
	.incbin "graphics/interface/bag_screen_female.gbapal.lz"

gBagScreen_Tilemap:: @ 8E77004
	.incbin "graphics/interface/bag_screen.bin"

	.align 2
gBuyMenuFrame_Gfx:: @ 8E77804
	.incbin "graphics/interface/mart_frame.4bpp.lz"

	.align 2
gMenuMoneyPal:: @ 8E77900
	.incbin "graphics/interface/money.gbapal.lz"

	.align 2
gBuyMenuFrame_Tilemap:: @ 8E77928
	.incbin "graphics/interface/mart_frame.bin.lz"

	.align 2
gMenuMoneyGfx:: @ 8E77A5C
	.incbin "graphics/interface/money.4bpp.lz"

	.align 2
gMenuPokeblock_Gfx:: @ 8E77AE4
	.incbin "graphics/interface/pokeblock_case_frame.4bpp.lz"

	.align 2
gMenuPokeblock_Pal:: @ 8E77D20
	.incbin "graphics/interface/pokeblock_case_frame.gbapal.lz"

	.align 2
gMenuPokeblockDevice_Gfx:: @ 8E77D90
	.incbin "graphics/interface/pokeblock_device.4bpp.lz"

	.align 2
gMenuPokeblockDevice_Pal:: @ 8E78050
	.incbin "graphics/interface/pokeblock_device.gbapal.lz"

	.align 2
gMenuPokeblock_Tilemap:: @ 8E78078
	.incbin "graphics/interface/pokeblock.bin.lz"

	.align 2
gPokeblock_Gfx::
	.incbin "graphics/pokeblock/pokeblock.4bpp.lz"

	.align 2
gPokeblockRed_Pal::
	.incbin "graphics/pokeblock/red.gbapal.lz"

	.align 2
gPokeblockBlue_Pal::
	.incbin "graphics/pokeblock/blue.gbapal.lz"

	.align 2
gPokeblockPink_Pal::
	.incbin "graphics/pokeblock/pink.gbapal.lz"

	.align 2
gPokeblockGreen_Pal::
	.incbin "graphics/pokeblock/green.gbapal.lz"

	.align 2
gPokeblockYellow_Pal::
	.incbin "graphics/pokeblock/yellow.gbapal.lz"

	.align 2
gPokeblockPurple_Pal::
	.incbin "graphics/pokeblock/purple.gbapal.lz"

	.align 2
gPokeblockIndigo_Pal::
	.incbin "graphics/pokeblock/indigo.gbapal.lz"

	.align 2
gPokeblockBrown_Pal::
	.incbin "graphics/pokeblock/brown.gbapal.lz"

	.align 2
gPokeblockLiteBlue_Pal::
	.incbin "graphics/pokeblock/liteblue.gbapal.lz"

	.align 2
gPokeblockOlive_Pal::
	.incbin "graphics/pokeblock/olive.gbapal.lz"

	.align 2
gPokeblockGray_Pal::
	.incbin "graphics/pokeblock/gray.gbapal.lz"

	.align 2
gPokeblockBlack_Pal::
	.incbin "graphics/pokeblock/black.gbapal.lz"

	.align 2
gPokeblockWhite_Pal::
	.incbin "graphics/pokeblock/white.gbapal.lz"

	.align 2
gPokeblockGold_Pal::
	.incbin "graphics/pokeblock/gold.gbapal.lz"

	.align 2
gUnknown_08E782FC:: @ 8E782FC
	.incbin "graphics/interface/pokeblock_feeding_bg_map.bin.lz"

	.align 2
gBerryCheck_Gfx:: @ 8E783FC
	.incbin "graphics/interface/check_berry.4bpp.lz"

	.align 2
gBerryCheck_Pal:: @ 8E7883C
	.incbin "graphics/interface/check_berry.gbapal.lz"

	.align 2
gUnknown_08E788E4:: @ 8E788E4
	.incbin "graphics/interface/berry_tag.bin.lz"

	.align 2
gUnknown_08E78A84:: @ 8E78A84
	.incbin "graphics/interface/berry_tag_title.bin.lz"

	.align 2
gBerryCheckCircle_Gfx:: @ 8E78BB4
	.incbin "graphics/interface/check_berry_circle.4bpp.lz"

@ 8E78D00
	.include "data/graphics/berries/graphics.inc"

	.align 2
gBattleAnimSpritePalette_282:: @ 8E7E7D0
	.incbin "graphics/battle_anims/sprites/282.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_282:: @ 8E7E7F8
	.incbin "graphics/battle_anims/sprites/282.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_270:: @ 8E7E9E0
	.incbin "graphics/battle_anims/sprites/270.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_270:: @ 8E7E9FC
	.incbin "graphics/battle_anims/sprites/270.4bpp.lz"

	.align 2
gBattleAnimSpritePalette_271:: @ 8E7EB24
	.incbin "graphics/battle_anims/sprites/271.gbapal.lz"

	.align 2
gBattleAnimSpriteSheet_271:: @ 8E7EB3C
	.incbin "graphics/battle_anims/sprites/271.4bpp.lz"

	.align 2
gCableCarBG_Pal:: @ 8E7EB9C
	.incbin "graphics/misc/cable_car_bg.gbapal"

	.align 2
gCableCar_Pal:: @ 8E7EC1C
	.incbin "graphics/misc/cable_car.gbapal"

	.align 2
gCableCarBG_Gfx:: @ 8E7EC3C
	.incbin "graphics/misc/cable_car_bg.4bpp.lz"

	.align 2
gCableCar_Gfx:: @ 8E80614
	.incbin "graphics/misc/cable_car.4bpp.lz"

	.align 2
gCableCarDoor_Gfx:: @ 8E80914
	.incbin "graphics/misc/cable_car_door.4bpp.lz"

	.align 2
gCableCarCord_Gfx:: @ 8E80944
	.incbin "graphics/misc/cable_car_cord.4bpp.lz"

	.align 2
gUnknown_08E8096C:: @ 8E8096C
	.incbin "graphics/unknown/unknown_E8096C.4bpp.lz"

	.align 2
gRouletteWheelTiles:: @ 8E81098
	.incbin "graphics/roulette/wheel.8bpp.lz"

	.align 2
gRouletteCenter_Gfx::
	.incbin "graphics/roulette/center.4bpp.lz"

	.align 2
gRouletteHeadersTiles:: @ 8E824BC
	.incbin "graphics/roulette/headers.4bpp.lz"

	.align 2
gRouletteCreditTiles:: @ 8E82AE0
	.incbin "graphics/roulette/credit.4bpp.lz"

	.align 2
gRouletteNumbersTiles:: @ 8E82C30
	.incbin "graphics/roulette/numbers.4bpp.lz"

	.align 2
gRouletteMultiplierTiles:: @ 8E82D14
	.incbin "graphics/roulette/multiplier.4bpp.lz"

	.align 2
gMailPalette_Orange:: @ 8E82E9C
	.incbin "graphics/mail/orange/palette.gbapal"

	.align 2
gMailPalette_Harbor:: @ 8E82EBC
	.incbin "graphics/mail/harbor/palette.gbapal"

	.align 2
gMailPalette_Glitter:: @ 8E82EDC
	.incbin "graphics/mail/glitter/palette.gbapal"

	.align 2
gMailPalette_Mech:: @ 8E82EFC
	.incbin "graphics/mail/mech/palette.gbapal"

	.align 2
gMailPalette_Wood:: @ 8E82F1C
	.incbin "graphics/mail/wood/palette.gbapal"

	.align 2
gMailPalette_Wave:: @ 8E82F3C
	.incbin "graphics/mail/wave/palette.gbapal"

	.align 2
gMailPalette_Bead:: @ 8E82F5C
	.incbin "graphics/mail/bead/palette.gbapal"

	.align 2
gMailPalette_Shadow:: @ 8E82F7C
	.incbin "graphics/mail/shadow/palette.gbapal"

	.align 2
gMailPalette_Tropic:: @ 8E82F9C
	.incbin "graphics/mail/tropic/palette.gbapal"

	.align 2
gMailPalette_Dream:: @ 8E82FBC
	.incbin "graphics/mail/dream/palette.gbapal"

	.align 2
gMailPalette_Fab:: @ 8E82FDC
	.incbin "graphics/mail/fab/palette.gbapal"

	.align 2
gMailPalette_Retro:: @ 8E82FFC
	.incbin "graphics/mail/retro/palette.gbapal"

	.align 2
gMailTiles_Orange:: @ 8E8301C
	.incbin "graphics/mail/orange/tiles.4bpp.lz"

	.align 2
gMailTiles_Harbor:: @ 8E831BC
	.incbin "graphics/mail/harbor/tiles.4bpp.lz"

	.align 2
gMailTiles_Glitter:: @ 8E832F8
	.incbin "graphics/mail/glitter/tiles.4bpp.lz"

	.align 2
gMailTiles_Mech:: @ 8E83508
	.incbin "graphics/mail/mech/tiles.4bpp.lz"

	.align 2
gMailTiles_Wood:: @ 8E835E0
	.incbin "graphics/mail/wood/tiles.4bpp.lz"

	.align 2
gMailTiles_Wave:: @ 8E837D8
	.incbin "graphics/mail/wave/tiles.4bpp.lz"

	.align 2
gMailTiles_Bead:: @ 8E83958
	.incbin "graphics/mail/bead/tiles.4bpp.lz"

	.align 2
gMailTiles_Shadow:: @ 8E83A00
	.incbin "graphics/mail/shadow/tiles.4bpp.lz"

	.align 2
gMailTiles_Tropic:: @ 8E83B90
	.incbin "graphics/mail/tropic/tiles.4bpp.lz"

	.align 2
gMailTiles_Dream:: @ 8E83CD0
	.incbin "graphics/mail/dream/tiles.4bpp.lz"

	.align 2
gMailTiles_Fab:: @ 8E83E38
	.incbin "graphics/mail/fab/tiles.4bpp.lz"

	.align 2
gMailTiles_Retro:: @ 8E83F88
	.incbin "graphics/mail/retro/tiles.4bpp.lz"

	.align 2
gMailTilemap_Orange:: @ 8E84228
	.incbin "graphics/mail/orange/map.bin.lz"

	.align 2
gMailTilemap_Harbor:: @ 8E84300
	.incbin "graphics/mail/harbor/map.bin.lz"

	.align 2
gMailTilemap_Glitter:: @ 8E843E0
	.incbin "graphics/mail/glitter/map.bin.lz"

	.align 2
gMailTilemap_Mech:: @ 8E844EC
	.incbin "graphics/mail/mech/map.bin.lz"

	.align 2
gMailTilemap_Wood:: @ 8E845C8
	.incbin "graphics/mail/wood/map.bin.lz"

	.align 2
gMailTilemap_Wave:: @ 8E846B8
	.incbin "graphics/mail/wave/map.bin.lz"

	.align 2
gMailTilemap_Bead:: @ 8E84798
	.incbin "graphics/mail/bead/map.bin.lz"

	.align 2
gMailTilemap_Shadow:: @ 8E84878
	.incbin "graphics/mail/shadow/map.bin.lz"

	.align 2
gMailTilemap_Tropic:: @ 8E84984
	.incbin "graphics/mail/tropic/map.bin.lz"

	.align 2
gMailTilemap_Dream:: @ 8E84A74
	.incbin "graphics/mail/dream/map.bin.lz"

	.align 2
gMailTilemap_Fab:: @ 8E84B6C
	.incbin "graphics/mail/fab/map.bin.lz"

	.align 2
gMailTilemap_Retro:: @ 8E84C84
	.incbin "graphics/mail/retro/map.bin.lz"

	.align 2
gNamingScreenBackButtonTiles:: @ 8E84D98
	.incbin "graphics/naming_screen/back_button.4bpp"

	.align 2
gNamingScreenRightPointingTriangleTiles:: @ 8E84F78
	.incbin "graphics/naming_screen/right_pointing_triangle.4bpp"

	.align 2
gNamingScreenOKButtonTiles:: @ 8E84F98
	.incbin "graphics/naming_screen/ok_button.4bpp"

	.align 2
gNamingScreenUnderscoreTiles:: @ 8E85178
	.incbin "graphics/naming_screen/underscore.4bpp"

	.align 2
gNamingScreenChangeKeyboardBoxTiles:: @ 8E85198
	.incbin "graphics/naming_screen/change_keyboard_box.4bpp"

	.align 2
gNamingScreenChangeKeyboardButtonTiles:: @ 8E85418
	.incbin "graphics/naming_screen/change_keyboard_button.4bpp"

	.space 128

	.align 2
gNamingScreenOthersTextTiles:: @ 8E85598
	.incbin "graphics/naming_screen/others_text.4bpp"

	.align 2
gNamingScreenCursorTiles:: @ 8E855F8
	.incbin "graphics/naming_screen/cursor.4bpp"

	.align 2
gNamingScreenActiveCursorSmallTiles:: @ 8E85678
	.incbin "graphics/naming_screen/active_cursor_small.4bpp"

	.align 2
gNamingScreenActiveCursorBigTiles:: @ 8E856F8
	.incbin "graphics/naming_screen/active_cursor_big.4bpp"

	.align 2
gNamingScreenLowerTextTiles:: @ 8E85778
	.incbin "graphics/naming_screen/lower_text.4bpp"

	.align 2
gNamingScreenUpperTextTiles:: @ 8E857D8
	.incbin "graphics/naming_screen/upper_text.4bpp"

	.space 352

	.align 2
gNamingScreenMenu_Gfx:: @ 8E85998
	.incbin "graphics/naming_screen/menu.4bpp"

	.align 2
gNamingScreenPalettes:: @ 8E86198
	.incbin "graphics/naming_screen/0.gbapal"
	.incbin "graphics/naming_screen/1.gbapal"
	.incbin "graphics/naming_screen/2.gbapal"
	.incbin "graphics/naming_screen/3.gbapal"
	.incbin "graphics/naming_screen/4.gbapal"
	.incbin "graphics/naming_screen/5.gbapal"

gUnknown_08E86258:: @ 8E86258
	.incbin "graphics/unknown/unknown_E86258.bin"

	.align 2
gPokedexMenu_Gfx:: @ 8E86758
	.incbin "graphics/pokedex/menu.4bpp.lz"

	.align 2
gPokedexMenu2_Gfx:: @ 8E874C8
	.incbin "graphics/pokedex/menu2.4bpp.lz"

	.align 2
gPokedexMenu_Pal:: @ 8E87AF4
	.incbin "graphics/pokedex/menu1.gbapal"

	.align 2
gPokedexMenu2_Pal:: @ 8E87B54
	.incbin "graphics/pokedex/menu2.gbapal"

	.align 2
gAreaUnknownTiles:: @ 8E87BB4
	.incbin "graphics/pokedex/area_unknown.4bpp.lz"

	.align 2
gAreaUnknownPalette:: @ 8E87D90
	.incbin "graphics/pokedex/area_unknown.gbapal"

	.align 2
gPokedexMenuSearch_Gfx:: @ 8E87DB0
	.incbin "graphics/pokedex/menu_search.4bpp.lz"

	.align 2
gPokedexMenuSearch_Pal:: @ 8E882D8
	.incbin "graphics/pokedex/menu3.gbapal"

	.align 2
gPokenavMainMenu_Gfx:: @ 8E88358
	.incbin "graphics/pokenav/mainmenu.4bpp.lz"

	.align 2
gPokenavMenuOptions_Gfx:: @ 8E884CC
	.incbin "graphics/pokenav/menu_options.4bpp.lz"

	.align 2
gPokenavMenuOptions1_Pal:: @ 8E88A28
	.incbin "graphics/pokenav/pokenav1.gbapal"

	.align 2
gPokenavMenuOptions2_Pal:: @ 8E88A48
	.incbin "graphics/pokenav/pokenav2.gbapal"

	.align 2
gPokenavMenuOptions3_Pal:: @ 8E88A68
	.incbin "graphics/pokenav/pokenav3.gbapal"

	.align 2
gPokenavHoennMapHeader_Gfx:: @ 8E88A88
	.incbin "graphics/pokenav/map_header.4bpp.lz"

	.align 2
gPokenavHoennMapMisc_Gfx:: @ 8E88D4C
	.incbin "graphics/pokenav/map_misc2.4bpp.lz"

	.align 2
gPokenavHoennMapSquares_Gfx:: @ 8E892C4
	.incbin "graphics/pokenav/map_squares.4bpp.lz"

	.align 2
gPokenavHoennMap1_Pal:: @ 8E89628
	.incbin "graphics/pokenav/map_menu.gbapal"

	.align 2
gPokenavHoennMapSquares_Pal:: @ 8E89648
	.incbin "graphics/pokenav/map_squares.gbapal"

	.align 2
gPokenavConditionMenu_Gfx:: @ 8E89668
	.incbin "graphics/pokenav/condition_menu.4bpp.lz"

	.align 2
gPokenavConditionMenu_Pal:: @ 8E89958
	.incbin "graphics/pokenav/condition1.gbapal"

	.align 2
gPokenavConditionMenuHeader_Gfx:: @ 8E89978
	.incbin "graphics/pokenav/condition_menu_header.4bpp.lz"

	.align 2
gPokenavConditionView_Gfx:: @ 8E89AD8
	.incbin "graphics/pokenav/condition_view.4bpp.lz"

	.align 2
gPokenavConditionMenu2_Pal:: @ 8E8A1C0
	.incbin "graphics/pokenav/condition2.gbapal"

	.align 2
gPokenavConditionMenuOptions_Gfx:: @ 8E8A1E0
	.incbin "graphics/pokenav/condition_menu_options.4bpp.lz"

	.align 2
gPokenavConditionMenuCancel_Gfx:: @ 8E8A498
	.incbin "graphics/pokenav/condition_cancel.4bpp"

	.align 2
gPokenavConditionPokeball_Pal:: @ 8E8A598
	.incbin "graphics/pokenav/condition3.gbapal"

	.align 2
gPokenavCondition4_Pal:: @ 8E8A5B8
	.incbin "graphics/pokenav/condition4.gbapal"

	.align 2
gPokenavConditionMenuOptions2_Gfx:: @ 8E8A5D8
	.incbin "graphics/pokenav/condition_menu_options2.4bpp.lz"

	.align 2
gPokenavConditionMenuMisc_Gfx:: @ 8E8A7C4
	.incbin "graphics/pokenav/condition_menu_misc.4bpp"

	.align 2
gPokenavCondition5_Pal:: @ 8E8ACE4
	.incbin "graphics/pokenav/condition5.gbapal"

	.align 2
gPokenavConditionSearch_Gfx:: @ 8E8AD04
	.incbin "graphics/pokenav/condition_search.4bpp.lz"

	.align 2
gPokenavCondition6_Pal:: @ 8E8B1C4
	.incbin "graphics/pokenav/condition6.gbapal"

	.align 2
gPokenavCondition7_Pal:: @ 8E8B1E4
	.incbin "graphics/pokenav/condition7.bin" @ another palette thats impossible to leave as native pal file due to 0xFFFF instead of 0x7FFF.

	.align 2
gPokenavTrainersEyesHeader_Gfx:: @ 8E8B204
	.incbin "graphics/pokenav/trainereyes.4bpp.lz"

	.align 2
gPokenavRibbonsHeader_Gfx:: @ 8E8B3A0
	.incbin "graphics/pokenav/ribbons.4bpp.lz"

	.align 2
gMenuTrainerCard_Gfx:: @ 8E8B4E0
	.incbin "graphics/misc/trainer_card.4bpp"

	.align 2
gMenuTrainerCard0Star_Pal::
	.incbin "graphics/misc/trainer_card_0star.gbapal"

	.align 2
gMenuTrainerCard1Star_Pal::
	.incbin "graphics/misc/trainer_card_1star.gbapal"

	.align 2
gMenuTrainerCard2Star_Pal::
	.incbin "graphics/misc/trainer_card_2star.gbapal"

	.align 2
gMenuTrainerCard3Star_Pal::
	.incbin "graphics/misc/trainer_card_3star.gbapal"

	.align 2
gMenuTrainerCard4Star_Pal::
	.incbin "graphics/misc/trainer_card_4star.gbapal"

gUnknown_08E8CAC0::
	.incbin "graphics/unknown/unknown_E8CAC0.bin"

gUnknown_08E8CFC0:: @ 8E8CFC0
	.incbin "graphics/unknown/unknown_E8CFC0.bin"

gUnknown_08E8D4C0::
	.incbin "graphics/unknown/unknown_E8D4C0.bin"

gUnknown_08E8D9C0:: @ 8E8D9C0
	.incbin "graphics/unknown/unknown_E8D9C0.bin"

	.align 2
gPSSMenuHeader_Gfx:: @ 8E8DEC0
	.incbin "graphics/pokemon_storage/header.4bpp.lz"

	.align 2
gPSSMenu1_Pal:: @ 8E8E0E8
	.incbin "graphics/pokemon_storage/menu1.gbapal"

	.align 2
gPSSMenu2_Pal:: @ 8E8E108
	.incbin "graphics/pokemon_storage/menu2.bin"

	.align 2
gPSSMenuHeader_Tilemap:: @ 8E8E128
	.incbin "graphics/pokemon_storage/header.bin.lz"

	.align 2
gPSSMenuMisc_Gfx:: @ 8E8E244
	.incbin "graphics/pokemon_storage/misc1.4bpp.lz"

	.align 2
gPSSMenu3_Pal:: @ 8E8E6A8
	.incbin "graphics/pokemon_storage/menu3.gbapal"

	.align 2
gPSSMenu4_Pal:: @ 8E8E6C8
	.incbin "graphics/pokemon_storage/menu4.gbapal"

	.align 2
gPSSMenuMisc_Tilemap:: @ 8E8E6E8
	.incbin "graphics/pokemon_storage/misc1.bin.lz"

	.align 2
gHallOfFame_Gfx:: @ 8E8E8B0
	.incbin "graphics/misc/hof.4bpp.lz"

	.align 2
gHallOfFame_Pal:: @ 8E8EA78
	.incbin "graphics/misc/hof.gbapal"

	.align 2
gMenuWordGroupIndicator_Gfx:: @ 8E8EA98
	.incbin "graphics/interface/wordgroup_indicator.4bpp.lz"

	.align 2
gMenuWordGroupFrame_Gfx:: @ 8E8EE18
	.incbin "graphics/interface/wordgroup_frame.4bpp.lz"

	.align 2
gMenuWordGroupIndicator_Pal:: @ 8E8F158
	.incbin "graphics/interface/wordgroup_indicator.gbapal"

	.align 2
gMenuWordGroupFrame1_Pal:: @ 8E8F178
	.incbin "graphics/interface/wordgroup_pink.gbapal"

	.align 2
gMenuWordGroupFrame2_Pal:: @ 8E8F198
	.incbin "graphics/interface/wordgroup_blue.gbapal"

	.align 2
gMiscClock_Gfx:: @ 8E8F1B8
	.incbin "graphics/misc/clock.4bpp.lz"

	.align 2
gMiscClockMale_Pal:: @ 8E8F804
	.incbin "graphics/misc/clock1.gbapal" @ male

	.align 2
gMiscClockFemale_Pal:: @ 8E8F824
	.incbin "graphics/misc/clock2.gbapal" @ female

	.align 2
gSlotMachine_Gfx:: @ 8E8F844
	.incbin "graphics/slot_machine/slots.4bpp.lz"

	.align 2
gBattleInterfaceStatusIcons_DynPal:: @ 8E903F8
	.incbin "graphics/battle_interface/status.gbapal"

	@ unused
	.incbin "graphics/unused/arrow.4bpp"

	.align 2
gBerryBlenderMarubatsuTiles:: @ 8E90618
	.incbin "graphics/berry_blender/marubatsu.4bpp"

	.align 2
gBerryBlenderParticlesTiles:: @ 8E90818
	.incbin "graphics/berry_blender/particles.4bpp"

	.space 0x120

	.align 2
gBerryBlenderCountdownNumbersTiles:: @ 8E90A18
	.incbin "graphics/berry_blender/countdown_numbers.4bpp"

	.align 2
gBerryBlenderStartTiles:: @ 8E91018
	.incbin "graphics/berry_blender/start.4bpp"

	.incbin "graphics/unknown/unknown_E91418.bin"

	.space 0x1E0

	.align 2
gBerryBlenderArrowTiles:: @ 8E91618
	.incbin "graphics/berry_blender/arrow.4bpp"

	.space 0x2C0

	.align 2
gBerryBlenderMiscPalette:: @ 8E920D8
	.incbin "graphics/berry_blender/misc.gbapal"

	.align 2
gBerryBlenderArrowPalette:: @ 8E920F8
	.incbin "graphics/berry_blender/arrow.gbapal"

	.align 2
gTilesetTiles_General:: @ 8E92118
	.incbin "data/tilesets/primary/general/tiles.4bpp.lz"

	.align 2
gTilesetPalettes_General:: @ 8E94310
	.incbin "data/tilesets/primary/general/palettes/00.gbapal"
	.incbin "data/tilesets/primary/general/palettes/01.gbapal"
	.incbin "data/tilesets/primary/general/palettes/02.gbapal"
	.incbin "data/tilesets/primary/general/palettes/03.gbapal"
	.incbin "data/tilesets/primary/general/palettes/04.gbapal"
	.incbin "data/tilesets/primary/general/palettes/05.gbapal"
	.incbin "data/tilesets/primary/general/palettes/06.gbapal"
	.incbin "data/tilesets/primary/general/palettes/07.gbapal"
	.incbin "data/tilesets/primary/general/palettes/08.gbapal"
	.incbin "data/tilesets/primary/general/palettes/09.gbapal"
	.incbin "data/tilesets/primary/general/palettes/10.gbapal"
	.incbin "data/tilesets/primary/general/palettes/11.gbapal"
	.incbin "data/tilesets/primary/general/palettes/12.gbapal"
	.incbin "data/tilesets/primary/general/palettes/13.gbapal"
	.incbin "data/tilesets/primary/general/palettes/14.gbapal"
	.incbin "data/tilesets/primary/general/palettes/15.gbapal"

gUnknown_08E94510:: @ 8E94510
	.incbin "graphics/unknown/unknown_E94510.bin"

gUnknown_08E94550:: @ 8E94550
	.incbin "graphics/unknown/unknown_E94550.bin"

gUnknown_08E94590:: @ 8E94590
	.incbin "graphics/unknown/unknown_E94590.bin"

gUnknown_08E945D0:: @ 8E945D0
	.incbin "graphics/interface/wordgroup_layout.bin"

gUnknown_08E94AD0:: @ 8E94AD0
	.incbin "graphics/unknown/unknown_E94AD0.bin"

	.align 2
gUnknown_08E953D0:: @ 8E953D0
	.incbin "graphics/unknown/unknown_E953D0.bin.lz"

	.align 2
gUnknown_08E954B0:: @ 8E954B0
	.incbin "graphics/misc/wallclock_edit.bin.lz"

	.align 2
gUnknown_08E95774:: @ 8E95774
	.incbin "graphics/misc/wallclock_view.bin.lz"

	.align 2
gUnknown_08E95A18:: @ 8E95A18
	.ifdef SAPPHIRE
	.incbin "graphics/slot_machine/sapphire.gbapal"
	.else
	.incbin "graphics/slot_machine/ruby.gbapal"
	.endif

gUnknown_08E95AB8:: @ 8E95AB8
	.incbin "graphics/unknown/unknown_E95AB8.bin"

gUnknown_08E95FB8:: @ 8E95FB8
	.incbin "graphics/slot_machine/slots_layout.bin"

gUnknown_08E964B8:: @ 8E964B8
	.incbin "graphics/contest/contest_words.bin"

gUnknown_08E966B8:: @ 8E966B8
	.incbin "graphics/unknown/unknown_E966B8.gbapal"

	.align 2
gMonIconPalettes:: @ 8E966D8
	.incbin "graphics/pokemon_icon_palettes/0.gbapal"
	.incbin "graphics/pokemon_icon_palettes/1.gbapal"
	.incbin "graphics/pokemon_icon_palettes/2.gbapal"

	.align 2
gUnknown_08E96738:: @ 8E96738
	.incbin "graphics/unknown/unknown_E96738.bin.lz"

	.align 2
gUnknown_08E96888:: @ 8E96888
	.incbin "graphics/pokedex/pokedex_list_menu.bin.lz"

	.align 2
gUnknown_08E96994:: @ 8E96994
	.incbin "graphics/pokedex/pokedex_listing_menu.bin.lz"

	.align 2
gUnknown_08E96ACC:: @ 8E96ACC
	.incbin "graphics/pokedex/pokedex_navbar.bin.lz"

	.align 2
gUnknown_08E96B58:: @ 8E96B58
	.incbin "graphics/pokedex/pokedex_navbar_3.bin.lz"

	.align 2
gUnknown_08E96BD4:: @ 8E96BD4
	.incbin "graphics/pokedex/pokedex_detail_layout.bin.lz"

	.align 2
gUnknown_08E96D2C:: @ 8E96D2C
	.incbin "graphics/unknown/unknown_E96D2C.bin.lz"

	.align 2
gBagScreenLabels_Tilemap:: @ 8E96EC8
	.incbin "graphics/interface/bag_screen_labels.bin"

	.align 2
gSlotMachineSpritePalette0:: @ 8E976C8
	.incbin "graphics/slot_machine/spr0.gbapal"

	.align 2
gSlotMachineSpritePalette1:: @ 8E976E8
	.incbin "graphics/slot_machine/spr1.gbapal"

	.align 2
gSlotMachineSpritePalette2:: @ 8E97708
	.ifdef SAPPHIRE
	.incbin "graphics/slot_machine/spr2_sapphire.gbapal"
	.else
	.incbin "graphics/slot_machine/spr2_ruby.gbapal"
	.endif

	.align 2
gSlotMachineSpritePalette3:: @ 8E97728
	.ifdef SAPPHIRE
	.incbin "graphics/slot_machine/spr3_sapphire.gbapal"
	.else
	.incbin "graphics/slot_machine/spr3_ruby.gbapal"
	.endif

	.align 2
gSlotMachineSpritePalette4:: @ 8E97748
	.incbin "graphics/slot_machine/spr4.gbapal"

	.align 2
gSlotMachineSpritePalette5:: @ 8E97768
	.incbin "graphics/slot_machine/spr5.gbapal"

	.align 2
gSlotMachineSpritePalette6:: @ 8E97788
	.incbin "graphics/slot_machine/spr6.gbapal"

	.align 2
gSlotMachineReelSymbol1Tiles::
	.incbin "graphics/slot_machine/reel_symbols/1.4bpp"

	.align 2
gSlotMachineReelSymbol2Tiles::
	.incbin "graphics/slot_machine/reel_symbols/2.4bpp"

	.align 2
gSlotMachineReelSymbol3Tiles::
	.incbin "graphics/slot_machine/reel_symbols/3.4bpp"

	.align 2
gSlotMachineReelSymbol4Tiles::
	.incbin "graphics/slot_machine/reel_symbols/4.4bpp"

	.align 2
gSlotMachineReelSymbol5Tiles::
	.incbin "graphics/slot_machine/reel_symbols/5.4bpp"

	.align 2
gSlotMachineReelSymbol6Tiles::
	.incbin "graphics/slot_machine/reel_symbols/6.4bpp"

	.align 2
gSlotMachineReelSymbol7Tiles::
	.incbin "graphics/slot_machine/reel_symbols/7.4bpp"

	.align 2
gSlotMachineNumber0Tiles::
	.incbin "graphics/slot_machine/numbers/0.4bpp"

	.align 2
gSlotMachineNumber1Tiles::
	.incbin "graphics/slot_machine/numbers/1.4bpp"

	.align 2
gSlotMachineNumber2Tiles::
	.incbin "graphics/slot_machine/numbers/2.4bpp"

	.align 2
gSlotMachineNumber3Tiles::
	.incbin "graphics/slot_machine/numbers/3.4bpp"

	.align 2
gSlotMachineNumber4Tiles::
	.incbin "graphics/slot_machine/numbers/4.4bpp"

	.align 2
gSlotMachineNumber5Tiles::
	.incbin "graphics/slot_machine/numbers/5.4bpp"

	.align 2
gSlotMachineNumber6Tiles::
	.incbin "graphics/slot_machine/numbers/6.4bpp"

	.align 2
gSlotMachineNumber7Tiles::
	.incbin "graphics/slot_machine/numbers/7.4bpp"

	.align 2
gSlotMachineNumber8Tiles::
	.incbin "graphics/slot_machine/numbers/8.4bpp"

	.align 2
gSlotMachineNumber9Tiles::
	.incbin "graphics/slot_machine/numbers/9.4bpp"

	.align 2
gSpriteImage_8E98828:: @ 8E98828
	.incbin "graphics/slot_machine/bolt.4bpp"

	.align 2
gSpriteImage_8E98848:: @ 8E98848
	.incbin "graphics/slot_machine/duck.4bpp"

	.align 2
gSpriteImage_8E98868:: @ 8E98868
	.incbin "graphics/slot_machine/smoke.4bpp"

	.align 2
gSpriteImage_8E988E8:: @ 8E988E8
	.incbin "graphics/slot_machine/reel_time_numbers/0.4bpp"

	.align 2
gSpriteImage_8E98968:: @ 8E98968
	.incbin "graphics/slot_machine/reel_time_numbers/1.4bpp"

	.align 2
gSpriteImage_8E989E8:: @ 8E989E8
	.incbin "graphics/slot_machine/reel_time_numbers/2.4bpp"

	.align 2
gSpriteImage_8E98A68:: @ 8E98A68
	.incbin "graphics/slot_machine/reel_time_numbers/3.4bpp"

	.align 2
gSpriteImage_8E98AE8:: @ 8E98AE8
	.incbin "graphics/slot_machine/reel_time_numbers/4.4bpp"

	.align 2
gSpriteImage_8E98B68:: @ 8E98B68
	.incbin "graphics/slot_machine/reel_time_numbers/5.4bpp"

	.align 2
gSpriteImage_8E98BE8:: @ 8E98BE8
	.incbin "graphics/slot_machine/large_bolt/0.4bpp"

	.align 2
gSpriteImage_8E98CE8:: @ 8E98CE8
	.incbin "graphics/slot_machine/large_bolt/1.4bpp"

	.align 2
gSpriteImage_8E98DE8:: @ 8E98DE8
	.incbin "graphics/slot_machine/reel_time_explosion/0.4bpp"

	.align 2
gSpriteImage_8E98FE8:: @ 8E98FE8
	.incbin "graphics/slot_machine/reel_time_explosion/1.4bpp"

	.align 2
gSpriteImage_8E991E8:: @ 8E991E8
	.incbin "graphics/slot_machine/shadow.4bpp"

	.align 2
gSpriteImage_8E993E8:: @ 8E993E8
	.incbin "graphics/slot_machine/pika_aura.4bpp"

	.align 2
gUnknownPalette_08E997E8:: @ 8E997E8
	.incbin "graphics/unknown/unknown_E997E8.gbapal"

	.align 2
gSpriteImage_8E99808:: @ 8E99808
	.incbin "graphics/unknown_sprites/8E99808.4bpp"

	.align 2
gSlotMachineReelTimeLights_Gfx:: @ 8E99848
	.incbin "graphics/slot_machine/reel_time_lights.4bpp.lz"

	.align 2
gUnknown_08E99FB0:: @ 8E99FB0
	.incbin "graphics/unknown/unknown_E99FB0.bin.lz"

	.align 2
gUnknown_08E9A100:: @ 8E9A100
	.incbin "graphics/pokenav/bottom_toolbar.bin"

gUnknown_08E9A300:: @ 8E9A300
	.incbin "graphics/unknown/unknown_E9A300.bin"

gUnknown_08E9AB00:: @ 8E9AB00
	.incbin "graphics/unknown/unknown_E9AB00.bin"

gUnknown_08E9AB40:: @ 8E9AB40
	.incbin "graphics/unknown/unknown_E9AB40.gbapal"

	.align 2
gUnknown_08E9AB60:: @ 8E9AB60
	.incbin "graphics/unknown/unknown_E9AB60.bin.lz"

	.align 2
gUnknown_08E9ABB4:: @ 8E9ABB4
	.incbin "graphics/unknown/unknown_E9ABB4.bin"

gUnknown_08E9AC2C:: @ 8E9AC2C
	.incbin "graphics/unknown/unknown_E9AC2C.bin"

	.align 2
gUnknown_08E9AC4C:: @ 8E9AC4C
	.incbin "graphics/pokenav/condition_screen.bin.lz"

@ text window frames

	.align 2
gTextWindowFrame1_Gfx::
	.incbin "graphics/text_window/1.4bpp"

	.align 2
gTextWindowFrame1_Pal::
	.incbin "graphics/text_window/1.gbapal"

	.align 2
gTextWindowFrame2_Gfx::
	.incbin "graphics/text_window/2.4bpp"

	.align 2
gTextWindowFrame2_Pal::
	.incbin "graphics/text_window/2.gbapal"

	.align 2
gTextWindowFrame3_Gfx::
	.incbin "graphics/text_window/3.4bpp"

	.align 2
gTextWindowFrame3_Pal::
	.incbin "graphics/text_window/3.gbapal"

	.align 2
gTextWindowFrame4_Gfx::
	.incbin "graphics/text_window/4.4bpp"

	.align 2
gTextWindowFrame4_Pal::
	.incbin "graphics/text_window/4.gbapal"

	.align 2
gTextWindowFrame5_Gfx::
	.incbin "graphics/text_window/5.4bpp"

	.align 2
gTextWindowFrame5_Pal::
	.incbin "graphics/text_window/5.gbapal"

	.align 2
gTextWindowFrame6_Gfx::
	.incbin "graphics/text_window/6.4bpp"

	.align 2
gTextWindowFrame6_Pal::
	.incbin "graphics/text_window/6.gbapal"

	.align 2
gTextWindowFrame7_Gfx::
	.incbin "graphics/text_window/7.4bpp"

	.align 2
gTextWindowFrame7_Pal::
	.incbin "graphics/text_window/7.gbapal"

	.align 2
gTextWindowFrame8_Gfx::
	.incbin "graphics/text_window/8.4bpp"

	.align 2
gTextWindowFrame8_Pal::
	.incbin "graphics/text_window/8.gbapal"

	.align 2
gTextWindowFrame9_Gfx::
	.incbin "graphics/text_window/9.4bpp"

	.align 2
gTextWindowFrame9_Pal::
	.incbin "graphics/text_window/9.gbapal"

	.align 2
gTextWindowFrame10_Gfx::
	.incbin "graphics/text_window/10.4bpp"

	.align 2
gTextWindowFrame10_Pal::
	.incbin "graphics/text_window/10.gbapal"

	.align 2
gTextWindowFrame11_Gfx::
	.incbin "graphics/text_window/11.4bpp"

	.align 2
gTextWindowFrame11_Pal::
	.incbin "graphics/text_window/11.gbapal"

	.align 2
gTextWindowFrame12_Gfx::
	.incbin "graphics/text_window/12.4bpp"

	.align 2
gTextWindowFrame12_Pal::
	.incbin "graphics/text_window/12.gbapal"

	.align 2
gTextWindowFrame13_Gfx::
	.incbin "graphics/text_window/13.4bpp"

	.align 2
gTextWindowFrame13_Pal::
	.incbin "graphics/text_window/13.gbapal"

	.align 2
gTextWindowFrame14_Gfx::
	.incbin "graphics/text_window/14.4bpp"

	.align 2
gTextWindowFrame14_Pal::
	.incbin "graphics/text_window/14.gbapal"

	.align 2
gTextWindowFrame15_Gfx::
	.incbin "graphics/text_window/15.4bpp"

	.align 2
gTextWindowFrame15_Pal::
	.incbin "graphics/text_window/15.gbapal"

	.align 2
gTextWindowFrame16_Gfx::
	.incbin "graphics/text_window/16.4bpp"

	.align 2
gTextWindowFrame16_Pal::
	.incbin "graphics/text_window/16.gbapal"

	.align 2
gTextWindowFrame17_Gfx::
	.incbin "graphics/text_window/17.4bpp"

	.align 2
gTextWindowFrame17_Pal::
	.incbin "graphics/text_window/17.gbapal"

	.align 2
gTextWindowFrame18_Gfx::
	.incbin "graphics/text_window/18.4bpp"

	.align 2
gTextWindowFrame18_Pal::
	.incbin "graphics/text_window/18.gbapal"

	.align 2
gTextWindowFrame19_Gfx::
	.incbin "graphics/text_window/19.4bpp"

	.align 2
gTextWindowFrame19_Pal::
	.incbin "graphics/text_window/19.gbapal"

	.align 2
gTextWindowFrame20_Gfx::
	.incbin "graphics/text_window/20.4bpp"

	.align 2
gTextWindowFrame20_Pal::
	.incbin "graphics/text_window/20.gbapal"

	.align 2
gUnknown_08E9C6DC:: @ 8E9C6DC
	.incbin "graphics/unknown/unknown_E9C6DC.bin.lz"

	.align 2
gIntroCopyright_Gfx:: @ 8E9C798
	.incbin "graphics/intro/copyright.4bpp.lz"

	.align 2
gIntroCopyright_Pal:: @ 8E9CA24
	.incbin "graphics/intro/copyright.gbapal"

	.align 2
gIntroCopyright_Tilemap:: @ 8E9CA44
	.incbin "graphics/intro/copyright.bin"

	.align 2
gInterviewOutlineCursorTiles:: @ 8E9CF44
	.incbin "graphics/misc/interview_outline_cursor.4bpp"

	.align 2
gTitleScreenPressStart_Gfx:: @ 8E9D644
	.incbin "graphics/title_screen/press_start.4bpp.lz"

	.align 2
gTitleScreenLogoShinePalette:: @ E9D8E4
	.incbin "graphics/title_screen/logo_shine.gbapal"

	.align 2
gUnknown_08E9D8CC:: @ 8E9D8CC
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/pokemon_sapphire.8bpp.lz"
	.else
	.incbin "graphics/title_screen/pokemon_ruby.8bpp.lz"
	.endif

	.align 2
gVersionTiles::
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/sapphireversion.8bpp.lz"
	.else
	.incbin "graphics/title_screen/rubyversion.8bpp.lz"
	.endif

	.align 2
gUnknown_08E9F624:: @ 8E9F624
	.ifdef SAPPHIRE
	.incbin "graphics/title_screen/logo_sapphire.gbapal" @ for some reason, the sapphire palette is different even though the visible colors for the logo and version are not, weird
	.else
	.incbin "graphics/title_screen/logo_ruby.gbapal"
	.endif

	.align 2
gUnknown_08E9F7E4:: @ 8E9F7E4
	.incbin "graphics/unknown/unknown_E9F7E4.bin.lz"

	.align 2
gPokenavArrowsPalette::
	.incbin "graphics/pokenav/arrows.gbapal"

gUnknown_08E9F988:: @ 8E9F988
	.incbin "graphics/unknown/unknown_E9F988.gbapal"

	.align 2
gPokenavArrow_Gfx:: @ 8E9F9A8
	.incbin "graphics/pokenav/arrow2.4bpp"

gUnknown_08E9F9E8:: @ 8E9F9E8
	.incbin "graphics/unknown/unknown_E9F9E8.gbapal"

	.align 2
gPokenavConditionSearch2_Gfx:: @ 8E9FA08
	.incbin "graphics/pokenav/condition_search2.4bpp.lz"

	.align 2
gPokenavRibbonView_Pal:: @ 8E9FAFC
	.incbin "graphics/pokenav/ribbon_view.pal.bin"

	.align 2
gPokenavRibbonView_Gfx:: @ 8E9FB1C
	.incbin "graphics/pokenav/ribbon_view.4bpp.lz"

	.align 2
gUnknown_08E9FBA0:: @ 8E9FBA0
	.incbin "graphics/unknown/unknown_E9FBA0.bin.lz"

	.align 2
gUnknown_08E9FC64:: @ 8E9FC64
	.incbin "graphics/unknown/unknown_E9FC64.bin.lz"

	.align 2
gUnknown_08E9FD1C:: @ 8E9FD1C
	.incbin "graphics/unknown/unknown_E9FD1C.bin"

gUnknown_08E9FD64:: @ 8E9FD64
	.incbin "graphics/unknown/unknown_E9FD64.bin"

gUnknown_08E9FE54:: @ 8E9FE54
	.incbin "graphics/unknown/unknown_E9FE54.bin"

	.align 2
gUnknown_08E9FEB4:: @ 8E9FEB4
	.incbin "graphics/unknown/unknown_E9FEB4.bin.lz"

	.align 2
gUnknown_08E9FF58:: @ 8E9FF58
	.incbin "graphics/unknown/unknown_E9FF58.bin.lz"

	.align 2
gPokenavRibbonPokeView_Gfx:: @ 8EA0028
	.incbin "graphics/pokenav/ribbon_pokeview.4bpp"

	.align 2
gDialogueFrame_Gfx:: @ 8EA0108
	.incbin "graphics/text_window/message_box.4bpp"

	.align 2
gUnknown_08EA02C8:: @ 8EA02C8
	.incbin "graphics/trade/menu.gbapal"
	.incbin "graphics/trade/stripes.gbapal"
	.incbin "graphics/trade/stripes.gbapal"

	.align 2
gUnknown_08EA0328:: @ 8EA0328
	.incbin "graphics/trade/selected_mon.gbapal"

	.align 2
gUnknown_08EA0348:: @ 8EA0348
	.incbin "graphics/trade/menu.4bpp"

	.align 2
gUnknown_08EA15C8:: @ 8EA15C8
	.incbin "graphics/trade/menu_map.bin"

	.align 2
gTradeMonBoxTilemap:: @ 8EA1DC8
	.incbin "graphics/trade/mon_box_map.bin"

	.align 2
gUnknown_08EA1DEC:: @ 8EA1DEC
	.incbin "graphics/trade/selected_mon.4bpp"

	.incbin "graphics/unknown/unknown_EA25EC.bin"

	.align 2
gCreditsCopyrightEnd_Gfx:: @ 8EA260C
	.incbin "graphics/misc/end_copyright.4bpp.lz"

	.align 2
gDecoration10000_Gfx:: @ 8EA2A44
	.incbin "graphics/misc/decoration_10000.4bpp"

	.align 2
gFont3LatinGlyphs:: @ 8EA2C44
.ifdef ENGLISH
	.if REVISION >= 1
	.incbin "graphics/fonts/font3_lat_rev1.4bpp"
	.else
	.incbin "graphics/fonts/font3_lat.4bpp"
	.endif
.else
	.incbin "graphics/fonts/font3_lat.4bpp"
.endif

	.align 2
gFont4LatinGlyphs:: @ 8EA6BC4
.ifdef ENGLISH
	.if REVISION >= 1
	.incbin "graphics/fonts/font4_lat_rev1.4bpp"
	.else
	.incbin "graphics/fonts/font4_lat.4bpp"
	.endif
.else
	.incbin "graphics/fonts/font4_lat.4bpp.bin"
.endif

	.align 2
gFont3JapaneseGlyphs:: @ 8EA8744
	.incbin "graphics/fonts/font3_jpn.4bpp"

	.align 2
gFont4JapaneseGlyphs:: @ 8EAC6C4
	.incbin "graphics/fonts/font4_jpn.4bpp"

.ifdef GERMAN
	.align 2
gSummaryScreenTextTiles::
	.incbin "graphics/summary_screen/text.4bpp"

	.align 2
gUnknown_0839FA7C::
	.incbin "graphics/pokedex/noball.4bpp.lz"

	.align 2
gIntroTiles::
	.incbin "graphics/intro/intro.4bpp.lz"

	.align 2
ConditionUpDownTiles::
	.incbin "graphics/misc/condition_up_down.4bpp"

	.align 2
ConditionUpDownPalette::
	.incbin "graphics/misc/condition_up_down.gbapal"

	.align 2
RouletteSpritePalette_01::
	.incbin "graphics/roulette/shadow.gbapal"

	.align 2
RouletteSpritePalette_02::
	.incbin "graphics/roulette/ball.gbapal"

	.align 2
RouletteSpritePalette_03::
	.incbin "graphics/roulette/ball_counter.gbapal"

	.align 2
RouletteSpritePalette_04::
	.incbin "graphics/roulette/cursor.gbapal"

	.align 2
RouletteSpritePalette_05::
	.incbin "graphics/roulette/credit.gbapal"

	.align 2
RouletteSpritePalette_06::
	.incbin "graphics/roulette/shroomish.gbapal"

	.align 2
RouletteSpritePalette_07::
	.incbin "graphics/roulette/tailow.gbapal"

	.align 2
RouletteSpritePalette_08::
	.incbin "graphics/roulette/poke_icons.gbapal"

	.align 2
RouletteSpritePalette_09::
	.incbin "graphics/roulette/wynaut.gbapal"

	.align 2
RouletteSpritePalette_10::
	.incbin "graphics/roulette/azurill.gbapal"

	.align 2
RouletteSpritePalette_11::
	.incbin "graphics/roulette/skitty.gbapal"

	.align 2
RouletteSpritePalette_12::
	.incbin "graphics/roulette/makuhita.gbapal"

	.align 2
RouletteSpritePalette_13::
	.incbin "graphics/roulette/83F907C.gbapal"

	.align 2
RouletteSpritePalette_14::
	.incbin "graphics/roulette/83F909C.gbapal"

	.align 2
RouletteSpritePalette_15::
	.incbin "graphics/roulette/83F90BC.gbapal"

	.align 2
RouletteSpritePalette_16::
	.incbin "graphics/roulette/83F90DC.gbapal"

	.align 2
gTilesetPalettes_Shop::
	.incbin "data/tilesets/secondary/shop/palettes/00.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/01.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/02.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/03.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/04.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/05.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/06.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/07.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/08.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/09.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/10.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/11.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/12.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/13.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/14.gbapal"
	.incbin "data/tilesets/secondary/shop/palettes/15.gbapal"

	.align 2
gTilesetTiles_Shop::
	.incbin "data/tilesets/secondary/shop/tiles.4bpp.lz"

	.align 2
gUnknown_083FAF1C::
	.incbin "graphics/pokedex/cry_meter.gbapal"

	.align 2
gUnknown_083FAF3C::
	.incbin "graphics/pokedex/cry_meter.4bpp.lz"

	.align 2
gUnknown_083FAE7C::
	.incbin "graphics/pokedex/cry_meter_map.bin"
.endif
