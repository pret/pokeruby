#include "global.h"

// Menu window and arrows.
const u16 gBattleTextboxTiles[] = INCBIN_U16("graphics/interface/menu.4bpp.lz");
const u16 gBattleTextboxPalette[] = INCBIN_U16("graphics/interface/menu.gbapal.lz");
const u16 gBattleTextboxTilemap[] = INCBIN_U16("graphics/interface/menu_map.bin");

const u8 gMonFrontPic_CircledQuestionMark[] = INCBIN_U8("graphics/pokemon/circled_question_mark/front.4bpp.lz");
const u8 gMonBackPic_CircledQuestionMark[] = INCBIN_U8("graphics/pokemon/circled_question_mark/back.4bpp.lz");
const u16 gMonPalette_CircledQuestionMark[] = INCBIN_U16("graphics/pokemon/circled_question_mark/normal.gbapal.lz");
const u16 gMonShinyPalette_CircledQuestionMark[] = INCBIN_U16("graphics/pokemon/circled_question_mark/shiny.gbapal.lz");

// The test menu debug battle tileset. This uses the old Crystal
// charmap and rendering method (it uses tiles instead of text).
// The non-English releases use translated graphics.
#if DEBUG_FIX || !ENGLISH
const u8 gDebugBattleCharmap_Gfx_lz[] = INCBIN_U8("graphics/debug/debug_battle_charmap_en.4bpp.lz");
const u8 gDebugBattleCharmap_Tilemap_lz[] = INCBIN_U8("graphics/debug/debug_battle_charmap_en.bin.lz");
const u8 gDebugBattleCharmap_Pal_lz[] = INCBIN_U8("graphics/debug/debug_battle_charmap_en.gbapal.lz");
#else
const u8 gDebugBattleCharmap_Gfx_lz[] = INCBIN_U8("graphics/debug/debug_battle_charmap_jp.4bpp.lz");
const u8 gDebugBattleCharmap_Tilemap_lz[] = INCBIN_U8("graphics/debug/debug_battle_charmap_jp.bin.lz");
const u8 gDebugBattleCharmap_Pal_lz[] = INCBIN_U8("graphics/debug/debug_battle_charmap_jp.gbapal.lz");
#endif

const u8 gSmokescreenImpactTiles[] = INCBIN_U8("graphics/battle_anims/sprites/smokescreen_impact.4bpp.lz");
const u16 gSmokescreenImpactPalette[] = INCBIN_U16("graphics/battle_anims/sprites/smokescreen_impact.gbapal.lz");

const u8 gInterfaceGfx_PokeBall[] = INCBIN_U8("graphics/interface/ball/poke.4bpp.lz");
const u8 gInterfacePal_PokeBall[] = INCBIN_U8("graphics/interface/ball/poke.gbapal.lz");
const u8 gInterfaceGfx_GreatBall[] = INCBIN_U8("graphics/interface/ball/great.4bpp.lz");
const u8 gInterfacePal_GreatBall[] = INCBIN_U8("graphics/interface/ball/great.gbapal.lz");
const u8 gInterfaceGfx_SafariBall[] = INCBIN_U8("graphics/interface/ball/safari.4bpp.lz");
const u8 gInterfacePal_SafariBall[] = INCBIN_U8("graphics/interface/ball/safari.gbapal.lz");
const u8 gInterfaceGfx_UltraBall[] = INCBIN_U8("graphics/interface/ball/ultra.4bpp.lz");
const u8 gInterfacePal_UltraBall[] = INCBIN_U8("graphics/interface/ball/ultra.gbapal.lz");
const u8 gInterfaceGfx_MasterBall[] = INCBIN_U8("graphics/interface/ball/master.4bpp.lz");
const u8 gInterfacePal_MasterBall[] = INCBIN_U8("graphics/interface/ball/master.gbapal.lz");
const u8 gInterfaceGfx_NetBall[] = INCBIN_U8("graphics/interface/ball/net.4bpp.lz");
const u8 gInterfacePal_NetBall[] = INCBIN_U8("graphics/interface/ball/net.gbapal.lz");
const u8 gInterfaceGfx_DiveBall[] = INCBIN_U8("graphics/interface/ball/dive.4bpp.lz");
const u8 gInterfacePal_DiveBall[] = INCBIN_U8("graphics/interface/ball/dive.gbapal.lz");
const u8 gInterfaceGfx_NestBall[] = INCBIN_U8("graphics/interface/ball/nest.4bpp.lz");
const u8 gInterfacePal_NestBall[] = INCBIN_U8("graphics/interface/ball/nest.gbapal.lz");
const u8 gInterfaceGfx_RepeatBall[] = INCBIN_U8("graphics/interface/ball/repeat.4bpp.lz");
const u8 gInterfacePal_RepeatBall[] = INCBIN_U8("graphics/interface/ball/repeat.gbapal.lz");
const u8 gInterfaceGfx_TimerBall[] = INCBIN_U8("graphics/interface/ball/timer.4bpp.lz");
const u8 gInterfacePal_TimerBall[] = INCBIN_U8("graphics/interface/ball/timer.gbapal.lz");
const u8 gInterfaceGfx_LuxuryBall[] = INCBIN_U8("graphics/interface/ball/luxury.4bpp.lz");
const u8 gInterfacePal_LuxuryBall[] = INCBIN_U8("graphics/interface/ball/luxury.gbapal.lz");
const u8 gInterfaceGfx_PremierBall[] = INCBIN_U8("graphics/interface/ball/premier.4bpp.lz");
const u8 gInterfacePal_PremierBall[] = INCBIN_U8("graphics/interface/ball/premier.gbapal.lz");

const u8 gUnknown_08D030D0[] = INCBIN_U8("graphics/interface/ball_open.4bpp.lz");
const u8 gBlankGfxCompressed[] = INCBIN_U8("graphics/interface/blank.4bpp.lz");

const u8 gBattleAnimSpriteSheet_146[] = INCBIN_U8("graphics/battle_anims/sprites/146.4bpp.lz");
const u8 gBattleAnimSpriteSheet_000[] = INCBIN_U8("graphics/battle_anims/sprites/000.4bpp.lz");
const u8 gBattleAnimSpriteSheet_003[] = INCBIN_U8("graphics/battle_anims/sprites/003.4bpp.lz");
const u8 gBattleAnimSpriteSheet_004[] = INCBIN_U8("graphics/battle_anims/sprites/004.4bpp.lz");
const u8 gBattleAnimSpriteSheet_005[] = INCBIN_U8("graphics/battle_anims/sprites/005.4bpp.lz");
const u8 gBattleAnimSpriteSheet_006[] = INCBIN_U8("graphics/battle_anims/sprites/006.4bpp.lz");
const u8 gBattleAnimSpritePalette_115[] = INCBIN_U8("graphics/battle_anims/sprites/115.gbapal.lz");
const u8 gBattleAnimSpritePalette_000[] = INCBIN_U8("graphics/battle_anims/sprites/000.gbapal.lz");
const u8 gBattleAnimSpritePalette_003[] = INCBIN_U8("graphics/battle_anims/sprites/003.gbapal.lz");
const u8 gBattleAnimSpritePalette_004[] = INCBIN_U8("graphics/battle_anims/sprites/004.gbapal.lz");
const u8 gBattleAnimSpritePalette_005[] = INCBIN_U8("graphics/battle_anims/sprites/005.gbapal.lz");
const u8 gBattleAnimSpritePalette_006[] = INCBIN_U8("graphics/battle_anims/sprites/006.gbapal.lz");
const u8 gBattleAnimSpriteSheet_161[] = INCBIN_U8("graphics/battle_anims/sprites/161.4bpp.lz");
const u8 gBattleAnimSpritePalette_161[] = INCBIN_U8("graphics/battle_anims/sprites/161.gbapal.lz");
const u8 gBattleAnimSpriteSheet_007[] = INCBIN_U8("graphics/battle_anims/sprites/007.4bpp.lz");
const u8 gBattleAnimSpritePalette_007[] = INCBIN_U8("graphics/battle_anims/sprites/007.gbapal.lz");
const u8 gBattleAnimSpriteSheet_008[] = INCBIN_U8("graphics/battle_anims/sprites/008.4bpp.lz");
const u8 gBattleAnimSpritePalette_008[] = INCBIN_U8("graphics/battle_anims/sprites/008.gbapal.lz");
const u8 gBattleAnimSpritePalette_010[] = INCBIN_U8("graphics/battle_anims/sprites/010.gbapal.lz");
const u8 gBattleAnimSpriteSheet_010[] = INCBIN_U8("graphics/battle_anims/sprites/010.4bpp.lz");
const u8 gBattleAnimSpriteSheet_009[] = INCBIN_U8("graphics/battle_anims/sprites/009.4bpp.lz");
const u8 gBattleAnimSpritePalette_009[] = INCBIN_U8("graphics/battle_anims/sprites/009.gbapal.lz");
const u8 gBattleAnimSpriteSheet_011[] = INCBIN_U8("graphics/battle_anims/sprites/011.4bpp.lz");
const u8 gBattleAnimSpritePalette_011[] = INCBIN_U8("graphics/battle_anims/sprites/011.gbapal.lz");
const u8 gBattleAnimSpriteSheet_012[] = INCBIN_U8("graphics/battle_anims/sprites/012.4bpp.lz");
const u8 gBattleAnimSpritePalette_012[] = INCBIN_U8("graphics/battle_anims/sprites/012.gbapal.lz");
const u8 gBattleAnimSpriteSheet_152[] = INCBIN_U8("graphics/battle_anims/sprites/152.4bpp.lz");
const u8 gBattleAnimSpritePalette_152[] = INCBIN_U8("graphics/battle_anims/sprites/152.gbapal.lz");
const u8 gBattleAnimSpriteSheet_013[] = INCBIN_U8("graphics/battle_anims/sprites/013.4bpp.lz");
const u8 gBattleAnimSpritePalette_013[] = INCBIN_U8("graphics/battle_anims/sprites/013.gbapal.lz");
const u8 gBattleAnimSpriteSheet_015[] = INCBIN_U8("graphics/battle_anims/sprites/015.4bpp.lz");
const u8 gBattleAnimSpritePalette_015[] = INCBIN_U8("graphics/battle_anims/sprites/015.gbapal.lz");
const u8 gBattleAnimSpriteSheet_016[] = INCBIN_U8("graphics/battle_anims/sprites/016.4bpp.lz");
const u8 gBattleAnimSpritePalette_016[] = INCBIN_U8("graphics/battle_anims/sprites/016.gbapal.lz");
const u8 gBattleAnimSpriteSheet_017[] = INCBIN_U8("graphics/battle_anims/sprites/017.4bpp.lz");

const u8 gUknown_08D04388[] = INCBIN_U8("graphics/unknown/unknown_D04388.4bpp.lz");

const u8 gBattleAnimSpritePalette_019[] = INCBIN_U8("graphics/battle_anims/sprites/019.gbapal.lz");
const u8 gBattleAnimSpriteSheet_019[] = INCBIN_U8("graphics/battle_anims/sprites/019.4bpp.lz");
const u8 gBattleAnimSpriteSheet_020[] = INCBIN_U8("graphics/battle_anims/sprites/020.4bpp.lz");
const u8 gBattleAnimSpritePalette_020[] = INCBIN_U8("graphics/battle_anims/sprites/020.gbapal.lz");
const u8 gBattleAnimSpritePalette_023[] = INCBIN_U8("graphics/battle_anims/sprites/023.gbapal.lz");
const u8 gBattleAnimSpriteSheet_023[] = INCBIN_U8("graphics/battle_anims/sprites/023.4bpp.lz");

const u8 gUnusedBattleAnim_023[] = INCBIN_U8("graphics/unused/battle_anim_023.gbapal.lz");
const u8 gUnusedMusicNotes[] = INCBIN_U8("graphics/unused/music_notes.4bpp.lz");

const u8 gBattleAnimSpritePalette_021[] = INCBIN_U8("graphics/battle_anims/sprites/021.gbapal.lz");
const u8 gBattleAnimSpriteSheet_021[] = INCBIN_U8("graphics/battle_anims/sprites/021.4bpp.lz");
const u8 gBattleAnimSpritePalette_022[] = INCBIN_U8("graphics/battle_anims/sprites/022.gbapal.lz");
const u8 gBattleAnimSpritePalette_025[] = INCBIN_U8("graphics/battle_anims/sprites/025.gbapal.lz");
const u8 gBattleAnimSpriteSheet_025[] = INCBIN_U8("graphics/battle_anims/sprites/025.4bpp.lz");
const u8 gBattleAnimSpriteSheet_024[] = INCBIN_U8("graphics/battle_anims/sprites/024.4bpp.lz");
const u8 gBattleAnimSpritePalette_024[] = INCBIN_U8("graphics/battle_anims/sprites/024.gbapal.lz");
const u8 gBattleAnimSpriteSheet_031[] = INCBIN_U8("graphics/battle_anims/sprites/031.4bpp.lz");
const u8 gBattleAnimSpritePalette_031[] = INCBIN_U8("graphics/battle_anims/sprites/031.gbapal.lz");
const u8 gBattleAnimSpritePalette_032[] = INCBIN_U8("graphics/battle_anims/sprites/032.gbapal.lz");
const u8 gBattleAnimSpriteSheet_032[] = INCBIN_U8("graphics/battle_anims/sprites/032.4bpp.lz");
const u8 gBattleAnimSpriteSheet_026[] = INCBIN_U8("graphics/battle_anims/sprites/026.4bpp.lz");
const u8 gBattleAnimSpritePalette_026[] = INCBIN_U8("graphics/battle_anims/sprites/026.gbapal.lz");
const u8 gBattleAnimSpritePalette_027[] = INCBIN_U8("graphics/battle_anims/sprites/027.gbapal.lz");
const u8 gBattleAnimSpriteSheet_027[] = INCBIN_U8("graphics/battle_anims/sprites/027.4bpp.lz");
const u8 gBattleAnimSpritePalette_028[] = INCBIN_U8("graphics/battle_anims/sprites/028.gbapal.lz");
const u8 gBattleAnimSpriteSheet_028[] = INCBIN_U8("graphics/battle_anims/sprites/028.4bpp.lz");
const u8 gBattleAnimSpriteSheet_029[] = INCBIN_U8("graphics/battle_anims/sprites/029.4bpp.lz");
const u8 gBattleAnimSpritePalette_029[] = INCBIN_U8("graphics/battle_anims/sprites/029.gbapal.lz");
const u8 gBattleAnimSpriteSheet_030[] = INCBIN_U8("graphics/battle_anims/sprites/030.4bpp.lz");
const u8 gBattleAnimSpritePalette_030[] = INCBIN_U8("graphics/battle_anims/sprites/030.gbapal.lz");
const u8 gBattleAnimSpritePalette_033[] = INCBIN_U8("graphics/battle_anims/sprites/033.gbapal.lz");
const u8 gBattleAnimSpriteSheet_033[] = INCBIN_U8("graphics/battle_anims/sprites/033.4bpp.lz");
const u8 gBattleAnimSpriteSheet_034[] = INCBIN_U8("graphics/battle_anims/sprites/034.4bpp.lz");
const u8 gBattleAnimSpriteSheet_035[] = INCBIN_U8("graphics/battle_anims/sprites/035.4bpp.lz");
const u8 gBattleAnimSpritePalette_036[] = INCBIN_U8("graphics/battle_anims/sprites/036.gbapal.lz");
const u8 gBattleAnimSpriteSheet_036[] = INCBIN_U8("graphics/battle_anims/sprites/036.4bpp.lz");
const u8 gBattleAnimSpriteSheet_037[] = INCBIN_U8("graphics/battle_anims/sprites/037.4bpp.lz");

const u8 gUnknown_08D07B68[] = INCBIN_U8("graphics/unknown/unknown_D07B68.4bpp.lz");
const u8 gUnknown_08D07B68_pal[] = INCBIN_U8("graphics/unknown/unknown_D07B68.gbapal.lz");
const u8 gUnknown_08D07B68_2[] = INCBIN_U8("graphics/unknown/unknown_D07B68_2.gbapal.lz");

// old battle interface data, unused
const u8 unused_gfx_obi1[] = INCBIN_U8("graphics/unused/obi1.4bpp.lz");
const u8 unused_gfx_obi_palpak1[] = INCBIN_U8("graphics/unused/obi_palpak1.gbapal.lz"); // palettes 1-3
const u8 unused_gfx_old_pal4[] = INCBIN_U8("graphics/unused/old_pal4.gbapal.lz"); // 4 is by itself
const u8 unused_gfx_obi_palpak3[] = INCBIN_U8("graphics/unused/obi_palpak3.gbapal.lz"); // palettes 5-7
const u8 unused_gfx_obi2[] = INCBIN_U8("graphics/unused/obi2.4bpp.lz");
const u8 unused_gfx_old_battle_interface_tilemap[] = INCBIN_U8("graphics/unused/old_battle_interface_tilemap.bin.lz");

const u8 gBattleAnimSpritePalette_038[] = INCBIN_U8("graphics/battle_anims/sprites/038.gbapal.lz");
const u8 gBattleAnimSpritePalette_039[] = INCBIN_U8("graphics/battle_anims/sprites/039.gbapal.lz");
const u8 gBattleAnimSpriteSheet_038[] = INCBIN_U8("graphics/battle_anims/sprites/038.4bpp.lz");
const u8 gBattleAnimSpriteSheet_039[] = INCBIN_U8("graphics/battle_anims/sprites/039.4bpp.lz");
const u8 gBattleAnimSpriteSheet_040[] = INCBIN_U8("graphics/battle_anims/sprites/040.4bpp.lz");
const u8 gBattleAnimSpriteSheet_041[] = INCBIN_U8("graphics/battle_anims/sprites/041.4bpp.lz");
const u8 gBattleAnimSpriteSheet_042[] = INCBIN_U8("graphics/battle_anims/sprites/042.4bpp.lz");
const u8 gBattleAnimSpritePalette_042[] = INCBIN_U8("graphics/battle_anims/sprites/042.gbapal.lz");
const u8 gBattleAnimSpriteSheet_043[] = INCBIN_U8("graphics/battle_anims/sprites/043.4bpp.lz");
const u8 gBattleAnimSpritePalette_043[] = INCBIN_U8("graphics/battle_anims/sprites/043.gbapal.lz");
const u8 gBattleAnimSpritePalette_044[] = INCBIN_U8("graphics/battle_anims/sprites/044.gbapal.lz");
const u8 gBattleAnimSpriteSheet_044[] = INCBIN_U8("graphics/battle_anims/sprites/044.4bpp.lz");
const u8 gBattleAnimSpritePalette_045[] = INCBIN_U8("graphics/battle_anims/sprites/045.gbapal.lz");
const u8 gBattleAnimSpriteSheet_045[] = INCBIN_U8("graphics/battle_anims/sprites/045.4bpp.lz");

const u8 gUnknown_08D09C48[] = INCBIN_U8("graphics/interface/hp_numbers.4bpp.lz");

