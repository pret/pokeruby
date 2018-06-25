#include "global.h"
#include "mail.h"
#include "data2.h"
#include "easy_chat.h"
#include "constants/items.h"
#include "constants/species.h"
#include "field_fadetransition.h"
#include "graphics.h"
#include "mail_data.h"
#include "menu.h"
#include "menu_helpers.h"
#include "name_string_util.h"
#include "palette.h"
#include "pokemon_icon.h"
#include "overworld.h"
#include "script.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"
#include "ewram.h"

extern u8 (*gMenuCallback)(void);

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

static u8 sub_80F8A28(void);
static void sub_80F8D50(void);
static void sub_80F8DA0(void);
static void sub_80F8E80(void);
static void sub_80F8F18(void);
static void sub_80F8F2C(void);
static void sub_80F8F58(void);
static void sub_80F8F78(void);
static void sub_80F8FB4(void);

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;

#if DEBUG
static u8 gUnknown_Debug_0300079C;
#endif

void HandleReadMail(struct MailStruct *arg0, MainCallback arg1, bool8 arg2)
{
    u16 buffer[2];
    u16 species;

#if DEBUG
    if (gUnknown_Debug_0300079C != 0)
    {
        ewram0_4.varFF = GAME_LANGUAGE;
        ewram0_4.var100 = gSpecialVar_0x8004;
        ewram0_4.var104 = (MainCallback)EasyChat_GetWordText;
        ewram0_4.var108 = (MainCallback)ConvertEasyChatWordsToString;
        ewram0_4.varFA = gSpecialVar_0x8006;
    }
    else
#endif
    {
        ewram0_4.varFF = GAME_LANGUAGE;
        ewram0_4.var100 = 1;
        ewram0_4.var104 = (MainCallback)EasyChat_GetWordText;
        ewram0_4.var108 = (MainCallback)ConvertEasyChatWordsToString;
        if (IS_ITEM_MAIL(arg0->itemId))
        {
            ewram0_4.varFA = arg0->itemId - 0x79;
        }
        else
        {
            ewram0_4.varFA = 0;
            arg2 = FALSE;
        }
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

    species = MailSpeciesToSpecies(arg0->species, buffer);
    if (species >= 1 && species <= 411)
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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gPaletteFade.bufferTransferDisabled = 0;
        ewram0_4.varF0 = sub_80F8F58;
        return TRUE;

    default:
        return FALSE;
    }

    gMain.state += 1;
    return FALSE;
}

static void sub_80F8D50(void)
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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        ewram0_4.varF0 = sub_80F8FB4;
    }
}

static void sub_80F8FB4(void)
{
    if (!UpdatePaletteFade())
    {
        SetMainCallback2(ewram0_4.varEC);
        switch (ewram0_4.varFB)
        {
        case 2:
        case 1:
            sub_809D608(sub_809D4A8(ewram0_4.varF4->species));
            sub_809D510(&gSprites[ewram0_4.varFC]);
            break;
        }
#if !DEBUG
        memset(&ewram0_4, 0, 0x110);
#endif
        ResetPaletteFade();
    }
}

#if DEBUG

void debug_sub_810CA7C(u8);
void debug_sub_810CE1C(u8);
void debug_sub_810D388(void);
void debug_sub_810D340(void);

void debug_sub_810C910(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gUnknown_Debug_0300079C = 1;
        Menu_EraseScreen();
        DestroyTask(taskId);
        if (gSaveBlock1.mail[gSpecialVar_0x8005].itemId == 0)
            HandleReadMail(&gSaveBlock1.mail[gSpecialVar_0x8005], debug_sub_810D388, 0);
        else
            HandleReadMail(&gSaveBlock1.mail[gSpecialVar_0x8005], debug_sub_810D388, 1);
    }
}

void debug_sub_810C990(u8 taskId)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_DOWN))
    {
        gSpecialVar_0x8006 = (gSpecialVar_0x8006 + 11) % 12;
        Menu_DrawStdWindowFrame(1, 1, 10, 4);
        Menu_PrintText(_84115C4[gSpecialVar_0x8006], 2, 2);
    }
    else if (gMain.newKeys & (DPAD_UP | DPAD_RIGHT))
    {
        gSpecialVar_0x8006 = (gSpecialVar_0x8006 + 1) % 12;
        Menu_DrawStdWindowFrame(1, 1, 10, 4);
        Menu_PrintText(_84115C4[gSpecialVar_0x8006], 2, 2);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = debug_sub_810C910;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        Menu_DisplayDialogueFrame();
        Menu_PrintText(Str_8411540, 4, 15);
        Menu_PrintText(_8411560[gSpecialVar_0x8004], 2, 2);
        gTasks[taskId].func = debug_sub_810CA7C;
    }
}

