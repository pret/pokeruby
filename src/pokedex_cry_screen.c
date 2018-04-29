#include "global.h"
#include "m4a.h"
#include "main.h"
#include "pokedex_cry_screen.h"
#include "palette.h"
#include "sprite.h"
#include "ewram.h"
#include "trig.h"
#include "sound.h"

extern struct SoundInfo gSoundInfo;
extern struct MusicPlayerInfo gMPlay_BGM;

struct Unk2000000 {
    u8 unk0000[7 * 32 * 32];
};

struct Unk201C800 {
    s8 unk_0;
    s8 unk_1;
    u8 unk_2;
    u16 unk_4;
};

struct PokedexCryScreen_201C000
{
    u8 unk0000[0x10];
    u8 unk0010;
    u8 unk0011;
    u8 unk0012;
    u16 unk0014;
    u8 unk0016;
    u16 species;
    u8 unk001A;
    u8 unk001B;
};

#define ePokedexCryScreenGfx (*(struct Unk2000000 *)gSharedMem)
#define ePokedexCryScreen (*(struct PokedexCryScreen_201C000 *)(gSharedMem + 0x1C000))

void sub_811A0A0(u16 species);
void sub_811A0C0(void);
void sub_811A124(void);
void sub_811A15C(u8);
void sub_811A1C8(u8, u8);
void sub_811A324(void);
void sub_811A350(u8, u16, u8);
void sub_811A6D8(s8);

extern u8 gUnknown_03005E98;

// data/pokedex_cry_screen.o
extern const u16 gUnknown_083FB6F8[];
extern const u16 gUnknown_083FB718[];
extern const u16 gUnknown_083FAE7C[];
extern const u16 gUnknown_083FAF1C[];
extern const u8 gUnknown_083FAF3C[];
extern struct SpriteTemplate gSpriteTemplate_83FB774;
extern const struct SpriteSheet gCryMeterNeedleSpriteSheets[];
extern const struct SpritePalette gCryMeterNeedleSpritePalettes[];

#if ENGLISH
#define CRY_METER_MAP_WIDTH 10
#elif GERMAN
#define CRY_METER_MAP_WIDTH 32
#endif