const u8 gBattleAnimSpriteSheet_046[] = INCBIN_U8("graphics/battle_anims/sprites/046.4bpp.lz");
const u8 gBattleAnimSpritePalette_046[] = INCBIN_U8("graphics/battle_anims/sprites/046.gbapal.lz");
const u8 gBattleAnimSpritePalette_047[] = INCBIN_U8("graphics/battle_anims/sprites/047.gbapal.lz");
const u8 gBattleAnimSpriteSheet_048[] = INCBIN_U8("graphics/battle_anims/sprites/048.4bpp.lz");
const u8 gBattleAnimSpritePalette_048[] = INCBIN_U8("graphics/battle_anims/sprites/048.gbapal.lz");
const u8 gBattleAnimSpritePalette_049[] = INCBIN_U8("graphics/battle_anims/sprites/049.gbapal.lz");
const u8 gBattleAnimSpritePalette_050[] = INCBIN_U8("graphics/battle_anims/sprites/050.gbapal.lz");
const u8 gBattleAnimSpriteSheet_050[] = INCBIN_U8("graphics/battle_anims/sprites/050.4bpp.lz");
const u8 gBattleAnimSpriteSheet_051[] = INCBIN_U8("graphics/battle_anims/sprites/051.4bpp.lz");
const u8 gBattleAnimSpriteSheet_052[] = INCBIN_U8("graphics/battle_anims/sprites/052.4bpp.lz");
const u8 unused_gfx_line_sketch[] = INCBIN_U8("graphics/unused/line_sketch.4bpp.lz");// unused

const u8 unused_gfx_line_sketch_pal[] = INCBIN_U8("graphics/unused/line_sketch.gbapal.lz");
const u8 gBattleAnimSpriteSheet_054[] = INCBIN_U8("graphics/battle_anims/sprites/054.4bpp.lz");
const u8 gBattleAnimSpritePalette_054[] = INCBIN_U8("graphics/battle_anims/sprites/054.gbapal.lz");
const u8 gBattleAnimSpriteSheet_056[] = INCBIN_U8("graphics/battle_anims/sprites/056.4bpp.lz");
const u8 gBattleAnimSpritePalette_056[] = INCBIN_U8("graphics/battle_anims/sprites/056.gbapal.lz");
const u8 gBattleAnimSpriteSheet_055[] = INCBIN_U8("graphics/battle_anims/sprites/055.4bpp.lz");
const u8 gBattleAnimSpriteSheet_057[] = INCBIN_U8("graphics/battle_anims/sprites/057.4bpp.lz");
const u8 gBattleAnimSpritePalette_057[] = INCBIN_U8("graphics/battle_anims/sprites/057.gbapal.lz");
const u8 gBattleAnimSpriteSheet_058[] = INCBIN_U8("graphics/battle_anims/sprites/058.4bpp.lz");
const u8 gBattleAnimSpritePalette_058[] = INCBIN_U8("graphics/battle_anims/sprites/058.gbapal.lz");
const u8 gBattleAnimSpriteSheet_059[] = INCBIN_U8("graphics/battle_anims/sprites/059.4bpp.lz");
const u8 gBattleAnimSpritePalette_059[] = INCBIN_U8("graphics/battle_anims/sprites/059.gbapal.lz");
const u8 gBattleAnimSpriteSheet_060[] = INCBIN_U8("graphics/battle_anims/sprites/060.4bpp.lz");
const u8 gBattleAnimSpritePalette_060[] = INCBIN_U8("graphics/battle_anims/sprites/060.gbapal.lz");
const u8 gBattleAnimSpriteSheet_061[] = INCBIN_U8("graphics/battle_anims/sprites/061.4bpp.lz");
const u8 gBattleAnimSpritePalette_061[] = INCBIN_U8("graphics/battle_anims/sprites/061.gbapal.lz");
const u8 gBattleAnimSpriteSheet_062[] = INCBIN_U8("graphics/battle_anims/sprites/062.4bpp.lz");
const u8 gBattleAnimSpritePalette_062[] = INCBIN_U8("graphics/battle_anims/sprites/062.gbapal.lz");
const u8 gBattleAnimSpriteSheet_063[] = INCBIN_U8("graphics/battle_anims/sprites/063.4bpp.lz");
const u8 gBattleAnimSpritePalette_063[] = INCBIN_U8("graphics/battle_anims/sprites/063.gbapal.lz");
const u8 unused_gfx_metronome_hand_small[] = INCBIN_U8("graphics/unused/metronome_hand_small.4bpp.lz");// unused, was for metronome at one point

const u8 gBattleAnimSpritePalette_091[] = INCBIN_U8("graphics/battle_anims/sprites/091.gbapal.lz");
const u8 gBattleAnimSpriteSheet_065[] = INCBIN_U8("graphics/battle_anims/sprites/065.4bpp.lz");
const u8 gBattleAnimSpritePalette_065[] = INCBIN_U8("graphics/battle_anims/sprites/065.gbapal.lz");
const u8 gBattleAnimSpriteSheet_066[] = INCBIN_U8("graphics/battle_anims/sprites/066.4bpp.lz");
const u8 gBattleAnimSpritePalette_066[] = INCBIN_U8("graphics/battle_anims/sprites/066.gbapal.lz");
const u8 gBattleAnimSpriteSheet_070[] = INCBIN_U8("graphics/battle_anims/sprites/070.4bpp.lz");
const u8 gBattleAnimSpritePalette_070[] = INCBIN_U8("graphics/battle_anims/sprites/070.gbapal.lz");
const u8 gBattleAnimSpriteSheet_071[] = INCBIN_U8("graphics/battle_anims/sprites/071.4bpp.lz");
const u8 gBattleAnimSpriteSheet_072[] = INCBIN_U8("graphics/battle_anims/sprites/072.4bpp.lz");
const u8 gBattleAnimSpritePalette_072[] = INCBIN_U8("graphics/battle_anims/sprites/072.gbapal.lz");
const u8 gBattleAnimSpriteSheet_073[] = INCBIN_U8("graphics/battle_anims/sprites/073.4bpp.lz");
const u8 gBattleAnimSpritePalette_073[] = INCBIN_U8("graphics/battle_anims/sprites/073.gbapal.lz");
const u8 gBattleAnimSpriteSheet_075[] = INCBIN_U8("graphics/battle_anims/sprites/075.4bpp.lz");
const u8 gBattleAnimSpritePalette_075[] = INCBIN_U8("graphics/battle_anims/sprites/075.gbapal.lz");
const u8 gBattleAnimSpriteSheet_078[] = INCBIN_U8("graphics/battle_anims/sprites/078.4bpp.lz");
const u8 gBattleAnimSpritePalette_078[] = INCBIN_U8("graphics/battle_anims/sprites/078.gbapal.lz");
const u8 gBattleAnimSpriteSheet_079[] = INCBIN_U8("graphics/battle_anims/sprites/079.4bpp.lz");
const u8 gBattleAnimSpriteSheet_080[] = INCBIN_U8("graphics/battle_anims/sprites/080.4bpp.lz");
const u8 gBattleAnimSpritePalette_080[] = INCBIN_U8("graphics/battle_anims/sprites/080.gbapal.lz");
const u8 gBattleAnimSpriteSheet_081[] = INCBIN_U8("graphics/battle_anims/sprites/081.4bpp.lz");
const u8 gBattleAnimSpritePalette_081[] = INCBIN_U8("graphics/battle_anims/sprites/081.gbapal.lz");

const u8 gUnknown_08D0CFAC[] = INCBIN_U8("graphics/unknown/unknown_D0CFAC.bin");
const u8 gUnknown_08D0CFD0[] = INCBIN_U8("graphics/unknown/unknown_D0CFD0.bin");
const u8 gUnknown_08D0CFF4[] = INCBIN_U8("graphics/unknown/unknown_D0CFF4.bin");
const u8 unused_line_sketch_2[] = INCBIN_U8("graphics/unused/line_sketch_2.8bpp.lz");
const u8 gUnknown_08D0D070[] = INCBIN_U8("graphics/unknown/unknown_D0D070.bin");
const u8 unused_line_sketch_2_tilemap[] = INCBIN_U8("graphics/unused/line_sketch_2.bin.lz");
const u8 gBattleAnimSpriteSheet_082[] = INCBIN_U8("graphics/battle_anims/sprites/082.4bpp.lz");
const u8 gBattleAnimSpritePalette_082[] = INCBIN_U8("graphics/battle_anims/sprites/082.gbapal.lz");
const u8 gBattleAnimSpritePalette_083[] = INCBIN_U8("graphics/battle_anims/sprites/083.gbapal.lz");
const u8 gBattleAnimSpritePalette_084[] = INCBIN_U8("graphics/battle_anims/sprites/084.gbapal.lz");
const u8 gBattleAnimSpritePalette_085[] = INCBIN_U8("graphics/battle_anims/sprites/085.gbapal.lz");
const u8 gBattleAnimSpritePalette_086[] = INCBIN_U8("graphics/battle_anims/sprites/086.gbapal.lz");
const u8 gBattleAnimSpritePalette_088[] = INCBIN_U8("graphics/battle_anims/sprites/088.gbapal.lz");
const u8 gBattleAnimSpritePalette_089[] = INCBIN_U8("graphics/battle_anims/sprites/089.gbapal.lz");
const u8 gBattleAnimSpritePalette_090[] = INCBIN_U8("graphics/battle_anims/sprites/090.gbapal.lz");
const u8 gBattleAnimSpritePalette_092[] = INCBIN_U8("graphics/battle_anims/sprites/092.gbapal.lz");
const u8 gBattleAnimSpritePalette_093[] = INCBIN_U8("graphics/battle_anims/sprites/093.gbapal.lz");
const u8 gBattleAnimSpritePalette_094[] = INCBIN_U8("graphics/battle_anims/sprites/094.gbapal.lz");
const u8 gUnknown_08D0D2B4[] = INCBIN_U8("graphics/unknown/unknown_D0D2B4.bin.lz");
const u8 gBattleAnimSpritePalette_095[] = INCBIN_U8("graphics/battle_anims/sprites/095.gbapal.lz");
const u8 gBattleAnimSpritePalette_096[] = INCBIN_U8("graphics/battle_anims/sprites/096.gbapal.lz");
const u8 gBattleAnimSpritePalette_097[] = INCBIN_U8("graphics/battle_anims/sprites/097.gbapal.lz");
const u8 gBattleAnimSpritePalette_100[] = INCBIN_U8("graphics/battle_anims/sprites/100.gbapal.lz");
const u8 gBattleAnimSpritePalette_101[] = INCBIN_U8("graphics/battle_anims/sprites/101.gbapal.lz");
const u8 gBattleAnimSpritePalette_103[] = INCBIN_U8("graphics/battle_anims/sprites/103.gbapal.lz");
const u8 gBattleAnimSpriteSheet_083[] = INCBIN_U8("graphics/battle_anims/sprites/083.4bpp.lz");
const u8 gBattleAnimSpriteSheet_084[] = INCBIN_U8("graphics/battle_anims/sprites/084.4bpp.lz");
const u8 gBattleAnimSpriteSheet_085[] = INCBIN_U8("graphics/battle_anims/sprites/085.4bpp.lz");
const u8 gBattleAnimSpriteSheet_086[] = INCBIN_U8("graphics/battle_anims/sprites/086.4bpp.lz");
const u8 gBattleAnimSpriteSheet_088[] = INCBIN_U8("graphics/battle_anims/sprites/088.4bpp.lz");
const u8 gBattleAnimSpriteSheet_089[] = INCBIN_U8("graphics/battle_anims/sprites/089.4bpp.lz");
const u8 gBattleAnimSpriteSheet_090[] = INCBIN_U8("graphics/battle_anims/sprites/090.4bpp.lz");
const u8 gBattleAnimSpriteSheet_091[] = INCBIN_U8("graphics/battle_anims/sprites/091.4bpp.lz");
const u8 gBattleAnimSpriteSheet_092[] = INCBIN_U8("graphics/battle_anims/sprites/092.4bpp.lz");
const u8 gBattleAnimSpriteSheet_093[] = INCBIN_U8("graphics/battle_anims/sprites/093.4bpp.lz");
const u8 gBattleAnimSpriteSheet_094[] = INCBIN_U8("graphics/battle_anims/sprites/094.4bpp.lz");
const u8 gBattleAnimSpriteSheet_095[] = INCBIN_U8("graphics/battle_anims/sprites/095.4bpp.lz");
const u8 gBattleAnimSpriteSheet_096[] = INCBIN_U8("graphics/battle_anims/sprites/096.4bpp.lz");
const u8 gBattleAnimSpriteSheet_097[] = INCBIN_U8("graphics/battle_anims/sprites/097.4bpp.lz");
const u8 gBattleAnimSpriteSheet_098[] = INCBIN_U8("graphics/battle_anims/sprites/098.4bpp.lz");
const u8 gBattleAnimSpriteSheet_100[] = INCBIN_U8("graphics/battle_anims/sprites/100.4bpp.lz");
const u8 gBattleAnimSpriteSheet_101[] = INCBIN_U8("graphics/battle_anims/sprites/101.4bpp.lz");
const u8 gBattleAnimSpriteSheet_102[] = INCBIN_U8("graphics/battle_anims/sprites/102.4bpp.lz");
const u8 gBattleAnimSpriteSheet_103[] = INCBIN_U8("graphics/battle_anims/sprites/103.4bpp.lz");
const u8 gBattleAnimSpriteSheet_104[] = INCBIN_U8("graphics/battle_anims/sprites/104.4bpp.lz");
const u8 gBattleAnimSpritePalette_104[] = INCBIN_U8("graphics/battle_anims/sprites/104.gbapal.lz");
const u8 gBattleAnimSpriteSheet_105[] = INCBIN_U8("graphics/battle_anims/sprites/105.4bpp.lz");
const u8 gBattleAnimSpritePalette_105[] = INCBIN_U8("graphics/battle_anims/sprites/105.gbapal.lz");
const u8 gBattleAnimSpriteSheet_106[] = INCBIN_U8("graphics/battle_anims/sprites/106.4bpp.lz");
const u8 gBattleAnimSpriteSheet_107[] = INCBIN_U8("graphics/battle_anims/sprites/107.4bpp.lz");
const u8 gBattleAnimSpritePalette_107[] = INCBIN_U8("graphics/battle_anims/sprites/107.gbapal.lz");
const u8 gBattleAnimSpriteSheet_108[] = INCBIN_U8("graphics/battle_anims/sprites/108.4bpp.lz");
const u8 gBattleAnimSpriteSheet_109[] = INCBIN_U8("graphics/battle_anims/sprites/109.4bpp.lz");
const u8 gBattleAnimSpritePalette_109[] = INCBIN_U8("graphics/battle_anims/sprites/109.gbapal.lz");
const u8 gBattleAnimSpriteSheet_110[] = INCBIN_U8("graphics/battle_anims/sprites/110.4bpp.lz");
const u8 gBattleAnimSpriteSheet_111[] = INCBIN_U8("graphics/battle_anims/sprites/111.4bpp.lz");
const u8 gBattleAnimSpritePalette_111[] = INCBIN_U8("graphics/battle_anims/sprites/111.gbapal.lz");
const u8 gBattleAnimSpriteSheet_112[] = INCBIN_U8("graphics/battle_anims/sprites/112.4bpp.lz");
const u8 gBattleAnimSpritePalette_112[] = INCBIN_U8("graphics/battle_anims/sprites/112.gbapal.lz");
const u8 gBattleAnimSpriteSheet_113[] = INCBIN_U8("graphics/battle_anims/sprites/113.4bpp.lz");
const u8 gBattleAnimSpritePalette_113[] = INCBIN_U8("graphics/battle_anims/sprites/113.gbapal.lz");
const u8 gBattleAnimSpriteSheet_114[] = INCBIN_U8("graphics/battle_anims/sprites/114.4bpp.lz");
const u8 gBattleAnimSpritePalette_114[] = INCBIN_U8("graphics/battle_anims/sprites/114.gbapal.lz");

const u8 unused_blue_frame[] = INCBIN_U8("graphics/unused/blue_frame.bin.lz");//  P1, P2, P3 and P4 tilemaps?
const u8 unused_redyellowgreen_frame[] = INCBIN_U8("graphics/unused/redyellowgreen_frame.bin.lz");
const u8 unused_color_frames[] = INCBIN_U8("graphics/unused/color_frames.4bpp.lz");
const u8 unused_color_frames_pal[] = INCBIN_U8("graphics/unused/color_frames.gbapal.lz");

const u8 gBattleAnimSpriteSheet_115[] = INCBIN_U8("graphics/battle_anims/sprites/115.4bpp.lz");

const u8 unused_water_splash_8bpp[] = INCBIN_U8("graphics/unused/water_splash.8bpp.lz");
const u8 unused_water_splash_bin[] = INCBIN_U8("graphics/unused/water_splash.bin.lz");
const u8 unused_water_splash_pal[] = INCBIN_U8("graphics/unused/water_splash.gbapal.lz");
const u8 unused_basic_frame_4bpp[] = INCBIN_U8("graphics/unused/basic_frame.4bpp.lz");
const u8 unused_basic_frame_pal[] = INCBIN_U8("graphics/unused/basic_frame.gbapal.lz");
const u8 unused_basic_frame_bin[] = INCBIN_U8("graphics/unused/basic_frame.bin.lz");

const u8 gUnknown_08D1212C[] = INCBIN_U8("graphics/battle_interface/window.gbapal");
const u8 gUnknown_08D1214C[] = INCBIN_U8("graphics/battle_interface/hpbar.gbapal");

const u8 gHealthboxElementsGfxTable[][32] = INCBIN_U8("graphics/battle_interface/healthbox_elements.4bpp");

const u8 Tiles_D129AC[] = INCBIN_U8("graphics/battle_interface/ball_display.4bpp");

// extra stuff
const u8 unused_gfx_ball_display_unused_extra[] = INCBIN_U8("graphics/battle_interface/ball_display_unused_extra.4bpp");
const u8 unused_gfx_status2[] = INCBIN_U8("graphics/battle_interface/status2.4bpp");// these three duplicate sets of graphics are for the opponent pokemon and are also for use in double battles. they use dynamic palettes so coloring them is an extreme headache and wont be done for now.
const u8 unused_gfx_status3[] = INCBIN_U8("graphics/battle_interface/status3.4bpp");
const u8 unused_gfx_status4[] = INCBIN_U8("graphics/battle_interface/status4.4bpp");
const u8 unused_gfx_unknown_D12FEC[] = INCBIN_U8("graphics/unknown/unknown_D12FEC.4bpp");
const u8 unused_gfx_unknown_D1300C[] = INCBIN_U8("graphics/unknown/unknown_D1300C.4bpp");

