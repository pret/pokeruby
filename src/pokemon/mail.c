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
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        ewram0_4.varF0 = sub_80F8FB4;
    }
}

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