#ifdef NONMATCHING
u8 sub_8119E3C(struct CryRelatedStruct *cry, u8 arg1)
{
    u8 i;
    u8 j;
    u16 r6;
    u16 r7;
    u8 r9 = FALSE;
    u32 offset;

    switch (gUnknown_03005E98)
    {
        case 0:
            ePokedexCryScreen.unk0014 = cry->unk0;
            ePokedexCryScreen.unk0016 = cry->yPos;
            ePokedexCryScreen.unk001A = 0;
            ePokedexCryScreen.unk001B = 0;
            ePokedexCryScreen.unk0010 = 0;
            ePokedexCryScreen.unk0012 = 28;
            ePokedexCryScreen.unk0011 = 0;
            sub_811A350(arg1, -8 * cry->xPos, 0);
            for (i = 0; i < 7; i++)
            {
                for (j = 0; j < 32; j++)
                {
                    DmaCopy16(3, gUnknown_083FB718, ePokedexCryScreenGfx.unk0000[32 * i + j], 32);
                }
            }
            gUnknown_03005E98++;
            break;
        case 1:
            r7 = cry->unk2 << 11;
            r6 = (cry->paletteNo << 12) + ((unsigned)(cry->unk0 << 18) >> 23);
            for (i = 0; i < 7; i++)
            {
                for (j = 0; j < 32; j++)
                {
                    offset = j << 1;
                    offset += i << 6;
                    offset += r7;
                    *((u16 *)(VRAM + offset)) = r6++;
                }
            }
            for (i = 0; i < ePokedexCryScreen.unk0016 * 8; i++)
            {
                sub_811A1C8(i, 0);
            }
            gUnknown_03005E98++;
            break;
        case 2:
            sub_811A324();
            LoadPalette(gUnknown_083FB6F8, cry->paletteNo * 16, 32);
            r9 = TRUE;
            break;
    }
    return r9;
}
#else
NAKED u8 sub_8119E3C(struct CryRelatedStruct *cry, u8 arg1)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r9\n"
                "\tmov r6, r8\n"
                "\tpush {r6,r7}\n"
                "\tadds r5, r0, 0\n"
                "\tlsls r1, 24\n"
                "\tlsrs r2, r1, 24\n"
                "\tmovs r0, 0\n"
                "\tmov r9, r0\n"
                "\tldr r6, _08119E60 @ =gUnknown_03005E98\n"
                "\tldrb r0, [r6]\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _08119EE0\n"
                "\tcmp r0, 0x1\n"
                "\tbgt _08119E64\n"
                "\tcmp r0, 0\n"
                "\tbeq _08119E6A\n"
                "\tb _08119F74\n"
                "\t.align 2, 0\n"
                "_08119E60: .4byte gUnknown_03005E98\n"
                "_08119E64:\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _08119F60\n"
                "\tb _08119F74\n"
                "_08119E6A:\n"
                "\tldr r4, _08119ECC @ =gSharedMem + 0x1C000\n"
                "\tldrh r0, [r5]\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r4, 0x14]\n"
                "\tldrb r0, [r5, 0x5]\n"
                "\tstrb r0, [r4, 0x16]\n"
                "\tstrb r1, [r4, 0x1A]\n"
                "\tstrb r1, [r4, 0x1B]\n"
                "\tstrb r1, [r4, 0x10]\n"
                "\tmovs r0, 0x1C\n"
                "\tstrb r0, [r4, 0x12]\n"
                "\tstrb r1, [r4, 0x11]\n"
                "\tldrb r1, [r5, 0x4]\n"
                "\tlsls r1, 19\n"
                "\tnegs r1, r1\n"
                "\tasrs r1, 16\n"
                "\tadds r0, r2, 0\n"
                "\tmovs r2, 0x1\n"
                "\tbl sub_811A350\n"
                "\tmovs r0, 0\n"
                "\tmov r12, r6\n"
                "\tldr r1, _08119ED0 @ =0x040000d4\n"
                "\tldr r7, _08119ED4 @ =gUnknown_083FB718\n"
                "\tldr r2, _08119ED8 @ =0xfffe4000\n"
                "\tadds r6, r4, r2\n"
                "\tldr r5, _08119EDC @ =0x80000010\n"
                "_08119EA0:\n"
                "\tmovs r3, 0\n"
                "\tadds r4, r0, 0x1\n"
                "\tlsls r2, r0, 5\n"
                "_08119EA6:\n"
                "\tstr r7, [r1]\n"
                "\tadds r0, r2, r3\n"
                "\tlsls r0, 5\n"
                "\tadds r0, r6\n"
                "\tstr r0, [r1, 0x4]\n"
                "\tstr r5, [r1, 0x8]\n"
                "\tldr r0, [r1, 0x8]\n"
                "\tadds r0, r3, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r3, r0, 24\n"
                "\tcmp r3, 0x1F\n"
                "\tbls _08119EA6\n"
                "\tlsls r0, r4, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x6\n"
                "\tbls _08119EA0\n"
                "\tmov r1, r12\n"
                "\tb _08119F50\n"
                "\t.align 2, 0\n"
                "_08119ECC: .4byte gSharedMem + 0x1C000\n"
                "_08119ED0: .4byte 0x040000d4\n"
                "_08119ED4: .4byte gUnknown_083FB718\n"
                "_08119ED8: .4byte 0xfffe4000\n"
                "_08119EDC: .4byte 0x80000010\n"
                "_08119EE0:\n"
                "\tldrb r0, [r5, 0x2]\n"
                "\tlsls r0, 27\n"
                "\tlsrs r7, r0, 16\n"
                "\tldrb r1, [r5, 0x3]\n"
                "\tlsls r1, 12\n"
                "\tldrh r0, [r5]\n"
                "\tlsls r0, 18\n"
                "\tlsrs r0, 23\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r6, r1, 16\n"
                "\tmovs r0, 0\n"
                "\tldr r2, _08119F58 @ =gSharedMem + 0x1C000\n"
                "\tmov r8, r2\n"
                "\tmovs r1, 0xC0\n"
                "\tlsls r1, 19\n"
                "\tmov r12, r1\n"
                "_08119F02:\n"
                "\tmovs r3, 0\n"
                "\tadds r4, r0, 0x1\n"
                "\tlsls r5, r0, 6\n"
                "_08119F08:\n"
                "\tlsls r1, r3, 1\n"
                "\tadds r1, r5\n"
                "\tadds r1, r7\n"
                "\tadd r1, r12\n"
                "\tadds r2, r6, 0\n"
                "\tadds r0, r2, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r6, r0, 16\n"
                "\tstrh r2, [r1]\n"
                "\tadds r0, r3, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r3, r0, 24\n"
                "\tcmp r3, 0x1F\n"
                "\tbls _08119F08\n"
                "\tlsls r0, r4, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x6\n"
                "\tbls _08119F02\n"
                "\tmov r2, r8\n"
                "\tldrb r0, [r2, 0x16]\n"
                "\tmovs r4, 0\n"
                "\tcmp r0, 0\n"
                "\tbeq _08119F4E\n"
                "\tmov r5, r8\n"
                "_08119F38:\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0\n"
                "\tbl sub_811A1C8\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tldrb r0, [r5, 0x16]\n"
                "\tlsls r0, 3\n"
                "\tcmp r4, r0\n"
                "\tblt _08119F38\n"
                "_08119F4E:\n"
                "\tldr r1, _08119F5C @ =gUnknown_03005E98\n"
                "_08119F50:\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tb _08119F74\n"
                "\t.align 2, 0\n"
                "_08119F58: .4byte gSharedMem + 0x1C000\n"
                "_08119F5C: .4byte gUnknown_03005E98\n"
                "_08119F60:\n"
                "\tbl sub_811A324\n"
                "\tldr r0, _08119F84 @ =gUnknown_083FB6F8\n"
                "\tldrb r1, [r5, 0x3]\n"
                "\tlsls r1, 4\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tmovs r0, 0x1\n"
                "\tmov r9, r0\n"
                "_08119F74:\n"
                "\tmov r0, r9\n"
                "\tpop {r3,r4}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_08119F84: .4byte gUnknown_083FB6F8");
}
#endif // NONMATCHING

