#include "global.h"
#include "main.h"
#include "menu.h"
#include "pokemon_storage_system.h"
#include "sound.h"

EWRAM_DATA struct UnkStruct_2000020 *gUnknown_020384EC = NULL;

extern s8 gUnknown_020384E4;
extern s8 gUnknown_020384E5;
extern bool8 gUnknown_020384E6;
extern u8 gUnknown_020384E9;

#if DEBUG
extern u8 unk_2038790;
#endif

extern const struct SpriteSheet gHandCursorSpriteSheets[3];
extern const struct SpritePalette gHandCursorSpritePalettes[3];
extern const struct SpriteTemplate gSpriteTemplate_83BBC70;
extern const struct SpriteTemplate gSpriteTemplate_83BBC88;
extern const u8 *const gUnknown_083BBCA0[];

extern struct PokemonStorageSystemFunc gUnknown_083BBBD4[];

void sub_809AF18(u8 a0, u8 a1);
void sub_809CA8C(void);
void sub_809CD88(void);
u16 sub_809AB8C(void);
void sub_809AACC(u8 a0, u8 a1, u16 *a2, u16 *a3);
void sub_809D0BC(struct UnkStruct_2000028*);
void sub_809D1C4(struct UnkStruct_2000028*);

u8 sub_809C85C(void)
{
    u8 retVal;
    s8 var0;
    register s8 var1 asm("r5"); // FAKEMATCHING: r5 and r6 become swapped without this register hack

    gPokemonStorageSystemPtr->unk_11df = 0;
    gPokemonStorageSystemPtr->unk_11de = 0;
    gPokemonStorageSystemPtr->unk_11e3 = 0;

    if (!(gMain.newAndRepeatedKeys & DPAD_UP))
    {
        if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            retVal = 1;
            var0 = 0;
            var1 = 2;
        }
        else
        {
            if (gMain.heldKeys & DPAD_LEFT)
                return 10;
            if (gMain.heldKeys & DPAD_RIGHT)
                return 9;
            if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
            {
                if (gMain.heldKeys & L_BUTTON)
                    return 10;
                if (gMain.heldKeys & R_BUTTON)
                    return 9;
            }

            if (gMain.newKeys & A_BUTTON)
            {
                sub_809A860(0);
                sub_809CA8C();
                return 7;
            }

            if (gMain.newKeys & B_BUTTON)
                return 16;

            if (gMain.newKeys & SELECT_BUTTON)
            {
                sub_809CD88();
                return 0;
            }

            retVal = 0;
        }
    }
    else
    {
        retVal = 1;
        var0 = 3;
        var1 = 0;
        gPokemonStorageSystemPtr->unk_11e3 = 1;
    }

    if (retVal)
    {
        if (var0 != 2)
            sub_809A860(0);
        sub_809AF18(var0, var1);
        return retVal;
    }

    return retVal;
}

