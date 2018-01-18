#include "global.h"
#include "mail.h"
#include "easy_chat.h"
#include "constants/items.h"
#include "graphics.h"
#include "mail_data.h"
#include "menu.h"
#include "menu_helpers.h"
#include "name_string_util.h"
#include "palette.h"
#include "pokemon_icon.h"
#include "overworld.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"
#include "ewram.h"

struct UnkMailStruct
{
    u8 unk_0_0:2;
    u8 unk_0_2:2;
    u8 unk_0_4:4;
};

struct MailLayout
{
    u8 var0;
    u8 var1;
    u8 var2;
    u8 var3_0:4;
    u8 var3_4:4;
    const struct UnkMailStruct *var4;
};

struct Unk2000000
{
    /* 0x00*/ u8 words[8][27];
    /* 0xD8*/ u8 varD8[20];
    /* 0xEC*/ MainCallback varEC;
    /* 0xF0*/ MainCallback varF0;
    /* 0xF4*/ struct MailStruct *varF4;
    /* 0xF8*/ u8 varF8;
    /* 0xF9*/ u8 varF9;
    /* 0xFA*/ u8 varFA;
    /* 0xFB*/ u8 varFB;
    /* 0xFC*/ u8 varFC;
    u8 padFD[1];
    /* 0xFE*/ u8 varFE;
    /* 0xFF*/ u8 varFF;
    /*0x100*/ u8 var100;
    u8 pad101[3];
    /*0x104*/ MainCallback var104;
    /*0x108*/ MainCallback var108;
    /*0x10C*/ const struct MailLayout *var10C;
};

struct MailGraphics
{
    const u16 *palette;
    const u8 *tiles;
    const u8 *tileMap;
    u16 var0C;
    u16 var0E;
    u16 color10;
    u16 color12;
};

#if DEBUG
// should be static
__attribute__((section(".bss"))) u8 unk_debug_bss_2;
#endif

const u16 gUnknown_083E562C[][2] =
{
    {0x6ACD, 0x51A5},
    {0x45FC, 0x38D4},
};