void sub_8119F88(u8 a0)
{
    u8 r4;
    sub_811A324();
    sub_811A15C(a0);
    if (ePokedexCryScreen.unk001B)
        ePokedexCryScreen.unk001B--;
    if (ePokedexCryScreen.unk001A && !--ePokedexCryScreen.unk001A)
    {
        sub_811A0A0(ePokedexCryScreen.species);
        sub_811A124();
        return;
    }
    if (ePokedexCryScreen.unk0010 == 0)
    {
        sub_811A124();
        return;
    }
    if (ePokedexCryScreen.unk0010 == 1)
    {
        sub_811A0C0();
    }
    else if (ePokedexCryScreen.unk0010 > 8)
    {
        if (!IsCryPlaying())
        {
            sub_811A124();
            ePokedexCryScreen.unk0010 = 0;
            return;
        }
        sub_811A0C0();
        ePokedexCryScreen.unk0010 = 1;
    }
    r4 = 2 * (ePokedexCryScreen.unk0010 - 1);
    sub_811A1C8(ePokedexCryScreen.unk0016 * 8 + ePokedexCryScreen.unk0011 - 2, ePokedexCryScreen.unk0000[r4]);
    sub_811A1C8(ePokedexCryScreen.unk0016 * 8 + ePokedexCryScreen.unk0011 - 1, ePokedexCryScreen.unk0000[r4 + 1]);
    ePokedexCryScreen.unk0010++;
}

void sub_811A050(u16 species)
{
    if (gMPlay_BGM.status & MUSICPLAYER_STATUS_PAUSE && !ePokedexCryScreen.unk001A)
    {
        if (!ePokedexCryScreen.unk001B)
        {
            ePokedexCryScreen.unk001B = 4;
            if (IsCryPlaying() == TRUE)
            {
                StopCry();
                ePokedexCryScreen.species = species;
                ePokedexCryScreen.unk001A = 2;
            }
            else
                sub_811A0A0(species);
        }
    }
}

void sub_811A0A0(u16 species)
{
    PlayCry2(species, 0, 0x7d, 10);
    ePokedexCryScreen.unk0010 = 1;
}