#ifdef NONMATCHING
u8 sub_809C944(void)
{
    u8 r6;
    s8 var0 = gUnknown_020384E4;
    s8 var1 = gUnknown_020384E5;

    gPokemonStorageSystemPtr->unk_11df = 0;
    gPokemonStorageSystemPtr->unk_11de = 0;
    gPokemonStorageSystemPtr->unk_11e3 = 0;

    if (!(gMain.newAndRepeatedKeys & DPAD_UP))
    {
        if (gMain.newAndRepeatedKeys & (DPAD_DOWN | START_BUTTON))
        {
            r6 = 1;
            var0 = 2;
            var1 = 0;
            gPokemonStorageSystemPtr->unk_11e3 = 1;
        }
        else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        {
            r6 = 1;
            var1 -= 1;
            if (var1 < 0)
            {
                gPokemonStorageSystemPtr->unk_11df = -1;
                var1 = 1;
            }
        }
        else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        {
            r6 = 1;
            var1 += 1;
            if (var1 > 1)
            {
                gPokemonStorageSystemPtr->unk_11df = 1;
                var1 = 0;
            }
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            return var1 == 0 ? 5 : 4;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            return 16;
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            sub_809CD88();
            return 0;
        }
        else
        {
            r6 = 0;
        }
    }
    else
    {
        r6 = 1;
        var0 = 0;
        gPokemonStorageSystemPtr->unk_11de = -1;
        var1 = !gUnknown_020384E5 ? 24 : 29;
        gPokemonStorageSystemPtr->unk_11e3 = 1;
    }

    if (r6)
    {
        sub_809AF18(var0, var1);
    }

    return r6;
}
#else
NAKED
u8 sub_809C944(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r0, _0809C988 @ =gUnknown_020384E4\n\
    ldrb r0, [r0]\n\
    mov r12, r0\n\
    ldr r7, _0809C98C @ =gUnknown_020384E5\n\
    ldrb r3, [r7]\n\
    ldr r0, _0809C990 @ =gPokemonStorageSystemPtr\n\
    ldr r1, [r0]\n\
    ldr r0, _0809C994 @ =0x000011df\n\
    adds r5, r1, r0\n\
    movs r0, 0\n\
    strb r0, [r5]\n\
    ldr r2, _0809C998 @ =0x000011de\n\
    adds r4, r1, r2\n\
    strb r0, [r4]\n\
    adds r2, 0x5\n\
    adds r1, r2\n\
    strb r0, [r1]\n\
    ldr r6, _0809C99C @ =gMain\n\
    ldrh r2, [r6, 0x30]\n\
    movs r0, 0x40\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _0809CA14\n\
    movs r0, 0x88\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0809C9A0\n\
    movs r6, 0x1\n\
    movs r0, 0x2\n\
    mov r12, r0\n\
    movs r3, 0\n\
    b _0809CA2A\n\
    .align 2, 0\n\
_0809C988: .4byte gUnknown_020384E4\n\
_0809C98C: .4byte gUnknown_020384E5\n\
_0809C990: .4byte gPokemonStorageSystemPtr\n\
_0809C994: .4byte 0x000011df\n\
_0809C998: .4byte 0x000011de\n\
_0809C99C: .4byte gMain\n\
_0809C9A0:\n\
    movs r0, 0x20\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0809C9C0\n\
    movs r6, 0x1\n\
    lsls r0, r3, 24\n\
    movs r1, 0xFF\n\
    lsls r1, 24\n\
    adds r0, r1\n\
    lsrs r3, r0, 24\n\
    cmp r0, 0\n\
    bge _0809CA2C\n\
    movs r0, 0xFF\n\
    strb r0, [r5]\n\
    movs r3, 0x1\n\
    b _0809CA2C\n\
_0809C9C0:\n\
    movs r0, 0x10\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0809C9E0\n\
    movs r6, 0x1\n\
    lsls r0, r3, 24\n\
    movs r2, 0x80\n\
    lsls r2, 17\n\
    adds r0, r2\n\
    lsrs r3, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x1\n\
    ble _0809CA2C\n\
    strb r6, [r5]\n\
    movs r3, 0\n\
    b _0809CA2C\n\
_0809C9E0:\n\
    ldrh r1, [r6, 0x2E]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809C9F4\n\
    movs r0, 0x4\n\
    cmp r3, 0\n\
    bne _0809CA3A\n\
    movs r0, 0x5\n\
    b _0809CA3A\n\
_0809C9F4:\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CA00\n\
    movs r0, 0x10\n\
    b _0809CA3A\n\
_0809CA00:\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CA10\n\
    bl sub_809CD88\n\
    movs r0, 0\n\
    b _0809CA3A\n\
_0809CA10:\n\
    movs r6, 0\n\
    b _0809CA38\n\
_0809CA14:\n\
    movs r6, 0x1\n\
    movs r0, 0\n\
    mov r12, r0\n\
    movs r0, 0xFF\n\
    strb r0, [r4]\n\
    movs r0, 0\n\
    ldrsb r0, [r7, r0]\n\
    movs r3, 0x1D\n\
    cmp r0, 0\n\
    bne _0809CA2A\n\
    movs r3, 0x18\n\
_0809CA2A:\n\
    strb r6, [r1]\n\
_0809CA2C:\n\
    cmp r6, 0\n\
    beq _0809CA38\n\
    mov r0, r12\n\
    adds r1, r3, 0\n\
    bl sub_809AF18\n\
_0809CA38:\n\
    adds r0, r6, 0\n\
_0809CA3A:\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif // NONMATCHING

u8 sub_809CA40(void)
{
    u16 i = 0;
    while (gUnknown_083BBBD4[i].func != NULL)
    {
        if (gUnknown_083BBBD4[i].unk4 == gUnknown_020384E4)
            return gUnknown_083BBBD4[i].func();
        i++;
    }

    return 0;
}

void sub_809CA8C(void)
{
    sub_809CDCC();
    sub_809CDEC(9);
    sub_809CDEC(10);
    sub_809CDEC(11);
    sub_809CDEC(0);
}

#if DEBUG
u8 debug_sub_80AA40C(void)
{
    if (sub_809AB8C())
    {
        sub_809CDCC();
        sub_809CDEC(32);
        sub_809CDEC(6);
        return 1;
    }

    return 0;
}
#endif

bool8 sub_809CAB0(void)
{
    u16 var0;

#if DEBUG
    if (unk_2038790)
        return debug_sub_80AA40C();
#endif

    sub_809CDCC();
    var0 = sub_809AB8C();

    switch (gPokemonStorageSystemPtr->unk_0005)
    {
    case 1:
        if (var0)
            sub_809CDEC(1);
        else
            return 0;
        break;
    case 0:
        if (var0)
            sub_809CDEC(2);
        else
            return 0;
        break;
    case 2:
        if (gUnknown_020384E6)
        {
            if (var0)
                sub_809CDEC(4);
            else
                sub_809CDEC(5);
        }
        else
        {
            if (var0)
                sub_809CDEC(3);
            else
                return 0;
        }
        break;
    default:
        return 0;
    }

    sub_809CDEC(6);
    if (gPokemonStorageSystemPtr->unk_0005 == 2)
    {
        if (!gUnknown_020384E4)
            sub_809CDEC(2);
        else
            sub_809CDEC(1);
    }

    sub_809CDEC(8);
    sub_809CDEC(7);
    sub_809CDEC(0);
    return 1;
}

void sub_809CB74(struct Sprite *sprite)
{
    sprite->pos1.x = gPokemonStorageSystemPtr->unk_11c0->pos1.x;
    sprite->pos1.y = gPokemonStorageSystemPtr->unk_11c0->pos1.y + 20;
}

void sub_809CB94(struct Pokemon *mon)
{
    if (gUnknown_020384E4 == 1)
    {
        mon->box = gPlayerParty[gUnknown_020384E5].box;
    }
    else
    {
        u8 boxId = get_preferred_box();
        mon->box = gPokemonStorage.boxes[boxId][gUnknown_020384E5];
    }
}

void sub_809CC04(void)
{
    u16 x, y;
    u8 spriteId;
    int priority, subpriority;
    struct SpriteSheet spriteSheets[3];
    struct SpritePalette spritePalettes[3];

    memcpy(spriteSheets, gHandCursorSpriteSheets, 24);
    memcpy(spritePalettes, gHandCursorSpritePalettes, 24);
    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);
    gPokemonStorageSystemPtr->unk_11e4[0] = IndexOfSpritePaletteTag(0xDAC6);
    gPokemonStorageSystemPtr->unk_11e4[1] = IndexOfSpritePaletteTag(0xDAD1);

    sub_809AACC(gUnknown_020384E4, gUnknown_020384E5, &x, &y);
    spriteId = CreateSprite(&gSpriteTemplate_83BBC70, x, y, 6);
    if (spriteId != MAX_SPRITES)
    {
        gPokemonStorageSystemPtr->unk_11c0 = &gSprites[spriteId];
        gPokemonStorageSystemPtr->unk_11c0->oam.paletteNum = gPokemonStorageSystemPtr->unk_11e4[gUnknown_020384E9];
        if (gUnknown_020384E6)
            StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 3);
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11c0 = NULL;
    }

    if (gUnknown_020384E4 == 1)
    {
        subpriority = 12;
        priority = 1;
    }
    else
    {
        subpriority = 20;
        priority = 2;
    }

    spriteId = CreateSprite(&gSpriteTemplate_83BBC88, 0, 0, subpriority);
    if (spriteId != MAX_SPRITES)
    {
        gPokemonStorageSystemPtr->unk_11c4 = &gSprites[spriteId];
        gPokemonStorageSystemPtr->unk_11c4->oam.priority = priority;
        if (gUnknown_020384E4)
            gPokemonStorageSystemPtr->unk_11c4->invisible = 1;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11c4 = NULL;
    }
}