const u8 gBattleAnimSpriteSheet_116[] = INCBIN_U8("graphics/battle_anims/sprites/116.4bpp.lz");
const u8 gBattleAnimSpritePalette_116[] = INCBIN_U8("graphics/battle_anims/sprites/116.gbapal.lz");
const u8 gBattleAnimSpriteSheet_117[] = INCBIN_U8("graphics/battle_anims/sprites/117.4bpp.lz");
const u8 gBattleAnimSpritePalette_117[] = INCBIN_U8("graphics/battle_anims/sprites/117.gbapal.lz");
const u8 gBattleAnimSpriteSheet_118[] = INCBIN_U8("graphics/battle_anims/sprites/118.4bpp.lz");
const u8 gBattleAnimSpritePalette_118[] = INCBIN_U8("graphics/battle_anims/sprites/118.gbapal.lz");
const u8 gBattleAnimSpriteSheet_119[] = INCBIN_U8("graphics/battle_anims/sprites/119.4bpp.lz");
const u8 gBattleAnimSpritePalette_119[] = INCBIN_U8("graphics/battle_anims/sprites/119.gbapal.lz");
const u8 gBattleAnimSpriteSheet_120[] = INCBIN_U8("graphics/battle_anims/sprites/120.4bpp.lz");
const u8 gBattleAnimSpritePalette_120[] = INCBIN_U8("graphics/battle_anims/sprites/120.gbapal.lz");
const u8 gBattleAnimSpriteSheet_121[] = INCBIN_U8("graphics/battle_anims/sprites/121.4bpp.lz");
const u8 gBattleAnimSpritePalette_121[] = INCBIN_U8("graphics/battle_anims/sprites/121.gbapal.lz");
const u8 gBattleAnimSpriteSheet_122[] = INCBIN_U8("graphics/battle_anims/sprites/122.4bpp.lz");
const u8 gBattleAnimSpritePalette_122[] = INCBIN_U8("graphics/battle_anims/sprites/122.gbapal.lz");
const u8 gBattleAnimSpriteSheet_123[] = INCBIN_U8("graphics/battle_anims/sprites/123.4bpp.lz");
const u8 gBattleAnimSpriteSheet_124[] = INCBIN_U8("graphics/battle_anims/sprites/124.4bpp.lz");
const u8 gBattleAnimSpritePalette_124[] = INCBIN_U8("graphics/battle_anims/sprites/124.gbapal.lz");
const u8 gBattleAnimSpriteSheet_125[] = INCBIN_U8("graphics/battle_anims/sprites/125.4bpp.lz");
const u8 gBattleAnimSpritePalette_125[] = INCBIN_U8("graphics/battle_anims/sprites/125.gbapal.lz");
const u8 gBattleAnimSpriteSheet_126[] = INCBIN_U8("graphics/battle_anims/sprites/126.4bpp.lz");
const u8 gBattleAnimSpritePalette_126[] = INCBIN_U8("graphics/battle_anims/sprites/126.gbapal.lz");
const u8 gBattleAnimSpriteSheet_127[] = INCBIN_U8("graphics/battle_anims/sprites/127.4bpp.lz");
const u8 gBattleAnimSpritePalette_127[] = INCBIN_U8("graphics/battle_anims/sprites/127.gbapal.lz");
const u8 gBattleAnimSpriteSheet_128[] = INCBIN_U8("graphics/battle_anims/sprites/128.4bpp.lz");
const u8 gBattleAnimSpritePalette_128[] = INCBIN_U8("graphics/battle_anims/sprites/128.gbapal.lz");
const u8 gBattleAnimSpriteSheet_129[] = INCBIN_U8("graphics/battle_anims/sprites/129.4bpp.lz");
const u8 gBattleAnimSpriteSheet_130[] = INCBIN_U8("graphics/battle_anims/sprites/130.4bpp.lz");
const u8 gBattleAnimSpritePalette_130[] = INCBIN_U8("graphics/battle_anims/sprites/130.gbapal.lz");
const u8 gBattleAnimSpriteSheet_131[] = INCBIN_U8("graphics/battle_anims/sprites/131.4bpp.lz");
const u8 gBattleAnimSpriteSheet_132[] = INCBIN_U8("graphics/battle_anims/sprites/132.4bpp.lz");
const u8 gBattleAnimSpritePalette_132[] = INCBIN_U8("graphics/battle_anims/sprites/132.gbapal.lz");
const u8 gBattleAnimSpriteSheet_133[] = INCBIN_U8("graphics/battle_anims/sprites/133.4bpp.lz");
const u8 gBattleAnimSpritePalette_133[] = INCBIN_U8("graphics/battle_anims/sprites/133.gbapal.lz");
const u8 gBattleAnimSpriteSheet_134[] = INCBIN_U8("graphics/battle_anims/sprites/134.4bpp.lz");
const u8 gBattleAnimSpriteSheet_076[] = INCBIN_U8("graphics/battle_anims/sprites/076.4bpp.lz");
const u8 gBattleAnimSpritePalette_076[] = INCBIN_U8("graphics/battle_anims/sprites/076.gbapal.lz");
const u8 gBattleAnimSpriteSheet_077[] = INCBIN_U8("graphics/battle_anims/sprites/077.4bpp.lz");
const u8 unused_old_contest_4bpp[] = INCBIN_U8("graphics/unused/old_contest.4bpp.lz");
const u8 unused_old_contest_pal[] = INCBIN_U8("graphics/unused/old_contest.gbapal.lz");
const u8 unused_old_contest_bin[] = INCBIN_U8("graphics/unused/old_contest.bin.lz");
const u8 unused_unknown_D15D64[] = INCBIN_U8("graphics/unknown/unknown_D15D64.bin.lz");

const u8 gContestNumbers_UnusedGfx[] = INCBIN_U8("graphics/unused/numbers.4bpp.lz");
const u8 gContestNumbers_UnusedPal[] = INCBIN_U8("graphics/unused/numbers.gbapal.lz");
const u8 unused_old_contest_2_4bpp[] = INCBIN_U8("graphics/unused/old_contest_2.4bpp.lz");
// the tilemap and palette for unused contest assets are used. however, these two files aren't old
const u8 gContestPalette[] = INCBIN_U8("graphics/unused/old_contest_2.gbapal.lz");

const u8 gContestGfx[] = INCBIN_U8("graphics/unused/old_contest_2.bin.lz");

const u8 gContestBgmap[] = INCBIN_U8("graphics/unknown/unknown_D17424.bin.lz");
const u8 unused_unknown_D176CC[] = INCBIN_U8("graphics/unknown/unknown_D176CC.bin.lz");
const u8 unused_unknown_D177D8[] = INCBIN_U8("graphics/unknown/unknown_D177D8.bin.lz");

const u8 gUnknown_08D17C3C[] = INCBIN_U8("graphics/unknown/unknown_D17C3C.bin.lz");

const u8 gContestMiscGfx[] = INCBIN_U8("graphics/contest/misc.4bpp.lz");

const u8 gContestAudienceGfx[] = INCBIN_U8("graphics/contest/audience.4bpp.lz");
const u8 unused_gfx_faces_4bpp[] = INCBIN_U8("graphics/contest/faces.4bpp.lz");

const u8 gContestJudgeSymbolsGfx[] = INCBIN_U8("graphics/contest/judge_symbols.4bpp.lz");

const u8 gContest3Pal[] = INCBIN_U8("graphics/contest/judge_symbols.gbapal.lz");

const u8 gTiles_8D1975C[] = INCBIN_U8("graphics/contest/heart.4bpp");

const u8 gUnknown_08D1977C[] = INCBIN_U8("graphics/contest/misc_2.4bpp.lz");

const u8 gUnknown_08D1A250[] = INCBIN_U8("graphics/contest/misc_2_tilemap_1.bin.lz");

const u8 gUnknown_08D1A364[] = INCBIN_U8("graphics/contest/misc_2_tilemap_2.bin.lz");

const u8 gUnknown_08D1A490[] = INCBIN_U8("graphics/contest/misc_2_tilemap_3.bin.lz");

const u8 gUnknown_08D1A618[] = INCBIN_U8("graphics/contest/misc_2.gbapal.lz");
const u8 gBattleAnimSpriteSheet_135[] = INCBIN_U8("graphics/battle_anims/sprites/135.4bpp.lz");
const u8 gBattleAnimSpritePalette_135[] = INCBIN_U8("graphics/battle_anims/sprites/135.gbapal.lz");
const u8 gBattleAnimSpriteSheet_Particles[] = INCBIN_U8("graphics/battle_anims/sprites/particles.4bpp.lz");
const u8 gBattleAnimSpriteSheet_136[] = INCBIN_U8("graphics/battle_anims/sprites/136.4bpp.lz");
const u8 gBattleAnimSpritePalette_136[] = INCBIN_U8("graphics/battle_anims/sprites/136.gbapal.lz");
const u8 gBattleAnimSpriteSheet_137[] = INCBIN_U8("graphics/battle_anims/sprites/137.4bpp.lz");
const u8 gBattleAnimSpriteSheet_139[] = INCBIN_U8("graphics/battle_anims/sprites/139.4bpp.lz");
const u8 gBattleAnimSpritePalette_139[] = INCBIN_U8("graphics/battle_anims/sprites/139.gbapal.lz");
const u8 gBattleAnimSpriteSheet_145[] = INCBIN_U8("graphics/battle_anims/sprites/145.4bpp.lz");
const u8 gBattleAnimSpriteSheet_138[] = INCBIN_U8("graphics/battle_anims/sprites/138.4bpp.lz");
const u8 gBattleAnimSpriteSheet_140[] = INCBIN_U8("graphics/battle_anims/sprites/140.4bpp.lz");
const u8 gBattleAnimSpritePalette_140[] = INCBIN_U8("graphics/battle_anims/sprites/140.gbapal.lz");
const u8 gBattleAnimSpriteSheet_141[] = INCBIN_U8("graphics/battle_anims/sprites/141.4bpp.lz");
const u8 gBattleAnimSpritePalette_141[] = INCBIN_U8("graphics/battle_anims/sprites/141.gbapal.lz");
const u8 gBattleAnimSpriteSheet_142[] = INCBIN_U8("graphics/battle_anims/sprites/142.4bpp.lz");

const u8 unused_old_beatup_4bpp[] = INCBIN_U8("graphics/unused/old_beatup.4bpp.lz");
const u8 unused_old_beatup_pal[] = INCBIN_U8("graphics/unused/old_beatup.gbapal.lz");

const u8 gBattleAnimSpriteSheet_147[] = INCBIN_U8("graphics/battle_anims/sprites/147.4bpp.lz");
const u8 gBattleAnimSpritePalette_147[] = INCBIN_U8("graphics/battle_anims/sprites/147.gbapal.lz");
const u8 gBattleAnimSpriteSheet_149[] = INCBIN_U8("graphics/battle_anims/sprites/149.4bpp.lz");
const u8 gBattleAnimSpriteSheet_148[] = INCBIN_U8("graphics/battle_anims/sprites/148.4bpp.lz");
const u8 gBattleAnimSpritePalette_148[] = INCBIN_U8("graphics/battle_anims/sprites/148.gbapal.lz");
const u8 gBattleAnimSpritePalette_259[] = INCBIN_U8("graphics/battle_anims/sprites/259.gbapal.lz");
const u8 gBattleAnimSpriteSheet_074[] = INCBIN_U8("graphics/battle_anims/sprites/074.4bpp.lz");
const u8 gBattleAnimSpritePalette_074[] = INCBIN_U8("graphics/battle_anims/sprites/074.gbapal.lz");
const u8 gBattleAnimSpriteSheet_150[] = INCBIN_U8("graphics/battle_anims/sprites/150.4bpp.lz");
const u8 gBattleAnimSpritePalette_150[] = INCBIN_U8("graphics/battle_anims/sprites/150.gbapal.lz");
const u8 gBattleAnimSpriteSheet_151[] = INCBIN_U8("graphics/battle_anims/sprites/151.4bpp.lz");
const u8 gBattleAnimSpriteSheet_153[] = INCBIN_U8("graphics/battle_anims/sprites/153.4bpp.lz");
const u8 gBattleAnimSpritePalette_153[] = INCBIN_U8("graphics/battle_anims/sprites/153.gbapal.lz");
const u8 gBattleAnimSpriteSheet_154[] = INCBIN_U8("graphics/battle_anims/sprites/154.4bpp.lz");
const u8 gBattleAnimSpritePalette_154[] = INCBIN_U8("graphics/battle_anims/sprites/154.gbapal.lz");
const u8 gBattleAnimSpriteSheet_155[] = INCBIN_U8("graphics/battle_anims/sprites/155.4bpp.lz");
const u8 gBattleAnimSpritePalette_155[] = INCBIN_U8("graphics/battle_anims/sprites/155.gbapal.lz");
const u8 gBattleAnimSpriteSheet_156[] = INCBIN_U8("graphics/battle_anims/sprites/156.4bpp.lz");
const u8 gBattleAnimSpritePalette_156[] = INCBIN_U8("graphics/battle_anims/sprites/156.gbapal.lz");
const u8 gBattleAnimSpriteSheet_157[] = INCBIN_U8("graphics/battle_anims/sprites/157.4bpp.lz");
const u8 gBattleAnimSpritePalette_157[] = INCBIN_U8("graphics/battle_anims/sprites/157.gbapal.lz");
const u8 gBattleAnimSpriteSheet_158[] = INCBIN_U8("graphics/battle_anims/sprites/158.4bpp.lz");
const u8 gBattleAnimSpritePalette_158[] = INCBIN_U8("graphics/battle_anims/sprites/158.gbapal.lz");
const u8 gBattleAnimSpriteSheet_159[] = INCBIN_U8("graphics/battle_anims/sprites/159.4bpp.lz");
const u8 gBattleAnimSpritePalette_159[] = INCBIN_U8("graphics/battle_anims/sprites/159.gbapal.lz");
const u8 gBattleAnimSpriteSheet_160[] = INCBIN_U8("graphics/battle_anims/sprites/160.4bpp.lz");
const u8 gBattleAnimSpritePalette_160[] = INCBIN_U8("graphics/battle_anims/sprites/160.gbapal.lz");
const u8 gBattleAnimSpriteSheet_144[] = INCBIN_U8("graphics/battle_anims/sprites/144.4bpp.lz");
const u8 gBattleAnimSpritePalette_144[] = INCBIN_U8("graphics/battle_anims/sprites/144.gbapal.lz");

const u8 unused_unknown_D1C060_4bpp[] = INCBIN_U8("graphics/unknown/unknown_D1C060.4bpp.lz");
const u8 unused_unknown_D1C060_pal[] = INCBIN_U8("graphics/unknown/unknown_D1C060.gbapal.lz");
const u8 unused_unknown_D1C060_bin[] = INCBIN_U8("graphics/unknown/unknown_D1C060.bin.lz");

const u8 gBattleAnimSpriteSheet_162[] = INCBIN_U8("graphics/battle_anims/sprites/162.4bpp.lz");
const u8 gBattleAnimSpritePalette_162[] = INCBIN_U8("graphics/battle_anims/sprites/162.gbapal.lz");
const u8 gBattleAnimSpriteSheet_163[] = INCBIN_U8("graphics/battle_anims/sprites/163.4bpp.lz");
const u8 gBattleAnimSpritePalette_163[] = INCBIN_U8("graphics/battle_anims/sprites/163.gbapal.lz");
const u8 gBattleAnimSpritePalette_288[] = INCBIN_U8("graphics/battle_anims/sprites/288.gbapal.lz");
const u8 gBattleAnimSpritePalette_164[] = INCBIN_U8("graphics/battle_anims/sprites/164.gbapal.lz");
const u8 gBattleAnimSpritePalette_165[] = INCBIN_U8("graphics/battle_anims/sprites/165.gbapal.lz");
const u8 gBattleAnimSpriteSheet_166[] = INCBIN_U8("graphics/battle_anims/sprites/166.4bpp.lz");
const u8 gBattleAnimSpritePalette_166[] = INCBIN_U8("graphics/battle_anims/sprites/166.gbapal.lz");
const u8 gBattleAnimSpritePalette_167[] = INCBIN_U8("graphics/battle_anims/sprites/167.gbapal.lz");
const u8 gBattleAnimSpritePalette_168[] = INCBIN_U8("graphics/battle_anims/sprites/168.gbapal.lz");
const u8 gBattleAnimSpritePalette_169[] = INCBIN_U8("graphics/battle_anims/sprites/169.gbapal.lz");
const u8 gBattleAnimSpritePalette_170[] = INCBIN_U8("graphics/battle_anims/sprites/170.gbapal.lz");
const u8 gBattleAnimSpriteSheet_171[] = INCBIN_U8("graphics/battle_anims/sprites/171.4bpp.lz");
const u8 gBattleAnimSpritePalette_171[] = INCBIN_U8("graphics/battle_anims/sprites/171.gbapal.lz");
const u8 gBattleAnimSpritePalette_172[] = INCBIN_U8("graphics/battle_anims/sprites/172.gbapal.lz");

const u8 gContestJudgeGfx[] = INCBIN_U8("graphics/contest/judge.4bpp.lz");
const u8 gContest2Pal[] = INCBIN_U8("graphics/contest/judge.gbapal.lz");

const u8 gBattleAnimSpriteSheet_001[] = INCBIN_U8("graphics/battle_anims/sprites/001.4bpp.lz");
const u8 gBattleAnimSpritePalette_001[] = INCBIN_U8("graphics/battle_anims/sprites/001.gbapal.lz");
const u8 gBattleAnimSpriteSheet_173[] = INCBIN_U8("graphics/battle_anims/sprites/173.4bpp.lz");