#ifdef NONMATCHING
void sub_811A0C0(void)
{
    const s8 * src;
    u8 i;
    if (gPcmDmaCounter < 2)
        src = gSoundInfo.pcmBuffer;
    else
        src = gSoundInfo.pcmBuffer + (gSoundInfo.pcmDmaPeriod + 1 - gPcmDmaCounter) * gSoundInfo.pcmSamplesPerVBlank;
    src += PCM_DMA_BUF_SIZE;
    for (i = 0; i < 16; i++)
        ePokedexCryScreen.unk0000[i] = src[i * 2] * 2;
}
#else
NAKED void sub_811A0C0(void)
{
    asm_unified("\tpush {r4,lr}\n"
                "\tldr r3, _0811A0D0 @ =gPcmDmaCounter\n"
                "\tmovs r0, 0\n"
                "\tldrsb r0, [r3, r0]\n"
                "\tcmp r0, 0x1\n"
                "\tbgt _0811A0D8\n"
                "\tldr r0, _0811A0D4 @ =gSoundInfo + 0x350\n"
                "\tb _0811A0F0\n"
                "\t.align 2, 0\n"
                "_0811A0D0: .4byte gPcmDmaCounter\n"
                "_0811A0D4: .4byte gSoundInfo + 0x350\n"
                "_0811A0D8:\n"
                "\tldr r2, _0811A11C @ =gSoundInfo\n"
                "\tldrb r1, [r2, 0xB]\n"
                "\tmovs r0, 0\n"
                "\tldrsb r0, [r3, r0]\n"
                "\tsubs r0, 0x1\n"
                "\tsubs r1, r0\n"
                "\tldr r0, [r2, 0x10]\n"
                "\tmuls r0, r1\n"
                "\tmovs r1, 0xD4\n"
                "\tlsls r1, 2\n"
                "\tadds r2, r1\n"
                "\tadds r0, r2\n"
                "_0811A0F0:\n"
                "\tmovs r1, 0xC6\n"
                "\tlsls r1, 3\n"
                "\tadds r3, r0, r1\n"
                "\tmovs r2, 0\n"
                "\tldr r4, _0811A120 @ =gSharedMem + 0x1C000\n"
                "_0811A0FA:\n"
                "\tadds r1, r2, r4\n"
                "\tlsls r0, r2, 1\n"
                "\tadds r0, r3\n"
                "\tldrb r0, [r0]\n"
                "\tlsls r0, 24\n"
                "\tasrs r0, 24\n"
                "\tlsls r0, 1\n"
                "\tstrb r0, [r1]\n"
                "\tadds r0, r2, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r2, r0, 24\n"
                "\tcmp r2, 0xF\n"
                "\tbls _0811A0FA\n"
                "\tpop {r4}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0811A11C: .4byte gSoundInfo\n"
                "_0811A120: .4byte gSharedMem + 0x1C000");
}
#endif // NONMATCHING

void sub_811A124(void)
{
    sub_811A1C8(ePokedexCryScreen.unk0016 * 8 + ePokedexCryScreen.unk0011 - 2, 0);
    sub_811A1C8(ePokedexCryScreen.unk0016 * 8 + ePokedexCryScreen.unk0011 - 1, 0);
}

void sub_811A15C(u8 a0)
{
    u8 i;
    u16 r3;
    sub_811A350(a0, ePokedexCryScreen.unk0011, 0);
    ePokedexCryScreen.unk0011 += 2;
    r3 = (ePokedexCryScreen.unk0011 / 8 + ePokedexCryScreen.unk0016 + 1) % 32;
    for (i = 0; i < 7; i++)
    {
        DmaCopy16(3, gUnknown_083FB718, &ePokedexCryScreenGfx.unk0000[32 * (32 * i + r3)], 32);
    }
}

extern const u16 gUnknown_083FB274[8][72];
extern const u8 gUnknown_083FB738[2];
extern const u8 gUnknown_083FB73A[2][16];