void sub_809CD88(void)
{
    gUnknown_020384E9 = !gUnknown_020384E9;
    gPokemonStorageSystemPtr->unk_11c0->oam.paletteNum = gPokemonStorageSystemPtr->unk_11e4[gUnknown_020384E9];
}

void sub_809CDCC(void)
{
    gPokemonStorageSystemPtr->unk_11b8 = 0;
    gPokemonStorageSystemPtr->unk_11b9 = 0;
}

void sub_809CDEC(u8 arg0)
{
    u8 width;
    u8 var0;

    if (gPokemonStorageSystemPtr->unk_11b8 < 7)
    {
        struct StorageText *storageText = &gPokemonStorageSystemPtr->unk_1180[gPokemonStorageSystemPtr->unk_11b8];
        storageText->text = gUnknown_083BBCA0[arg0];
        storageText->textId = arg0;
        width = GetStringWidthInMenuWindow(storageText->text);
        var0 = (width + 7) / 8;
        if (var0 > gPokemonStorageSystemPtr->unk_11b9)
            gPokemonStorageSystemPtr->unk_11b9 = var0;

        gPokemonStorageSystemPtr->unk_11b8++;
    }
}

s8 sub_809CE4C(u8 arg0)
{
    if (arg0 >= gPokemonStorageSystemPtr->unk_11b8)
        return -1;
    else
        return gPokemonStorageSystemPtr->unk_1180[arg0].textId;
}