void debug_sub_810CA7C(u8 taskId)
{
    if (gMain.newKeys & 0xF0)
    {
        gSpecialVar_0x8004 ^= 1;
        Menu_PrintText(_8411560[gSpecialVar_0x8004], 2, 2);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (gMain.watchedKeysPressed)
        {
            gMain.watchedKeysPressed = FALSE;
            Menu_DisplayDialogueFrame();
            Menu_PrintText(Str_8411540, 4, 15);
            Menu_DrawStdWindowFrame(1, 1, 10, 4);
            Menu_PrintText(_8411560[gSpecialVar_0x8004], 2, 2);
        }
        else
        {
            Menu_DisplayDialogueFrame();
            Menu_PrintText(Str_8411568, 4, 15);
            Menu_DrawStdWindowFrame(1, 1, 10, 4);
            Menu_PrintText(_84115C4[gSpecialVar_0x8006], 2, 2);
            gTasks[taskId].func = debug_sub_810C990;
        }
    }
}

void debug_sub_810CB50(u8 taskId)
{
    u8 sp0[] = _("{STR_VAR_1}　{STR_VAR_2}");
    u8 sp8[] = _("メール{STR_VAR_1}　{STR_VAR_2}");
    bool8 r2 = FALSE;

    if (gMain.newKeys & A_BUTTON)
    {
        ConvertIntToDecimalStringN(gStringVar1, gSpecialVar_0x8005, 2, 1);
        StringCopy(gStringVar2, gSpeciesNames[gTasks[taskId].data[0]]);
        gSaveBlock1.mail[gSpecialVar_0x8005].species = gTasks[taskId].data[0];
        StringExpandPlaceholders(gStringVar4, sp8);
        Menu_DisplayDialogueFrame();
        Menu_PrintText(gStringVar4, 4, 15);
        DestroyTask(taskId);
        CreateTask(debug_sub_810CE1C, 0);
        debug_sub_810D340();
        return;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        DestroyTask(taskId);
        Menu_EraseScreen();
        CreateTask(debug_sub_810CE1C, 0);
        debug_sub_810D340();
        return;
    }
    else if (gMain.newKeys & (DPAD_LEFT | DPAD_DOWN))
    {
        gTasks[taskId].data[0] = (gTasks[taskId].data[0] + 0x19B) % 0x19C;
        r2 = TRUE;
    }
    else if (gMain.newKeys & (DPAD_UP | DPAD_RIGHT))
    {
        gTasks[taskId].data[0] = (gTasks[taskId].data[0] + 1) % 0x19C;
        r2 = TRUE;
    }

    if (r2)
    {
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[0], 2, 3);
        StringCopy(gStringVar2, gSpeciesNames[gTasks[taskId].data[0]]);
        StringExpandPlaceholders(gStringVar4, sp0);
        Menu_DrawStdWindowFrame(0, 0, 12, 3);
        Menu_PrintText(gStringVar4, 1, 1);
    }
}

void debug_sub_810CCEC(u8 taskId)
{
    u8 string1[] = _("メール{STR_VAR_1}を　だれに　もたせる？");
    u8 string2[] = _("000　{STR_VAR_1}");

    ConvertIntToDecimalStringN(gStringVar1, gSpecialVar_0x8005, 1, 1);
    StringExpandPlaceholders(gStringVar4, string1);
    Menu_DisplayDialogueFrame();
    Menu_PrintText(gStringVar4, 4, 15);

    StringCopy(gStringVar1, gSpeciesNames[0]);
    StringExpandPlaceholders(gStringVar4, string2);
    Menu_DrawStdWindowFrame(0, 0, 12, 3);
    Menu_PrintText(string2, 1, 1);  // This probably should have been gStringVar4

    gTasks[taskId].func = debug_sub_810CB50;
}

u8 debug_sub_810CD9C(void)
{
    CloseMenu();
    ScriptContext1_Stop();
    ScriptContext2_Enable();
    gUnknown_Debug_0300079C = 0;
    gSpecialVar_0x8004 = gSpecialVar_0x8005 = gSpecialVar_0x8006 = 0;
    SetMainCallback2(debug_sub_810D388);
    return 1;
}

void debug_sub_810CDE0(void)
{
    UpdatePaletteFade();
    RunTasks();
}