#ifdef NONMATCHING
void sub_811A1C8(u8 a0, u8 a1)
{
    u8 sp0;
    u8 r7;
    u8 r8;
    u16 r1 = (a1 + 127) << 8;
    u8 i = r1 / 1152.0;
    if (i > 71 - 16)
        i = 71 - 16;
    sp0 = i;
    r7 = a0 % 2;
    r8 = a0 / 8;
    if (i > ePokedexCryScreen.unk0012)
    {
        do
        {
            ePokedexCryScreenGfx.unk0000[(u16)(r8 * 32 + gUnknown_083FB274[a0 % 8][i])] &= gUnknown_083FB738[r7];
            ePokedexCryScreenGfx.unk0000[(u16)(r8 * 32 + gUnknown_083FB274[a0 % 8][i])] |= gUnknown_083FB73A[r7][((i / 3) - 1) & 0x0F];
            i--;
        } while (i > ePokedexCryScreen.unk0012);
    }
    else
    {
        do
        {
            ePokedexCryScreenGfx.unk0000[(u16)(r8 * 32 + gUnknown_083FB274[a0 % 8][i])] &= gUnknown_083FB738[r7];
            ePokedexCryScreenGfx.unk0000[(u16)(r8 * 32 + gUnknown_083FB274[a0 % 8][i])] |= gUnknown_083FB73A[r7][((i / 3) - 1) & 0x0F];
            i++;
        } while (i < ePokedexCryScreen.unk0012);
    }
    ePokedexCryScreen.unk0012 = sp0;
}
#else
NAKED void sub_811A1C8(u8 a0, u8 a1)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0xC\n"
                "\tlsls r5, r0, 24\n"
                "\tlsrs r4, r5, 24\n"
                "\tlsls r1, 24\n"
                "\tmovs r0, 0xFE\n"
                "\tlsls r0, 23\n"
                "\tadds r1, r0\n"
                "\tlsrs r1, 16\n"
                "\tadds r0, r1, 0\n"
                "\tbl __floatsidf\n"
                "\tldr r3, _0811A280 @ =0x00000000\n"
                "\tldr r2, _0811A27C @ =0x40920000\n"
                "\tbl __divdf3\n"
                "\tbl __fixunsdfsi\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tcmp r6, 0x37\n"
                "\tbls _0811A1FE\n"
                "\tmovs r6, 0x37\n"
                "_0811A1FE:\n"
                "\tstr r6, [sp]\n"
                "\tmovs r7, 0x1\n"
                "\tands r7, r4\n"
                "\tldr r0, _0811A284 @ =gSharedMem + 0x1C000\n"
                "\tmov r10, r0\n"
                "\tlsrs r5, 27\n"
                "\tmov r8, r5\n"
                "\tldr r0, _0811A288 @ =gUnknown_083FB738\n"
                "\tmov r1, r10\n"
                "\tldrb r1, [r1, 0x12]\n"
                "\tcmp r6, r1\n"
                "\tbls _0811A298\n"
                "\tadds r0, r7, r0\n"
                "\tldrb r0, [r0]\n"
                "\tmov r9, r0\n"
                "\tmovs r2, 0x7\n"
                "\tands r2, r4\n"
                "_0811A220:\n"
                "\tlsls r1, r6, 1\n"
                "\tlsls r0, r2, 3\n"
                "\tadds r0, r2\n"
                "\tlsls r0, 4\n"
                "\tadds r1, r0\n"
                "\tldr r3, _0811A28C @ =gUnknown_083FB274\n"
                "\tadds r1, r3\n"
                "\tmov r3, r8\n"
                "\tlsls r0, r3, 5\n"
                "\tldrh r1, [r1]\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r1, _0811A290 @ =gSharedMem\n"
                "\tadds r5, r0, r1\n"
                "\tldrb r4, [r5]\n"
                "\tmov r3, r9\n"
                "\tands r4, r3\n"
                "\tstrb r4, [r5]\n"
                "\tadds r0, r6, 0\n"
                "\tmovs r1, 0x3\n"
                "\tstr r2, [sp, 0x8]\n"
                "\tbl __udivsi3\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tsubs r0, 0x1\n"
                "\tmovs r1, 0xF\n"
                "\tands r0, r1\n"
                "\tlsls r1, r7, 4\n"
                "\tadds r0, r1\n"
                "\tldr r1, _0811A294 @ =gUnknown_083FB73A\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0]\n"
                "\torrs r4, r0\n"
                "\tstrb r4, [r5]\n"
                "\tsubs r0, r6, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tldr r2, [sp, 0x8]\n"
                "\tldr r3, _0811A284 @ =gSharedMem + 0x1C000\n"
                "\tldrb r3, [r3, 0x12]\n"
                "\tcmp r6, r3\n"
                "\tbhi _0811A220\n"
                "\tb _0811A2FA\n"
                "\t.align 2, 0\n"
                "_0811A27C: .4byte 0x40920000\n"
                "_0811A280: .4byte 0x00000000\n"
                "_0811A284: .4byte gSharedMem + 0x1C000\n"
                "_0811A288: .4byte gUnknown_083FB738\n"
                "_0811A28C: .4byte gUnknown_083FB274\n"
                "_0811A290: .4byte gSharedMem\n"
                "_0811A294: .4byte gUnknown_083FB73A\n"
                "_0811A298:\n"
                "\tlsls r1, r7, 4\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tadds r0, r7, r0\n"
                "\tldrb r0, [r0]\n"
                "\tmov r9, r0\n"
                "\tmovs r7, 0x7\n"
                "\tands r7, r4\n"
                "_0811A2A6:\n"
                "\tlsls r1, r6, 1\n"
                "\tlsls r0, r7, 3\n"
                "\tadds r0, r7\n"
                "\tlsls r0, 4\n"
                "\tadds r1, r0\n"
                "\tldr r2, _0811A314 @ =gUnknown_083FB274\n"
                "\tadds r1, r2\n"
                "\tmov r3, r8\n"
                "\tlsls r0, r3, 5\n"
                "\tldrh r1, [r1]\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r1, _0811A318 @ =gSharedMem\n"
                "\tadds r5, r0, r1\n"
                "\tldrb r4, [r5]\n"
                "\tmov r2, r9\n"
                "\tands r4, r2\n"
                "\tstrb r4, [r5]\n"
                "\tadds r0, r6, 0\n"
                "\tmovs r1, 0x3\n"
                "\tbl __udivsi3\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tsubs r0, 0x1\n"
                "\tmovs r1, 0xF\n"
                "\tands r0, r1\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tadds r0, r3\n"
                "\tldr r1, _0811A31C @ =gUnknown_083FB73A\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0]\n"
                "\torrs r4, r0\n"
                "\tstrb r4, [r5]\n"
                "\tadds r0, r6, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tldr r2, _0811A320 @ =gSharedMem + 0x1C000\n"
                "\tldrb r2, [r2, 0x12]\n"
                "\tcmp r6, r2\n"
                "\tbcc _0811A2A6\n"
                "_0811A2FA:\n"
                "\tmov r3, sp\n"
                "\tldrb r0, [r3]\n"
                "\tmov r3, r10\n"
                "\tstrb r0, [r3, 0x12]\n"
                "\tadd sp, 0xC\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0811A314: .4byte gUnknown_083FB274\n"
                "_0811A318: .4byte gSharedMem\n"
                "_0811A31C: .4byte gUnknown_083FB73A\n"
                "_0811A320: .4byte gSharedMem + 0x1C000");
}
#endif // NONMATCHING