const u8 gBattleAnimBackgroundImage_00[] = INCBIN_U8("graphics/battle_anims/backgrounds/00.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_00[] = INCBIN_U8("graphics/battle_anims/backgrounds/00.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_00[] = INCBIN_U8("graphics/battle_anims/backgrounds/00.bin.lz");

const u8 gUnknown_08D1D410[] = INCBIN_U8("graphics/battle_anims/masks/metal_shine.4bpp.lz");
const u8 gUnknown_08D1D54C[] = INCBIN_U8("graphics/battle_anims/masks/metal_shine.gbapal.lz");
const u8 gUnknown_08D1D574[] = INCBIN_U8("graphics/battle_anims/masks/metal_shine.bin.lz");

const u8 unused_gfx_goosuto_4bpp[] = INCBIN_U8("graphics/unused/goosuto.4bpp.lz");// ghost
const u8 unused_gfx_goosuto_pal[] = INCBIN_U8("graphics/unused/goosuto.gbapal.lz");
const u8 unused_gfx_goosuto_bin[] = INCBIN_U8("graphics/unused/goosuto.bin.lz");

const u8 gBattleAnimSpriteSheet_174[] = INCBIN_U8("graphics/battle_anims/sprites/174.4bpp.lz");
const u8 gBattleAnimSpritePalette_174[] = INCBIN_U8("graphics/battle_anims/sprites/174.gbapal.lz");
const u8 gBattleAnimSpriteSheet_175[] = INCBIN_U8("graphics/battle_anims/sprites/175.4bpp.lz");
const u8 gBattleAnimSpritePalette_175[] = INCBIN_U8("graphics/battle_anims/sprites/175.gbapal.lz");
const u8 gBattleAnimSpriteSheet_176[] = INCBIN_U8("graphics/battle_anims/sprites/176.4bpp.lz");
const u8 gBattleAnimSpritePalette_176[] = INCBIN_U8("graphics/battle_anims/sprites/176.gbapal.lz");
const u8 gBattleAnimSpriteSheet_177[] = INCBIN_U8("graphics/battle_anims/sprites/177.4bpp.lz");
const u8 gBattleAnimSpritePalette_177[] = INCBIN_U8("graphics/battle_anims/sprites/177.gbapal.lz");
const u8 gBattleAnimSpriteSheet_178[] = INCBIN_U8("graphics/battle_anims/sprites/178.4bpp.lz");
const u8 gBattleAnimSpritePalette_178[] = INCBIN_U8("graphics/battle_anims/sprites/178.gbapal.lz");
const u8 gBattleAnimSpritePalette_179[] = INCBIN_U8("graphics/battle_anims/sprites/179.gbapal.lz");
const u8 gBattleAnimSpriteSheet_179[] = INCBIN_U8("graphics/battle_anims/sprites/179.4bpp.lz");
const u8 gBattleAnimSpriteSheet_180[] = INCBIN_U8("graphics/battle_anims/sprites/180.4bpp.lz");
const u8 gBattleAnimSpriteSheet_181[] = INCBIN_U8("graphics/battle_anims/sprites/181.4bpp.lz");
const u8 gBattleAnimSpriteSheet_182[] = INCBIN_U8("graphics/battle_anims/sprites/182.4bpp.lz");
const u8 gBattleAnimSpritePalette_182[] = INCBIN_U8("graphics/battle_anims/sprites/182.gbapal.lz");
const u8 gBattleAnimSpriteSheet_183[] = INCBIN_U8("graphics/battle_anims/sprites/183.4bpp.lz");
const u8 gBattleAnimSpritePalette_183[] = INCBIN_U8("graphics/battle_anims/sprites/183.gbapal.lz");
const u8 gBattleAnimSpriteSheet_184[] = INCBIN_U8("graphics/battle_anims/sprites/184.4bpp.lz");
const u8 gBattleAnimSpritePalette_184[] = INCBIN_U8("graphics/battle_anims/sprites/184.gbapal.lz");
const u8 gBattleAnimSpriteSheet_185[] = INCBIN_U8("graphics/battle_anims/sprites/185.4bpp.lz");
const u8 gBattleAnimSpritePalette_185[] = INCBIN_U8("graphics/battle_anims/sprites/185.gbapal.lz");

const u8 gBattleAnimBackgroundImage_03[] = INCBIN_U8("graphics/battle_anims/backgrounds/03.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_03[] = INCBIN_U8("graphics/battle_anims/backgrounds/03.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_03[] = INCBIN_U8("graphics/battle_anims/backgrounds/03.bin.lz");
const u8 gBattleAnimSpriteSheet_187[] = INCBIN_U8("graphics/battle_anims/sprites/187.4bpp.lz");
const u8 gBattleAnimSpritePalette_187[] = INCBIN_U8("graphics/battle_anims/sprites/187.gbapal.lz");
const u8 gBattleAnimSpriteSheet_186[] = INCBIN_U8("graphics/battle_anims/sprites/186.4bpp.lz");
const u8 gBattleAnimSpritePalette_186[] = INCBIN_U8("graphics/battle_anims/sprites/186.gbapal.lz");

const u8 gBattleWindowLargeGfx[] = INCBIN_U8("graphics/battle_interface/window.4bpp.lz");
const u8 gBattleWindowSmallGfx[] = INCBIN_U8("graphics/battle_interface/window2.4bpp.lz");
const u8 gBattleWindowSmall2Gfx[] = INCBIN_U8("graphics/battle_interface/window3.4bpp.lz");
const u8 gBattleWindowSmall3Gfx[] = INCBIN_U8("graphics/battle_interface/window4.4bpp.lz");
const u8 gBattleWindowLarge2Gfx[] = INCBIN_U8("graphics/battle_interface/window5.4bpp.lz");

const u8 unused_gfx_shadow_4bpp[] = INCBIN_U8("graphics/unused/shadow.4bpp.lz");
const u8 unused_gfx_shadow_pal[] = INCBIN_U8("graphics/unused/shadow.gbapal.lz");

const u8 gBattleAnimSpriteSheet_014[] = INCBIN_U8("graphics/battle_anims/sprites/014.4bpp.lz");
const u8 gBattleAnimSpritePalette_014[] = INCBIN_U8("graphics/battle_anims/sprites/014.gbapal.lz");
const u8 gBattleAnimSpriteSheet_190[] = INCBIN_U8("graphics/battle_anims/sprites/190.4bpp.lz");
const u8 gBattleAnimSpritePalette_190[] = INCBIN_U8("graphics/battle_anims/sprites/190.gbapal.lz");
const u8 gBattleAnimSpriteSheet_191[] = INCBIN_U8("graphics/battle_anims/sprites/191.4bpp.lz");
const u8 gBattleAnimSpritePalette_191[] = INCBIN_U8("graphics/battle_anims/sprites/191.gbapal.lz");
const u8 gBattleAnimSpriteSheet_189[] = INCBIN_U8("graphics/battle_anims/sprites/189.4bpp.lz");
const u8 gBattleAnimSpritePalette_189[] = INCBIN_U8("graphics/battle_anims/sprites/189.gbapal.lz");
const u8 gBattleAnimSpriteSheet_192[] = INCBIN_U8("graphics/battle_anims/sprites/192.4bpp.lz");
const u8 gBattleAnimSpritePalette_192[] = INCBIN_U8("graphics/battle_anims/sprites/192.gbapal.lz");
const u8 gBattleAnimSpriteSheet_193[] = INCBIN_U8("graphics/battle_anims/sprites/193.4bpp.lz");
const u8 gBattleAnimSpritePalette_193[] = INCBIN_U8("graphics/battle_anims/sprites/193.gbapal.lz");

const u8 gUnknown_08D20A14[] = INCBIN_U8("graphics/battle_anims/masks/curse.4bpp.lz");
const u8 gUnknown_08D20A30[] = INCBIN_U8("graphics/battle_anims/masks/curse.bin.lz");

const u8 gBattleAnimSpriteSheet_002[] = INCBIN_U8("graphics/battle_anims/sprites/002.4bpp.lz");
const u8 gBattleAnimSpritePalette_002[] = INCBIN_U8("graphics/battle_anims/sprites/002.gbapal.lz");
const u8 gBattleAnimSpriteSheet_196[] = INCBIN_U8("graphics/battle_anims/sprites/196.4bpp.lz");
const u8 gBattleAnimSpritePalette_196[] = INCBIN_U8("graphics/battle_anims/sprites/196.gbapal.lz");
const u8 gBattleAnimSpriteSheet_194[] = INCBIN_U8("graphics/battle_anims/sprites/194.4bpp.lz");
const u8 gBattleAnimSpritePalette_194[] = INCBIN_U8("graphics/battle_anims/sprites/194.gbapal.lz");
const u8 gBattleAnimSpriteSheet_195[] = INCBIN_U8("graphics/battle_anims/sprites/195.4bpp.lz");
const u8 gBattleAnimSpritePalette_195[] = INCBIN_U8("graphics/battle_anims/sprites/195.gbapal.lz");
const u8 gBattleAnimSpriteSheet_197[] = INCBIN_U8("graphics/battle_anims/sprites/197.4bpp.lz");
const u8 gBattleAnimSpritePalette_197[] = INCBIN_U8("graphics/battle_anims/sprites/197.gbapal.lz");
const u8 gBattleAnimSpriteSheet_198[] = INCBIN_U8("graphics/battle_anims/sprites/198.4bpp.lz");
const u8 gBattleAnimSpritePalette_198[] = INCBIN_U8("graphics/battle_anims/sprites/198.gbapal.lz");
const u8 gBattleAnimSpriteSheet_199[] = INCBIN_U8("graphics/battle_anims/sprites/199.4bpp.lz");
const u8 gBattleAnimSpritePalette_199[] = INCBIN_U8("graphics/battle_anims/sprites/199.gbapal.lz");
const u8 gBattleAnimSpriteSheet_200[] = INCBIN_U8("graphics/battle_anims/sprites/200.4bpp.lz");
const u8 gBattleAnimSpritePalette_200[] = INCBIN_U8("graphics/battle_anims/sprites/200.gbapal.lz");
const u8 gBattleAnimSpriteSheet_201[] = INCBIN_U8("graphics/battle_anims/sprites/201.4bpp.lz");
const u8 gBattleAnimSpritePalette_201[] = INCBIN_U8("graphics/battle_anims/sprites/201.gbapal.lz");
const u8 gBattleAnimSpriteSheet_204[] = INCBIN_U8("graphics/battle_anims/sprites/204.4bpp.lz");
const u8 gBattleAnimSpritePalette_204[] = INCBIN_U8("graphics/battle_anims/sprites/204.gbapal.lz");
const u8 gBattleAnimSpriteSheet_202[] = INCBIN_U8("graphics/battle_anims/sprites/202.4bpp.lz");
const u8 gBattleAnimSpritePalette_202[] = INCBIN_U8("graphics/battle_anims/sprites/202.gbapal.lz");
const u8 gBattleAnimSpriteSheet_203[] = INCBIN_U8("graphics/battle_anims/sprites/203.4bpp.lz");
const u8 gBattleAnimSpritePalette_203[] = INCBIN_U8("graphics/battle_anims/sprites/203.gbapal.lz");
const u8 gBattleAnimSpriteSheet_206[] = INCBIN_U8("graphics/battle_anims/sprites/206.4bpp.lz");
const u8 gBattleAnimSpritePalette_206[] = INCBIN_U8("graphics/battle_anims/sprites/206.gbapal.lz");
const u8 gBattleAnimSpriteSheet_205[] = INCBIN_U8("graphics/battle_anims/sprites/205.4bpp.lz");
const u8 gBattleAnimSpritePalette_205[] = INCBIN_U8("graphics/battle_anims/sprites/205.gbapal.lz");
const u8 gBattleAnimSpriteSheet_207[] = INCBIN_U8("graphics/battle_anims/sprites/207.4bpp.lz");
const u8 gBattleAnimSpritePalette_207[] = INCBIN_U8("graphics/battle_anims/sprites/207.gbapal.lz");
const u8 gBattleAnimSpriteSheet_208[] = INCBIN_U8("graphics/battle_anims/sprites/208.4bpp.lz");
const u8 gBattleAnimSpriteSheet_209[] = INCBIN_U8("graphics/battle_anims/sprites/209.4bpp.lz");
const u8 gBattleAnimSpritePalette_209[] = INCBIN_U8("graphics/battle_anims/sprites/209.gbapal.lz");
const u8 gBattleAnimSpriteSheet_064[] = INCBIN_U8("graphics/battle_anims/sprites/064.4bpp.lz");
const u8 gBattleAnimSpritePalette_064[] = INCBIN_U8("graphics/battle_anims/sprites/064.gbapal.lz");
const u8 gBattleAnimSpriteSheet_210[] = INCBIN_U8("graphics/battle_anims/sprites/210.4bpp.lz");
const u8 gBattleAnimSpritePalette_219[] = INCBIN_U8("graphics/battle_anims/sprites/219.gbapal.lz");
const u8 gBattleAnimSpritePalette_210[] = INCBIN_U8("graphics/battle_anims/sprites/210.gbapal.lz");
const u8 gBattleAnimSpritePalette_216[] = INCBIN_U8("graphics/battle_anims/sprites/216.gbapal.lz");

const u8 gAttractGfx[] = INCBIN_U8("graphics/battle_anims/backgrounds/attract.4bpp.lz");
const u8 gAttractPal[] = INCBIN_U8("graphics/battle_anims/backgrounds/attract.gbapal.lz");
const u8 gAttractTilemap[] = INCBIN_U8("graphics/battle_anims/backgrounds/attract.bin.lz");

const u8 gBattleAnimSpriteSheet_217[] = INCBIN_U8("graphics/battle_anims/sprites/217.4bpp.lz");
const u8 gBattleAnimSpritePalette_217[] = INCBIN_U8("graphics/battle_anims/sprites/217.gbapal.lz");
const u8 gBattleAnimSpriteSheet_212[] = INCBIN_U8("graphics/battle_anims/sprites/212.4bpp.lz");
const u8 gBattleAnimSpriteSheet_211[] = INCBIN_U8("graphics/battle_anims/sprites/211.4bpp.lz");
const u8 gBattleAnimSpriteSheet_213[] = INCBIN_U8("graphics/battle_anims/sprites/213.4bpp.lz");
const u8 gBattleAnimSpritePalette_211[] = INCBIN_U8("graphics/battle_anims/sprites/211.gbapal.lz");
const u8 gBattleAnimSpriteSheet_214[] = INCBIN_U8("graphics/battle_anims/sprites/214.4bpp.lz");
const u8 gBattleAnimSpriteSheet_215[] = INCBIN_U8("graphics/battle_anims/sprites/215.4bpp.lz");
const u8 gBattleAnimSpritePalette_215[] = INCBIN_U8("graphics/battle_anims/sprites/215.gbapal.lz");

const u8 gBattleAnimBackgroundPalette_ScaryFace[] = INCBIN_U8("graphics/battle_anims/backgrounds/scary_face.gbapal.lz");
const u8 gBattleAnimBackgroundImage_ScaryFace[] = INCBIN_U8("graphics/battle_anims/backgrounds/scary_face.4bpp.lz");

const u8 gBattleAnimSpritePalette_218[] = INCBIN_U8("graphics/battle_anims/sprites/218.gbapal.lz");
const u8 gBattleAnimSpriteSheet_218[] = INCBIN_U8("graphics/battle_anims/sprites/218.4bpp.lz");
const u8 gBattleAnimSpriteSheet_087[] = INCBIN_U8("graphics/battle_anims/sprites/087.4bpp.lz");
const u8 gBattleAnimSpritePalette_087[] = INCBIN_U8("graphics/battle_anims/sprites/087.gbapal.lz");
const u8 gBattleAnimSpriteSheet_018[] = INCBIN_U8("graphics/battle_anims/sprites/018.4bpp.lz");
const u8 gBattleAnimSpritePalette_018[] = INCBIN_U8("graphics/battle_anims/sprites/018.gbapal.lz");
const u8 gBattleAnimSpritePalette_220[] = INCBIN_U8("graphics/battle_anims/sprites/220.gbapal.lz");
const u8 gBattleAnimSpriteSheet_220[] = INCBIN_U8("graphics/battle_anims/sprites/220.4bpp.lz");
const u8 gBattleAnimSpritePalette_221[] = INCBIN_U8("graphics/battle_anims/sprites/221.gbapal.lz");
const u8 gBattleAnimSpriteSheet_221[] = INCBIN_U8("graphics/battle_anims/sprites/221.4bpp.lz");
const u8 gBattleAnimSpriteSheet_222[] = INCBIN_U8("graphics/battle_anims/sprites/222.4bpp.lz");
const u8 gBattleAnimSpritePalette_222[] = INCBIN_U8("graphics/battle_anims/sprites/222.gbapal.lz");
const u8 gBattleAnimSpritePalette_223[] = INCBIN_U8("graphics/battle_anims/sprites/223.gbapal.lz");
const u8 gBattleAnimSpriteSheet_223[] = INCBIN_U8("graphics/battle_anims/sprites/223.4bpp.lz");
const u8 gBattleAnimSpritePalette_224[] = INCBIN_U8("graphics/battle_anims/sprites/224.gbapal.lz");
const u8 gBattleAnimSpriteSheet_224[] = INCBIN_U8("graphics/battle_anims/sprites/224.4bpp.lz");
const u8 gBattleAnimSpritePalette_230[] = INCBIN_U8("graphics/battle_anims/sprites/230.gbapal.lz");
const u8 gBattleAnimSpriteSheet_230[] = INCBIN_U8("graphics/battle_anims/sprites/230.4bpp.lz");
const u8 gBattleAnimSpritePalette_228[] = INCBIN_U8("graphics/battle_anims/sprites/228.gbapal.lz");
const u8 gBattleAnimSpriteSheet_228[] = INCBIN_U8("graphics/battle_anims/sprites/228.4bpp.lz");

const u8 gBattleAnimBackgroundPalette_04[] = INCBIN_U8("graphics/battle_anims/backgrounds/04.gbapal.lz");
const u8 gBattleAnimBackgroundImage_04[] = INCBIN_U8("graphics/battle_anims/backgrounds/04.4bpp.lz");
const u8 gBattleAnimBackgroundTilemap_04[] = INCBIN_U8("graphics/battle_anims/backgrounds/04.bin.lz");
const u8 gBattleAnimBackgroundTilemap_05[] = INCBIN_U8("graphics/battle_anims/backgrounds/05.bin.lz");
const u8 gBattleAnimBackgroundTilemap_06[] = INCBIN_U8("graphics/battle_anims/backgrounds/06.bin.lz");
const u8 gBattleAnimSpriteSheet_225[] = INCBIN_U8("graphics/battle_anims/sprites/225.4bpp.lz");
const u8 gBattleAnimSpritePalette_225[] = INCBIN_U8("graphics/battle_anims/sprites/225.gbapal.lz");
const u8 gBattleAnimSpriteSheet_227[] = INCBIN_U8("graphics/battle_anims/sprites/227.4bpp.lz");
const u8 gBattleAnimSpriteSheet_226[] = INCBIN_U8("graphics/battle_anims/sprites/226.4bpp.lz");
const u8 gBattleAnimSpritePalette_226[] = INCBIN_U8("graphics/battle_anims/sprites/226.gbapal.lz");
const u8 gBattleAnimSpriteSheet_229[] = INCBIN_U8("graphics/battle_anims/sprites/229.4bpp.lz");
const u8 gBattleAnimSpritePalette_229[] = INCBIN_U8("graphics/battle_anims/sprites/229.gbapal.lz");
const u8 gBattleAnimSpriteSheet_099[] = INCBIN_U8("graphics/battle_anims/sprites/099.4bpp.lz");
const u8 gBattleAnimSpritePalette_099[] = INCBIN_U8("graphics/battle_anims/sprites/099.gbapal.lz");
const u8 gBattleAnimSpriteSheet_232[] = INCBIN_U8("graphics/battle_anims/sprites/232.4bpp.lz");
const u8 gBattleAnimSpritePalette_231[] = INCBIN_U8("graphics/battle_anims/sprites/231.gbapal.lz");
const u8 gBattleAnimSpriteSheet_231[] = INCBIN_U8("graphics/battle_anims/sprites/231.4bpp.lz");
const u8 gBattleAnimSpriteSheet_233[] = INCBIN_U8("graphics/battle_anims/sprites/233.4bpp.lz");
const u8 gBattleAnimSpritePalette_233[] = INCBIN_U8("graphics/battle_anims/sprites/233.gbapal.lz");
const u8 gBattleAnimSpriteSheet_234[] = INCBIN_U8("graphics/battle_anims/sprites/234.4bpp.lz");
const u8 gBattleAnimSpritePalette_234[] = INCBIN_U8("graphics/battle_anims/sprites/234.gbapal.lz");
const u8 gBattleAnimSpriteSheet_238[] = INCBIN_U8("graphics/battle_anims/sprites/238.4bpp.lz");
const u8 gBattleAnimSpritePalette_238[] = INCBIN_U8("graphics/battle_anims/sprites/238.gbapal.lz");
const u8 gBattleAnimSpriteSheet_235[] = INCBIN_U8("graphics/battle_anims/sprites/235.4bpp.lz");
const u8 gBattleAnimSpritePalette_235[] = INCBIN_U8("graphics/battle_anims/sprites/235.gbapal.lz");
const u8 gBattleAnimSpritePalette_236[] = INCBIN_U8("graphics/battle_anims/sprites/236.gbapal.lz");
const u8 gBattleAnimSpritePalette_237[] = INCBIN_U8("graphics/battle_anims/sprites/237.gbapal.lz");
const u8 gBattleAnimBackgroundImage_07[] = INCBIN_U8("graphics/battle_anims/backgrounds/07.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_07[] = INCBIN_U8("graphics/battle_anims/backgrounds/07.gbapal.lz");
const u8 gBattleAnimBackgroundPalette_18[] = INCBIN_U8("graphics/battle_anims/backgrounds/18.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_07[] = INCBIN_U8("graphics/battle_anims/backgrounds/07.bin.lz");
const u8 gBattleAnimBackgroundTilemap_08[] = INCBIN_U8("graphics/battle_anims/backgrounds/08.bin.lz");
const u8 gBattleAnimBackgroundImage_20[] = INCBIN_U8("graphics/battle_anims/backgrounds/20.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_20[] = INCBIN_U8("graphics/battle_anims/backgrounds/20.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_20[] = INCBIN_U8("graphics/battle_anims/backgrounds/20.bin.lz");
const u8 gBattleAnimBackgroundTilemap_09[] = INCBIN_U8("graphics/battle_anims/backgrounds/09.bin.lz");
const u8 gBattleAnimBackgroundPalette_09[] = INCBIN_U8("graphics/battle_anims/backgrounds/09.gbapal.lz");
const u8 gBattleAnimBackgroundPalette_22[] = INCBIN_U8("graphics/battle_anims/backgrounds/22.gbapal.lz");
const u8 gBattleAnimBackgroundImage_09[] = INCBIN_U8("graphics/battle_anims/backgrounds/09.4bpp.lz");
const u8 gBattleAnimBackgroundTilemap_10[] = INCBIN_U8("graphics/battle_anims/backgrounds/10.bin.lz");
const u8 gUnknown_08D2A9E0[] = INCBIN_U8("graphics/battle_anims/masks/morning_sun.4bpp.lz");
const u8 gUnknown_08D2AA80[] = INCBIN_U8("graphics/battle_anims/masks/morning_sun.gbapal.lz");
const u8 gUnknown_08D2AA98[] = INCBIN_U8("graphics/battle_anims/masks/morning_sun.bin.lz");
const u8 gBattleAnimBackgroundTilemap_12[] = INCBIN_U8("graphics/battle_anims/backgrounds/12.bin.lz");
const u8 gBattleAnimBackgroundTilemap_13[] = INCBIN_U8("graphics/battle_anims/backgrounds/13.bin.lz");
const u8 gBattleAnimBackgroundTilemap_14[] = INCBIN_U8("graphics/battle_anims/backgrounds/14.bin.lz");
const u8 gBattleAnimBackgroundImage_12[] = INCBIN_U8("graphics/battle_anims/backgrounds/12.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_12[] = INCBIN_U8("graphics/battle_anims/backgrounds/12.gbapal.lz");
const u8 gBattleAnimBackgroundImage_11[] = INCBIN_U8("graphics/battle_anims/backgrounds/11.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_11[] = INCBIN_U8("graphics/battle_anims/backgrounds/11.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_11[] = INCBIN_U8("graphics/battle_anims/backgrounds/11.bin.lz");
const u8 gBattleAnimSpriteSheet_239[] = INCBIN_U8("graphics/battle_anims/sprites/239.4bpp.lz");
const u8 gBattleAnimSpritePalette_239[] = INCBIN_U8("graphics/battle_anims/sprites/239.gbapal.lz");
const u8 gBattleAnimSpriteSheet_143[] = INCBIN_U8("graphics/battle_anims/sprites/143.4bpp.lz");
const u8 gBattleAnimSpritePalette_143[] = INCBIN_U8("graphics/battle_anims/sprites/143.gbapal.lz");
const u8 gBattleAnimSpriteSheet_240[] = INCBIN_U8("graphics/battle_anims/sprites/240.4bpp.lz");
const u8 gBattleAnimSpritePalette_240[] = INCBIN_U8("graphics/battle_anims/sprites/240.gbapal.lz");
const u8 gSubstituteDollPal[] = INCBIN_U8("graphics/battle_anims/sprites/substitute.gbapal.lz");
const u8 gSubstituteDollGfx[] = INCBIN_U8("graphics/battle_anims/sprites/substitute.4bpp.lz");
const u8 gSubstituteDollTilemap[] = INCBIN_U8("graphics/battle_anims/sprites/substitute.bin.lz");
const u8 gBattleAnimSpriteSheet_241[] = INCBIN_U8("graphics/battle_anims/sprites/241.4bpp.lz");
const u8 gBattleAnimSpritePalette_241[] = INCBIN_U8("graphics/battle_anims/sprites/241.gbapal.lz");
const u8 gContestConfetti_Gfx[] = INCBIN_U8("graphics/misc/confetti.4bpp.lz");
const u8 gContestConfetti_Pal[] = INCBIN_U8("graphics/misc/confetti.gbapal.lz");
const u8 gBattleAnimSpriteSheet_242[] = INCBIN_U8("graphics/battle_anims/sprites/242.4bpp.lz");
const u8 gBattleAnimSpritePalette_242[] = INCBIN_U8("graphics/battle_anims/sprites/242.gbapal.lz");
const u8 gBattleAnimSpriteSheet_243[] = INCBIN_U8("graphics/battle_anims/sprites/243.4bpp.lz");
const u8 gBattleAnimSpritePalette_243[] = INCBIN_U8("graphics/battle_anims/sprites/243.gbapal.lz");
const u8 gBattleStatMask_Gfx[] = INCBIN_U8("graphics/battle_anims/masks/stat.4bpp.lz");
const u8 gBattleStatMask1_Tilemap[] = INCBIN_U8("graphics/battle_anims/masks/stat_tilemap_1.bin.lz");
const u8 gBattleStatMask2_Tilemap[] = INCBIN_U8("graphics/battle_anims/masks/stat_tilemap_2.bin.lz");
const u8 gBattleStatMask1_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat1.gbapal.lz");
const u8 gBattleStatMask2_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat2.gbapal.lz");
const u8 gBattleStatMask3_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat3.gbapal.lz");
const u8 gBattleStatMask4_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat4.gbapal.lz");
const u8 gBattleStatMask5_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat5.gbapal.lz");
const u8 gBattleStatMask6_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat6.gbapal.lz");
const u8 gBattleStatMask7_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat7.gbapal.lz");
const u8 gBattleStatMask8_Pal[] = INCBIN_U8("graphics/battle_anims/masks/stat8.gbapal.lz");
const u8 gUnknown_08D2E014[] = INCBIN_U8("graphics/battle_anims/masks/cure_bubbles.4bpp.lz");
const u8 gUnknown_08D2E150[] = INCBIN_U8("graphics/battle_anims/masks/cure_bubbles.gbapal.lz");
const u8 gUnknown_08D2E170[] = INCBIN_U8("graphics/battle_anims/masks/cure_bubbles.bin.lz");
const u8 gBattleAnimSpritePalette_245[] = INCBIN_U8("graphics/battle_anims/sprites/245.gbapal.lz");
const u8 gBattleAnimSpriteSheet_245[] = INCBIN_U8("graphics/battle_anims/sprites/245.4bpp.lz");
const u8 gBattleAnimSpriteSheet_246[] = INCBIN_U8("graphics/battle_anims/sprites/246.4bpp.lz");
const u8 gBattleAnimSpriteSheet_244[] = INCBIN_U8("graphics/battle_anims/sprites/244.4bpp.lz");
const u8 gBattleAnimSpritePalette_244[] = INCBIN_U8("graphics/battle_anims/sprites/244.gbapal.lz");
const u8 gBattleAnimSpriteSheet_247[] = INCBIN_U8("graphics/battle_anims/sprites/247.4bpp.lz");
const u8 gBattleAnimSpriteSheet_053[] = INCBIN_U8("graphics/battle_anims/sprites/053.4bpp.lz");
const u8 gUnknown_08D2EDFC[] = INCBIN_U8("graphics/battle_anims/masks/unknown_D2EDFC.4bpp.lz");
const u8 gUnknown_08D2EE48[] = INCBIN_U8("graphics/battle_anims/masks/unknown_D2EDFC.bin.lz");
const u8 gBattleAnimSpriteSheet_248[] = INCBIN_U8("graphics/battle_anims/sprites/248.4bpp.lz");
const u8 gBattleAnimSpritePalette_248[] = INCBIN_U8("graphics/battle_anims/sprites/248.gbapal.lz");
const u8 gBattleAnimSpriteSheet_249[] = INCBIN_U8("graphics/battle_anims/sprites/249.4bpp.lz");
const u8 gBattleAnimSpritePalette_249[] = INCBIN_U8("graphics/battle_anims/sprites/249.gbapal.lz");
const u8 gBattleAnimSpriteSheet_250[] = INCBIN_U8("graphics/battle_anims/sprites/250.4bpp.lz");
const u8 gBattleAnimSpriteSheet_251[] = INCBIN_U8("graphics/battle_anims/sprites/251.4bpp.lz");
const u8 gBattleAnimSpritePalette_251[] = INCBIN_U8("graphics/battle_anims/sprites/251.gbapal.lz");
const u8 gBattleAnimSpriteSheet_252[] = INCBIN_U8("graphics/battle_anims/sprites/252.4bpp.lz");
const u8 gBattleAnimSpritePalette_252[] = INCBIN_U8("graphics/battle_anims/sprites/252.gbapal.lz");
const u8 gBattleAnimSpriteSheet_253[] = INCBIN_U8("graphics/battle_anims/sprites/253.4bpp.lz");
const u8 gBattleAnimSpritePalette_253[] = INCBIN_U8("graphics/battle_anims/sprites/253.gbapal.lz");
const u8 gBattleAnimSpriteSheet_254[] = INCBIN_U8("graphics/battle_anims/sprites/254.4bpp.lz");
const u8 gBattleAnimSpritePalette_254[] = INCBIN_U8("graphics/battle_anims/sprites/254.gbapal.lz");
const u8 gBattleAnimSpriteSheet_255[] = INCBIN_U8("graphics/battle_anims/sprites/255.4bpp.lz");
const u8 gBattleAnimSpritePalette_255[] = INCBIN_U8("graphics/battle_anims/sprites/255.gbapal.lz");
const u8 gBattleAnimSpriteSheet_258[] = INCBIN_U8("graphics/battle_anims/sprites/258.4bpp.lz");
const u8 gBattleAnimSpritePalette_258[] = INCBIN_U8("graphics/battle_anims/sprites/258.gbapal.lz");
const u8 gBattleAnimSpriteSheet_256[] = INCBIN_U8("graphics/battle_anims/sprites/256.4bpp.lz");
const u8 gBattleAnimSpritePalette_256[] = INCBIN_U8("graphics/battle_anims/sprites/256.gbapal.lz");
const u8 gBattleAnimSpriteSheet_257[] = INCBIN_U8("graphics/battle_anims/sprites/257.4bpp.lz");
const u8 gBattleAnimSpritePalette_257[] = INCBIN_U8("graphics/battle_anims/sprites/257.gbapal.lz");

#include "graphics/pokemon.h"

const u8 gMonFrontPic_UnownExclamationMark[] = INCBIN_U8("graphics/pokemon/unown/front_exclamation_mark.4bpp.lz");
const u8 gMonBackPic_UnownExclamationMark[] = INCBIN_U8("graphics/pokemon/unown/back_exclamation_mark.4bpp.lz");
const u8 gMonIcon_UnownExclamationMark[] = INCBIN_U8("graphics/pokemon/unown/icon_exclamation_mark.4bpp");
const u8 gMonFrontPic_UnownQuestionMark[] = INCBIN_U8("graphics/pokemon/unown/front_question_mark.4bpp.lz");
const u8 gMonBackPic_UnownQuestionMark[] = INCBIN_U8("graphics/pokemon/unown/back_question_mark.4bpp.lz");
const u8 gMonIcon_UnownQuestionMark[] = INCBIN_U8("graphics/pokemon/unown/icon_question_mark.4bpp");

#include "graphics/trainers.h"

const u8 gMonIcon_QuestionMark[] = INCBIN_U8("graphics/pokemon/question_mark/icon.4bpp");
const u8 gMonFootprint_QuestionMark[] = INCBIN_U8("graphics/pokemon/question_mark/footprint.1bpp");
const u8 gVersusFrameGfx[] = INCBIN_U8("graphics/battle_transitions/vs_frame.4bpp.lz");
const u8 gVersusFrameTilemap[] = INCBIN_U8("graphics/battle_transitions/vs_frame.bin.lz");
const u8 gVersusFramePal[] = INCBIN_U8("graphics/battle_transitions/vs_frame.gbapal.lz");
const u8 gUnknown_08E5DC2C[] = INCBIN_U8("graphics/battle_transitions/vs.4bpp.lz");
const u8 gBattleTerrainTiles_TallGrass[] = INCBIN_U8("graphics/battle_terrain/tall_grass/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_TallGrass[] = INCBIN_U8("graphics/battle_terrain/tall_grass/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_TallGrass[] = INCBIN_U8("graphics/battle_terrain/tall_grass/map.bin.lz");
const u8 gBattleTerrainTiles_LongGrass[] = INCBIN_U8("graphics/battle_terrain/long_grass/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_LongGrass[] = INCBIN_U8("graphics/battle_terrain/long_grass/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_LongGrass[] = INCBIN_U8("graphics/battle_terrain/long_grass/map.bin.lz");
const u8 gBattleTerrainTiles_Sand[] = INCBIN_U8("graphics/battle_terrain/sand/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_Sand[] = INCBIN_U8("graphics/battle_terrain/sand/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_Sand[] = INCBIN_U8("graphics/battle_terrain/sand/map.bin.lz");
const u8 gBattleTerrainTiles_Underwater[] = INCBIN_U8("graphics/battle_terrain/underwater/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_Underwater[] = INCBIN_U8("graphics/battle_terrain/underwater/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_Underwater[] = INCBIN_U8("graphics/battle_terrain/underwater/map.bin.lz");
const u8 gBattleTerrainTiles_Water[] = INCBIN_U8("graphics/battle_terrain/water/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_Water[] = INCBIN_U8("graphics/battle_terrain/water/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_Water[] = INCBIN_U8("graphics/battle_terrain/water/map.bin.lz");
const u8 gBattleTerrainTiles_PondWater[] = INCBIN_U8("graphics/battle_terrain/pond_water/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_PondWater[] = INCBIN_U8("graphics/battle_terrain/pond_water/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_PondWater[] = INCBIN_U8("graphics/battle_terrain/pond_water/map.bin.lz");
const u8 gBattleTerrainTiles_Rock[] = INCBIN_U8("graphics/battle_terrain/rock/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_Rock[] = INCBIN_U8("graphics/battle_terrain/rock/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_Rock[] = INCBIN_U8("graphics/battle_terrain/rock/map.bin.lz");
const u8 gBattleTerrainTiles_Cave[] = INCBIN_U8("graphics/battle_terrain/cave/tiles.4bpp.lz");
const u8 gBattleTerrainPalette_Cave[] = INCBIN_U8("graphics/battle_terrain/cave/palette.gbapal.lz");
const u8 gBattleTerrainTilemap_Cave[] = INCBIN_U8("graphics/battle_terrain/cave/map.bin.lz");
const u8 gBattleTerrainPalette_Plain[] = INCBIN_U8("graphics/battle_terrain/plain/palette.gbapal.lz");
const u8 gBattleTerrainTiles_Building[] = INCBIN_U8("graphics/battle_terrain/building/tiles.4bpp.lz");

// this is also used for link battles
const u8 gBattleTerrainPalette_BattleTower[] = INCBIN_U8("graphics/battle_terrain/stadium/battle_tower.gbapal.lz");
const u8 gBattleTerrainTilemap_Building[] = INCBIN_U8("graphics/battle_terrain/building/map.bin.lz");
const u8 gBattleTerrainTiles_Stadium[] = INCBIN_U8("graphics/battle_terrain/stadium/tiles.4bpp.lz");
const u8 gBattleTerrainTilemap_Stadium[] = INCBIN_U8("graphics/battle_terrain/stadium/map.bin.lz");
const u8 gBattleTerrainPalette_Building[] = INCBIN_U8("graphics/battle_terrain/building/palette.gbapal.lz");
const u8 gBattleTerrainPalette_Kyogre[] = INCBIN_U8("graphics/battle_terrain/water/kyogre.gbapal.lz");
const u8 gBattleTerrainPalette_Groudon[] = INCBIN_U8("graphics/battle_terrain/cave/groudon.gbapal.lz");
const u8 gBattleTerrainPalette_BuildingGym[] = INCBIN_U8("graphics/battle_terrain/building/palette2.gbapal.lz");
const u8 gBattleTerrainPalette_BuildingLeader[] = INCBIN_U8("graphics/battle_terrain/building/palette3.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumAqua[] = INCBIN_U8("graphics/battle_terrain/stadium/palette1.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumMagma[] = INCBIN_U8("graphics/battle_terrain/stadium/palette2.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumSidney[] = INCBIN_U8("graphics/battle_terrain/stadium/palette3.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumPhoebe[] = INCBIN_U8("graphics/battle_terrain/stadium/palette4.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumGlacia[] = INCBIN_U8("graphics/battle_terrain/stadium/palette5.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumDrake[] = INCBIN_U8("graphics/battle_terrain/stadium/palette6.gbapal.lz");
const u8 gBattleTerrainPalette_StadiumSteven[] = INCBIN_U8("graphics/battle_terrain/stadium/palette7.gbapal.lz");
const u8 gBattleTerrainAnimTiles_TallGrass[] = INCBIN_U8("graphics/battle_terrain/tall_grass/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_TallGrass[] = INCBIN_U8("graphics/battle_terrain/tall_grass/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_LongGrass[] = INCBIN_U8("graphics/battle_terrain/long_grass/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_LongGrass[] = INCBIN_U8("graphics/battle_terrain/long_grass/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_Sand[] = INCBIN_U8("graphics/battle_terrain/sand/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_Sand[] = INCBIN_U8("graphics/battle_terrain/sand/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_Underwater[] = INCBIN_U8("graphics/battle_terrain/underwater/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_Underwater[] = INCBIN_U8("graphics/battle_terrain/underwater/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_Water[] = INCBIN_U8("graphics/battle_terrain/water/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_Water[] = INCBIN_U8("graphics/battle_terrain/water/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_PondWater[] = INCBIN_U8("graphics/battle_terrain/pond_water/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_PondWater[] = INCBIN_U8("graphics/battle_terrain/pond_water/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_Rock[] = INCBIN_U8("graphics/battle_terrain/rock/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_Rock[] = INCBIN_U8("graphics/battle_terrain/rock/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_Cave[] = INCBIN_U8("graphics/battle_terrain/cave/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_Cave[] = INCBIN_U8("graphics/battle_terrain/cave/anim_map.bin.lz");
const u8 gBattleTerrainAnimTiles_Building[] = INCBIN_U8("graphics/battle_terrain/building/anim_tiles.4bpp.lz");
const u8 gBattleTerrainAnimTilemap_Building[] = INCBIN_U8("graphics/battle_terrain/building/anim_map.bin.lz");
const u8 gBattleAnimSpriteSheet_261[] = INCBIN_U8("graphics/battle_anims/sprites/261.4bpp.lz");
const u8 gBattleAnimBackgroundTilemap_SandstormBrew[] = INCBIN_U8("graphics/battle_anims/backgrounds/sandstorm_brew.bin.lz");
const u8 gBattleAnimBackgroundImage_SandstormBrew[] = INCBIN_U8("graphics/battle_anims/backgrounds/sandstorm_brew.4bpp.lz");
const u8 gBattleAnimSpritePalette_261[] = INCBIN_U8("graphics/battle_anims/sprites/261.gbapal.lz");
const u8 gBattleAnimSpriteSheet_260[] = INCBIN_U8("graphics/battle_anims/sprites/260.4bpp.lz");
const u8 gBattleAnimSpritePalette_260[] = INCBIN_U8("graphics/battle_anims/sprites/260.gbapal.lz");
const u8 gBattleAnimBackgroundImage_15[] = INCBIN_U8("graphics/battle_anims/backgrounds/15.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_15[] = INCBIN_U8("graphics/battle_anims/backgrounds/15.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_15[] = INCBIN_U8("graphics/battle_anims/backgrounds/15.bin.lz");
const u8 gBattleAnimSpriteSheet_262[] = INCBIN_U8("graphics/battle_anims/sprites/262.4bpp.lz");
const u8 gBattleAnimSpritePalette_262[] = INCBIN_U8("graphics/battle_anims/sprites/262.gbapal.lz");
const u8 gContestNextTurnGfx[] = INCBIN_U8("graphics/contest/nextturn.4bpp.lz");
const u8 gContestNextTurnNumbersGfx[] = INCBIN_U8("graphics/contest/nextturn_numbers.4bpp");
const u8 gContestNextTurnRandomGfx[] = INCBIN_U8("graphics/contest/nextturn_random.4bpp");
const u8 gBattleAnimSpriteSheet_264[] = INCBIN_U8("graphics/battle_anims/sprites/264.4bpp.lz");
const u8 gBattleAnimSpritePalette_264[] = INCBIN_U8("graphics/battle_anims/sprites/264.gbapal.lz");
const u8 gBattleAnimSpritePalette_265[] = INCBIN_U8("graphics/battle_anims/sprites/265.gbapal.lz");
const u8 gBattleAnimSpritePalette_067[] = INCBIN_U8("graphics/battle_anims/sprites/067.gbapal.lz");
const u8 gBattleAnimSpritePalette_068[] = INCBIN_U8("graphics/battle_anims/sprites/068.gbapal.lz");
const u8 gContestApplauseGfx[] = INCBIN_U8("graphics/contest/applause.4bpp.lz");
const u8 gContestApplauseMeterGfx[] = INCBIN_U8("graphics/contest/applause_meter.4bpp");
const u8 gContestPal[] = INCBIN_U8("graphics/contest/nextturn.gbapal");
const u8 gBattleAnimSpriteSheet_272[] = INCBIN_U8("graphics/battle_anims/sprites/272.4bpp.lz");
const u8 gBattleAnimSpritePalette_272[] = INCBIN_U8("graphics/battle_anims/sprites/272.gbapal.lz");
const u8 gBattleAnimSpriteSheet_273[] = INCBIN_U8("graphics/battle_anims/sprites/273.4bpp.lz");
const u8 gBattleAnimSpriteSheet_269[] = INCBIN_U8("graphics/battle_anims/sprites/269.4bpp.lz");
const u8 gBattleAnimSpritePalette_269[] = INCBIN_U8("graphics/battle_anims/sprites/269.gbapal.lz");
const u8 gBattleAnimSpriteSheet_274[] = INCBIN_U8("graphics/battle_anims/sprites/274.4bpp.lz");
const u8 gBattleAnimSpriteSheet_275[] = INCBIN_U8("graphics/battle_anims/sprites/275.4bpp.lz");
const u8 gBattleAnimSpriteSheet_276[] = INCBIN_U8("graphics/battle_anims/sprites/276.4bpp.lz");
const u8 gBattleAnimSpritePalette_274[] = INCBIN_U8("graphics/battle_anims/sprites/274.gbapal.lz");
const u8 gBattleAnimBackgroundImage_17[] = INCBIN_U8("graphics/battle_anims/backgrounds/17.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_17[] = INCBIN_U8("graphics/battle_anims/backgrounds/17.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_17[] = INCBIN_U8("graphics/battle_anims/backgrounds/17.bin.lz");
const u8 gBattleAnimSpriteSheet_280[] = INCBIN_U8("graphics/battle_anims/sprites/280.4bpp.lz");
const u8 gBattleAnimSpritePalette_280[] = INCBIN_U8("graphics/battle_anims/sprites/280.gbapal.lz");
const u8 gBattleAnimBackgroundImageMuddyWater_Pal[] = INCBIN_U8("graphics/battle_anims/backgrounds/water_muddy.gbapal.lz");
const u8 gEnemyMonShadow_Gfx[] = INCBIN_U8("graphics/battle_interface/enemy_mon_shadow.4bpp.lz");
const u8 gBattleGfx_BallStatusBar[] = INCBIN_U8("graphics/battle_interface/bar.4bpp.lz");
const u8 gMonIcon_Egg[] = INCBIN_U8("graphics/pokemon/egg/icon.4bpp");
const u8 gBattleAnimBackgroundImage_02[] = INCBIN_U8("graphics/battle_anims/backgrounds/02.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_02[] = INCBIN_U8("graphics/battle_anims/backgrounds/02.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_02[] = INCBIN_U8("graphics/battle_anims/backgrounds/02.bin.lz");
const u8 gBattleAnimSpritePalette_287[] = INCBIN_U8("graphics/battle_anims/sprites/287.gbapal.lz");
const u8 gBattleAnimBackgroundPalette_24[] = INCBIN_U8("graphics/battle_anims/backgrounds/24.gbapal.lz");
const u8 unused_unknown_E6BC04[] = INCBIN_U8("graphics/unknown/unknown_E6BC04.bin.lz");
const u8 gUnknown_08E6C100[] = INCBIN_U8("graphics/berry_blender/center.8bpp.lz");
const u8 gUnknown_08E6C920[] = INCBIN_U8("graphics/berry_blender/outer.4bpp.lz");
const u8 gUnknown_08E6D354[] = INCBIN_U8("graphics/berry_blender/outer_map.bin.lz");
const u8 gBattleAnimBackgroundPalette_16[] = INCBIN_U8("graphics/battle_anims/backgrounds/16.gbapal.lz");
const u8 gBattleAnimBackgroundImage_16[] = INCBIN_U8("graphics/battle_anims/backgrounds/16.4bpp.lz");
const u8 gBattleAnimBackgroundTilemap_16[] = INCBIN_U8("graphics/battle_anims/backgrounds/16.bin.lz");
const u8 gBattleAnimSpritePalette_277[] = INCBIN_U8("graphics/battle_anims/sprites/277.gbapal.lz");
const u8 gBattleAnimSpriteSheet_277[] = INCBIN_U8("graphics/battle_anims/sprites/277.4bpp.lz");
const u8 gBattleAnimFogTilemap[] = INCBIN_U8("graphics/battle_anims/backgrounds/fog.bin.lz");
const u8 gBattleAnimSpritePalette_283[] = INCBIN_U8("graphics/battle_anims/sprites/283.gbapal.lz");
const u8 gBattleAnimSpriteSheet_283[] = INCBIN_U8("graphics/battle_anims/sprites/283.4bpp.lz");
const u8 gBattleAnimBackgroundTilemap_ScaryFacePlayer[] = INCBIN_U8("graphics/battle_anims/backgrounds/scary_face_player.bin.lz");
const u8 gBattleAnimBackgroundTilemap_ScaryFaceOpponent[] = INCBIN_U8("graphics/battle_anims/backgrounds/scary_face_opponent.bin.lz");
const u8 gBattleAnimBackgroundTilemap_ScaryFaceContest[] = INCBIN_U8("graphics/battle_anims/backgrounds/scary_face_contest.bin.lz");
const u8 gBattleAnimSpriteSheet_263[] = INCBIN_U8("graphics/battle_anims/sprites/263.4bpp.lz");
const u8 gBattleAnimSpritePalette_263[] = INCBIN_U8("graphics/battle_anims/sprites/263.gbapal.lz");
const u8 gBattleAnimSpriteSheet_266[] = INCBIN_U8("graphics/battle_anims/sprites/266.4bpp.lz");
const u8 gBattleAnimSpritePalette_266[] = INCBIN_U8("graphics/battle_anims/sprites/266.gbapal.lz");
const u8 gBattleAnimSpritePalette_267[] = INCBIN_U8("graphics/battle_anims/sprites/267.gbapal.lz");
const u8 gBattleAnimSpritePalette_268[] = INCBIN_U8("graphics/battle_anims/sprites/268.gbapal.lz");
const u8 gBattleAnimSpriteSheet_278[] = INCBIN_U8("graphics/battle_anims/sprites/278.4bpp.lz");
const u8 gBattleAnimSpritePalette_278[] = INCBIN_U8("graphics/battle_anims/sprites/278.gbapal.lz");
const u8 gBattleAnimSpriteSheet_279[] = INCBIN_U8("graphics/battle_anims/sprites/279.4bpp.lz");
const u8 gBattleAnimSpritePalette_279[] = INCBIN_U8("graphics/battle_anims/sprites/279.gbapal.lz");
const u8 gBattleAnimSpriteSheet_281[] = INCBIN_U8("graphics/battle_anims/sprites/281.4bpp.lz");
const u8 gBattleAnimSpritePalette_281[] = INCBIN_U8("graphics/battle_anims/sprites/281.gbapal.lz");
const u8 gBattleAnimBackgroundImage_21[] = INCBIN_U8("graphics/battle_anims/backgrounds/21.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_21[] = INCBIN_U8("graphics/battle_anims/backgrounds/21.gbapal.lz");
const u8 gBattleAnimBackgroundTilemap_21[] = INCBIN_U8("graphics/battle_anims/backgrounds/21.bin.lz");
const u8 gBattleAnimSpriteSheet_284[] = INCBIN_U8("graphics/battle_anims/sprites/284.4bpp.lz");
const u8 gBattleAnimSpritePalette_284[] = INCBIN_U8("graphics/battle_anims/sprites/284.gbapal.lz");
const u8 gBattleAnimSpriteSheet_285[] = INCBIN_U8("graphics/battle_anims/sprites/285.4bpp.lz");
const u8 gBattleAnimSpritePalette_285[] = INCBIN_U8("graphics/battle_anims/sprites/285.gbapal.lz");
const u8 gBattleAnimBackgroundImage_Surf[] = INCBIN_U8("graphics/battle_anims/backgrounds/water.4bpp.lz");
const u8 gBattleAnimBackgroundPalette_Surf[] = INCBIN_U8("graphics/battle_anims/backgrounds/water.gbapal.lz");
const u8 gUnknown_08E70968[] = INCBIN_U8("graphics/unknown/unknown_E70968.bin.lz");
const u8 gUnknown_08E70C38[] = INCBIN_U8("graphics/unknown/unknown_E70C38.bin.lz");
const u8 gUnknown_08E70F0C[] = INCBIN_U8("graphics/unknown/unknown_E70F0C.bin.lz");
const u8 gBattleAnimSpritePalette_286[] = INCBIN_U8("graphics/battle_anims/sprites/286.gbapal.lz");
const u8 gBattleAnimSpriteSheet_188[] = INCBIN_U8("graphics/battle_anims/sprites/188.4bpp.lz");
const u8 gBattleAnimSpritePalette_188[] = INCBIN_U8("graphics/battle_anims/sprites/188.gbapal.lz");
const u8 gPartyMenuMisc_Gfx[] = INCBIN_U8("graphics/interface/party_menu_misc.4bpp.lz");
const u8 gPartyMenuMisc_Pal[] = INCBIN_U8("graphics/interface/party_menu_misc.gbapal.lz");
const u8 gPartyMenuMisc_Tilemap[] = INCBIN_U8("graphics/interface/party_menu_misc.bin.lz");
const u8 gPartyMenuHpBar_Gfx[] = INCBIN_U8("graphics/interface/party_menu_hpbar.4bpp.lz");
const u8 gPartyMenuOrderText_Gfx[] = INCBIN_U8("graphics/interface/party_menu_ordertext.4bpp.lz");
const u8 gMoveTypes_Gfx[] = INCBIN_U8("graphics/types/move_types.4bpp.lz");
const u8 gMoveTypes_Pal[] = INCBIN_U8("graphics/types/move_types.gbapal.lz");
const u8 gMenuSummaryGfx[] = INCBIN_U8("graphics/interface/summary_frames.4bpp.lz");// the arrows appear to be unused.

const u8 gMenuSummaryPal[] = INCBIN_U8("graphics/interface/summary_frames.gbapal.lz");
const u8 gStatusGfx_Icons[] = INCBIN_U8("graphics/interface/status_icons.4bpp.lz");
const u8 gStatusPal_Icons[] = INCBIN_U8("graphics/interface/status_icons.gbapal.lz");
const u8 gStatusScreen_Gfx[] = INCBIN_U8("graphics/interface/status_screen.4bpp.lz");
const u8 gStatusScreen_Pal[] = INCBIN_U8("graphics/interface/status_screen.gbapal.lz");
const u8 gUnknown_08E73508[] = INCBIN_U8("graphics/interface/status_screen.bin");
const u8 gStatusScreen_Tilemap[] = INCBIN_U8("graphics/interface/status_screen_pokemon_skills.bin.lz");
const u8 gUnknown_08E73E88[] = INCBIN_U8("graphics/interface/status_screen_battle_moves.bin");
const u8 gUnknown_08E74688[] = INCBIN_U8("graphics/interface/status_screen_contest_moves.bin");
const u8 gUnknown_08E74E88[] = INCBIN_U8("graphics/interface/pokemon_info.bin.lz");
const u8 gBagMaleTiles[] = INCBIN_U8("graphics/misc/bag_male.4bpp.lz");
const u8 gBagFemaleTiles[] = INCBIN_U8("graphics/misc/bag_female.4bpp.lz");
const u8 gBagPalette[] = INCBIN_U8("graphics/misc/bag.gbapal.lz");
const u8 gBagScreen_Gfx[] = INCBIN_U8("graphics/interface/bag_screen.4bpp.lz");
const u8 gBagScreenMale_Pal[] = INCBIN_U8("graphics/interface/bag_screen_male.gbapal.lz");
const u8 gBagScreenFemale_Pal[] = INCBIN_U8("graphics/interface/bag_screen_female.gbapal.lz");
const u8 gBagScreen_Tilemap[] = INCBIN_U8("graphics/interface/bag_screen.bin");
const u8 gBuyMenuFrame_Gfx[] = INCBIN_U8("graphics/interface/mart_frame.4bpp.lz");
const u8 gMenuMoneyPal[] = INCBIN_U8("graphics/interface/money.gbapal.lz");
const u8 gBuyMenuFrame_Tilemap[] = INCBIN_U8("graphics/interface/mart_frame.bin.lz");
const u8 gMenuMoneyGfx[] = INCBIN_U8("graphics/interface/money.4bpp.lz");
const u8 gMenuPokeblock_Gfx[] = INCBIN_U8("graphics/interface/pokeblock_case_frame.4bpp.lz");
const u8 gMenuPokeblock_Pal[] = INCBIN_U8("graphics/interface/pokeblock_case_frame.gbapal.lz");
const u8 gMenuPokeblockDevice_Gfx[] = INCBIN_U8("graphics/interface/pokeblock_device.4bpp.lz");
const u8 gMenuPokeblockDevice_Pal[] = INCBIN_U8("graphics/interface/pokeblock_device.gbapal.lz");
const u8 gMenuPokeblock_Tilemap[] = INCBIN_U8("graphics/interface/pokeblock.bin.lz");
const u8 gPokeblock_Gfx[] = INCBIN_U8("graphics/pokeblock/pokeblock.4bpp.lz");
const u8 gPokeblockRed_Pal[] = INCBIN_U8("graphics/pokeblock/red.gbapal.lz");
const u8 gPokeblockBlue_Pal[] = INCBIN_U8("graphics/pokeblock/blue.gbapal.lz");
const u8 gPokeblockPink_Pal[] = INCBIN_U8("graphics/pokeblock/pink.gbapal.lz");
const u8 gPokeblockGreen_Pal[] = INCBIN_U8("graphics/pokeblock/green.gbapal.lz");
const u8 gPokeblockYellow_Pal[] = INCBIN_U8("graphics/pokeblock/yellow.gbapal.lz");
const u8 gPokeblockPurple_Pal[] = INCBIN_U8("graphics/pokeblock/purple.gbapal.lz");
const u8 gPokeblockIndigo_Pal[] = INCBIN_U8("graphics/pokeblock/indigo.gbapal.lz");
const u8 gPokeblockBrown_Pal[] = INCBIN_U8("graphics/pokeblock/brown.gbapal.lz");
const u8 gPokeblockLiteBlue_Pal[] = INCBIN_U8("graphics/pokeblock/liteblue.gbapal.lz");
const u8 gPokeblockOlive_Pal[] = INCBIN_U8("graphics/pokeblock/olive.gbapal.lz");
const u8 gPokeblockGray_Pal[] = INCBIN_U8("graphics/pokeblock/gray.gbapal.lz");
const u8 gPokeblockBlack_Pal[] = INCBIN_U8("graphics/pokeblock/black.gbapal.lz");
const u8 gPokeblockWhite_Pal[] = INCBIN_U8("graphics/pokeblock/white.gbapal.lz");
const u8 gPokeblockGold_Pal[] = INCBIN_U8("graphics/pokeblock/gold.gbapal.lz");
const u8 gUnknown_08E782FC[] = INCBIN_U8("graphics/interface/pokeblock_feeding_bg_map.bin.lz");
const u8 gBerryCheck_Gfx[] = INCBIN_U8("graphics/interface/check_berry.4bpp.lz");
const u8 gBerryCheck_Pal[] = INCBIN_U8("graphics/interface/check_berry.gbapal.lz");
const u8 gUnknown_08E788E4[] = INCBIN_U8("graphics/interface/berry_tag.bin.lz");
const u8 gUnknown_08E78A84[] = INCBIN_U8("graphics/interface/berry_tag_title.bin.lz");
const u8 gBerryCheckCircle_Gfx[] = INCBIN_U8("graphics/interface/check_berry_circle.4bpp.lz");

#include "graphics/berries.h"

const u8 gBattleAnimSpritePalette_282[] = INCBIN_U8("graphics/battle_anims/sprites/282.gbapal.lz");
const u8 gBattleAnimSpriteSheet_282[] = INCBIN_U8("graphics/battle_anims/sprites/282.4bpp.lz");
const u8 gBattleAnimSpritePalette_270[] = INCBIN_U8("graphics/battle_anims/sprites/270.gbapal.lz");
const u8 gBattleAnimSpriteSheet_270[] = INCBIN_U8("graphics/battle_anims/sprites/270.4bpp.lz");
const u8 gBattleAnimSpritePalette_271[] = INCBIN_U8("graphics/battle_anims/sprites/271.gbapal.lz");
const u8 gBattleAnimSpriteSheet_271[] = INCBIN_U8("graphics/battle_anims/sprites/271.4bpp.lz");

const u16 gCableCarBG_Pal[] = INCBIN_U16("graphics/misc/cable_car_bg.gbapal");
const u16 gCableCar_Pal[] = INCBIN_U16("graphics/misc/cable_car.gbapal");
const u8 gCableCarBG_Gfx[] = INCBIN_U8("graphics/misc/cable_car_bg.4bpp.lz");
const u8 gCableCar_Gfx[] = INCBIN_U8("graphics/misc/cable_car.4bpp.lz");
const u8 gCableCarDoor_Gfx[] = INCBIN_U8("graphics/misc/cable_car_door.4bpp.lz");
const u8 gCableCarCord_Gfx[] = INCBIN_U8("graphics/misc/cable_car_cord.4bpp.lz");

const u8 gUnknown_08E8096C[] = INCBIN_U8("graphics/unknown/unknown_E8096C.4bpp.lz");

const u8 gRouletteWheelTiles[] = INCBIN_U8("graphics/roulette/wheel.8bpp.lz");
const u8 gRouletteCenter_Gfx[] = INCBIN_U8("graphics/roulette/center.4bpp.lz");
const u8 gRouletteHeadersTiles[] = INCBIN_U8("graphics/roulette/headers.4bpp.lz");
const u8 gRouletteCreditTiles[] = INCBIN_U8("graphics/roulette/credit.4bpp.lz");
const u8 gRouletteNumbersTiles[] = INCBIN_U8("graphics/roulette/numbers.4bpp.lz");
const u8 gRouletteMultiplierTiles[] = INCBIN_U8("graphics/roulette/multiplier.4bpp.lz");

const u16 gMailPalette_Orange[] = INCBIN_U16("graphics/mail/orange/palette.gbapal");
const u16 gMailPalette_Harbor[] = INCBIN_U16("graphics/mail/harbor/palette.gbapal");
const u16 gMailPalette_Glitter[] = INCBIN_U16("graphics/mail/glitter/palette.gbapal");
const u16 gMailPalette_Mech[] = INCBIN_U16("graphics/mail/mech/palette.gbapal");
const u16 gMailPalette_Wood[] = INCBIN_U16("graphics/mail/wood/palette.gbapal");
const u16 gMailPalette_Wave[] = INCBIN_U16("graphics/mail/wave/palette.gbapal");
const u16 gMailPalette_Bead[] = INCBIN_U16("graphics/mail/bead/palette.gbapal");
const u16 gMailPalette_Shadow[] = INCBIN_U16("graphics/mail/shadow/palette.gbapal");
const u16 gMailPalette_Tropic[] = INCBIN_U16("graphics/mail/tropic/palette.gbapal");
const u16 gMailPalette_Dream[] = INCBIN_U16("graphics/mail/dream/palette.gbapal");
const u16 gMailPalette_Fab[] = INCBIN_U16("graphics/mail/fab/palette.gbapal");
const u16 gMailPalette_Retro[] = INCBIN_U16("graphics/mail/retro/palette.gbapal");

const u8 gMailTiles_Orange[] = INCBIN_U8("graphics/mail/orange/tiles.4bpp.lz");
const u8 gMailTiles_Harbor[] = INCBIN_U8("graphics/mail/harbor/tiles.4bpp.lz");
const u8 gMailTiles_Glitter[] = INCBIN_U8("graphics/mail/glitter/tiles.4bpp.lz");
const u8 gMailTiles_Mech[] = INCBIN_U8("graphics/mail/mech/tiles.4bpp.lz");
const u8 gMailTiles_Wood[] = INCBIN_U8("graphics/mail/wood/tiles.4bpp.lz");
const u8 gMailTiles_Wave[] = INCBIN_U8("graphics/mail/wave/tiles.4bpp.lz");
const u8 gMailTiles_Bead[] = INCBIN_U8("graphics/mail/bead/tiles.4bpp.lz");
const u8 gMailTiles_Shadow[] = INCBIN_U8("graphics/mail/shadow/tiles.4bpp.lz");
const u8 gMailTiles_Tropic[] = INCBIN_U8("graphics/mail/tropic/tiles.4bpp.lz");
const u8 gMailTiles_Dream[] = INCBIN_U8("graphics/mail/dream/tiles.4bpp.lz");
const u8 gMailTiles_Fab[] = INCBIN_U8("graphics/mail/fab/tiles.4bpp.lz");
const u8 gMailTiles_Retro[] = INCBIN_U8("graphics/mail/retro/tiles.4bpp.lz");

const u8 gMailTilemap_Orange[] = INCBIN_U8("graphics/mail/orange/map.bin.lz");
const u8 gMailTilemap_Harbor[] = INCBIN_U8("graphics/mail/harbor/map.bin.lz");
const u8 gMailTilemap_Glitter[] = INCBIN_U8("graphics/mail/glitter/map.bin.lz");
const u8 gMailTilemap_Mech[] = INCBIN_U8("graphics/mail/mech/map.bin.lz");
const u8 gMailTilemap_Wood[] = INCBIN_U8("graphics/mail/wood/map.bin.lz");
const u8 gMailTilemap_Wave[] = INCBIN_U8("graphics/mail/wave/map.bin.lz");
const u8 gMailTilemap_Bead[] = INCBIN_U8("graphics/mail/bead/map.bin.lz");
const u8 gMailTilemap_Shadow[] = INCBIN_U8("graphics/mail/shadow/map.bin.lz");
const u8 gMailTilemap_Tropic[] = INCBIN_U8("graphics/mail/tropic/map.bin.lz");
const u8 gMailTilemap_Dream[] = INCBIN_U8("graphics/mail/dream/map.bin.lz");
const u8 gMailTilemap_Fab[] = INCBIN_U8("graphics/mail/fab/map.bin.lz");
const u8 gMailTilemap_Retro[] = INCBIN_U8("graphics/mail/retro/map.bin.lz");

const u8 gNamingScreenBackButtonTiles[] = INCBIN_U8("graphics/naming_screen/back_button.4bpp");
const u8 gNamingScreenRightPointingTriangleTiles[] = INCBIN_U8("graphics/naming_screen/right_pointing_triangle.4bpp");
const u8 gNamingScreenOKButtonTiles[] = INCBIN_U8("graphics/naming_screen/ok_button.4bpp");
const u8 gNamingScreenUnderscoreTiles[] = INCBIN_U8("graphics/naming_screen/underscore.4bpp");
const u8 gNamingScreenChangeKeyboardBoxTiles[] = INCBIN_U8("graphics/naming_screen/change_keyboard_box.4bpp");
const u8 gNamingScreenChangeKeyboardButtonTiles[] = INCBIN_U8("graphics/naming_screen/change_keyboard_button.4bpp");

asm(".space 128");

const u8 gNamingScreenOthersTextTiles[] = INCBIN_U8("graphics/naming_screen/others_text.4bpp");
const u8 gNamingScreenCursorTiles[] = INCBIN_U8("graphics/naming_screen/cursor.4bpp");
const u8 gNamingScreenActiveCursorSmallTiles[] = INCBIN_U8("graphics/naming_screen/active_cursor_small.4bpp");
const u8 gNamingScreenActiveCursorBigTiles[] = INCBIN_U8("graphics/naming_screen/active_cursor_big.4bpp");
const u8 gNamingScreenLowerTextTiles[] = INCBIN_U8("graphics/naming_screen/lower_text.4bpp");
const u8 gNamingScreenUpperTextTiles[] = INCBIN_U8("graphics/naming_screen/upper_text.4bpp");

asm(".space 352");

const u8 gNamingScreenMenu_Gfx[] = INCBIN_U8("graphics/naming_screen/menu.4bpp");

const u16 gNamingScreenPalettes[][16] = 
{
    INCBIN_U16("graphics/naming_screen/0.gbapal"),
    INCBIN_U16("graphics/naming_screen/1.gbapal"),
    INCBIN_U16("graphics/naming_screen/2.gbapal"),
    INCBIN_U16("graphics/naming_screen/3.gbapal"),
    INCBIN_U16("graphics/naming_screen/4.gbapal"),
    INCBIN_U16("graphics/naming_screen/5.gbapal"),
};

const u8 gUnknown_08E86258[] = INCBIN_U8("graphics/unknown/unknown_E86258.bin");
const u8 gPokedexMenu_Gfx[] = INCBIN_U8("graphics/pokedex/menu.4bpp.lz");
const u8 gPokedexMenu2_Gfx[] = INCBIN_U8("graphics/pokedex/menu2.4bpp.lz");
const u16 gPokedexMenu_Pal[] = INCBIN_U16("graphics/pokedex/menu1.gbapal");
const u16 gPokedexMenu2_Pal[] = INCBIN_U16("graphics/pokedex/menu2.gbapal");

const u8 gAreaUnknownTiles[] = INCBIN_U8("graphics/pokedex/area_unknown.4bpp.lz");
const u16 gAreaUnknownPalette[] = INCBIN_U16("graphics/pokedex/area_unknown.gbapal");

const u8 gPokedexMenuSearch_Gfx[] = INCBIN_U8("graphics/pokedex/menu_search.4bpp.lz");
const u16 gPokedexMenuSearch_Pal[] = INCBIN_U16("graphics/pokedex/menu3.gbapal");

const u8 gPokenavMainMenu_Gfx[] = INCBIN_U8("graphics/pokenav/mainmenu.4bpp.lz");
const u8 gPokenavMenuOptions_Gfx[] = INCBIN_U8("graphics/pokenav/menu_options.4bpp.lz");
const u16 gPokenavMenuOptions1_Pal[] = INCBIN_U16("graphics/pokenav/pokenav1.gbapal");
const u16 gPokenavMenuOptions2_Pal[] = INCBIN_U16("graphics/pokenav/pokenav2.gbapal");
const u16 gPokenavMenuOptions3_Pal[] = INCBIN_U16("graphics/pokenav/pokenav3.gbapal");
const u8 gPokenavHoennMapHeader_Gfx[] = INCBIN_U8("graphics/pokenav/map_header.4bpp.lz");
const u8 gPokenavHoennMapMisc_Gfx[] = INCBIN_U8("graphics/pokenav/map_misc2.4bpp.lz");
const u8 gPokenavHoennMapSquares_Gfx[] = INCBIN_U8("graphics/pokenav/zoom_tiles.4bpp.lz");
const u16 gPokenavHoennMap1_Pal[] = INCBIN_U16("graphics/pokenav/map_menu.gbapal");
const u8 gPokenavHoennMapSquares_Pal[] = INCBIN_U8("graphics/pokenav/zoom_tiles.gbapal");
const u8 gPokenavConditionMenu_Gfx[] = INCBIN_U8("graphics/pokenav/condition_menu.4bpp.lz");
const u16 gPokenavConditionMenu_Pal[] = INCBIN_U16("graphics/pokenav/condition1.gbapal");
const u8 gPokenavConditionMenuHeader_Gfx[] = INCBIN_U8("graphics/pokenav/condition_menu_header.4bpp.lz");
const u8 gPokenavConditionView_Gfx[] = INCBIN_U8("graphics/pokenav/condition_view.4bpp.lz");
const u8 gPokenavConditionMenu2_Pal[] = INCBIN_U8("graphics/pokenav/condition2.gbapal");
const u8 gPokenavConditionMenuOptions_Gfx[] = INCBIN_U8("graphics/pokenav/condition_menu_options.4bpp.lz");
const u8 gPokenavConditionMenuCancel_Gfx[] = INCBIN_U8("graphics/pokenav/condition_cancel.4bpp");
const u8 gPokenavConditionPokeball_Pal[] = INCBIN_U8("graphics/pokenav/condition3.gbapal");//
const u16 gPokenavCondition4_Pal[] = INCBIN_U16("graphics/pokenav/condition4.gbapal");
const u8 gPokenavConditionMenuOptions2_Gfx[] = INCBIN_U8("graphics/pokenav/condition_menu_options2.4bpp.lz");
const u8 gPokenavConditionMenuMisc_Gfx[] = INCBIN_U8("graphics/pokenav/condition_menu_misc.4bpp");
const u16 gPokenavCondition5_Pal[] = INCBIN_U16("graphics/pokenav/condition5.gbapal");
const u8 gPokenavConditionSearch_Gfx[] = INCBIN_U8("graphics/pokenav/condition_search.4bpp.lz");
const u16 gPokenavCondition6_Pal[] = INCBIN_U16("graphics/pokenav/condition6.gbapal");
// another palette thats impossible to leave as native pal file due to 0xFFFF instead of 0x7FFF.
const u16 gPokenavCondition7_Pal[] = INCBIN_U16("graphics/pokenav/condition7.bin");
const u8 gPokenavTrainersEyesHeader_Gfx[] = INCBIN_U8("graphics/pokenav/trainereyes.4bpp.lz");
const u8 gPokenavRibbonsHeader_Gfx[] = INCBIN_U8("graphics/pokenav/ribbons.4bpp.lz");

const u8 gMenuTrainerCard_Gfx[] = INCBIN_U8("graphics/trainer_card/trainer_card.4bpp");
const u16 gMenuTrainerCard0Star_Pal[] = INCBIN_U16("graphics/trainer_card/trainer_card_0star.gbapal");
const u16 gMenuTrainerCard1Star_Pal[] = INCBIN_U16("graphics/trainer_card/trainer_card_1star.gbapal");
const u16 gMenuTrainerCard2Star_Pal[] = INCBIN_U16("graphics/trainer_card/trainer_card_2star.gbapal");
const u16 gMenuTrainerCard3Star_Pal[] = INCBIN_U16("graphics/trainer_card/trainer_card_3star.gbapal");
const u16 gMenuTrainerCard4Star_Pal[] = INCBIN_U16("graphics/trainer_card/trainer_card_4star.gbapal");

const u8 gMenuTrainerCardFront_Tilemap[] = INCBIN_U8("graphics/trainer_card/trainer_card_front.map.bin");
const u8 gMenuTrainerCardBack_Tilemap[] = INCBIN_U8("graphics/trainer_card/trainer_card_back.map.bin");
const u8 gMenuTrainerCardFront2_Tilemap[] = INCBIN_U8("graphics/trainer_card/trainer_card_front_2.map.bin");
const u8 gMenuTrainerCardBackground_Tilemap[] = INCBIN_U8("graphics/trainer_card/trainer_card_background.map.bin");

const u8 gPSSMenuHeader_Gfx[] = INCBIN_U8("graphics/pokemon_storage/header.4bpp.lz");
const u16 gPSSMenu1_Pal[] = INCBIN_U16("graphics/pokemon_storage/menu1.gbapal");
const u16 gPSSMenu2_Pal[] = INCBIN_U16("graphics/pokemon_storage/menu2.bin");
const u8 gPSSMenuHeader_Tilemap[] = INCBIN_U8("graphics/pokemon_storage/header.bin.lz");
const u8 gPSSMenuMisc_Gfx[] = INCBIN_U8("graphics/pokemon_storage/misc1.4bpp.lz");
const u16 gPSSMenu3_Pal[] = INCBIN_U16("graphics/pokemon_storage/menu3.gbapal");
const u16 gPSSMenu4_Pal[] = INCBIN_U16("graphics/pokemon_storage/menu4.gbapal");
const u8 gPSSMenuMisc_Tilemap[] = INCBIN_U8("graphics/pokemon_storage/misc1.bin.lz");

const u8 gHallOfFame_Gfx[] = INCBIN_U8("graphics/misc/hof.4bpp.lz");
const u16 gHallOfFame_Pal[] = INCBIN_U16("graphics/misc/hof.gbapal");

const u8 gMenuWordGroupIndicator_Gfx[] = INCBIN_U8("graphics/interface/wordgroup_indicator.4bpp.lz");
const u8 gMenuWordGroupFrame_Gfx[] = INCBIN_U8("graphics/interface/wordgroup_frame.4bpp.lz");

const u16 gMenuWordGroupIndicator_Pal[] = INCBIN_U16("graphics/interface/wordgroup_indicator.gbapal");
const u16 gMenuWordGroupFrame1_Pal[] = INCBIN_U16("graphics/interface/wordgroup_pink.gbapal");
const u16 gMenuWordGroupFrame2_Pal[] = INCBIN_U16("graphics/interface/wordgroup_blue.gbapal");

const u8 gMiscClock_Gfx[] = INCBIN_U8("graphics/misc/clock.4bpp.lz");
const u16 gMiscClockMale_Pal[] = INCBIN_U16("graphics/misc/clock1.gbapal"); // boy
const u16 gMiscClockFemale_Pal[] = INCBIN_U16("graphics/misc/clock2.gbapal"); // girl

const u8 gSlotMachine_Gfx[] = INCBIN_U8("graphics/slot_machine/slots.4bpp.lz");
const u8 gBattleInterfaceStatusIcons_DynPal[] = INCBIN_U8("graphics/battle_interface/status.gbapal");
const u8 gUnusedArrowGfx[] = INCBIN_U8("graphics/unused/arrow.4bpp"); // unused
const u8 gBerryBlenderMarubatsuTiles[] = INCBIN_U8("graphics/berry_blender/marubatsu.4bpp");
const u8 gBerryBlenderParticlesTiles[] = INCBIN_U8("graphics/berry_blender/particles.4bpp");

asm(".space 0x120");

const u8 gBerryBlenderCountdownNumbersTiles[] = INCBIN_U8("graphics/berry_blender/countdown_numbers.4bpp");
const u8 gBerryBlenderStartTiles[] = INCBIN_U8("graphics/berry_blender/start.4bpp");
const u8 gUnknown_08E91418[] = INCBIN_U8("graphics/unknown/unknown_E91418.bin");

asm(".space 0x1E0");

const u8 gBerryBlenderArrowTiles[] = INCBIN_U8("graphics/berry_blender/arrow.4bpp");
asm(".space 0x2C0");

const u8 gBerryBlenderMiscPalette[] = INCBIN_U8("graphics/berry_blender/misc.gbapal");
const u8 gBerryBlenderArrowPalette[] = INCBIN_U8("graphics/berry_blender/arrow.gbapal");

const u16 gTilesetTiles_General[] = INCBIN_U16("data/tilesets/primary/general/tiles.4bpp.lz");
const u16 gTilesetPalettes_General[][16] = 
{
    INCBIN_U16("data/tilesets/primary/general/palettes/00.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/01.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/02.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/03.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/04.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/05.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/06.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/07.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/08.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/09.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/10.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/11.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/12.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/13.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/14.gbapal"),
    INCBIN_U16("data/tilesets/primary/general/palettes/15.gbapal"),
};

const u8 gUnknown_08E94510[] = INCBIN_U8("graphics/unknown/unknown_E94510.bin");
const u8 gUnknown_08E94550[] = INCBIN_U8("graphics/unknown/unknown_E94550.bin");
const u8 gUnknown_08E94590[] = INCBIN_U8("graphics/unknown/unknown_E94590.bin");
const u8 gUnknown_08E945D0[] = INCBIN_U8("graphics/interface/wordgroup_layout.bin");
const u8 gUnknown_08E94AD0[] = INCBIN_U8("graphics/unknown/unknown_E94AD0.bin");
const u8 gUnknown_08E953D0[] = INCBIN_U8("graphics/unknown/unknown_E953D0.bin.lz");
const u8 gUnknown_08E954B0[] = INCBIN_U8("graphics/misc/wallclock_edit.bin.lz");
const u8 gUnknown_08E95774[] = INCBIN_U8("graphics/misc/wallclock_view.bin.lz");

#ifdef SAPPHIRE
const u8 gUnknown_08E95A18[] = INCBIN_U8("graphics/slot_machine/sapphire.gbapal");
#else
const u8 gUnknown_08E95A18[] = INCBIN_U8("graphics/slot_machine/ruby.gbapal");
#endif // SAPPHIRE

const u8 gUnknown_08E95AB8[] = INCBIN_U8("graphics/unknown/unknown_E95AB8.bin");
const u8 gUnknown_08E95FB8[] = INCBIN_U8("graphics/slot_machine/slots_layout.bin");
const u8 gUnknown_08E964B8[] = INCBIN_U8("graphics/contest/contest_words.bin");
const u16 gUnknown_08E966B8[] = INCBIN_U16("graphics/unknown/unknown_E966B8.gbapal");

const u16 gMonIconPalettes[][16] = 
{
    INCBIN_U16("graphics/pokemon_icon_palettes/0.gbapal"),
    INCBIN_U16("graphics/pokemon_icon_palettes/1.gbapal"),
    INCBIN_U16("graphics/pokemon_icon_palettes/2.gbapal"),
};

const u8 gUnknown_08E96738[] = INCBIN_U8("graphics/unknown/unknown_E96738.bin.lz");
const u8 gUnknown_08E96888[] = INCBIN_U8("graphics/pokedex/pokedex_list_menu.bin.lz");
const u8 gUnknown_08E96994[] = INCBIN_U8("graphics/pokedex/pokedex_listing_menu.bin.lz");
const u8 gUnknown_08E96ACC[] = INCBIN_U8("graphics/pokedex/pokedex_navbar.bin.lz");
const u8 gUnknown_08E96B58[] = INCBIN_U8("graphics/pokedex/pokedex_navbar_3.bin.lz");
const u8 gUnknown_08E96BD4[] = INCBIN_U8("graphics/pokedex/pokedex_detail_layout.bin.lz");
const u8 gPokedexMenuSearch_Tilemap[] = INCBIN_U8("graphics/unknown/unknown_E96D2C.bin.lz");

const u8 gBagScreenLabels_Tilemap[] = INCBIN_U8("graphics/interface/bag_screen_labels.bin");

const u16 gSlotMachineSpritePalette0[] = INCBIN_U16("graphics/slot_machine/spr0.gbapal");
const u16 gSlotMachineSpritePalette1[] = INCBIN_U16("graphics/slot_machine/spr1.gbapal");

#ifdef SAPPHIRE
const u16 gSlotMachineSpritePalette2[] = INCBIN_U16("graphics/slot_machine/spr2_sapphire.gbapal");
#else
const u16 gSlotMachineSpritePalette2[] = INCBIN_U16("graphics/slot_machine/spr2_ruby.gbapal");
#endif // SAPPHIRE

#ifdef SAPPHIRE
const u16 gSlotMachineSpritePalette3[] = INCBIN_U16("graphics/slot_machine/spr3_sapphire.gbapal");
#else
const u16 gSlotMachineSpritePalette3[] = INCBIN_U16("graphics/slot_machine/spr3_ruby.gbapal");
#endif // SAPPHIRE

const u16 gSlotMachineSpritePalette4[] = INCBIN_U16("graphics/slot_machine/spr4.gbapal");
const u16 gSlotMachineSpritePalette5[] = INCBIN_U16("graphics/slot_machine/spr5.gbapal");
const u16 gSlotMachineSpritePalette6[] = INCBIN_U16("graphics/slot_machine/spr6.gbapal");

const u8 gSlotMachineReelSymbol1Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/1.4bpp");
const u8 gSlotMachineReelSymbol2Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/2.4bpp");
const u8 gSlotMachineReelSymbol3Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/3.4bpp");
const u8 gSlotMachineReelSymbol4Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/4.4bpp");
const u8 gSlotMachineReelSymbol5Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/5.4bpp");
const u8 gSlotMachineReelSymbol6Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/6.4bpp");
const u8 gSlotMachineReelSymbol7Tiles[] = INCBIN_U8("graphics/slot_machine/reel_symbols/7.4bpp");

const u8 gSlotMachineNumber0Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/0.4bpp");
const u8 gSlotMachineNumber1Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/1.4bpp");
const u8 gSlotMachineNumber2Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/2.4bpp");
const u8 gSlotMachineNumber3Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/3.4bpp");
const u8 gSlotMachineNumber4Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/4.4bpp");
const u8 gSlotMachineNumber5Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/5.4bpp");
const u8 gSlotMachineNumber6Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/6.4bpp");
const u8 gSlotMachineNumber7Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/7.4bpp");
const u8 gSlotMachineNumber8Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/8.4bpp");
const u8 gSlotMachineNumber9Tiles[] = INCBIN_U8("graphics/slot_machine/numbers/9.4bpp");

const u8 gSpriteImage_8E98828[] = INCBIN_U8("graphics/slot_machine/bolt.4bpp");
const u8 gSpriteImage_8E98848[] = INCBIN_U8("graphics/slot_machine/duck.4bpp");
const u8 gSpriteImage_8E98868[] = INCBIN_U8("graphics/slot_machine/smoke.4bpp");
const u8 gSpriteImage_8E988E8[] = INCBIN_U8("graphics/slot_machine/reel_time_numbers/0.4bpp");
const u8 gSpriteImage_8E98968[] = INCBIN_U8("graphics/slot_machine/reel_time_numbers/1.4bpp");
const u8 gSpriteImage_8E989E8[] = INCBIN_U8("graphics/slot_machine/reel_time_numbers/2.4bpp");
const u8 gSpriteImage_8E98A68[] = INCBIN_U8("graphics/slot_machine/reel_time_numbers/3.4bpp");
const u8 gSpriteImage_8E98AE8[] = INCBIN_U8("graphics/slot_machine/reel_time_numbers/4.4bpp");
const u8 gSpriteImage_8E98B68[] = INCBIN_U8("graphics/slot_machine/reel_time_numbers/5.4bpp");
const u8 gSpriteImage_8E98BE8[] = INCBIN_U8("graphics/slot_machine/large_bolt/0.4bpp");
const u8 gSpriteImage_8E98CE8[] = INCBIN_U8("graphics/slot_machine/large_bolt/1.4bpp");
const u8 gSpriteImage_8E98DE8[] = INCBIN_U8("graphics/slot_machine/reel_time_explosion/0.4bpp");
const u8 gSpriteImage_8E98FE8[] = INCBIN_U8("graphics/slot_machine/reel_time_explosion/1.4bpp");
const u8 gSpriteImage_8E991E8[] = INCBIN_U8("graphics/slot_machine/shadow.4bpp");
const u8 gSpriteImage_8E993E8[] = INCBIN_U8("graphics/slot_machine/pika_aura.4bpp");

const u8 gUnknownPalette_08E997E8[] = INCBIN_U8("graphics/unknown/unknown_E997E8.gbapal");
const u8 gSpriteImage_8E99808[] = INCBIN_U8("graphics/unknown_sprites/8E99808.4bpp");
const u8 gSlotMachineReelTimeLights_Gfx[] = INCBIN_U8("graphics/slot_machine/reel_time_lights.4bpp.lz");

const u8 gUnknown_08E99FB0[] = INCBIN_U8("graphics/unknown/unknown_E99FB0.bin.lz");
const u8 gUnknown_08E9A100[] = INCBIN_U8("graphics/pokenav/bottom_toolbar.bin");
const u8 gUnknown_08E9A300[] = INCBIN_U8("graphics/unknown/unknown_E9A300.bin");
const u8 gUnknown_08E9AB00[] = INCBIN_U8("graphics/unknown/unknown_E9AB00.bin");
const u8 gUnknown_08E9AB40[] = INCBIN_U8("graphics/unknown/unknown_E9AB40.gbapal");
const u8 gUnknown_08E9AB60[] = INCBIN_U8("graphics/unknown/unknown_E9AB60.bin.lz");
const u8 gUnknown_08E9ABB4[] = INCBIN_U8("graphics/unknown/unknown_E9ABB4.bin");
const u8 gUnknown_08E9AC2C[] = INCBIN_U8("graphics/unknown/unknown_E9AC2C.bin");
const u8 gUnknown_08E9AC4C[] = INCBIN_U8("graphics/pokenav/condition_screen.bin.lz");

// text window frames
const u8 gTextWindowFrame1_Gfx[] = INCBIN_U8("graphics/text_window/1.4bpp");
const u16 gTextWindowFrame1_Pal[] = INCBIN_U16("graphics/text_window/1.gbapal");
const u8 gTextWindowFrame2_Gfx[] = INCBIN_U8("graphics/text_window/2.4bpp");
const u16 gTextWindowFrame2_Pal[] = INCBIN_U16("graphics/text_window/2.gbapal");
const u8 gTextWindowFrame3_Gfx[] = INCBIN_U8("graphics/text_window/3.4bpp");
const u16 gTextWindowFrame3_Pal[] = INCBIN_U16("graphics/text_window/3.gbapal");
const u8 gTextWindowFrame4_Gfx[] = INCBIN_U8("graphics/text_window/4.4bpp");
const u16 gTextWindowFrame4_Pal[] = INCBIN_U16("graphics/text_window/4.gbapal");
const u8 gTextWindowFrame5_Gfx[] = INCBIN_U8("graphics/text_window/5.4bpp");
const u16 gTextWindowFrame5_Pal[] = INCBIN_U16("graphics/text_window/5.gbapal");
const u8 gTextWindowFrame6_Gfx[] = INCBIN_U8("graphics/text_window/6.4bpp");
const u16 gTextWindowFrame6_Pal[] = INCBIN_U16("graphics/text_window/6.gbapal");
const u8 gTextWindowFrame7_Gfx[] = INCBIN_U8("graphics/text_window/7.4bpp");
const u16 gTextWindowFrame7_Pal[] = INCBIN_U16("graphics/text_window/7.gbapal");
const u8 gTextWindowFrame8_Gfx[] = INCBIN_U8("graphics/text_window/8.4bpp");
const u16 gTextWindowFrame8_Pal[] = INCBIN_U16("graphics/text_window/8.gbapal");
const u8 gTextWindowFrame9_Gfx[] = INCBIN_U8("graphics/text_window/9.4bpp");
const u16 gTextWindowFrame9_Pal[] = INCBIN_U16("graphics/text_window/9.gbapal");
const u8 gTextWindowFrame10_Gfx[] = INCBIN_U8("graphics/text_window/10.4bpp");
const u16 gTextWindowFrame10_Pal[] = INCBIN_U16("graphics/text_window/10.gbapal");
const u8 gTextWindowFrame11_Gfx[] = INCBIN_U8("graphics/text_window/11.4bpp");
const u16 gTextWindowFrame11_Pal[] = INCBIN_U16("graphics/text_window/11.gbapal");
const u8 gTextWindowFrame12_Gfx[] = INCBIN_U8("graphics/text_window/12.4bpp");
const u16 gTextWindowFrame12_Pal[] = INCBIN_U16("graphics/text_window/12.gbapal");
const u8 gTextWindowFrame13_Gfx[] = INCBIN_U8("graphics/text_window/13.4bpp");
const u16 gTextWindowFrame13_Pal[] = INCBIN_U16("graphics/text_window/13.gbapal");
const u8 gTextWindowFrame14_Gfx[] = INCBIN_U8("graphics/text_window/14.4bpp");
const u16 gTextWindowFrame14_Pal[] = INCBIN_U16("graphics/text_window/14.gbapal");
const u8 gTextWindowFrame15_Gfx[] = INCBIN_U8("graphics/text_window/15.4bpp");
const u16 gTextWindowFrame15_Pal[] = INCBIN_U16("graphics/text_window/15.gbapal");
const u8 gTextWindowFrame16_Gfx[] = INCBIN_U8("graphics/text_window/16.4bpp");
const u16 gTextWindowFrame16_Pal[] = INCBIN_U16("graphics/text_window/16.gbapal");
const u8 gTextWindowFrame17_Gfx[] = INCBIN_U8("graphics/text_window/17.4bpp");
const u16 gTextWindowFrame17_Pal[] = INCBIN_U16("graphics/text_window/17.gbapal");
const u8 gTextWindowFrame18_Gfx[] = INCBIN_U8("graphics/text_window/18.4bpp");
const u16 gTextWindowFrame18_Pal[] = INCBIN_U16("graphics/text_window/18.gbapal");
const u8 gTextWindowFrame19_Gfx[] = INCBIN_U8("graphics/text_window/19.4bpp");
const u16 gTextWindowFrame19_Pal[] = INCBIN_U16("graphics/text_window/19.gbapal");
const u8 gTextWindowFrame20_Gfx[] = INCBIN_U8("graphics/text_window/20.4bpp");
const u16 gTextWindowFrame20_Pal[] = INCBIN_U16("graphics/text_window/20.gbapal");

const u8 gUnknown_08E9C6DC[] = INCBIN_U8("graphics/unknown/unknown_E9C6DC.bin.lz");

const u8 gIntroCopyright_Gfx[] = INCBIN_U8("graphics/intro/copyright.4bpp.lz");
const u16 gIntroCopyright_Pal[] = INCBIN_U16("graphics/intro/copyright.gbapal");
const u8 gIntroCopyright_Tilemap[] = INCBIN_U8("graphics/intro/copyright.bin");

const u8 gInterviewOutlineCursorTiles[] = INCBIN_U8("graphics/misc/interview_outline_cursor.4bpp");
const u8 gTitleScreenPressStart_Gfx[] = INCBIN_U8("graphics/title_screen/press_start.4bpp.lz");
const u8 gTitleScreenLogoShinePalette[] = INCBIN_U8("graphics/title_screen/logo_shine.gbapal");

#ifdef SAPPHIRE
const u8 gUnknown_08E9D8CC[] = INCBIN_U8("graphics/title_screen/pokemon_sapphire.8bpp.lz");
const u8 gVersionTiles[] = INCBIN_U8("graphics/title_screen/sapphireversion.8bpp.lz");
const u16 gUnknown_08E9F624[] = INCBIN_U16("graphics/title_screen/logo_sapphire.gbapal");
// for some reason, the sapphire palette is different even though the visible colors for the logo and version are not
#else
const u8 gUnknown_08E9D8CC[] = INCBIN_U8("graphics/title_screen/pokemon_ruby.8bpp.lz");
const u8 gVersionTiles[] = INCBIN_U8("graphics/title_screen/rubyversion.8bpp.lz");
const u16 gUnknown_08E9F624[] = INCBIN_U16("graphics/title_screen/logo_ruby.gbapal");
#endif // SAPPHIRE

const u8 gUnknown_08E9F7E4[] = INCBIN_U8("graphics/unknown/unknown_E9F7E4.bin.lz");
const u16 gPokenavArrowsPalette[] = INCBIN_U16("graphics/pokenav/arrows.gbapal");
const u16 gUnknown_08E9F988[] = INCBIN_U16("graphics/unknown/unknown_E9F988.gbapal");
const u8 gPokenavArrow_Gfx[] = INCBIN_U8("graphics/pokenav/arrow2.4bpp");
const u16 gUnknown_08E9F9E8[] = INCBIN_U16("graphics/unknown/unknown_E9F9E8.gbapal");
const u8 gPokenavConditionSearch2_Gfx[] = INCBIN_U8("graphics/pokenav/condition_search2.4bpp.lz");
const u8 gPokenavRibbonView_Pal[] = INCBIN_U8("graphics/pokenav/ribbon_view.pal.bin");
const u8 gPokenavRibbonView_Gfx[] = INCBIN_U8("graphics/pokenav/ribbon_view.4bpp.lz");
const u8 gUnknown_08E9FBA0[] = INCBIN_U8("graphics/unknown/unknown_E9FBA0.bin.lz");
const u8 gUnknown_08E9FC64[] = INCBIN_U8("graphics/unknown/unknown_E9FC64.bin.lz");
const u8 gUnknown_08E9FD1C[] = INCBIN_U8("graphics/unknown/unknown_E9FD1C.bin");
const u8 gUnknown_08E9FD64[] = INCBIN_U8("graphics/unknown/unknown_E9FD64.bin");
const u8 gUnknown_08E9FE54[] = INCBIN_U8("graphics/unknown/unknown_E9FE54.bin");
const u8 gUnknown_08E9FEB4[] = INCBIN_U8("graphics/unknown/unknown_E9FEB4.bin.lz");
const u8 gUnknown_08E9FF58[] = INCBIN_U8("graphics/unknown/unknown_E9FF58.bin.lz");
const u8 gPokenavRibbonPokeView_Gfx[] = INCBIN_U8("graphics/pokenav/ribbon_pokeview.4bpp");
const u8 gDialogueFrame_Gfx[] = INCBIN_U8("graphics/text_window/message_box.4bpp");

const u16 gUnknown_08EA02C8[] = INCBIN_U16("graphics/trade/menu.gbapal", "graphics/trade/stripes.gbapal", "graphics/trade/stripes.gbapal");

const u16 gUnknown_08EA0328[] = INCBIN_U16("graphics/trade/selected_mon.gbapal");
const u8 gUnknown_08EA0348[] = INCBIN_U8("graphics/trade/menu.4bpp");
const u8 gUnknown_08EA15C8[] = INCBIN_U8("graphics/trade/menu_map.bin");
const u8 gTradeMonBoxTilemap[] = INCBIN_U8("graphics/trade/mon_box_map.bin");
const u8 gUnknown_08EA1DEC[] = INCBIN_U8("graphics/trade/selected_mon.4bpp");

const u8 gUnknown_08EA25EC[] = INCBIN_U8("graphics/unknown/unknown_EA25EC.bin");
const u8 gCreditsCopyrightEnd_Gfx[] = INCBIN_U8("graphics/misc/end_copyright.4bpp.lz");
const u8 gDecoration10000_Gfx[] = INCBIN_U8("graphics/misc/decoration_10000.4bpp");

#ifdef ENGLISH
    #if REVISION >= 1
        const u8 gFont3LatinGlyphs[] = INCBIN_U8("graphics/fonts/font3_lat_rev1.4bpp");
    #else
        const u8 gFont3LatinGlyphs[] = INCBIN_U8("graphics/fonts/font3_lat.4bpp");
    #endif
#else
    const u8 gFont3LatinGlyphs[] = INCBIN_U8("graphics/fonts/font3_lat.4bpp");
#endif

#ifdef ENGLISH
    #if REVISION >= 1
    const u8 gFont4LatinGlyphs[] = INCBIN_U8("graphics/fonts/font4_lat_rev1.4bpp");
    #else
    const u8 gFont4LatinGlyphs[] = INCBIN_U8("graphics/fonts/font4_lat.4bpp");
    #endif
#else
    const u8 gFont4LatinGlyphs[] = INCBIN_U8("graphics/fonts/font4_lat.4bpp.bin");
#endif // ENGLISH

const u8 gFont3JapaneseGlyphs[] = INCBIN_U8("graphics/fonts/font3_jpn.4bpp");
const u8 gFont4JapaneseGlyphs[] = INCBIN_U8("graphics/fonts/font4_jpn.4bpp");

#ifdef GERMAN
const u8 gSummaryScreenTextTiles[] = INCBIN_U8("graphics/summary_screen/text.4bpp");
const u8 gUnknown_0839FA7C[] = INCBIN_U8("graphics/pokedex/noball.4bpp.lz");
const u8 gIntroTiles[] = INCBIN_U8("graphics/intro/intro.4bpp.lz");

const u8 ConditionUpDownTiles[] = INCBIN_U8("graphics/misc/condition_up_down.4bpp");
const u16 ConditionUpDownPalette[] = INCBIN_U16("graphics/misc/condition_up_down.gbapal");

const u16 RouletteSpritePalette_01[] = INCBIN_U16("graphics/roulette/shadow.gbapal");
const u16 RouletteSpritePalette_02[] = INCBIN_U16("graphics/roulette/ball.gbapal");
const u16 RouletteSpritePalette_03[] = INCBIN_U16("graphics/roulette/ball_counter.gbapal");
const u16 RouletteSpritePalette_04[] = INCBIN_U16("graphics/roulette/cursor.gbapal");
const u16 RouletteSpritePalette_05[] = INCBIN_U16("graphics/roulette/credit.gbapal");
const u16 RouletteSpritePalette_06[] = INCBIN_U16("graphics/roulette/shroomish.gbapal");
const u16 RouletteSpritePalette_07[] = INCBIN_U16("graphics/roulette/tailow.gbapal");
const u16 RouletteSpritePalette_08[] = INCBIN_U16("graphics/roulette/poke_icons.gbapal");
const u16 RouletteSpritePalette_09[] = INCBIN_U16("graphics/roulette/wynaut.gbapal");
const u16 RouletteSpritePalette_10[] = INCBIN_U16("graphics/roulette/azurill.gbapal");
const u16 RouletteSpritePalette_11[] = INCBIN_U16("graphics/roulette/skitty.gbapal");
const u16 RouletteSpritePalette_12[] = INCBIN_U16("graphics/roulette/makuhita.gbapal");
const u16 RouletteSpritePalette_13[] = INCBIN_U16("graphics/roulette/83F907C.gbapal");
const u16 RouletteSpritePalette_14[] = INCBIN_U16("graphics/roulette/83F909C.gbapal");
const u16 RouletteSpritePalette_15[] = INCBIN_U16("graphics/roulette/83F90BC.gbapal");
const u16 RouletteSpritePalette_16[] = INCBIN_U16("graphics/roulette/83F90DC.gbapal");

const u16 gTilesetPalettes_Shop[][16] = 
{
    INCBIN_U16("data/tilesets/secondary/shop/palettes/00.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/01.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/02.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/03.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/04.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/05.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/06.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/07.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/08.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/09.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/10.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/11.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/12.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/13.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/14.gbapal"),
    INCBIN_U16("data/tilesets/secondary/shop/palettes/15.gbapal"),
};

const u8 gTilesetTiles_Shop[] = INCBIN_U8("data/tilesets/secondary/shop/tiles.4bpp.lz");
const u16 gUnknown_083FAF1C[] = INCBIN_U16("graphics/pokedex/cry_meter.gbapal");
const u8 gUnknown_083FAF3C[] = INCBIN_U8("graphics/pokedex/cry_meter.4bpp.lz");
const u8 gUnknown_083FAE7C[] = INCBIN_U8("graphics/pokedex/cry_meter_map.bin");
#endif // GERMAN