void debug_sub_810CDF0(void)
{
    gMain.watchedKeysPressed = 0;
    gMain.watchedKeysMask = 0;
    gFieldCallback = mapldr_default;
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

void debug_sub_810CE1C(u8 taskId)
{
    if (gMenuCallback() == TRUE)
    {
        CloseMenu();
        DestroyTask(taskId);
    }
}

u8 debug_sub_810CE48(void)
{
    s8 input = Menu_ProcessInput();

    switch (input)
    {
    case -1:
        Menu_EraseScreen();
        debug_sub_810D340();
        return 0;
    case -2:
        return 0;
    default:
        gSpecialVar_0x8005 = input;
        gSpecialVar_0x8006 %= 12;
        CreateTask(debug_sub_810CA7C, 0);
        gMain.watchedKeysPressed = TRUE;  // huh?
        gMain.watchedKeysMask = 0;
        return 1;
    }
}

u8 debug_sub_810CEA4(void)
{
    if (!gPaletteFade.active)
    {
        gSpecialVar_0x8004 = 4;
        sub_80E60D8();
        return 1;
    }
    return 0;
}

u8 debug_sub_810CED0(void)
{
    u8 text[] = _("せいきの　データが　とうろくずみ　です\n"
                  "しんき　とうろく　できません");
    s8 input = Menu_ProcessInput();

    switch (input)
    {
    case -1:
        Menu_EraseScreen();
        break;
    case -2:
        return 0;
    default:
        gSpecialVar_0x8005 = input;
        if (IS_ITEM_MAIL(gSaveBlock1.mail[input].itemId))
        {
            Menu_EraseScreen();
            Menu_DisplayDialogueFrame();
            Menu_PrintText(text, 4, 15);
        }
        else
        {
            gSaveBlock1.mail[gSpecialVar_0x8005].itemId = 0xFFFF;
            StringCopy(gSaveBlock1.mail[gSpecialVar_0x8005].playerName, gSaveBlock2.playerName);
            *(u32 *)gSaveBlock1.mail[gSpecialVar_0x8005].trainerId = *(u32 *)gSaveBlock2.playerTrainerId;
            gMenuCallback = debug_sub_810CEA4;
            return 0;
        }
        break;
    }
    debug_sub_810D340();
    return 0;
}

u8 debug_sub_810CFA4(void)
{
    u8 text[] = _("せいきに　とうろくされたメールデータは\n"
                  "へんこう　できません");
    s8 input = Menu_ProcessInput();

    switch (input)
    {
    case -1:
        Menu_EraseScreen();
        debug_sub_810D340();
        return 0;
    case -2:
        return 0;
    default:
        gSpecialVar_0x8005 = input;
        if (IS_ITEM_MAIL(gSaveBlock1.mail[input].itemId))
        {
            Menu_EraseScreen();
            Menu_DisplayDialogueFrame();
            Menu_PrintText(text, 4, 15);
            debug_sub_810D340();
            return 0;
        }
        else
        {
            CreateTask(debug_sub_810CCEC, 0);
            return 1;
        }
    }
}

u8 debug_sub_810D030(void)
{
    const u8 text1[] = _("メール{STR_VAR_1}　とうろく　かいじょ");
    const u8 text2[] = _("デバッグメニューから　とうろくした\n"
                         "メール　いがいは　けせません");
    s8 input = Menu_ProcessInput();

    switch (input)
    {
    case -1:
        Menu_EraseScreen();
        debug_sub_810D340();
        return 0;
    case -2:
        return 0;
    default:
        gSpecialVar_0x8005 = input;
        if (gSaveBlock1.mail[gSpecialVar_0x8005].itemId != 0xFFFF
         && gSaveBlock1.mail[gSpecialVar_0x8005].itemId != 0)
        {
            Menu_EraseScreen();
            Menu_DisplayDialogueFrame();
            Menu_PrintText(text2, 4, 15);
            debug_sub_810D340();
            return 0;
        }
        else
        {
            s8 i;

            gSaveBlock1.mail[gSpecialVar_0x8005].itemId = 0;
            gSaveBlock1.mail[gSpecialVar_0x8005].species = 0;
            gSaveBlock1.mail[gSpecialVar_0x8005].playerName[0] = EOS;
            *(u32 *)gSaveBlock1.mail[gSpecialVar_0x8005].trainerId = 0;
            for (i = 0; i < 9; i++)
                gSaveBlock1.mail[gSpecialVar_0x8005].words[i] = 0xFFFF;
            ConvertIntToDecimalStringN(gStringVar1, gSpecialVar_0x8005, 1, 1);
            StringExpandPlaceholders(gStringVar4, text1);
            Menu_EraseScreen();
            Menu_DisplayDialogueFrame();
            Menu_PrintText(gStringVar4, 4, 15);
            debug_sub_810D340();
            return 0;
        }
    }
}

void debug_sub_810D174(u8 a)
{
    u8 string[] = _("メール{STR_VAR_1}　{STR_VAR_2}　{STR_VAR_3}");
    u8 buffer[9][20];
    struct MenuAction menuActions[9];
    u8 i;

    for (i = 0; i < 9; i++)
    {
        ConvertIntToDecimalStringN(gStringVar1, i, 1, 1);
        if (gSaveBlock1.mail[i].itemId == 0xFFFF)
        {
            ConvertIntToDecimalStringN(gStringVar2, 1, 1, 1);
        }
        else if (IS_ITEM_MAIL(gSaveBlock1.mail[i].itemId))
        {
            ConvertIntToDecimalStringN(gStringVar2, 2, 1, 1);
        }
        else
        {
            ConvertIntToDecimalStringN(gStringVar2, 0, 1, 1);
            gSaveBlock1.mail[i].itemId = 0;
        }
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.mail[i].species]);
        StringExpandPlaceholders(buffer[i], string);
        menuActions[i].text = buffer[i];
        menuActions[i].func = NULL;
    }
    Menu_DrawStdWindowFrame(0, 0, 16, 19);
    Menu_PrintItems(2, 1, 9, menuActions);
    InitMenu(0, 1, 1, 9, 0, 15);
    switch (a)
    {
    case 0:
        gMenuCallback = debug_sub_810CE48;
        break;
    case 1:
        gMenuCallback = debug_sub_810CED0;
        break;
    case 2:
        gMenuCallback = debug_sub_810CFA4;
        break;
    case 3:
        gMenuCallback = debug_sub_810D030;
        break;
    }
}