void sub_811A324(void)
{
    DmaCopy16(3, ePokedexCryScreenGfx.unk0000, VRAM + ePokedexCryScreen.unk0014, 0x1c00);
}

void sub_811A350(u8 a0, u16 a1, u8 a2)
{
    switch (a0)
    {
        case 0:
            if (a2)
                REG_BG0VOFS = a1;
            else
                REG_BG0HOFS = a1;
            break;
        case 1:
            if (a2)
                REG_BG1VOFS = a1;
            else
                REG_BG1HOFS = a1;
            break;
        case 2:
            if (a2)
                REG_BG2VOFS = a1;
            else
                REG_BG2HOFS = a1;
            break;
        case 3:
            if (a2)
                REG_BG3VOFS = a1;
            else
                REG_BG3HOFS = a1;
            break;
    }
}

u8 ShowPokedexCryScreen(struct CryRelatedStruct *cry, u8 arg1) {
    int returnVal = FALSE;

    switch (gUnknown_03005E98)
    {
    case 0:
        LZ77UnCompVram(gUnknown_083FAF3C, (void *) (VRAM + cry->unk0));
        LoadPalette(&gUnknown_083FAF1C, cry->paletteNo * 16, 0x20);
        gUnknown_03005E98 += 1;
        break;

    case 1:
    {
        void *vram;
        u8 row, col;
        u32 r12;
        int x, y;

        vram = BG_SCREEN_ADDR(cry->unk2);

        r12 = (u32) (cry->unk0 << 18) >> 23;

        for (row = 0; row < 8; row++)
        {
            for (col = 0; col < 10; col++)
            {
                y = row + cry->yPos;
                x = col + cry->xPos;
                *(u16 *) (vram + (y * 64 + x * 2)) = (gUnknown_083FAE7C[row * CRY_METER_MAP_WIDTH + col] | (cry->paletteNo << 12)) + r12;
            }
        }

        gUnknown_03005E98 += 1;
        break;
    }

    case 2:
    {
        LoadSpriteSheets(gCryMeterNeedleSpriteSheets);
        LoadSpritePalettes(gCryMeterNeedleSpritePalettes);
        EWRAM_1C800.unk_4 = CreateSprite(&gSpriteTemplate_83FB774, 40 + cry->xPos * 8, 56 + cry->yPos * 8, 1);
        EWRAM_1C800.unk_0 = 0x20;
        EWRAM_1C800.unk_1 = 0x20;
        EWRAM_1C800.unk_2 = 0;

        returnVal = TRUE;
        break;
    }
    }

    return returnVal;
}