void sub_809CE84(void)
{
    gPokemonStorageSystemPtr->unk_11bc = 14 - gPokemonStorageSystemPtr->unk_11b8 * 2;
    gPokemonStorageSystemPtr->unk_11ba = 28 - gPokemonStorageSystemPtr->unk_11b9;
    Menu_DrawStdWindowFrame(gPokemonStorageSystemPtr->unk_11ba, gPokemonStorageSystemPtr->unk_11bc, 29, 15);
    Menu_PrintItems(
        gPokemonStorageSystemPtr->unk_11ba + 1,
        gPokemonStorageSystemPtr->unk_11bc + 1,
        gPokemonStorageSystemPtr->unk_11b8,
        gPokemonStorageSystemPtr->unk_1180);
    InitMenu(
        0,
        gPokemonStorageSystemPtr->unk_11ba + 1,
        gPokemonStorageSystemPtr->unk_11bc + 1,
        gPokemonStorageSystemPtr->unk_11b8,
        0,
        gPokemonStorageSystemPtr->unk_11b9);
}

#ifdef NONMATCHING // r4 and r5 are swapped throughout the entire function.
s16 sub_809CF30(void)
{
    int textId = -2;

    if (!(gMain.newKeys & A_BUTTON))
    {
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(5);
            textId++;
        }

        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(5);
            Menu_MoveCursor(-1);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(5);
            Menu_MoveCursor(1);
        }
    }
    else
    {
        textId = Menu_GetCursorPos();
    }

    if (textId != -2)
    {
        Menu_DestroyCursor();
        Menu_EraseWindowRect(
            gPokemonStorageSystemPtr->unk_11ba,
            gPokemonStorageSystemPtr->unk_11bc,
            29,
            15);
    }

    if (textId >= 0)
    {
        textId = gPokemonStorageSystemPtr->unk_1180[textId].textId;
    }

    return textId;
}
#else
NAKED
s16 sub_809CF30(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    movs r5, 0x2\n\
    negs r5, r5\n\
    ldr r4, _0809CF6C @ =gMain\n\
    ldrh r1, [r4, 0x2E]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0809CF86\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CF52\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    adds r5, 0x1\n\
_0809CF52:\n\
    ldrh r1, [r4, 0x2E]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CF70\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    bl Menu_MoveCursor\n\
    b _0809CF8E\n\
    .align 2, 0\n\
_0809CF6C: .4byte gMain\n\
_0809CF70:\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CF8E\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    bl Menu_MoveCursor\n\
    b _0809CF8E\n\
_0809CF86:\n\
    bl Menu_GetCursorPos\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
_0809CF8E:\n\
    movs r0, 0x2\n\
    negs r0, r0\n\
    cmp r5, r0\n\
    beq _0809CFB2\n\
    bl Menu_DestroyCursor\n\
    ldr r0, _0809CFD0 @ =gPokemonStorageSystemPtr\n\
    ldr r1, [r0]\n\
    ldr r2, _0809CFD4 @ =0x000011ba\n\
    adds r0, r1, r2\n\
    ldrb r0, [r0]\n\
    adds r2, 0x2\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    movs r2, 0x1D\n\
    movs r3, 0xF\n\
    bl Menu_EraseWindowRect\n\
_0809CFB2:\n\
    cmp r5, 0\n\
    blt _0809CFC4\n\
    ldr r0, _0809CFD0 @ =gPokemonStorageSystemPtr\n\
    ldr r0, [r0]\n\
    lsls r1, r5, 3\n\
    ldr r2, _0809CFD8 @ =0x00001184\n\
    adds r0, r2\n\
    adds r0, r1\n\
    ldr r5, [r0]\n\
_0809CFC4:\n\
    lsls r0, r5, 16\n\
    asrs r0, 16\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0809CFD0: .4byte gPokemonStorageSystemPtr\n\
_0809CFD4: .4byte 0x000011ba\n\
_0809CFD8: .4byte 0x00001184\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_809CFDC(struct UnkStruct_2000020 *arg0, struct UnkStruct_2000028 *arg1, u8 arg2)
{
    gUnknown_020384EC = arg0;
    arg0->unk_00 = arg1;
    arg0->unk_05 = arg2;
    arg0->unk_04 = 0;
}

void sub_809CFF0(void)
{
    u16 i;
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_020384EC->unk_04)
    {
        for (i = 0; i < gUnknown_020384EC->unk_04; i++)
        {
            unkStruct = &gUnknown_020384EC->unk_00[i];
            unkStruct->unk_0c(unkStruct);
        }

        gUnknown_020384EC->unk_04 = 0;
    }
}