const struct MailGraphics gMailGraphicsTable[] =
{
    {
        .palette = gMailPalette_Orange,
        .tiles = gMailTiles_Orange,
        .tileMap = gMailTilemap_Orange,
        .var0C = 0x2C0,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
    {
        .palette = gMailPalette_Harbor,
        .tiles = gMailTiles_Harbor,
        .tileMap = gMailTilemap_Harbor,
        .var0C = 0x2E0,
        .var0E = 0,
        .color10 = 0x7FFF,
        .color12 = 0x4631,
    },
    {
        .palette = gMailPalette_Glitter,
        .tiles = gMailTiles_Glitter,
        .tileMap = gMailTilemap_Glitter,
        .var0C = 0x400,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
    {
        .palette = gMailPalette_Mech,
        .tiles = gMailTiles_Mech,
        .tileMap = gMailTilemap_Mech,
        .var0C = 0x1E0,
        .var0E = 0,
        .color10 = 0x7FFF,
        .color12 = 0x4631,
    },
    {
        .palette = gMailPalette_Wood,
        .tiles = gMailTiles_Wood,
        .tileMap = gMailTilemap_Wood,
        .var0C = 0x2E0,
        .var0E = 0,
        .color10 = 0x7FFF,
        .color12 = 0x4631,
    },
    {
        .palette = gMailPalette_Wave,
        .tiles = gMailTiles_Wave,
        .tileMap = gMailTilemap_Wave,
        .var0C = 0x300,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
    {
        .palette = gMailPalette_Bead,
        .tiles = gMailTiles_Bead,
        .tileMap = gMailTilemap_Bead,
        .var0C = 0x140,
        .var0E = 0,
        .color10 = 0x7FFF,
        .color12 = 0x4631,
    },
    {
        .palette = gMailPalette_Shadow,
        .tiles = gMailTiles_Shadow,
        .tileMap = gMailTilemap_Shadow,
        .var0C = 0x300,
        .var0E = 0,
        .color10 = 0x7FFF,
        .color12 = 0x4631,
    },
    {
        .palette = gMailPalette_Tropic,
        .tiles = gMailTiles_Tropic,
        .tileMap = gMailTilemap_Tropic,
        .var0C = 0x220,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
    {
        .palette = gMailPalette_Dream,
        .tiles = gMailTiles_Dream,
        .tileMap = gMailTilemap_Dream,
        .var0C = 0x340,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
    {
        .palette = gMailPalette_Fab,
        .tiles = gMailTiles_Fab,
        .tileMap = gMailTilemap_Fab,
        .var0C = 0x2A0,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
    {
        .palette = gMailPalette_Retro,
        .tiles = gMailTiles_Retro,
        .tileMap = gMailTilemap_Retro,
        .var0C = 0x520,
        .var0E = 0,
        .color10 = 0x294A,
        .color12 = 0x6739,
    },
};

const struct UnkMailStruct Unknown_3E5724[] =
{
    {0, 3, 0},
    {0, 3, 0},
    {0, 3, 0},
};

const struct MailLayout gUnknown_083E5730[] =
{
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
    {3, 16, 27, 4, 3, Unknown_3E5724},
    {3, 15, 27, 4, 3, Unknown_3E5724},
};

const struct UnkMailStruct Unknown_3E5790[] =
{
    {0, 2, 0},
    {0, 2, 0},
    {0, 2, 0},
    {0, 2, 0},
    {0, 1, 0},
};

const struct MailLayout gUnknown_083E57A4[] =
{
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 15, 16, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 15, 16, 4, 3, Unknown_3E5790},
    {5, 15, 16, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
    {5, 16, 15, 4, 3, Unknown_3E5790},
    {5, 15, 15, 4, 3, Unknown_3E5790},
};

#if DEBUG

const u8 Str_8411540[] = _("レイアウトを　にほんごで　ひょうじ？");  // Display using Japanese layout?
const u8 Str_8411553[] = _("にほんご　");  // Japanese
const u8 Str_8411559[] = _("かいがい　");  // Overseas

const u8 *const _8411560[] =
{
    Str_8411553,
    Str_8411559,
};

const u8 Str_8411568[] = _("イメージ　タイプを　えらんでね");  // Choose an image type
const u8 Str_8411578[] = _("{STR_VAR_1}");
const u8 Str_841157B[] = _("オレンジ　");  // Orange
const u8 Str_8411581[] = _("ハーバー　");  // Harbor
const u8 Str_8411587[] = _("キラキラ　");  // Glitter
const u8 Str_841158D[] = _("メカニカル");  // Mech
const u8 Str_8411593[] = _("ウッディー");  // Wood
const u8 Str_8411599[] = _("クロス　　");  // Wave
const u8 Str_841159F[] = _("トレジャー");  // Bead
const u8 Str_84115A5[] = _("シャドウ　");  // Shadow
const u8 Str_84115AB[] = _("トロピカル");  // Tropic
const u8 Str_84115B1[] = _("ドリーム　");  // Dream
const u8 Str_84115B7[] = _("ミラクル　");  // Fab
const u8 Str_84115BD[] = _("レトロ　　");  // Retro

const u8 *const _84115C4[] =
{
    Str_841157B,
    Str_8411581,
    Str_8411587,
    Str_841158D,
    Str_8411593,
    Str_8411599,
    Str_841159F,
    Str_84115A5,
    Str_84115AB,
    Str_84115B1,
    Str_84115B7,
    Str_84115BD,
};

const u8 Str_84115F4[] = _("メールをみる");  // View Mail
const u8 Str_84115FB[] = _("メールとうろく");  // Register Mail
const u8 Str_8411603[] = _("もたせる");  // Give to Pokémon
const u8 Str_8411608[] = _("メールをけす");  // Delete Mail

#endif

// XXX: what is this?
static u8 *const sSharedMemPtr = gSharedMem;

#if DEBUG

const u8 Str_841160F[] = _("{STR_VAR_1}　{STR_VAR_2}");
const u8 Str_841161A[] = _("メール{STR_VAR_1}　{STR_VAR_2}");
const u8 Str_8411623[] = _("メール{STR_VAR_1}を　だれに　もたせる？");
const u8 Str_8411634[] = _("000　{STR_VAR_1}");
const u8 Str_841163B[] = _("せいきの　データが　とうろくずみ　です\n");
const u8 Str_841163B_after[] = _("しんき　とうろく　できません");
const u8 Str_841165E[] = _("せいきに　とうろくされたメールデータは\n");
const u8 Str_841165E_after[] = _("へんこう　できません");
const u8 Str_841167D[] = _("メール{STR_VAR_1}　とうろく　かいじょ");
const u8 Str_841168D[] = _("デバッグメニューから　とうろくした\n");
const u8 Str_841168D_after[] = _("メール　いがいは　けせません");
const u8 Str_84116AE[] = _("メール{STR_VAR_1}　{STR_VAR_2}　{STR_VAR_3}");

const struct MenuAction _84116BC[] =
{
    {Str_84115F4, NULL},
    {Str_84115FB, NULL},
    {Str_8411603, NULL},
    {Str_8411608, NULL},
};

#endif

static u8 sub_80F8A28(void);
/*static*/ void sub_80F8D50(void);
static void sub_80F8DA0(void);
static void sub_80F8E80(void);
static void sub_80F8F18(void);
static void sub_80F8F2C(void);
static void sub_80F8F58(void);
static void sub_80F8F78(void);
static void sub_80F8FB4(void);

void HandleReadMail(struct MailStruct *arg0, MainCallback arg1, bool8 arg2)
{
    u16 mailDesign;
    u16 buffer[2];

    ewram0_4.varFF = GAME_LANGUAGE;
    ewram0_4.var100 = 1;
    ewram0_4.var104 = (MainCallback)EasyChat_GetWordText;
    ewram0_4.var108 = (MainCallback)ConvertEasyChatWordsToString;

    mailDesign = arg0->itemId - ITEM_ORANGE_MAIL;

    if (mailDesign <= 11)
    {
        ewram0_4.varFA = arg0->itemId - ITEM_ORANGE_MAIL;
    }
    else
    {
        ewram0_4.varFA = 0;
        arg2 = FALSE;
    }

    switch (ewram0_4.var100)
    {
    case 0:
    default:
        ewram0_4.var10C = &gUnknown_083E5730[ewram0_4.varFA];
        break;

    case 1:
        ewram0_4.var10C = &gUnknown_083E57A4[ewram0_4.varFA];
        break;
    }

    if (((MailSpeciesToSpecies(arg0->species, buffer) << 16) + 0xFFFF0000) <= (410 << 16))
    {
        switch (ewram0_4.varFA)
        {
        case 6:
            ewram0_4.varFB = 1;
            break;

        case 9:
            ewram0_4.varFB = 2;
            break;

        default:
            ewram0_4.varFB = 0;
            break;
        }
    }
    else
    {
        ewram0_4.varFB = 0;
    }


    ewram0_4.varF4 = arg0;
    ewram0_4.varEC = arg1;
    ewram0_4.varF8 = arg2;

    SetMainCallback2(sub_80F8D50);
}

#define RETURN_UP_STATE break
#define RETURN_SKIP_STATE return FALSE

static u8 sub_80F8A28(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        ScanlineEffect_Stop();
        REG_DISPCNT = 0;
        RETURN_UP_STATE;

    case 1: CpuFill16(0, (void *)OAM, OAM_SIZE);
        RETURN_UP_STATE;

    case 2:
        ResetPaletteFade();
        RETURN_UP_STATE;

    case 3:
        ResetTasks();
        RETURN_UP_STATE;

    case 4:
        ResetSpriteData();
        RETURN_UP_STATE;

    case 5:
        FreeAllSpritePalettes();
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG2VOFS = 0;
        REG_BG2HOFS = 0;
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        RETURN_UP_STATE;

    case 6:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6DFC);
        RETURN_UP_STATE;

    case 7:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E6DFC);
        RETURN_UP_STATE;

    case 8:
        if (MultistepInitMenuWindowContinue() == 0)
        {
            return FALSE;
        }
        RETURN_UP_STATE;

    case 9:
        Menu_EraseScreen();
        RETURN_UP_STATE;

    case 10: CpuFill16(1, (void *)(VRAM + 0x4800), 0x800);
        RETURN_UP_STATE;

    case 11:
        LoadPalette(gMailGraphicsTable[ewram0_4.varFA].palette, 0, 16 * 2);
        RETURN_UP_STATE;

    case 12:
        LZ77UnCompVram(gMailGraphicsTable[ewram0_4.varFA].tileMap, (void *)(VRAM + 0x4000));
        RETURN_UP_STATE;

    case 13:
        LZ77UnCompVram(gMailGraphicsTable[ewram0_4.varFA].tiles, (void *)(VRAM));

        gPlttBufferUnfaded[241] = gMailGraphicsTable[ewram0_4.varFA].color10;
        gPlttBufferUnfaded[248] = gMailGraphicsTable[ewram0_4.varFA].color12;
        gPlttBufferUnfaded[10] = gUnknown_083E562C[gSaveBlock2.playerGender][0];
        gPlttBufferUnfaded[11] = gUnknown_083E562C[gSaveBlock2.playerGender][1];
        RETURN_UP_STATE;

    case 14:
        if (ewram0_4.varF8 != 0)
        {
            sub_80F8DA0();
        }
        RETURN_UP_STATE;

    case 15:
        if (ewram0_4.varF8 != 0)
        {
            sub_80F8E80();
        }

        SetVBlankCallback(sub_80F8F18);
        gPaletteFade.bufferTransferDisabled = 1;
        RETURN_UP_STATE;

    case 16:
    {
        u16 local1;

        local1 = sub_809D4A8(ewram0_4.varF4->species);

        switch (ewram0_4.varFB)
        {
        case 1:
            sub_809D580(local1);
            ewram0_4.varFC = sub_809D3A4(local1, SpriteCallbackDummy, 96, 128, 0);
            break;

        case 2:
            sub_809D580(local1);
            ewram0_4.varFC = sub_809D3A4(local1, SpriteCallbackDummy, 40, 128, 0);
            break;
        }
        RETURN_UP_STATE;
    }

    case 17:
        if (sub_8055870() != TRUE)
        {
            RETURN_UP_STATE;
        }
        RETURN_SKIP_STATE;

    case 18:
        REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_TXT256x512;
        REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(8)  | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(9)  | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BLDCNT = 0;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        BeginNormalPaletteFade(-1, 0, 16, 0, 0);
        gPaletteFade.bufferTransferDisabled = 0;
        ewram0_4.varF0 = sub_80F8F58;
        return TRUE;

    default:
        return FALSE;
    }

    gMain.state += 1;
    return FALSE;
}

/*static*/ void sub_80F8D50(void)
{
    do
    {
        if (sub_80F8A28() == 1)
        {
            SetMainCallback2(sub_80F8F2C);
            return;
        }
    } while (sub_80F9344() != 1);
}

static u8 *sub_80F8D7C(u8 *dest, u8 *src)
{
    u16 length;

    StringCopy(dest, src);
    SanitizeNameString(dest);

    length = StringLength(dest);

    return dest + length;
}

static void sub_80F8DA0(void)
{
    u16 i;
    u8 r6;
    u8 *ptr;

    r6 = 0;
    for (i = 0; i < ewram0_4.var10C->var0; i++)
    {
        ConvertEasyChatWordsToString(ewram0_4.words[i], &ewram0_4.varF4->words[r6], ewram0_4.var10C->var4[i].unk_0_2, 1);
        r6 += ewram0_4.var10C->var4[i].unk_0_2;
    }
    ptr = ewram0_4.varD8;
    if (ewram0_4.var100 == 0)
    {
        ptr = sub_80F8D7C(ptr, ewram0_4.varF4->playerName);
        StringCopy(ptr, gOtherText_From);
        ewram0_4.varF9 = ewram0_4.var10C->var2 - StringLength(ewram0_4.varD8);

    }
    else
    {
        ptr = StringCopy(ptr, gOtherText_From);
        sub_80F8D7C(ptr, ewram0_4.varF4->playerName);
        ewram0_4.varF9 = ewram0_4.var10C->var2;
    }
}

static void sub_80F8E80(void)
{
    u16 pos;
    u8 x;
    u8 y = 0;

    for (pos = 0; pos < ewram0_4.var10C->var0; pos++)
    {
        if (ewram0_4.words[pos][0] == 0xFF)
        {
            continue;
        }

        if (ewram0_4.words[pos][0] == 0x00)
        {
            continue;
        }

        x = ewram0_4.var10C->var4[pos].unk_0_4;
        y += ewram0_4.var10C->var4[pos].unk_0_0;
        Menu_PrintText(ewram0_4.words[pos], ewram0_4.var10C->var3_4 + x, ewram0_4.var10C->var3_0 + y);
        y += 2;
    }

    Menu_PrintText(ewram0_4.varD8, ewram0_4.varF9, ewram0_4.var10C->var1);
}

static void sub_80F8F18(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_80F8F2C(void)
{
    if (ewram0_4.varFB != 0)
    {
        AnimateSprites();
        BuildOamBuffer();
    }

    ewram0_4.varF0();
}

static void sub_80F8F58(void)
{
    u8 local0;

    local0 = UpdatePaletteFade();
    if (local0 == 0)
    {
        ewram0_4.varF0 = sub_80F8F78;
    }
}

static void sub_80F8F78(void)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        ewram0_4.varF0 = sub_80F8FB4;
    }
}

#if DEBUG
__attribute__((naked))
void sub_80F8FB4()
{
    asm(
        "	push	{r4, lr}\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._135	@cond_branch\n"
        "	ldr	r4, ._138\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xec\n"
        "	ldr	r0, [r0]\n"
        "	bl	SetMainCallback2\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xfb\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0x2\n"
        "	bgt	._137	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	blt	._137	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xf4\n"
        "	ldr	r0, [r0]\n"
        "	ldrh	r0, [r0, #0x1e]\n"
        "	bl	sub_809D4A8\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	bl	sub_809D608\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xfc\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x4\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._138 + 4\n"
        "	add	r0, r0, r1\n"
        "	bl	sub_809D510\n"
        "._137:\n"
        "	bl	ResetPaletteFade\n"
        "._135:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._139:\n"
        "	.align	2, 0\n"
        "._138:\n"
        "	.word	+0x2000000\n"
        "	.word	gSprites\n"
        "\n"
    );
}
#else
static void sub_80F8FB4(void)
{
    u16 local1;

    if (UpdatePaletteFade())
    {
        return;
    }

    SetMainCallback2(ewram0_4.varEC);
    switch (ewram0_4.varFB)
    {
    case 2:
    case 1:
        local1 = sub_809D4A8(ewram0_4.varF4->species);
        sub_809D608(local1);

        sub_809D510(&gSprites[ewram0_4.varFC]);
        break;
    }

    memset(&ewram0_4, 0, 0x110);
    ResetPaletteFade();
}
#endif

#if DEBUG
__attribute__((naked))
void debug_sub_810C910()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r0, ._143\n"
        "	ldrb	r1, [r0, #0x7]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._142	@cond_branch\n"
        "	ldr	r1, ._143 + 4\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	bl	Menu_EraseScreen\n"
        "	add	r0, r4, #0\n"
        "	bl	DestroyTask\n"
        "	ldr	r2, ._143 + 8\n"
        "	ldr	r0, ._143 + 12\n"
        "	ldrh	r1, [r0]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r0, r1, r2\n"
        "	ldr	r3, ._143 + 16\n"
        "	add	r0, r0, r3\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._141	@cond_branch\n"
        "	sub	r3, r3, #0x20\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r1, r0\n"
        "	ldr	r1, ._143 + 20\n"
        "	mov	r2, #0x0\n"
        "	bl	HandleReadMail\n"
        "	b	._142\n"
        "._144:\n"
        "	.align	2, 0\n"
        "._143:\n"
        "	.word	gPaletteFade\n"
        "	.word	unk_debug_bss_2\n"
        "	.word	gSaveBlock1\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	0x2b6c\n"
        "	.word	debug_sub_810D388+1\n"
        "._141:\n"
        "	ldr	r3, ._145\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r1, r0\n"
        "	ldr	r1, ._145 + 4\n"
        "	mov	r2, #0x1\n"
        "	bl	HandleReadMail\n"
        "._142:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._146:\n"
        "	.align	2, 0\n"
        "._145:\n"
        "	.word	0x2b4c\n"
        "	.word	debug_sub_810D388+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810C990()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	add	r5, r4, #0\n"
        "	ldr	r0, ._149\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0xa0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._147	@cond_branch\n"
        "	ldr	r4, ._149 + 4\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0xb\n"
        "	b	._148\n"
        "._150:\n"
        "	.align	2, 0\n"
        "._149:\n"
        "	.word	gMain\n"
        "	.word	gSpecialVar_0x8006\n"
        "._147:\n"
        "	mov	r2, #0x50\n"
        "	and	r2, r2, r1\n"
        "	cmp	r2, #0\n"
        "	beq	._151	@cond_branch\n"
        "	ldr	r4, ._153\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "._148:\n"
        "	mov	r1, #0xc\n"
        "	bl	__modsi3\n"
        "	strh	r0, [r4]\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0xa\n"
        "	mov	r3, #0x4\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r1, ._153 + 4\n"
        "	ldrh	r0, [r4]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x2\n"
        "	bl	Menu_PrintText\n"
        "	b	._159\n"
        "._154:\n"
        "	.align	2, 0\n"
        "._153:\n"
        "	.word	gSpecialVar_0x8006\n"
        "	.word	_84115C4\n"
        "._151:\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._155	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	str	r2, [sp]\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r1, ._157\n"
        "	lsl	r0, r4, #0x2\n"
        "	add	r0, r0, r4\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._157 + 4\n"
        "	b	._156\n"
        "._158:\n"
        "	.align	2, 0\n"
        "._157:\n"
        "	.word	gTasks\n"
        "	.word	debug_sub_810C910+1\n"
        "._155:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._159	@cond_branch\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._160\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._160 + 4\n"
        "	ldr	r0, ._160 + 8\n"
        "	ldrh	r0, [r0]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x2\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._160 + 12\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._160 + 16\n"
        "._156:\n"
        "	str	r1, [r0]\n"
        "._159:\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._161:\n"
        "	.align	2, 0\n"
        "._160:\n"
        "	.word	Str_8411540\n"
        "	.word	_8411560\n"
        "	.word	gSpecialVar_0x8004\n"
        "	.word	gTasks\n"
        "	.word	debug_sub_810CA7C+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CA7C()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r3, ._164\n"
        "	ldrh	r1, [r3, #0x2e]\n"
        "	mov	r2, #0xf0\n"
        "	and	r2, r2, r1\n"
        "	cmp	r2, #0\n"
        "	beq	._162	@cond_branch\n"
        "	ldr	r2, ._164 + 4\n"
        "	ldrh	r0, [r2]\n"
        "	mov	r1, #0x1\n"
        "	eor	r0, r0, r1\n"
        "	strh	r0, [r2]\n"
        "	ldr	r1, ._164 + 8\n"
        "	ldrh	r0, [r2]\n"
        "	b	._163\n"
        "._165:\n"
        "	.align	2, 0\n"
        "._164:\n"
        "	.word	gMain\n"
        "	.word	gSpecialVar_0x8004\n"
        "	.word	_8411560\n"
        "._162:\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._168	@cond_branch\n"
        "	ldrh	r0, [r3, #0x34]\n"
        "	cmp	r0, #0\n"
        "	beq	._167	@cond_branch\n"
        "	strh	r2, [r3, #0x34]\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._169\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0xa\n"
        "	mov	r3, #0x4\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r1, ._169 + 4\n"
        "	ldr	r0, ._169 + 8\n"
        "	ldrh	r0, [r0]\n"
        "._163:\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x2\n"
        "	bl	Menu_PrintText\n"
        "	b	._168\n"
        "._170:\n"
        "	.align	2, 0\n"
        "._169:\n"
        "	.word	Str_8411540\n"
        "	.word	_8411560\n"
        "	.word	gSpecialVar_0x8004\n"
        "._167:\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._171\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0xa\n"
        "	mov	r3, #0x4\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r1, ._171 + 4\n"
        "	ldr	r0, ._171 + 8\n"
        "	ldrh	r0, [r0]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x2\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._171 + 12\n"
        "	lsl	r0, r4, #0x2\n"
        "	add	r0, r0, r4\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._171 + 16\n"
        "	str	r1, [r0]\n"
        "._168:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._172:\n"
        "	.align	2, 0\n"
        "._171:\n"
        "	.word	Str_8411568\n"
        "	.word	_84115C4\n"
        "	.word	gSpecialVar_0x8006\n"
        "	.word	gTasks\n"
        "	.word	debug_sub_810C990+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CB50()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	add	sp, sp, #0xffffffec\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	ldr	r1, ._175\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x6\n"
        "	bl	memcpy\n"
        "	add	r7, sp, #0x8\n"
        "	ldr	r1, ._175 + 4\n"
        "	add	r0, r7, #0\n"
        "	mov	r2, #0x9\n"
        "	bl	memcpy\n"
        "	mov	r2, #0x0\n"
        "	ldr	r0, ._175 + 8\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._173	@cond_branch\n"
        "	ldr	r0, ._175 + 12\n"
        "	ldr	r5, ._175 + 16\n"
        "	ldrh	r1, [r5]\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r0, ._175 + 20\n"
        "	ldr	r1, ._175 + 24\n"
        "	lsl	r4, r6, #0x2\n"
        "	add	r4, r4, r6\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r1\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r2, [r4, r1]\n"
        "	mov	r1, #0xb\n"
        "	mul	r1, r1, r2\n"
        "	ldr	r2, ._175 + 28\n"
        "	add	r1, r1, r2\n"
        "	bl	StringCopy\n"
        "	ldr	r2, ._175 + 32\n"
        "	ldrh	r1, [r5]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r2\n"
        "	ldrh	r1, [r4, #0x8]\n"
        "	ldr	r2, ._175 + 36\n"
        "	add	r0, r0, r2\n"
        "	strh	r1, [r0]\n"
        "	ldr	r4, ._175 + 40\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r7, #0\n"
        "	bl	StringExpandPlaceholders\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	add	r0, r6, #0\n"
        "	bl	DestroyTask\n"
        "	b	._174\n"
        "._176:\n"
        "	.align	2, 0\n"
        "._175:\n"
        "	.word	Str_841160F\n"
        "	.word	Str_841161A\n"
        "	.word	gMain\n"
        "	.word	gStringVar1\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gStringVar2\n"
        "	.word	gTasks\n"
        "	.word	gSpeciesNames\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x2b6a\n"
        "	.word	gStringVar4\n"
        "._173:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._177	@cond_branch\n"
        "	add	r0, r6, #0\n"
        "	bl	DestroyTask\n"
        "	bl	Menu_EraseScreen\n"
        "._174:\n"
        "	ldr	r0, ._179\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	bl	debug_sub_810D340\n"
        "	b	._186\n"
        "._180:\n"
        "	.align	2, 0\n"
        "._179:\n"
        "	.word	debug_sub_810CE1C+1\n"
        "._177:\n"
        "	mov	r0, #0xa0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._181	@cond_branch\n"
        "	ldr	r0, ._183\n"
        "	lsl	r4, r6, #0x2\n"
        "	add	r4, r4, r6\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r4, r1]\n"
        "	ldr	r2, ._183 + 4\n"
        "	add	r0, r0, r2\n"
        "	mov	r1, #0xce\n"
        "	lsl	r1, r1, #0x1\n"
        "	bl	__modsi3\n"
        "	strh	r0, [r4, #0x8]\n"
        "	b	._182\n"
        "._184:\n"
        "	.align	2, 0\n"
        "._183:\n"
        "	.word	gTasks\n"
        "	.word	0x19b\n"
        "._181:\n"
        "	mov	r0, #0x50\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._185	@cond_branch\n"
        "	ldr	r0, ._187\n"
        "	lsl	r4, r6, #0x2\n"
        "	add	r4, r4, r6\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r4, r1]\n"
        "	add	r0, r0, #0x1\n"
        "	mov	r1, #0xce\n"
        "	lsl	r1, r1, #0x1\n"
        "	bl	__modsi3\n"
        "	strh	r0, [r4, #0x8]\n"
        "	mov	r2, #0x1\n"
        "._185:\n"
        "	cmp	r2, #0\n"
        "	beq	._186	@cond_branch\n"
        "._182:\n"
        "	ldr	r0, ._187 + 4\n"
        "	ldr	r1, ._187\n"
        "	lsl	r4, r6, #0x2\n"
        "	add	r4, r4, r6\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r1\n"
        "	mov	r2, #0x8\n"
        "	ldsh	r1, [r4, r2]\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r0, ._187 + 8\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r2, [r4, r1]\n"
        "	mov	r1, #0xb\n"
        "	mul	r1, r1, r2\n"
        "	ldr	r2, ._187 + 12\n"
        "	add	r1, r1, r2\n"
        "	bl	StringCopy\n"
        "	ldr	r4, ._187 + 16\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, sp\n"
        "	bl	StringExpandPlaceholders\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0xc\n"
        "	mov	r3, #0x3\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	bl	Menu_PrintText\n"
        "._186:\n"
        "	add	sp, sp, #0x14\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._188:\n"
        "	.align	2, 0\n"
        "._187:\n"
        "	.word	gTasks\n"
        "	.word	gStringVar1\n"
        "	.word	gStringVar2\n"
        "	.word	gSpeciesNames\n"
        "	.word	gStringVar4\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CCEC()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	mov	r6, r8\n"
        "	push	{r6}\n"
        "	add	sp, sp, #0xffffffe4\n"
        "	add	r5, r0, #0\n"
        "	lsl	r5, r5, #0x18\n"
        "	lsr	r5, r5, #0x18\n"
        "	ldr	r1, ._189\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x11\n"
        "	bl	memcpy\n"
        "	add	r6, sp, #0x14\n"
        "	ldr	r1, ._189 + 4\n"
        "	add	r0, r6, #0\n"
        "	mov	r2, #0x7\n"
        "	bl	memcpy\n"
        "	ldr	r0, ._189 + 8\n"
        "	mov	r8, r0\n"
        "	ldr	r0, ._189 + 12\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, r8\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r4, ._189 + 16\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, sp\n"
        "	bl	StringExpandPlaceholders\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._189 + 20\n"
        "	mov	r0, r8\n"
        "	bl	StringCopy\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	StringExpandPlaceholders\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0xc\n"
        "	mov	r3, #0x3\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	add	r0, r6, #0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._189 + 24\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._189 + 28\n"
        "	str	r1, [r0]\n"
        "	add	sp, sp, #0x1c\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._190:\n"
        "	.align	2, 0\n"
        "._189:\n"
        "	.word	Str_8411623\n"
        "	.word	Str_8411634\n"
        "	.word	gStringVar1\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gStringVar4\n"
        "	.word	gSpeciesNames\n"
        "	.word	gTasks\n"
        "	.word	debug_sub_810CB50+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CD9C()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	ScriptContext1_Stop\n"
        "	bl	ScriptContext2_Enable\n"
        "	ldr	r1, ._191\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	ldr	r3, ._191 + 4\n"
        "	ldr	r2, ._191 + 8\n"
        "	ldr	r1, ._191 + 12\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r1]\n"
        "	strh	r0, [r2]\n"
        "	strh	r0, [r3]\n"
        "	ldr	r0, ._191 + 16\n"
        "	bl	SetMainCallback2\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._192:\n"
        "	.align	2, 0\n"
        "._191:\n"
        "	.word	unk_debug_bss_2\n"
        "	.word	gSpecialVar_0x8004\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gSpecialVar_0x8006\n"
        "	.word	debug_sub_810D388+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CDE0()
{
    asm(
        "	push	{lr}\n"
        "	bl	UpdatePaletteFade\n"
        "	bl	RunTasks\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CDF0()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._193\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r1, #0x34]\n"
        "	strh	r0, [r1, #0x36]\n"
        "	ldr	r1, ._193 + 4\n"
        "	ldr	r0, ._193 + 8\n"
        "	str	r0, [r1]\n"
        "	ldr	r0, ._193 + 12\n"
        "	bl	SetMainCallback2\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._194:\n"
        "	.align	2, 0\n"
        "._193:\n"
        "	.word	gMain\n"
        "	.word	gFieldCallback\n"
        "	.word	mapldr_default+1\n"
        "	.word	c2_exit_to_overworld_2_switch+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CE1C()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r0, ._196\n"
        "	ldr	r0, [r0]\n"
        "	bl	_call_via_r0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x1\n"
        "	bne	._195	@cond_branch\n"
        "	bl	CloseMenu\n"
        "	add	r0, r4, #0\n"
        "	bl	DestroyTask\n"
        "._195:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._197:\n"
        "	.align	2, 0\n"
        "._196:\n"
        "	.word	gCallback_03004AE8\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CE48()
{
    asm(
        "	push	{r4, lr}\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r1, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._198	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._199	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	debug_sub_810D340\n"
        "._198:\n"
        "	mov	r0, #0x0\n"
        "	b	._200\n"
        "._199:\n"
        "	ldr	r0, ._201\n"
        "	strh	r1, [r0]\n"
        "	ldr	r4, ._201 + 4\n"
        "	ldrh	r0, [r4]\n"
        "	mov	r1, #0xc\n"
        "	bl	__umodsi3\n"
        "	strh	r0, [r4]\n"
        "	ldr	r0, ._201 + 8\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	ldr	r1, ._201 + 12\n"
        "	mov	r2, #0x0\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r1, #0x34]\n"
        "	strh	r2, [r1, #0x36]\n"
        "._200:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._202:\n"
        "	.align	2, 0\n"
        "._201:\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gSpecialVar_0x8006\n"
        "	.word	debug_sub_810CA7C+1\n"
        "	.word	gMain\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CEA4()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._205\n"
        "	ldrb	r1, [r0, #0x7]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._203	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._204\n"
        "._206:\n"
        "	.align	2, 0\n"
        "._205:\n"
        "	.word	gPaletteFade\n"
        "._203:\n"
        "	ldr	r1, ._207\n"
        "	mov	r0, #0x4\n"
        "	strh	r0, [r1]\n"
        "	bl	sub_80E60D8\n"
        "	mov	r0, #0x1\n"
        "._204:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._208:\n"
        "	.align	2, 0\n"
        "._207:\n"
        "	.word	gSpecialVar_0x8004\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CED0()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	sp, sp, #0xffffffdc\n"
        "	ldr	r1, ._212\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x23\n"
        "	bl	memcpy\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r1, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._215	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._210	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	b	._211\n"
        "._213:\n"
        "	.align	2, 0\n"
        "._212:\n"
        "	.word	Str_841163B\n"
        "._210:\n"
        "	ldr	r5, ._216\n"
        "	strh	r1, [r5]\n"
        "	ldr	r6, ._216 + 4\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r6\n"
        "	ldr	r1, ._216 + 8\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x79\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0xb\n"
        "	bls	._214	@cond_branch\n"
        "	ldrh	r1, [r5]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r6\n"
        "	ldr	r2, ._216 + 8\n"
        "	add	r0, r0, r2\n"
        "	ldr	r1, ._216 + 12\n"
        "	strh	r1, [r0]\n"
        "	ldrh	r1, [r5]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	sub	r2, r2, #0xe\n"
        "	add	r1, r6, r2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r4, ._216 + 16\n"
        "	add	r1, r4, #0\n"
        "	bl	StringCopy\n"
        "	ldrh	r1, [r5]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r2, ._216 + 20\n"
        "	add	r1, r6, r2\n"
        "	add	r0, r0, r1\n"
        "	add	r4, r4, #0xa\n"
        "	ldr	r1, [r4]\n"
        "	str	r1, [r0]\n"
        "	ldr	r1, ._216 + 24\n"
        "	ldr	r0, ._216 + 28\n"
        "	str	r0, [r1]\n"
        "	b	._215\n"
        "._217:\n"
        "	.align	2, 0\n"
        "._216:\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x2b6c\n"
        "	.word	0xffff\n"
        "	.word	gSaveBlock2\n"
        "	.word	0x2b66\n"
        "	.word	gCallback_03004AE8\n"
        "	.word	debug_sub_810CEA4+1\n"
        "._214:\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "._211:\n"
        "	bl	debug_sub_810D340\n"
        "._215:\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x24\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810CFA4()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xffffffe0\n"
        "	ldr	r1, ._221\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x1f\n"
        "	bl	memcpy\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r2, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r2, r0\n"
        "	beq	._218	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r2, r0\n"
        "	bne	._219	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	b	._220\n"
        "._222:\n"
        "	.align	2, 0\n"
        "._221:\n"
        "	.word	Str_841165E\n"
        "._219:\n"
        "	ldr	r0, ._225\n"
        "	strh	r2, [r0]\n"
        "	ldr	r1, ._225 + 4\n"
        "	lsl	r0, r2, #0x3\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._225 + 8\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x79\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0xb\n"
        "	bls	._223	@cond_branch\n"
        "	ldr	r0, ._225 + 12\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	mov	r0, #0x1\n"
        "	b	._224\n"
        "._226:\n"
        "	.align	2, 0\n"
        "._225:\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x2b6c\n"
        "	.word	debug_sub_810CCEC+1\n"
        "._223:\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "._220:\n"
        "	bl	debug_sub_810D340\n"
        "._218:\n"
        "	mov	r0, #0x0\n"
        "._224:\n"
        "	add	sp, sp, #0x20\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810D030()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	add	sp, sp, #0xffffffcc\n"
        "	ldr	r1, ._230\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x10\n"
        "	bl	memcpy\n"
        "	add	r5, sp, #0x10\n"
        "	ldr	r1, ._230 + 4\n"
        "	add	r0, r5, #0\n"
        "	mov	r2, #0x21\n"
        "	bl	memcpy\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r1, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._227	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._228	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	b	._229\n"
        "._231:\n"
        "	.align	2, 0\n"
        "._230:\n"
        "	.word	Str_841167D\n"
        "	.word	Str_841168D\n"
        "._228:\n"
        "	ldr	r2, ._235\n"
        "	strh	r1, [r2]\n"
        "	ldr	r3, ._235 + 4\n"
        "	ldrh	r1, [r2]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r3\n"
        "	ldr	r1, ._235 + 8\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r1, [r0]\n"
        "	ldr	r0, ._235 + 12\n"
        "	add	r4, r2, #0\n"
        "	cmp	r1, r0\n"
        "	beq	._233	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	beq	._233	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	add	r0, r5, #0\n"
        "	b	._234\n"
        "._236:\n"
        "	.align	2, 0\n"
        "._235:\n"
        "	.word	gSpecialVar_0x8005\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x2b6c\n"
        "	.word	0xffff\n"
        "._233:\n"
        "	ldrh	r1, [r4]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r3\n"
        "	ldr	r5, ._238\n"
        "	add	r0, r0, r5\n"
        "	mov	r2, #0x0\n"
        "	strh	r2, [r0]\n"
        "	ldrh	r1, [r4]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r3\n"
        "	ldr	r1, ._238 + 4\n"
        "	add	r0, r0, r1\n"
        "	strh	r2, [r0]\n"
        "	ldrh	r1, [r4]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r3\n"
        "	sub	r5, r5, #0xe\n"
        "	add	r0, r0, r5\n"
        "	mov	r1, #0xff\n"
        "	strb	r1, [r0]\n"
        "	ldrh	r1, [r4]\n"
        "	lsl	r0, r1, #0x3\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r5, r5, #0x8\n"
        "	add	r1, r3, r5\n"
        "	add	r0, r0, r1\n"
        "	str	r2, [r0]\n"
        "	mov	r0, #0x0\n"
        "	ldr	r1, ._238 + 8\n"
        "	mov	ip, r1\n"
        "	sub	r5, r5, #0x1a\n"
        "	add	r7, r3, r5\n"
        "	add	r6, r4, #0\n"
        "	ldr	r1, ._238 + 12\n"
        "	add	r5, r1, #0\n"
        "._237:\n"
        "	lsl	r1, r0, #0x18\n"
        "	asr	r1, r1, #0x18\n"
        "	lsl	r3, r1, #0x1\n"
        "	ldrh	r2, [r6]\n"
        "	lsl	r0, r2, #0x3\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r3, r3, r0\n"
        "	add	r3, r3, r7\n"
        "	ldrh	r0, [r3]\n"
        "	orr	r0, r0, r5\n"
        "	strh	r0, [r3]\n"
        "	add	r1, r1, #0x1\n"
        "	lsl	r1, r1, #0x18\n"
        "	lsr	r0, r1, #0x18\n"
        "	asr	r1, r1, #0x18\n"
        "	cmp	r1, #0x8\n"
        "	ble	._237	@cond_branch\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r0, ip\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r4, ._238 + 16\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, sp\n"
        "	bl	StringExpandPlaceholders\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	add	r0, r4, #0\n"
        "._234:\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "._229:\n"
        "	bl	debug_sub_810D340\n"
        "._227:\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x34\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._239:\n"
        "	.align	2, 0\n"
        "._238:\n"
        "	.word	0x2b6c\n"
        "	.word	0x2b6a\n"
        "	.word	gStringVar1\n"
        "	.word	0xffff\n"
        "	.word	gStringVar4\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810D174()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xfffffeec\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r7, r0, #0x18\n"
        "	ldr	r1, ._242\n"
        "	add	r0, sp, #0x8\n"
        "	mov	r2, #0xc\n"
        "	bl	memcpy\n"
        "	mov	r5, #0x0\n"
        "	mov	r0, sp\n"
        "	add	r0, r0, #0x14\n"
        "	str	r0, [sp, #0x110]\n"
        "	add	r1, sp, #0xc8\n"
        "	mov	r8, r1\n"
        "	add	r2, sp, #0xcc\n"
        "	mov	sl, r2\n"
        "	ldr	r0, ._242 + 4\n"
        "	mov	r9, r0\n"
        "._248:\n"
        "	ldr	r0, ._242 + 8\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	lsl	r1, r5, #0x3\n"
        "	add	r0, r1, r5\n"
        "	lsl	r0, r0, #0x2\n"
        "	add r0, r0, r9\n"
        "	ldr	r2, ._242 + 12\n"
        "	add	r4, r0, r2\n"
        "	ldrh	r0, [r4]\n"
        "	add	r6, r1, #0\n"
        "	ldr	r1, ._242 + 16\n"
        "	cmp	r0, r1\n"
        "	bne	._240	@cond_branch\n"
        "	ldr	r0, ._242 + 20\n"
        "	mov	r1, #0x1\n"
        "	b	._241\n"
        "._243:\n"
        "	.align	2, 0\n"
        "._242:\n"
        "	.word	Str_84116AE\n"
        "	.word	gSaveBlock1\n"
        "	.word	gStringVar1\n"
        "	.word	0x2b6c\n"
        "	.word	0xffff\n"
        "	.word	gStringVar2\n"
        "._240:\n"
        "	sub	r0, r0, #0x79\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0xb\n"
        "	bhi	._244	@cond_branch\n"
        "	ldr	r0, ._246\n"
        "	mov	r1, #0x2\n"
        "._241:\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	b	._245\n"
        "._247:\n"
        "	.align	2, 0\n"
        "._246:\n"
        "	.word	gStringVar2\n"
        "._244:\n"
        "	ldr	r0, ._253\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r4]\n"
        "._245:\n"
        "	add	r0, r6, r5\n"
        "	lsl	r0, r0, #0x2\n"
        "	add r0, r0, r9\n"
        "	ldr	r2, ._253 + 4\n"
        "	add	r0, r0, r2\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, #0xb\n"
        "	mul	r1, r1, r0\n"
        "	ldr	r0, ._253 + 8\n"
        "	add	r1, r1, r0\n"
        "	ldr	r0, ._253 + 12\n"
        "	bl	StringCopy\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x2\n"
        "	ldr	r0, [sp, #0x110]\n"
        "	add	r4, r0, r4\n"
        "	add	r0, r4, #0\n"
        "	add	r1, sp, #0x8\n"
        "	bl	StringExpandPlaceholders\n"
        "	mov	r1, r8\n"
        "	add	r0, r1, r6\n"
        "	str	r4, [r0]\n"
        "	mov	r2, sl\n"
        "	add	r0, r2, r6\n"
        "	mov	r4, #0x0\n"
        "	str	r4, [r0]\n"
        "	add	r0, r5, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	cmp	r5, #0x8\n"
        "	bls	._248	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x10\n"
        "	mov	r3, #0x13\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	mov	r0, #0x2\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x9\n"
        "	mov	r3, r8\n"
        "	bl	Menu_PrintItems\n"
        "	str	r4, [sp]\n"
        "	mov	r0, #0xf\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x9\n"
        "	bl	InitMenu\n"
        "	cmp	r7, #0x1\n"
        "	beq	._249	@cond_branch\n"
        "	cmp	r7, #0x1\n"
        "	bgt	._250	@cond_branch\n"
        "	cmp	r7, #0\n"
        "	beq	._251	@cond_branch\n"
        "	b	._257\n"
        "._254:\n"
        "	.align	2, 0\n"
        "._253:\n"
        "	.word	gStringVar2\n"
        "	.word	0x2b6a\n"
        "	.word	gSpeciesNames\n"
        "	.word	gStringVar3\n"
        "._250:\n"
        "	cmp	r7, #0x2\n"
        "	beq	._255	@cond_branch\n"
        "	cmp	r7, #0x3\n"
        "	beq	._256	@cond_branch\n"
        "	b	._257\n"
        "._251:\n"
        "	ldr	r1, ._259\n"
        "	ldr	r0, ._259 + 4\n"
        "	b	._264\n"
        "._260:\n"
        "	.align	2, 0\n"
        "._259:\n"
        "	.word	gCallback_03004AE8\n"
        "	.word	debug_sub_810CE48+1\n"
        "._249:\n"
        "	ldr	r1, ._262\n"
        "	ldr	r0, ._262 + 4\n"
        "	b	._264\n"
        "._263:\n"
        "	.align	2, 0\n"
        "._262:\n"
        "	.word	gCallback_03004AE8\n"
        "	.word	debug_sub_810CED0+1\n"
        "._255:\n"
        "	ldr	r1, ._265\n"
        "	ldr	r0, ._265 + 4\n"
        "	b	._264\n"
        "._266:\n"
        "	.align	2, 0\n"
        "._265:\n"
        "	.word	gCallback_03004AE8\n"
        "	.word	debug_sub_810CFA4+1\n"
        "._256:\n"
        "	ldr	r1, ._267\n"
        "	ldr	r0, ._267 + 4\n"
        "._264:\n"
        "	str	r0, [r1]\n"
        "._257:\n"
        "	add	sp, sp, #0x114\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._268:\n"
        "	.align	2, 0\n"
        "._267:\n"
        "	.word	gCallback_03004AE8\n"
        "	.word	debug_sub_810D030+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810D2F4()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r2, r0, #0x18\n"
        "	asr	r1, r2, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._269	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._270	@cond_branch\n"
        "	ldr	r0, ._272\n"
        "	bl	SetMainCallback2\n"
        "	b	._279\n"
        "._273:\n"
        "	.align	2, 0\n"
        "._272:\n"
        "	.word	debug_sub_810CDF0+1\n"
        "._270:\n"
        "	cmp	r1, #0x1\n"
        "	beq	._278	@cond_branch\n"
        "	cmp	r1, #0x1\n"
        "	bgt	._275	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	beq	._278	@cond_branch\n"
        "	b	._279\n"
        "._275:\n"
        "	cmp	r1, #0x2\n"
        "	beq	._278	@cond_branch\n"
        "	cmp	r1, #0x3\n"
        "	bne	._279	@cond_branch\n"
        "._278:\n"
        "	lsr	r0, r2, #0x18\n"
        "	bl	debug_sub_810D174\n"
        "._269:\n"
        "	mov	r0, #0x0\n"
        "	b	._280\n"
        "._279:\n"
        "	mov	r0, #0x1\n"
        "._280:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810D340()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x9\n"
        "	mov	r3, #0x9\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r3, ._281\n"
        "	mov	r0, #0x2\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x4\n"
        "	bl	Menu_PrintItems\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0x8\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x4\n"
        "	bl	InitMenu\n"
        "	ldr	r1, ._281 + 4\n"
        "	ldr	r0, ._281 + 8\n"
        "	str	r0, [r1]\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._282:\n"
        "	.align	2, 0\n"
        "._281:\n"
        "	.word	_84116BC\n"
        "	.word	gCallback_03004AE8\n"
        "	.word	debug_sub_810D2F4+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_810D388()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	ldr	r1, ._285\n"
        "	ldr	r2, ._285 + 4\n"
        "	add	r0, r1, r2\n"
        "	ldrb	r0, [r0]\n"
        "	add	r2, r1, #0\n"
        "	cmp	r0, #0x8\n"
        "	bls	._283	@cond_branch\n"
        "	b	._320\n"
        "._283:\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._285 + 8\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._286:\n"
        "	.align	2, 0\n"
        "._285:\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "	.word	._287\n"
        "._287:\n"
        "	.word	._288\n"
        "	.word	._289\n"
        "	.word	._290\n"
        "	.word	._291\n"
        "	.word	._292\n"
        "	.word	._293\n"
        "	.word	._294\n"
        "	.word	._295\n"
        "	.word	._296\n"
        "._288:\n"
        "	ldr	r3, ._299\n"
        "	ldrb	r4, [r3]\n"
        "	cmp	r4, #0\n"
        "	beq	._297	@cond_branch\n"
        "	ldr	r1, ._299 + 4\n"
        "	add	r0, r2, r1\n"
        "	mov	r2, #0x0\n"
        "	mov	r1, #0x2\n"
        "	strb	r1, [r0]\n"
        "	strb	r2, [r3]\n"
        "	b	._320\n"
        "._300:\n"
        "	.align	2, 0\n"
        "._299:\n"
        "	.word	unk_debug_bss_2\n"
        "	.word	0x43c\n"
        "._297:\n"
        "	bl	ScanlineEffect_Stop\n"
        "	bl	ResetPaletteFade\n"
        "	ldr	r0, ._302\n"
        "	bl	SetVBlankCallback\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	str	r4, [sp]\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	b	._321\n"
        "._303:\n"
        "	.align	2, 0\n"
        "._302:\n"
        "	.word	sub_80F8F18+1\n"
        "._289:\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._304	@cond_branch\n"
        "	b	._320\n"
        "._304:\n"
        "	b	._321\n"
        "._290:\n"
        "	mov	r0, #0x0\n"
        "	bl	SetVBlankCallback\n"
        "	ldr	r0, ._308\n"
        "	mov	r1, #0x0\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	strh	r1, [r0]\n"
        "	sub	r0, r0, #0x2\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r1, [r0]\n"
        "	b	._321\n"
        "._309:\n"
        "	.align	2, 0\n"
        "._308:\n"
        "	.word	0x4000010\n"
        "._291:\n"
        "	bl	ResetSpriteData\n"
        "	bl	ResetTasks\n"
        "	bl	FreeAllSpritePalettes\n"
        "	b	._321\n"
        "._292:\n"
        "	ldr	r4, ._312\n"
        "	add	r0, r4, #0\n"
        "	bl	Text_LoadWindowTemplate\n"
        "	add	r0, r4, #0\n"
        "	bl	InitMenuWindow\n"
        "	bl	Menu_EraseScreen\n"
        "	b	._321\n"
        "._313:\n"
        "	.align	2, 0\n"
        "._312:\n"
        "	.word	gWindowTemplate_81E6CE4\n"
        "._293:\n"
        "	ldr	r4, ._315\n"
        "	ldr	r0, [r4]\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x20\n"
        "	bl	LoadPalette\n"
        "	ldr	r0, [r4, #0x4]\n"
        "	mov	r1, #0xc0\n"
        "	lsl	r1, r1, #0x13\n"
        "	bl	LZ77UnCompVram\n"
        "	add	r1, sp, #0x4\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r1]\n"
        "	ldr	r1, ._315 + 4\n"
        "	add	r2, sp, #0x4\n"
        "	str	r2, [r1]\n"
        "	ldr	r0, ._315 + 8\n"
        "	str	r0, [r1, #0x4]\n"
        "	ldr	r0, ._315 + 12\n"
        "	str	r0, [r1, #0x8]\n"
        "	ldr	r0, [r1, #0x8]\n"
        "	b	._321\n"
        "._316:\n"
        "	.align	2, 0\n"
        "._315:\n"
        "	.word	gMailGraphicsTable\n"
        "	.word	0x40000d4\n"
        "	.word	0x6004000\n"
        "	.word	0x81000280\n"
        "._294:\n"
        "	ldr	r1, ._318\n"
        "	ldr	r2, ._318 + 4\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r2, ._318 + 8\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x46\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r1]\n"
        "	sub	r1, r1, #0x50\n"
        "	mov	r2, #0xd0\n"
        "	lsl	r2, r2, #0x2\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	bl	debug_sub_810D340\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x10\n"
        "	mov	r3, #0x0\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r0, ._318 + 12\n"
        "	bl	SetVBlankCallback\n"
        "	b	._321\n"
        "._319:\n"
        "	.align	2, 0\n"
        "._318:\n"
        "	.word	0x4000008\n"
        "	.word	0x9f08\n"
        "	.word	0x801\n"
        "	.word	sub_80F8F18+1\n"
        "._295:\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._320	@cond_branch\n"
        "	b	._321\n"
        "._296:\n"
        "	ldr	r0, ._322\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	ldr	r0, ._322 + 4\n"
        "	bl	SetMainCallback2\n"
        "._321:\n"
        "	ldr	r1, ._322 + 8\n"
        "	ldr	r0, ._322 + 12\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "._320:\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._323:\n"
        "	.align	2, 0\n"
        "._322:\n"
        "	.word	debug_sub_810CE1C+1\n"
        "	.word	debug_sub_810CDE0+1\n"
        "	.word	gMain\n"
        "	.word	0x43c\n"
        "\n"
    );
}
#endif