void DestroyCryMeterNeedleSprite(void)
{
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[EWRAM_1C800.unk_4].oam.paletteNum));
    DestroySprite(gSprites + EWRAM_1C800.unk_4);
}

void sub_811A534(struct Sprite * sprite)
{
    u16 i;
    s8 r3;
    s16 x;
    s16 y;
    struct ObjAffineSrcData sp04;
    struct OamMatrix sp0c;
    u8 * r0;

    gSprites[EWRAM_1C800.unk_4].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[EWRAM_1C800.unk_4].oam.affineParam = 0;
    switch (ePokedexCryScreen.unk0010)
    {
        case 0:
            EWRAM_1C800.unk_1 = 0x20;
            if (EWRAM_1C800.unk_0 > 0)
            {
                if (EWRAM_1C800.unk_2 != 1)
                    EWRAM_1C800.unk_2--;
            }
            else
                EWRAM_1C800.unk_2 = 5;
            break;
        case 2:
            r3 = 0;
            for (i = 0; i < 16; i++)
            {
                if (r3 < ePokedexCryScreen.unk0000[i])
                    r3 = ePokedexCryScreen.unk0000[i];
            }
            sub_811A6D8(r3 * 0xd0 / 0x100);
            break;
        case 6:
            r0 = &ePokedexCryScreen.unk0000[10];
            sub_811A6D8(*r0 * 0xd0 / 0x100);
            break;
    }
    if (EWRAM_1C800.unk_0 == EWRAM_1C800.unk_1)
        ;
    else if (EWRAM_1C800.unk_0 < EWRAM_1C800.unk_1)
    {
        if ((EWRAM_1C800.unk_0 += EWRAM_1C800.unk_2) > EWRAM_1C800.unk_1)
        {
            EWRAM_1C800.unk_0 = EWRAM_1C800.unk_1;
            EWRAM_1C800.unk_1 = 0;
        }
    }
    else
    {
        if ((EWRAM_1C800.unk_0 -= EWRAM_1C800.unk_2) < EWRAM_1C800.unk_1)
        {
            EWRAM_1C800.unk_0 = EWRAM_1C800.unk_1;
            EWRAM_1C800.unk_1 = 0;
        }
    }
    sp04.xScale = 0x100;
    sp04.yScale = 0x100;
    sp04.rotation = EWRAM_1C800.unk_0 * 256;
    ObjAffineSet(&sp04, &sp0c, 1, 2);
    SetOamMatrix(0, sp0c.a, sp0c.b, sp0c.c, sp0c.d);
    x = gSineTable[((EWRAM_1C800.unk_0 + 0x7F) & 0xFF)];
    y = gSineTable[((EWRAM_1C800.unk_0 + 0x7F) & 0xFF) + 0x40];
    sprite->pos2.x = x * 24 / 256;
    sprite->pos2.y = y * 24 / 256;
}

void sub_811A6D8(s8 a0)
{
    u16 r2 = (0x20 - a0) & 0xff;
    if (r2 > 0x20 && r2 < 0xe0)
        r2 = 0xe0;
    EWRAM_1C800.unk_1 = r2;
    EWRAM_1C800.unk_2 = 5;
}