bool8 sub_809D034(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height)
{
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_020384EC->unk_04 >= gUnknown_020384EC->unk_05)
        return FALSE;

    unkStruct = &gUnknown_020384EC->unk_00[gUnknown_020384EC->unk_04++];
    unkStruct->unk_08 = width * 2;
    unkStruct->unk_04 = dest + (dTop * 64) + (dLeft * 2);
    unkStruct->unk_00 = src + (sTop * 64) + (sLeft * 2);
    unkStruct->unk_0a = height;
    unkStruct->unk_0c = sub_809D0BC;
    return TRUE;
}

void sub_809D0BC(struct UnkStruct_2000028 *unkStruct)
{
    u32 i;
    const u8 *src = unkStruct->unk_00;
    u8 *dest = unkStruct->unk_04;
    int height = unkStruct->unk_0a;
    int width = unkStruct->unk_08;
    for (i = 0; i < height; i++)
    {
        CpuSet(src, dest, (width / 2) & 0x1FFFFF);
        dest += 64;
        src += 64;
    }
}

void sub_809D104(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height)
{
    const u8 *from = src + (sTop * 64) + (sLeft * 2);
    u8 *to = dest + (dTop * 64) + (dLeft * 2);
    u8 *end = dest + (dTop + height) * 64;
    int width2 = width * 2;
    while (to < end)
    {
        CpuSet(from, to, (width2 / 2) & 0x1FFFFF);
        to += 64;
        from += 64;
    }
}

bool8 sub_809D16C(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height)
{
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_020384EC->unk_04 >= gUnknown_020384EC->unk_05)
        return FALSE;

    unkStruct = &gUnknown_020384EC->unk_00[gUnknown_020384EC->unk_04++];
    unkStruct->unk_08 = width * 2;
    unkStruct->unk_04 = dest + ((dTop * 32) + dLeft) * 2;
    unkStruct->unk_0a = height;
    unkStruct->unk_0c = sub_809D1C4;
    return TRUE;
}

void sub_809D1C4(struct UnkStruct_2000028 *unkStruct)
{
    u16 i;

    for (i = 0; i < unkStruct->unk_0a; i++)
    {
        Dma3FillLarge_(0, unkStruct->unk_04, unkStruct->unk_08, 16);
        unkStruct->unk_04 += 64;
    }
}
