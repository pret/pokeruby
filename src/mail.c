#include "global.h"
#include "mail.h"
#include "asm.h"
#include "items.h"
#include "menu.h"
#include "name_string_util.h"
#include "palette.h"
#include "rom4.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

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
    struct UnkMailStruct *var4;
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
    /*0x10C*/ struct MailLayout *var10C;
};

struct MailGraphics
{
    u16 (*palette)[];
    u8 (*tiles)[];
    u8 (*tileMap)[];
    u16 var0C;
    u16 var0E;
    u16 color10;
    u16 color12;
};

extern u8 ewram[];
#define ewram0 (*(struct Unk2000000 *)(ewram))

extern struct MailGraphics gMailGraphicsTable[];
extern u16 gUnknown_083E562C[][2];

extern struct MailLayout gUnknown_083E5730[];
extern struct MailLayout gUnknown_083E57A4[];

extern u8 gOtherText_From[];

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
    u8 buffer[4];

    ewram0.varFF = GAME_LANGUAGE;
    ewram0.var100 = 1;
    ewram0.var104 = (MainCallback)sub_80EB3FC;
    ewram0.var108 = (MainCallback)ConvertEasyChatWordsToString;

    mailDesign = arg0->itemId - ITEM_ORANGE_MAIL;

    if (mailDesign <= 11)
    {
        ewram0.varFA = arg0->itemId - ITEM_ORANGE_MAIL;
    }
    else
    {
        ewram0.varFA = 0;
        arg2 = FALSE;
    }

    switch (ewram0.var100)
    {
    case 0:
    default:
        ewram0.var10C = &gUnknown_083E5730[ewram0.varFA];
        break;

    case 1:
        ewram0.var10C = &gUnknown_083E57A4[ewram0.varFA];
        break;
    }

    if (((MailSpeciesToSpecies(arg0->species, buffer) << 16) + 0xFFFF0000) <= (410 << 16))
    {
        switch (ewram0.varFA)
        {
        case 6:
            ewram0.varFB = 1;
            break;

        case 9:
            ewram0.varFB = 2;
            break;

        default:
            ewram0.varFB = 0;
            break;
        }
    }
    else
    {
        ewram0.varFB = 0;
    }


    ewram0.varF4 = arg0;
    ewram0.varEC = arg1;
    ewram0.varF8 = arg2;

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
        remove_some_task();
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
        SetUpWindowConfig(&gWindowConfig_81E6DFC);
        RETURN_UP_STATE;

    case 7:
        MultistepInitMenuWindowBegin(&gWindowConfig_81E6DFC);
        RETURN_UP_STATE;

    case 8:
        if (MultistepInitMenuWindowContinue() == 0)
        {
            return FALSE;
        }
        RETURN_UP_STATE;

    case 9:
        MenuZeroFillScreen();
        RETURN_UP_STATE;

    case 10: CpuFill16(1, (void *)(VRAM + 0x4800), 0x800);
        RETURN_UP_STATE;

    case 11:
        LoadPalette(gMailGraphicsTable[ewram0.varFA].palette, 0, 16 * 2);
        RETURN_UP_STATE;

    case 12:
        LZ77UnCompVram(gMailGraphicsTable[ewram0.varFA].tileMap, (void *)(VRAM + 0x4000));
        RETURN_UP_STATE;

    case 13:
        LZ77UnCompVram(gMailGraphicsTable[ewram0.varFA].tiles, (void *)(VRAM));

        gPlttBufferUnfaded[241] = gMailGraphicsTable[ewram0.varFA].color10;
        gPlttBufferUnfaded[248] = gMailGraphicsTable[ewram0.varFA].color12;
        gPlttBufferUnfaded[10] = gUnknown_083E562C[gSaveBlock2.playerGender][0];
        gPlttBufferUnfaded[11] = gUnknown_083E562C[gSaveBlock2.playerGender][1];
        RETURN_UP_STATE;

    case 14:
        if (ewram0.varF8 != 0)
        {
            sub_80F8DA0();
        }
        RETURN_UP_STATE;

    case 15:
        if (ewram0.varF8 != 0)
        {
            sub_80F8E80();
        }

        SetVBlankCallback(sub_80F8F18);
        gPaletteFade.bufferTransferDisabled = 1;
        RETURN_UP_STATE;

    case 16:
    {
        u16 local1;

        local1 = sub_809D4A8(ewram0.varF4->species);

        switch (ewram0.varFB)
        {
        case 1:
            sub_809D580(local1);
            ewram0.varFC = sub_809D3A4(local1, SpriteCallbackDummy, 96, 128, 0);
            break;

        case 2:
            sub_809D580(local1);
            ewram0.varFC = sub_809D3A4(local1, SpriteCallbackDummy, 40, 128, 0);
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
        REG_BG0CNT = 0x9F08;
        REG_BG1CNT = 0x0801;
        REG_BG2CNT = 0x0902;
        REG_BLDCNT = 0;
        REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        BeginNormalPaletteFade(-1, 0, 16, 0, 0);
        gPaletteFade.bufferTransferDisabled = 0;
        ewram0.varF0 = sub_80F8F58;
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
    for (i = 0; i < ewram0.var10C->var0; i++)
    {
        ConvertEasyChatWordsToString(ewram0.words[i], &ewram0.varF4->words[r6], ewram0.var10C->var4[i].unk_0_2, 1);
        r6 += ewram0.var10C->var4[i].unk_0_2;
    }
    ptr = ewram0.varD8;
    if (ewram0.var100 == 0)
    {
        ptr = sub_80F8D7C(ptr, ewram0.varF4->playerName);
        StringCopy(ptr, gOtherText_From);
        ewram0.varF9 = ewram0.var10C->var2 - StringLength(ewram0.varD8);

    }
    else
    {
        ptr = StringCopy(ptr, gOtherText_From);
        sub_80F8D7C(ptr, ewram0.varF4->playerName);
        ewram0.varF9 = ewram0.var10C->var2;
    }
}

static void sub_80F8E80(void)
{
    u16 pos;
    u8 x;
    u8 y = 0;

    for (pos = 0; pos < ewram0.var10C->var0; pos++)
    {
        if (ewram0.words[pos][0] == 0xFF)
        {
            continue;
        }

        if (ewram0.words[pos][0] == 0x00)
        {
            continue;
        }

        x = ewram0.var10C->var4[pos].unk_0_4;
        y += ewram0.var10C->var4[pos].unk_0_0;
        MenuPrint(ewram0.words[pos], ewram0.var10C->var3_4 + x, ewram0.var10C->var3_0 + y);
        y += 2;
    }

    MenuPrint(ewram0.varD8, ewram0.varF9, ewram0.var10C->var1);
}

static void sub_80F8F18(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_80F8F2C(void)
{
    if (ewram0.varFB != 0)
    {
        AnimateSprites();
        BuildOamBuffer();
    }

    ewram0.varF0();
}

static void sub_80F8F58(void)
{
    u8 local0;

    local0 = UpdatePaletteFade();
    if (local0 == 0)
    {
        ewram0.varF0 = sub_80F8F78;
    }
}

static void sub_80F8F78(void)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        ewram0.varF0 = sub_80F8FB4;
    }
}

static void sub_80F8FB4(void)
{
    u16 local1;

    if (UpdatePaletteFade())
    {
        return;
    }

    SetMainCallback2(ewram0.varEC);
    switch (ewram0.varFB)
    {
    case 2:
    case 1:
        local1 = sub_809D4A8(ewram0.varF4->species);
        sub_809D608(local1);

        sub_809D510(&gSprites[ewram0.varFC]);
        break;
    }

    memset(&ewram0, 0, 0x110);
    ResetPaletteFade();
}