u8 debug_sub_810D2F4(void)
{
    s8 input = Menu_ProcessInput();

    switch (input)
    {
    case -1:
        SetMainCallback2(debug_sub_810CDF0);
        return 1;
    case -2:
        return 0;
    }

    switch (input)
    {
    case 0:
        debug_sub_810D174(input);
        return 0;
    case 1:
        debug_sub_810D174(input);
        return 0;
    case 2:
        debug_sub_810D174(input);
        return 0;
    case 3:
        debug_sub_810D174(input);
        return 0;
    }

    return 1;
}

const struct MenuAction _84116BC[] =
{
    {Str_84115F4, NULL},
    {Str_84115FB, NULL},
    {Str_8411603, NULL},
    {Str_8411608, NULL},
};

void debug_sub_810D340(void)
{
    Menu_DrawStdWindowFrame(0, 0, 9, 9);
    Menu_PrintItems(2, 1, 4, _84116BC);
    InitMenu(0, 1, 1, 4, 0, 8);
    gMenuCallback = debug_sub_810D2F4;
}

void debug_sub_810D388(void)
{
    switch (gMain.state)
    {
    case 0:
        if (gUnknown_Debug_0300079C != 0)
        {
            gMain.state = 2;
            gUnknown_Debug_0300079C = 0;
            return;
        }
        else
        {
            ScanlineEffect_Stop();
            ResetPaletteFade();
            SetVBlankCallback(sub_80F8F18);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        }
        break;
    case 1:
        if (UpdatePaletteFade())
            return;
        break;
    case 2:
        SetVBlankCallback(NULL);
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG2VOFS = 0;
        REG_BG2HOFS = 0;
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 0;
        break;
    case 3:
        ResetSpriteData();
        ResetTasks();
        FreeAllSpritePalettes();
        break;
    case 4:
        Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
        InitMenuWindow(&gMenuTextWindowTemplate);
        Menu_EraseScreen();
        break;
    case 5:
        LoadPalette(gMailGraphicsTable[0].palette, 0, 32);
        LZ77UnCompVram(gMailGraphicsTable[0].tiles, (void *)VRAM);
        DmaFill16(3, 1, (void *)(VRAM + 0x4000), 0x500);
        break;
    case 6:
        REG_BG0CNT = 0x9F08;
        REG_BG1CNT = 0x0801;
        REG_BLDCNT = 0;
        REG_DISPCNT = 0x0340;
        debug_sub_810D340();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(sub_80F8F18);
        break;
    case 7:
        if (!UpdatePaletteFade())
            return;
        break;
    case 8:
        CreateTask(debug_sub_810CE1C, 0);
        SetMainCallback2(debug_sub_810CDE0);
        break;
    default:
        return;
    }
    gMain.state++;
}

#endif
