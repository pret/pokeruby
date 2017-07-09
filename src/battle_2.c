#include "global.h"
#include "abilities.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_setup.h"
#include "data2.h"
#include "item.h"
#include "link.h"
#include "main.h"
#include "name_string_util.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokedex.h"
#include "pokemon.h"
#include "rng.h"
#include "rom3.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "sprite.h"
#include "task.h"
#include "text.h"
#include "trig.h"
#include "unknown_task.h"
#include "util.h"
#include "items.h"
#include "hold_effects.h"
#include "battle_move_effects.h"

struct UnknownStruct6
{
    u16 unk0[0xA0];
    u8 fillerA0[0x640];
    u16 unk780[0xA0];
};

struct UnknownStruct7
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

struct UnknownStruct8
{
    u8 unk0[7];
    u8 unk7;
    u8 unk8[18];
    u8 unk1A;
};

struct UnknownPokemonStruct2
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 heldItem;
    /*0x04*/ u8 nickname[11];
    /*0x0F*/ u8 level;
    /*0x10*/ u16 hp;
    /*0x12*/ u16 maxhp;
    /*0x14*/ u32 status;
    /*0x18*/ u32 personality;
    /*0x1C*/ u8 gender;
    /*0x1D*/ u8 language;
};

struct UnknownStruct12
{
    u32 unk0;
    u8 filler4[0x54];
};

extern const u16 gUnknown_08D004E0[];
extern const struct MonCoords gCastformFrontSpriteCoords[];

extern u8 ewram[];
#define ewram0 (*(struct UnknownStruct7 *)(ewram + 0x0))
#define ewram4 (*(struct UnknownStruct8 *)(ewram + 0x4))
#define ewram16000 (ewram[0x16000])
#define ewram16001 (ewram[0x16001])
#define ewram16002 (ewram[0x16002])
#define ewram16003 (ewram[0x16003])
#define ewram1600C (ewram[0x1600C])
#define ewram1600E (ewram[0x1600E])
#define ewram1601B (ewram[0x1601B])
#define ewram16020 ((u8 *)(ewram + 0x16020))
#define ewram16056 (ewram[0x16056])
#define ewram16058 (ewram[0x16058])
#define ewram16059 (ewram[0x16059])
#define ewram16078 (ewram[0x16078])
#define ewram16084 (ewram[0x16084])
#define ewram16086 (ewram[0x16086])
#define ewram16087 (ewram[0x16087])
#define ewram16088 (ewram[0x16088])
#define ewram16089 (ewram[0x16089])
#define ewram160A1 (ewram[0x160A1])
#define ewram160A6 (ewram[0x160A6])
#define ewram160AC ((u8 *)(ewram + 0x160AC))
#define ewram160BC ((u16 *)(ewram + 0x160BC))  // hp
#define ewram160C8 (ewram[0x160C8])
#define ewram160C9 (ewram[0x160C9])
#define ewram160CB (ewram[0x160CB])
#define ewram160CC ((u8 *)(ewram + 0x160CC))
#define ewram160E6 (ewram[0x160E6])
#define ewram160E8 ((u8 *)(ewram + 0x160E8))
#define ewram160F0 ((u8 *)(ewram + 0x160F0))
#define ewram160F9 (ewram[0x160F9])
#define ewram16100 ((u8 *)(ewram + 0x16100))
#define ewram16108 ((u8 *)(ewram + 0x16108))
#define ewram16110 (ewram[0x16110])
#define ewram16111 (ewram[0x16111])
#define ewram16113 (ewram[0x16113])
#define ewram17100 ((u32 *)(ewram + 0x17100))
#define ewram17130 (ewram[0x17130])
#define ewram17160 (ewram[0x17160])
#define ewram1D000 ((struct Pokemon *)(ewram + 0x1D000))

extern struct UnknownPokemonStruct2 gUnknown_02023A00[];
extern u8 gBattleBufferB[][0x200];
extern u8 gActiveBank;
extern u32 gBattleExecBuffer;
extern u8 gNoOfAllBanks;
extern u16 gBattlePartyID[];
extern u8 gFightStateTracker;
extern u8 gTurnOrder[];
extern struct UnknownStruct12 gUnknown_02024AD0[];
extern u8 gObjectBankIDs[];
extern u16 gCurrentMove;
extern u8 gLastUsedAbility;
extern u8 gStringBank;
extern u8 gAbsentBankFlags;
extern u8 gMultiHitCounter;
extern u8 gActionForBanks[];
extern u16 gUnknown_02024C2C[];
extern u16 gLastUsedMove[];
extern u16 gMoveHitWith[];
extern u16 gUnknown_02024C44[];
extern u16 gUnknown_02024C4C[];
extern u16 gLockedMove[];
extern u8 gUnknown_02024C5C[];
extern u16 gChosenMovesByBanks[];
extern u32 gHitMarker;
extern u8 gUnknown_02024C70[];
extern u16 gSideAffecting[];
extern u32 gStatuses3[];
//extern u8 gDisableStructs[][0x1C];
extern u16 gPauseCounterBattle;
extern u16 gPaydayMoney;
extern u16 gRandomTurnNumber;
extern u8 gBattleCommunication[];
extern u8 gUnknown_02024D1F[];  // I don't actually know what type this is.
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gActionSelectionCursor[];
extern u8 gMoveSelectionCursor[];
extern u8 gUnknown_02038470[];
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern struct Window gUnknown_030041D0;
extern u16 gUnknown_03004200;
extern struct Window gUnknown_03004210;
extern u16 gUnknown_03004244;
extern struct Window gUnknown_03004250;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004280;
extern u32 gUnknown_03004284;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;
extern MainCallback gPreBattleCallback1;
extern void (*gBattleMainFunc)(void);
extern u8 gLeveledUpInBattle;
extern void (*gBattleBankFunc[])(void);
extern u8 gHealthboxIDs[];
extern struct UnknownStruct6 gUnknown_03004DE0;
//extern u16 gUnknown_03004DE0[][0xA0];  // possibly?
extern u16 gBattleTypeFlags;
extern s8 gBattleTerrain;  // I'm not sure if this is supposed to be s8 or u8. Regardless, it must have the same type as the return value of GetBattleTerrain.
extern u8 gReservedSpritePaletteCount;
extern u16 gTrainerBattleOpponent;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];
extern u8 gBattleMonForms[];
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u16 gBattleWeather;
extern u32 gBattleMoveDamage;
extern struct BattlePokemon gBattleMons[];
extern u8 gBattleMoveFlags;

static void BattlePrepIntroSlide(void);

void sub_800E7C4(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        sub_800B858();
        SetMainCallback2(sub_800F104);
        gBattleCommunication[0] = 0;
    }
    else
    {
        InitBattle();
    }
}

#ifdef DEBUG
__attribute__((naked))
void InitBattle()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r0, #0x0\n"
        "	bl	SetHBlankCallback\n"
        "	mov	r0, #0x0\n"
        "	bl	SetVBlankCallback\n"
        "	mov	r4, #0x0\n"
        "	str	r4, [sp]\n"
        "	mov	r1, #0xc0\n"
        "	lsl	r1, r1, #0x13\n"
        "	ldr	r2, ._10\n"
        "	mov	r0, sp\n"
        "	bl	gScriptFuncs_End+0x3cb4\n"
        "	ldr	r0, ._10 + 4\n"
        "	strh	r4, [r0]\n"
        "	sub	r0, r0, #0xc\n"
        "	mov	r2, #0xf0\n"
        "	strh	r2, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	ldr	r3, ._10 + 8\n"
        "	add	r1, r3, #0\n"
        "	strh	r1, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	strh	r4, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r4, [r0]\n"
        "	ldr	r0, ._10 + 12\n"
        "	strh	r2, [r0]\n"
        "	ldr	r0, ._10 + 16\n"
        "	strh	r1, [r0]\n"
        "	bl	dp12_8087EA4\n"
        "	ldr	r0, ._10 + 20\n"
        "	mov	r3, #0xf0\n"
        "	mov	r5, #0xf0\n"
        "	lsl	r5, r5, #0x3\n"
        "	add	r2, r0, r5\n"
        "	mov	r1, #0x4f\n"
        "._5:\n"
        "	strh	r3, [r0]\n"
        "	strh	r3, [r2]\n"
        "	add	r2, r2, #0x2\n"
        "	add	r0, r0, #0x2\n"
        "	sub	r1, r1, #0x1\n"
        "	cmp	r1, #0\n"
        "	bge	._5	@cond_branch\n"
        "	mov	r1, #0x50\n"
        "	ldr	r4, ._10 + 24\n"
        "	ldr	r0, ._10 + 20\n"
        "	ldr	r3, ._10 + 28\n"
        "	mov	r5, #0x82\n"
        "	lsl	r5, r5, #0x4\n"
        "	add	r2, r0, r5\n"
        "	add	r0, r0, #0xa0\n"
        "._6:\n"
        "	strh	r3, [r0]\n"
        "	strh	r3, [r2]\n"
        "	add	r2, r2, #0x2\n"
        "	add	r0, r0, #0x2\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, #0x9f\n"
        "	ble	._6	@cond_branch\n"
        "	ldr	r0, [r4]\n"
        "	ldr	r1, [r4, #0x4]\n"
        "	ldr	r2, [r4, #0x8]\n"
        "	bl	sub_80895F8\n"
        "	ldr	r4, ._10 + 32\n"
        "	add	r0, r4, #0\n"
        "	bl	SetUpWindowConfig\n"
        "	bl	ResetPaletteFade\n"
        "	ldr	r0, ._10 + 36\n"
        "	mov	r1, #0x0\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 40\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 44\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 48\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 52\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 56\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 60\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 64\n"
        "	strh	r1, [r0]\n"
        "	ldr	r0, ._10 + 68\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x8\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._7	@cond_branch\n"
        "	bl	GetBattleTerrain\n"
        "	ldr	r1, ._10 + 72\n"
        "	strb	r0, [r1]\n"
        "._7:\n"
        "	ldr	r0, ._10 + 76\n"
        "	add	r1, r4, #0\n"
        "	bl	InitWindowFromConfig\n"
        "	ldr	r0, ._10 + 80\n"
        "	ldr	r1, ._10 + 84\n"
        "	bl	InitWindowFromConfig\n"
        "	ldr	r0, ._10 + 88\n"
        "	ldr	r1, ._10 + 92\n"
        "	bl	InitWindowFromConfig\n"
        "	bl	sub_800D6D4\n"
        "	bl	sub_800DAB8\n"
        "	bl	ResetSpriteData\n"
        "	bl	ResetTasks\n"
        "	bl	sub_800E23C\n"
        "	bl	FreeAllSpritePalettes\n"
        "	ldr	r1, ._10 + 96\n"
        "	mov	r0, #0x4\n"
        "	strb	r0, [r1]\n"
        "	ldr	r0, ._10 + 100\n"
        "	bl	SetVBlankCallback\n"
        "	bl	setup_poochyena_battle\n"
        "	ldr	r0, ._10 + 104\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._8	@cond_branch\n"
        "	ldr	r0, ._10 + 108\n"
        "	bl	SetMainCallback2\n"
        "	b	._9\n"
        "._11:\n"
        "	.align	2, 0\n"
        "._10:\n"
        "	.word	0x5006000\n"
        "	.word	0x400004c\n"
        "	.word	0x5051\n"
        "	.word	gUnknown_030042C4\n"
        "	.word	gUnknown_03004240\n"
        "	.word	gUnknown_03004DE0\n"
        "	.word	gUnknown_081F9674\n"
        "	.word	0xff10\n"
        "	.word	gWindowConfig_81E6C58\n"
        "	.word	gUnknown_030042A4\n"
        "	.word	gUnknown_030042A0\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_030041B4\n"
        "	.word	gUnknown_03004288\n"
        "	.word	gUnknown_03004280\n"
        "	.word	gUnknown_030041B0\n"
        "	.word	gUnknown_030041B8\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	gBattleTerrain\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gUnknown_030041D0\n"
        "	.word	gWindowConfig_81E71D0\n"
        "	.word	gUnknown_03004250\n"
        "	.word	gWindowConfig_81E71EC\n"
        "	.word	gReservedSpritePaletteCount\n"
        "	.word	sub_800FCFC+1\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	sub_800F298+1\n"
        "._8:\n"
        "	ldr	r0, ._15\n"
        "	bl	SetMainCallback2\n"
        "._9:\n"
        "	ldr	r0, ._15 + 4\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._13	@cond_branch\n"
        "	ldr	r0, ._15 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x8\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._13	@cond_branch\n"
        "	ldr	r0, ._15 + 12\n"
        "	ldr	r1, ._15 + 16\n"
        "	ldrh	r1, [r1]\n"
        "	bl	CreateNPCTrainerParty\n"
        "	bl	SetWildMonHeldItem\n"
        "._13:\n"
        "	ldr	r0, ._15 + 20\n"
        "	ldr	r1, ._15 + 24\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x2\n"
        "	orr	r1, r1, r2\n"
        "	strb	r1, [r0]\n"
        "	ldr	r4, ._15 + 28\n"
        "	mov	r3, #0xfa\n"
        "	lsl	r3, r3, #0x1\n"
        "	add	r5, r4, r3\n"
        "._14:\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x3\n"
        "	bl	AdjustFriendship\n"
        "	add	r4, r4, #0x64\n"
        "	cmp	r4, r5\n"
        "	ble	._14	@cond_branch\n"
        "	mov	r1, #0x0\n"
        "	ldr	r0, ._15 + 32\n"
        "	strb	r1, [r0]\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._16:\n"
        "	.align	2, 0\n"
        "._15:\n"
        "	.word	sub_800EC9C+1\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	gEnemyParty\n"
        "	.word	gTrainerBattleOpponent\n"
        "	.word	gMain\n"
        "	.word	0x43d\n"
        "	.word	gPlayerParty\n"
        "	.word	gBattleCommunication\n"
        "\n"
    );
}
#else
void InitBattle(void)
{
    s32 i;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);

    CpuFill32(0, (void *)VRAM, VRAM_SIZE);

    REG_MOSAIC = 0;
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0x5051;
    REG_WININ = 0;
    REG_WINOUT = 0;
    gUnknown_030042C4 = 0xF0;
    gUnknown_03004240 = 0x5051;
    dp12_8087EA4();

    for (i = 0; i < 80; i++)
    {
        gUnknown_03004DE0.unk0[i] = 0xF0;
        gUnknown_03004DE0.unk780[i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gUnknown_03004DE0.unk0[i] = 0xFF10;
        gUnknown_03004DE0.unk780[i] = 0xFF10;
    }
    sub_80895F8(gUnknown_081F9674.unk0, gUnknown_081F9674.unk4, gUnknown_081F9674.unk8);
    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;
    gBattleTerrain = GetBattleTerrain();
    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    InitWindowFromConfig(&gUnknown_030041D0, &gWindowConfig_81E71D0);
    InitWindowFromConfig(&gUnknown_03004250, &gWindowConfig_81E71EC);
    sub_800D6D4();
    sub_800DAB8();
    ResetSpriteData();
    ResetTasks();
    sub_800E23C();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    setup_poochyena_battle();
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        SetMainCallback2(sub_800F298);
    else
        SetMainCallback2(sub_800EC9C);
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        CreateNPCTrainerParty(gEnemyParty, gTrainerBattleOpponent);
        SetWildMonHeldItem();
    }
    gMain.inBattle = TRUE;
    for (i = 0; i < 6; i++)
        AdjustFriendship(&gPlayerParty[i], 3);
    gBattleCommunication[0] = 0;
}
#endif

void sub_800E9EC(void)
{
    u16 r6 = 0;
    u16 species;
    u16 hp;
    u32 status;
    s32 i;

    for (i = 0; i < 6; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r6 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r6 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r6 |= 3 << i * 2;
    }
    ewram0.unk2 = r6;
    ewram0.unk3 = r6 >> 8;
}

void sub_800EAAC(void)
{
    s32 i;
    struct UnknownStruct8 *_ewram4 = &ewram4;

    for (i = 0; i < 7; i++)
        _ewram4->unk0[i] = gSaveBlock1.enigmaBerry.berry.name[i];
    for (i = 0; i < 18; i++)
        _ewram4->unk8[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
    _ewram4->unk7 = gSaveBlock1.enigmaBerry.holdEffect;
    _ewram4->unk1A = gSaveBlock1.enigmaBerry.holdEffectParam;
}

void sub_800EB08(void)
{
    s32 i;
    s32 j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        for (i = 0; i < 7; i++)
        {
            gEnigmaBerries[0].name[i] = gSaveBlock1.enigmaBerry.berry.name[i];
            gEnigmaBerries[2].name[i] = gSaveBlock1.enigmaBerry.berry.name[i];
        }
        for (i = 0; i < 18; i++)
        {
            gEnigmaBerries[0].itemEffect[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
            gEnigmaBerries[2].itemEffect[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
        }
        gEnigmaBerries[0].holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
        gEnigmaBerries[2].holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
        gEnigmaBerries[0].holdEffectParam = gSaveBlock1.enigmaBerry.holdEffectParam;
        gEnigmaBerries[2].holdEffectParam = gSaveBlock1.enigmaBerry.holdEffectParam;
    }
    else
    {
        s32 numPlayers;
        struct BattleEnigmaBerry *src;
        u8 r4;

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            numPlayers = 4;
        else
            numPlayers = 2;
        for (i = 0; i < numPlayers; i++)
        {
            src = (struct BattleEnigmaBerry *)(gBlockRecvBuffer[i] + 2);
            r4 = gLinkPlayers[i].lp_field_18;

            for (j = 0; j < 7; j++)
                gEnigmaBerries[r4].name[j] = src->name[j];
            for (j = 0; j < 18; j++)
                gEnigmaBerries[r4].itemEffect[j] = src->itemEffect[j];
            gEnigmaBerries[r4].holdEffect = src->holdEffect;
            gEnigmaBerries[r4].holdEffectParam = src->holdEffectParam;
        }
    }
}

void shedinja_something(struct Pokemon *pkmn)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 language = 1;

    if (GetMonData(pkmn, MON_DATA_SPECIES) == SPECIES_SHEDINJA
     && GetMonData(pkmn, MON_DATA_LANGUAGE) != language)
    {
        GetMonData(pkmn, MON_DATA_NICKNAME, nickname);
        if (StringCompareWithoutExtCtrlCodes(nickname, gUnknown_081F96C8) == 0)
            SetMonData(pkmn, MON_DATA_LANGUAGE, &language);
    }
}

#ifdef DEBUG
__attribute__((naked))
void sub_800EC9C()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	bl	RunTasks\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	bl	GetMultiplayerId\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r0, ._55\n"
        "	ldr	r1, ._55 + 4\n"
        "	add	r0, r0, r1\n"
        "	strb	r4, [r0]\n"
        "	mov	r0, #0x1\n"
        "	add	r5, r4, #0\n"
        "	eor	r5, r5, r0\n"
        "	ldr	r0, ._55 + 8\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0x9\n"
        "	bls	._53	@cond_branch\n"
        "	b	._140\n"
        "._53:\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._55 + 12\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._56:\n"
        "	.align	2, 0\n"
        "._55:\n"
        "	.word	+0x2000000\n"
        "	.word	0x160cb\n"
        "	.word	gBattleCommunication\n"
        "	.word	._57\n"
        "._57:\n"
        "	.word	._58\n"
        "	.word	._59\n"
        "	.word	._60\n"
        "	.word	._61\n"
        "	.word	._62\n"
        "	.word	._63\n"
        "	.word	._64\n"
        "	.word	._65\n"
        "	.word	._66\n"
        "	.word	._67\n"
        "._58:\n"
        "	ldr	r2, ._76\n"
        "	ldrh	r1, [r2]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._68	@cond_branch\n"
        "	ldr	r0, ._76 + 4\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._69	@cond_branch\n"
        "	b	._140\n"
        "._69:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._71	@cond_branch\n"
        "	b	._140\n"
        "._71:\n"
        "	ldr	r1, ._76 + 8\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	strb	r0, [r1, #0x1]\n"
        "	bl	sub_800E9EC\n"
        "	bl	sub_800EAAC\n"
        "	ldr	r0, ._76 + 12\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x8\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._73	@cond_branch\n"
        "	mov	r3, #0x0\n"
        "	ldr	r1, ._76 + 16\n"
        "	ldr	r0, ._76 + 20\n"
        "._74:\n"
        "	strh	r3, [r0, #0x18]\n"
        "	str	r1, [r0, #0x14]\n"
        "	add	r0, r0, #0x1c\n"
        "	add	r3, r3, #0x1\n"
        "	cmp	r3, #0x1\n"
        "	ble	._74	@cond_branch\n"
        "._73:\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._76 + 8\n"
        "	mov	r2, #0x20\n"
        "	bl	SendBlock\n"
        "	ldr	r1, ._76 + 24\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._140\n"
        "._77:\n"
        "	.align	2, 0\n"
        "._76:\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gReceivedRemoteLinkPlayers\n"
        "	.word	+0x2000000\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	0x2211\n"
        "	.word	gLinkPlayers\n"
        "	.word	gBattleCommunication\n"
        "._68:\n"
        "	mov	r0, #0x4\n"
        "	orr	r0, r0, r1\n"
        "	strh	r0, [r2]\n"
        "	ldr	r1, ._79\n"
        "	mov	r0, #0x8\n"
        "	strb	r0, [r1]\n"
        "	bl	sub_800EB08\n"
        "	b	._140\n"
        "._80:\n"
        "	.align	2, 0\n"
        "._79:\n"
        "	.word	gBattleCommunication\n"
        "._59:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0x3\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0x3\n"
        "	beq	._81	@cond_branch\n"
        "	b	._140\n"
        "._81:\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	mov	r3, #0x0\n"
        "	ldr	r0, ._86\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._83	@cond_branch\n"
        "	cmp	r4, #0\n"
        "	bne	._84	@cond_branch\n"
        "	ldr	r0, ._86 + 4\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0xc\n"
        "	b	._85\n"
        "._87:\n"
        "	.align	2, 0\n"
        "._86:\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	gBattleTypeFlags\n"
        "._84:\n"
        "	ldr	r0, ._92\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0x8\n"
        "._85:\n"
        "	orr	r1, r1, r2\n"
        "	strh	r1, [r0]\n"
        "	add	r3, r3, #0x1\n"
        "._83:\n"
        "	lsl	r7, r5, #0x8\n"
        "	cmp	r3, #0\n"
        "	bne	._94	@cond_branch\n"
        "	ldr	r0, ._92 + 4\n"
        "	mov	r1, #0x80\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r2, r0, r1\n"
        "	ldrh	r1, [r0]\n"
        "	add	r6, r0, #0\n"
        "	ldrh	r2, [r2]\n"
        "	cmp	r1, r2\n"
        "	bne	._89	@cond_branch\n"
        "	cmp	r4, #0\n"
        "	bne	._90	@cond_branch\n"
        "	ldr	r0, ._92\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0xc\n"
        "	b	._91\n"
        "._93:\n"
        "	.align	2, 0\n"
        "._92:\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gBlockRecvBuffer\n"
        "._90:\n"
        "	ldr	r0, ._96\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0x8\n"
        "._91:\n"
        "	orr	r1, r1, r2\n"
        "	strh	r1, [r0]\n"
        "	add	r3, r3, #0x1\n"
        "._89:\n"
        "	lsl	r7, r5, #0x8\n"
        "	cmp	r3, #0\n"
        "	bne	._94	@cond_branch\n"
        "	ldrh	r1, [r6]\n"
        "	ldr	r0, ._96 + 4\n"
        "	ldr	r2, ._96\n"
        "	b	._95\n"
        "._97:\n"
        "	.align	2, 0\n"
        "._96:\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	0x101\n"
        "._100:\n"
        "	add	r3, r3, #0x1\n"
        "	cmp	r3, #0x1\n"
        "	bgt	._98	@cond_branch\n"
        "	lsl	r0, r3, #0x8\n"
        "	add	r0, r0, r6\n"
        "	ldrh	r1, [r0]\n"
        "	ldr	r0, ._103\n"
        "._95:\n"
        "	cmp	r1, r0\n"
        "	bls	._100	@cond_branch\n"
        "	cmp	r3, r4\n"
        "	beq	._100	@cond_branch\n"
        "._98:\n"
        "	cmp	r3, #0x2\n"
        "	bne	._101	@cond_branch\n"
        "	ldrh	r0, [r2]\n"
        "	mov	r1, #0xc\n"
        "	b	._102\n"
        "._104:\n"
        "	.align	2, 0\n"
        "._103:\n"
        "	.word	0x101\n"
        "._101:\n"
        "	ldrh	r0, [r2]\n"
        "	mov	r1, #0x8\n"
        "._102:\n"
        "	orr	r0, r0, r1\n"
        "	strh	r0, [r2]\n"
        "._94:\n"
        "	bl	sub_800EB08\n"
        "	ldr	r0, ._106\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._106 + 4\n"
        "	lsl	r2, r0, #0x2\n"
        "	add	r2, r2, r0\n"
        "	lsl	r2, r2, #0x3\n"
        "	add	r2, r2, r1\n"
        "	mov	r1, #0x0\n"
        "	mov	r0, #0x87\n"
        "	lsl	r0, r0, #0x1\n"
        "	strh	r0, [r2, #0xa]\n"
        "	mov	r0, #0x5a\n"
        "	strh	r0, [r2, #0xc]\n"
        "	strh	r1, [r2, #0x12]\n"
        "	ldr	r0, ._106 + 8\n"
        "	ldrb	r1, [r0, #0x2]\n"
        "	ldrb	r0, [r0, #0x3]\n"
        "	lsl	r0, r0, #0x8\n"
        "	orr	r1, r1, r0\n"
        "	strh	r1, [r2, #0xe]\n"
        "	ldr	r0, ._106 + 12\n"
        "	add	r0, r0, #0x2\n"
        "	add	r0, r7, r0\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r2, #0x10]\n"
        "	b	._129\n"
        "._107:\n"
        "	.align	2, 0\n"
        "._106:\n"
        "	.word	sub_800DE30+1\n"
        "	.word	gTasks\n"
        "	.word	+0x2000000\n"
        "	.word	gBlockRecvBuffer\n"
        "._60:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._108	@cond_branch\n"
        "	b	._140\n"
        "._108:\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._111\n"
        "	mov	r2, #0xc8\n"
        "	bl	SendBlock\n"
        "	b	._129\n"
        "._112:\n"
        "	.align	2, 0\n"
        "._111:\n"
        "	.word	gPlayerParty\n"
        "._61:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0x3\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0x3\n"
        "	beq	._113	@cond_branch\n"
        "	b	._140\n"
        "._113:\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	ldr	r0, ._116\n"
        "	lsl	r1, r5, #0x8\n"
        "	ldr	r2, ._116 + 4\n"
        "	add	r1, r1, r2\n"
        "	mov	r2, #0xc8\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "	b	._129\n"
        "._117:\n"
        "	.align	2, 0\n"
        "._116:\n"
        "	.word	gEnemyParty\n"
        "	.word	gBlockRecvBuffer\n"
        "._62:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._118	@cond_branch\n"
        "	b	._140\n"
        "._118:\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._121\n"
        "	mov	r2, #0xc8\n"
        "	bl	SendBlock\n"
        "	b	._129\n"
        "._122:\n"
        "	.align	2, 0\n"
        "._121:\n"
        "	.word	gPlayerParty+0xc8\n"
        "._63:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0x3\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0x3\n"
        "	beq	._123	@cond_branch\n"
        "	b	._140\n"
        "._123:\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	ldr	r0, ._126\n"
        "	lsl	r1, r5, #0x8\n"
        "	ldr	r2, ._126 + 4\n"
        "	add	r1, r1, r2\n"
        "	mov	r2, #0xc8\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "	b	._129\n"
        "._127:\n"
        "	.align	2, 0\n"
        "._126:\n"
        "	.word	gEnemyParty+0xc8\n"
        "	.word	gBlockRecvBuffer\n"
        "._64:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._140	@cond_branch\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._130\n"
        "	mov	r2, #0xc8\n"
        "	bl	SendBlock\n"
        "	b	._129\n"
        "._131:\n"
        "	.align	2, 0\n"
        "._130:\n"
        "	.word	gPlayerParty+0x190\n"
        "._65:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0x3\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0x3\n"
        "	bne	._140	@cond_branch\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	ldr	r4, ._134\n"
        "	lsl	r1, r5, #0x8\n"
        "	ldr	r0, ._134 + 4\n"
        "	add	r1, r1, r0\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0xc8\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "	ldr	r1, ._134 + 8\n"
        "	add	r0, r4, r1\n"
        "	bl	shedinja_something\n"
        "	ldr	r1, ._134 + 12\n"
        "	add	r0, r4, r1\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	sub	r0, r0, #0xc8\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	sub	r0, r0, #0x64\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0x64\n"
        "	bl	shedinja_something\n"
        "._129:\n"
        "	ldr	r1, ._134 + 16\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._140\n"
        "._135:\n"
        "	.align	2, 0\n"
        "._134:\n"
        "	.word	gEnemyParty+0x190\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	0xfffffe70\n"
        "	.word	0xfffffed4\n"
        "	.word	gBattleCommunication\n"
        "._66:\n"
        "	bl	sub_800B950\n"
        "	ldr	r0, ._137\n"
        "	ldrb	r1, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	mov	r2, #0x0\n"
        "	strb	r1, [r0]\n"
        "	strb	r2, [r0, #0x1]\n"
        "	strb	r2, [r0, #0x2]\n"
        "	b	._140\n"
        "._138:\n"
        "	.align	2, 0\n"
        "._137:\n"
        "	.word	gBattleCommunication\n"
        "._67:\n"
        "	ldr	r0, ._141\n"
        "	add	r1, r0, #1\n"
        "	bl	battle_load_something\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._140	@cond_branch\n"
        "	ldr	r2, ._141 + 4\n"
        "	ldr	r1, ._141 + 8\n"
        "	ldr	r0, [r1]\n"
        "	str	r0, [r2]\n"
        "	ldr	r0, ._141 + 12\n"
        "	str	r0, [r1]\n"
        "	ldr	r0, ._141 + 16\n"
        "	bl	SetMainCallback2\n"
        "	ldr	r3, ._141 + 20\n"
        "	ldrh	r2, [r3]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r2\n"
        "	cmp	r0, #0\n"
        "	beq	._140	@cond_branch\n"
        "	ldr	r1, ._141 + 24\n"
        "	mov	r4, #0x80\n"
        "	lsl	r4, r4, #0x4\n"
        "	add	r0, r4, #0\n"
        "	strh	r0, [r1]\n"
        "	mov	r0, #0x20\n"
        "	orr	r0, r0, r2\n"
        "	strh	r0, [r3]\n"
        "._140:\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._142:\n"
        "	.align	2, 0\n"
        "._141:\n"
        "	.word	gUnknown_02024D1F\n"
        "	.word	gPreBattleCallback1\n"
        "	.word	gMain\n"
        "	.word	debug_sub_80139E4+1\n"
        "	.word	sub_800F808+1\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gTrainerBattleOpponent\n"
        "\n"
    );
}
#else
void sub_800EC9C(void)
{
    u8 playerId;
    u8 enemyId;

    asm(".fill 44");
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    enemyId = playerId ^ 1;

    switch (gBattleCommunication[0])
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
            {
                ewram0.unk0 = 1;
                ewram0.unk1 = 1;
                sub_800E9EC();
                sub_800EAAC();
                SendBlock(bitmask_all_link_players_but_self(), &ewram0, 32);
                gBattleCommunication[0] = 1;
            }
        }
        else
        {
            gBattleTypeFlags |= BATTLE_TYPE_WILD;
            gBattleCommunication[0] = 8;
            sub_800EB08();
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            s32 id;
            u8 taskId;

            ResetBlockReceivedFlags();
            id = 0;
            if (gBlockRecvBuffer[0][0] == 0x100)
            {
                if (playerId == 0)
                    gBattleTypeFlags |= 12;
                else
                    gBattleTypeFlags |= 8;
                id++;
            }
            if (id == 0)
            {
                if (gBlockRecvBuffer[0][0] == gBlockRecvBuffer[1][0])
                {
                    if (playerId == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                    id++;
                }
                if (id == 0)
                {
                    while (id < 2)
                    {
                        if (gBlockRecvBuffer[id][0] > 0x0101 && id != playerId)
                            break;
                        id++;
                    }
                    if (id == 2)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
            }
            sub_800EB08();
            taskId = CreateTask(sub_800DE30, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = ewram0.unk2 | (ewram0.unk3 << 8);
            gTasks[taskId].data[4] = gBlockRecvBuffer[enemyId][1];
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty, sizeof(*gPlayerParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 2, sizeof(*gPlayerParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 2, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 6:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 4, sizeof(*gPlayerParty) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 7:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 4, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            shedinja_something(&gEnemyParty[0]);
            shedinja_something(&gEnemyParty[1]);
            shedinja_something(&gEnemyParty[2]);
            shedinja_something(&gEnemyParty[3]);
            shedinja_something(&gEnemyParty[4]);
            shedinja_something(&gEnemyParty[5]);
            gBattleCommunication[0]++;
        }
        break;
    case 8:
        sub_800B950();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        gBattleCommunication[2] = 0;
        break;
    case 9:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(sub_800F808);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                gTrainerBattleOpponent = 0x800;
                gBattleTypeFlags |= BATTLE_TYPE_20;
            }
        }
        break;
    }
}
#endif

void sub_800F02C(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        u8 *nickname = gUnknown_02023A00[i].nickname;

        gUnknown_02023A00[i].species     = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
        gUnknown_02023A00[i].heldItem    = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        GetMonData(&gPlayerParty[i], MON_DATA_NICKNAME, nickname);
        gUnknown_02023A00[i].level       = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
        gUnknown_02023A00[i].hp          = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        gUnknown_02023A00[i].maxhp       = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
        gUnknown_02023A00[i].status      = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
        gUnknown_02023A00[i].personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
        gUnknown_02023A00[i].gender      = GetMonGender(&gPlayerParty[i]);
        StripExtCtrlCodes(nickname);
        gUnknown_02023A00[i].language    = GetMonData(&gPlayerParty[i], MON_DATA_LANGUAGE);
        if (gUnknown_02023A00[i].language != 1)
            PadNameString(nickname, 0);
    }
    memcpy(ewram, gUnknown_02023A00, 0x60);
}

#ifdef DEBUG
__attribute__((naked))
void sub_800F104()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r9\n"
        "	mov	r6, r8\n"
        "	push	{r6, r7}\n"
        "	bl	GetMultiplayerId\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	ldr	r0, ._151\n"
        "	ldr	r2, ._151 + 4\n"
        "	add	r1, r0, r2\n"
        "	strb	r6, [r1]\n"
        "	ldr	r1, ._151 + 8\n"
        "	add	r1, r1, r0\n"
        "	mov	r9, r1\n"
        "	sub	r2, r2, #0x9\n"
        "	add	r2, r2, r0\n"
        "	mov	r8, r2\n"
        "	bl	RunTasks\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	ldr	r2, ._151 + 12\n"
        "	ldrb	r0, [r2]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._147	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._148	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._149	@cond_branch\n"
        "	b	._183\n"
        "._152:\n"
        "	.align	2, 0\n"
        "._151:\n"
        "	.word	+0x2000000\n"
        "	.word	0x160cb\n"
        "	.word	0x160c4\n"
        "	.word	gBattleCommunication\n"
        "._148:\n"
        "	cmp	r0, #0x2\n"
        "	bne	._153	@cond_branch\n"
        "	b	._154\n"
        "._153:\n"
        "	cmp	r0, #0x3\n"
        "	bne	._155	@cond_branch\n"
        "	b	._156\n"
        "._155:\n"
        "	b	._183\n"
        "._149:\n"
        "	ldr	r0, ._165\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._158	@cond_branch\n"
        "	b	._183\n"
        "._158:\n"
        "	ldr	r0, ._165 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x8\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._160	@cond_branch\n"
        "	mov	r4, #0x0\n"
        "	ldr	r1, ._165 + 8\n"
        "	ldr	r0, ._165 + 12\n"
        "._161:\n"
        "	strh	r4, [r0, #0x18]\n"
        "	str	r1, [r0, #0x14]\n"
        "	add	r0, r0, #0x1c\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x3\n"
        "	ble	._161	@cond_branch\n"
        "._160:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._162	@cond_branch\n"
        "	b	._183\n"
        "._162:\n"
        "	bl	sub_800F02C\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._165 + 16\n"
        "	mov	r2, #0x60\n"
        "	bl	SendBlock\n"
        "	ldr	r1, ._165 + 20\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._183\n"
        "._166:\n"
        "	.align	2, 0\n"
        "._165:\n"
        "	.word	gReceivedRemoteLinkPlayers\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	0x2211\n"
        "	.word	gLinkPlayers\n"
        "	.word	+0x2000000\n"
        "	.word	gBattleCommunication\n"
        "._147:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0xf\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0xf\n"
        "	bne	._183	@cond_branch\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	mov	r4, #0x0\n"
        "	lsl	r0, r6, #0x3\n"
        "	sub	r0, r0, r6\n"
        "	lsl	r5, r0, #0x2\n"
        "	mov	r7, #0x0\n"
        "._175:\n"
        "	cmp	r4, r6\n"
        "	beq	._174	@cond_branch\n"
        "	ldr	r2, ._172\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	mov	r3, #0x1\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._169	@cond_branch\n"
        "	add	r0, r5, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._170	@cond_branch\n"
        "	b	._174\n"
        "._173:\n"
        "	.align	2, 0\n"
        "._172:\n"
        "	.word	gLinkPlayers\n"
        "._169:\n"
        "	add	r0, r5, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._174	@cond_branch\n"
        "._170:\n"
        "	lsl	r1, r4, #0x8\n"
        "	ldr	r0, ._177\n"
        "	add	r1, r1, r0\n"
        "	ldr	r0, ._177 + 4\n"
        "	mov	r2, #0x60\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "._174:\n"
        "	add	r7, r7, #0x1c\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x3\n"
        "	ble	._175	@cond_branch\n"
        "	ldr	r1, ._177 + 8\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	ldr	r1, ._177 + 12\n"
        "	ldr	r0, [r1, #0x8]\n"
        "	mov	r2, r9\n"
        "	str	r0, [r2]\n"
        "	ldr	r0, ._177 + 16\n"
        "	ldrh	r0, [r0]\n"
        "	mov	r2, r8\n"
        "	strh	r0, [r2]\n"
        "	ldr	r0, ._177 + 20\n"
        "	str	r0, [r1, #0x8]\n"
        "	mov	r0, #0x5\n"
        "	mov	r1, #0x0\n"
        "	bl	OpenPartyMenu\n"
        "	b	._183\n"
        "._178:\n"
        "	.align	2, 0\n"
        "._177:\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	gUnknown_02023A00\n"
        "	.word	gBattleCommunication\n"
        "	.word	gMain\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	sub_800F104+1\n"
        "._154:\n"
        "	ldr	r0, ._181\n"
        "	ldrb	r1, [r0, #0x7]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._183	@cond_branch\n"
        "	mov	r0, #0x3\n"
        "	strb	r0, [r2]\n"
        "	bl	sub_800832C\n"
        "	b	._183\n"
        "._182:\n"
        "	.align	2, 0\n"
        "._181:\n"
        "	.word	gPaletteFade\n"
        "._156:\n"
        "	ldr	r0, ._184\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._183	@cond_branch\n"
        "	ldr	r1, ._184 + 4\n"
        "	mov	r2, r8\n"
        "	ldrh	r0, [r2]\n"
        "	strh	r0, [r1]\n"
        "	ldr	r1, ._184 + 8\n"
        "	mov	r2, r9\n"
        "	ldr	r0, [r2]\n"
        "	str	r0, [r1, #0x8]\n"
        "	ldr	r0, ._184 + 12\n"
        "	bl	SetMainCallback2\n"
        "._183:\n"
        "	pop	{r3, r4}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._185:\n"
        "	.align	2, 0\n"
        "._184:\n"
        "	.word	gReceivedRemoteLinkPlayers\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gMain\n"
        "	.word	InitBattle+1\n"
        "\n"
    );
}
#else
void sub_800F104(void)
{
    u8 playerId;
    MainCallback *pSavedCallback;
    u16 *pSavedBattleTypeFlags;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    // Seriously, Game Freak?
    pSavedCallback = (MainCallback *)(ewram + 0x160C4);
    pSavedBattleTypeFlags = (u16 *)(ewram + 0x160C2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gBattleCommunication[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
        {
            sub_800F02C();
            SendBlock(bitmask_all_link_players_but_self(), ewram, 0x60);
            gBattleCommunication[0]++;
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            s32 i;

            ResetBlockReceivedFlags();
            for (i = 0; i < 4; i++)
            {
                if (i != playerId)
                {
                    if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[i].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                        memcpy(gUnknown_02023A00, gBlockRecvBuffer[i], 0x60);
                }
            }
            gBattleCommunication[0]++;
            *pSavedCallback = gMain.savedCallback;
            *pSavedBattleTypeFlags = gBattleTypeFlags;
            gMain.savedCallback = sub_800F104;
            OpenPartyMenu(5, 0);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[0] = 3;
            sub_800832C();
        }
        break;
    case 3:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            gBattleTypeFlags = *pSavedBattleTypeFlags;
            gMain.savedCallback = *pSavedCallback;
            SetMainCallback2(InitBattle);
        }
        break;
    }
}
#endif

#ifdef DEBUG

__attribute__((naked))
void sub_800F298()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r8\n"
        "	push	{r7}\n"
        "	bl	GetMultiplayerId\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	ldr	r0, ._188\n"
        "	ldr	r1, ._188 + 4\n"
        "	add	r0, r0, r1\n"
        "	strb	r6, [r0]\n"
        "	bl	RunTasks\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	ldr	r0, ._188 + 8\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0x7\n"
        "	bls	._186	@cond_branch\n"
        "	b	._352\n"
        "._186:\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._188 + 12\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._189:\n"
        "	.align	2, 0\n"
        "._188:\n"
        "	.word	+0x2000000\n"
        "	.word	0x160cb\n"
        "	.word	gBattleCommunication\n"
        "	.word	._190\n"
        "._190:\n"
        "	.word	._191\n"
        "	.word	._192\n"
        "	.word	._193\n"
        "	.word	._194\n"
        "	.word	._195\n"
        "	.word	._196\n"
        "	.word	._197\n"
        "	.word	._198\n"
        "._191:\n"
        "	ldr	r0, ._206\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._199	@cond_branch\n"
        "	b	._352\n"
        "._199:\n"
        "	ldr	r0, ._206 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x8\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._201	@cond_branch\n"
        "	mov	r4, #0x0\n"
        "	ldr	r1, ._206 + 8\n"
        "	ldr	r0, ._206 + 12\n"
        "._202:\n"
        "	strh	r4, [r0, #0x18]\n"
        "	str	r1, [r0, #0x14]\n"
        "	add	r0, r0, #0x1c\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x3\n"
        "	ble	._202	@cond_branch\n"
        "._201:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._203	@cond_branch\n"
        "	b	._352\n"
        "._203:\n"
        "	ldr	r4, ._206 + 16\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	strb	r0, [r4, #0x1]\n"
        "	bl	sub_800E9EC\n"
        "	bl	sub_800EAAC\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0x20\n"
        "	bl	SendBlock\n"
        "	b	._300\n"
        "._207:\n"
        "	.align	2, 0\n"
        "._206:\n"
        "	.word	gReceivedRemoteLinkPlayers\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	0x2211\n"
        "	.word	gLinkPlayers\n"
        "	.word	+0x2000000\n"
        "._192:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0xf\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0xf\n"
        "	beq	._208	@cond_branch\n"
        "	b	._352\n"
        "._208:\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	mov	r4, #0x0\n"
        "	ldr	r0, ._213\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._210	@cond_branch\n"
        "	cmp	r6, #0\n"
        "	bne	._211	@cond_branch\n"
        "	ldr	r0, ._213 + 4\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0xc\n"
        "	b	._212\n"
        "._214:\n"
        "	.align	2, 0\n"
        "._213:\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	gBattleTypeFlags\n"
        "._211:\n"
        "	ldr	r0, ._221\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0x8\n"
        "._212:\n"
        "	orr	r1, r1, r2\n"
        "	strh	r1, [r0]\n"
        "	add	r4, r4, #0x1\n"
        "._210:\n"
        "	cmp	r4, #0\n"
        "	bne	._223	@cond_branch\n"
        "	mov	r2, #0x0\n"
        "	ldr	r1, ._221 + 4\n"
        "	add	r5, r1, #0\n"
        "	mov	r3, #0x80\n"
        "	lsl	r3, r3, #0x1\n"
        "._217:\n"
        "	add	r1, r1, r3\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, #0x3\n"
        "	bgt	._216	@cond_branch\n"
        "	ldrh	r0, [r5]\n"
        "	ldrh	r7, [r1]\n"
        "	cmp	r0, r7\n"
        "	beq	._217	@cond_branch\n"
        "._216:\n"
        "	cmp	r2, #0x4\n"
        "	bne	._218	@cond_branch\n"
        "	cmp	r6, #0\n"
        "	bne	._219	@cond_branch\n"
        "	ldr	r0, ._221\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0xc\n"
        "	b	._220\n"
        "._222:\n"
        "	.align	2, 0\n"
        "._221:\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gBlockRecvBuffer\n"
        "._219:\n"
        "	ldr	r0, ._233\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0x8\n"
        "._220:\n"
        "	orr	r1, r1, r2\n"
        "	strh	r1, [r0]\n"
        "	add	r4, r4, #0x1\n"
        "._218:\n"
        "	cmp	r4, #0\n"
        "	bne	._223	@cond_branch\n"
        "	ldr	r0, ._233 + 4\n"
        "	ldrh	r2, [r0]\n"
        "	ldr	r1, ._233 + 8\n"
        "	add	r3, r0, #0\n"
        "	ldr	r5, ._233\n"
        "	cmp	r2, r1\n"
        "	beq	._224	@cond_branch\n"
        "._230:\n"
        "	lsl	r0, r4, #0x8\n"
        "	add	r0, r0, r3\n"
        "	ldrh	r0, [r0]\n"
        "	ldr	r1, ._233 + 8\n"
        "	cmp	r0, r1\n"
        "	bls	._225	@cond_branch\n"
        "	cmp	r4, r6\n"
        "	bne	._227	@cond_branch\n"
        "._225:\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x3\n"
        "	bgt	._227	@cond_branch\n"
        "	lsl	r0, r4, #0x8\n"
        "	add	r0, r0, r3\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r0, r1\n"
        "	bne	._230	@cond_branch\n"
        "._224:\n"
        "	cmp	r4, r6\n"
        "	beq	._230	@cond_branch\n"
        "	cmp	r4, r6\n"
        "	bge	._230	@cond_branch\n"
        "._227:\n"
        "	cmp	r4, #0x4\n"
        "	bne	._231	@cond_branch\n"
        "	ldrh	r0, [r5]\n"
        "	mov	r1, #0xc\n"
        "	b	._232\n"
        "._234:\n"
        "	.align	2, 0\n"
        "._233:\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	0x101\n"
        "._231:\n"
        "	ldrh	r0, [r5]\n"
        "	mov	r1, #0x8\n"
        "._232:\n"
        "	orr	r0, r0, r1\n"
        "	strh	r0, [r5]\n"
        "._223:\n"
        "	bl	sub_800EB08\n"
        "	ldr	r0, ._239\n"
        "	ldr	r1, ._239 + 4\n"
        "	mov	r2, #0x96\n"
        "	lsl	r2, r2, #0x1\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "	ldr	r0, ._239 + 8\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r2, ._239 + 12\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r2\n"
        "	mov	r2, #0x0\n"
        "	mov	r0, #0x87\n"
        "	lsl	r0, r0, #0x1\n"
        "	strh	r0, [r1, #0xa]\n"
        "	mov	r0, #0x5a\n"
        "	strh	r0, [r1, #0xc]\n"
        "	strh	r2, [r1, #0x12]\n"
        "	strh	r2, [r1, #0xe]\n"
        "	strh	r2, [r1, #0x10]\n"
        "	add	r2, r1, #0\n"
        "	ldr	r0, ._239 + 16\n"
        "	add	r3, r0, #2\n"
        "	ldr	r6, ._239 + 20\n"
        "	mov	r5, #0x3f\n"
        "	mov	r7, #0x80\n"
        "	lsl	r7, r7, #0x1\n"
        "	mov	r4, #0x3\n"
        "._247:\n"
        "	ldrh	r0, [r6, #0x18]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._235	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._236	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._237	@cond_branch\n"
        "	b	._246\n"
        "._240:\n"
        "	.align	2, 0\n"
        "._239:\n"
        "	.word	+0x201d000\n"
        "	.word	gPlayerParty\n"
        "	.word	sub_800DE30+1\n"
        "	.word	gTasks\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	gLinkPlayers\n"
        "._236:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._241	@cond_branch\n"
        "	cmp	r0, #0x3\n"
        "	beq	._242	@cond_branch\n"
        "	b	._246\n"
        "._237:\n"
        "	ldrh	r0, [r3]\n"
        "	add	r1, r5, #0\n"
        "	and	r1, r1, r0\n"
        "	b	._244\n"
        "._235:\n"
        "	ldrh	r0, [r3]\n"
        "	add	r1, r5, #0\n"
        "	and	r1, r1, r0\n"
        "	b	._245\n"
        "._241:\n"
        "	ldrh	r0, [r3]\n"
        "	add	r1, r5, #0\n"
        "	and	r1, r1, r0\n"
        "	lsl	r1, r1, #0x6\n"
        "._244:\n"
        "	ldrh	r0, [r2, #0xe]\n"
        "	orr	r1, r1, r0\n"
        "	strh	r1, [r2, #0xe]\n"
        "	b	._246\n"
        "._242:\n"
        "	ldrh	r0, [r3]\n"
        "	add	r1, r5, #0\n"
        "	and	r1, r1, r0\n"
        "	lsl	r1, r1, #0x6\n"
        "._245:\n"
        "	ldrh	r0, [r2, #0x10]\n"
        "	orr	r1, r1, r0\n"
        "	strh	r1, [r2, #0x10]\n"
        "._246:\n"
        "	add	r3, r3, r7\n"
        "	add	r6, r6, #0x1c\n"
        "	sub	r4, r4, #0x1\n"
        "	cmp	r4, #0\n"
        "	bge	._247	@cond_branch\n"
        "	bl	ZeroPlayerPartyMons\n"
        "	bl	ZeroEnemyPartyMons\n"
        "	ldr	r1, ._251\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "._193:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._248	@cond_branch\n"
        "	b	._352\n"
        "._248:\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._251 + 4\n"
        "	mov	r2, #0xc8\n"
        "	bl	SendBlock\n"
        "	b	._300\n"
        "._252:\n"
        "	.align	2, 0\n"
        "._251:\n"
        "	.word	gBattleCommunication\n"
        "	.word	+0x201d000\n"
        "._194:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0xf\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0xf\n"
        "	beq	._253	@cond_branch\n"
        "	b	._352\n"
        "._253:\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	mov	r4, #0x0\n"
        "	lsl	r0, r6, #0x3\n"
        "	sub	r0, r0, r6\n"
        "	lsl	r0, r0, #0x2\n"
        "	mov	r8, r0\n"
        "	ldr	r5, ._260\n"
        "	mov	r7, #0x0\n"
        "._294:\n"
        "	cmp	r4, r6\n"
        "	bne	._255	@cond_branch\n"
        "	ldr	r0, ._260 + 4\n"
        "	add	r0, r7, r0\n"
        "	ldrh	r0, [r0, #0x18]\n"
        "	cmp	r0, #0x2\n"
        "	bgt	._256	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bge	._257	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._258	@cond_branch\n"
        "	b	._291\n"
        "._261:\n"
        "	.align	2, 0\n"
        "._260:\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	gLinkPlayers\n"
        "._256:\n"
        "	cmp	r0, #0x3\n"
        "	bne	._291	@cond_branch\n"
        "._258:\n"
        "	ldr	r0, ._264\n"
        "	b	._283\n"
        "._265:\n"
        "	.align	2, 0\n"
        "._264:\n"
        "	.word	gPlayerParty\n"
        "._257:\n"
        "	ldr	r0, ._267\n"
        "	b	._283\n"
        "._268:\n"
        "	.align	2, 0\n"
        "._267:\n"
        "	.word	gPlayerParty+0x12c\n"
        "._255:\n"
        "	ldr	r2, ._272\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	mov	r3, #0x1\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._269	@cond_branch\n"
        "	mov	r1, r8\n"
        "	add	r0, r1, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._270	@cond_branch\n"
        "	b	._274\n"
        "._273:\n"
        "	.align	2, 0\n"
        "._272:\n"
        "	.word	gLinkPlayers\n"
        "._269:\n"
        "	mov	r1, r8\n"
        "	add	r0, r1, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._274	@cond_branch\n"
        "._270:\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r2, [r0, #0x18]\n"
        "	cmp	r2, #0x2\n"
        "	bgt	._275	@cond_branch\n"
        "	cmp	r2, #0x1\n"
        "	bge	._276	@cond_branch\n"
        "	cmp	r2, #0\n"
        "	beq	._277	@cond_branch\n"
        "	b	._291\n"
        "._275:\n"
        "	cmp	r2, #0x3\n"
        "	bne	._291	@cond_branch\n"
        "._277:\n"
        "	ldr	r0, ._281\n"
        "	b	._283\n"
        "._282:\n"
        "	.align	2, 0\n"
        "._281:\n"
        "	.word	gPlayerParty\n"
        "._276:\n"
        "	ldr	r0, ._284\n"
        "	b	._283\n"
        "._285:\n"
        "	.align	2, 0\n"
        "._284:\n"
        "	.word	gPlayerParty+0x12c\n"
        "._274:\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r2, [r0, #0x18]\n"
        "	cmp	r2, #0x2\n"
        "	bgt	._286	@cond_branch\n"
        "	cmp	r2, #0x1\n"
        "	bge	._287	@cond_branch\n"
        "	cmp	r2, #0\n"
        "	beq	._288	@cond_branch\n"
        "	b	._291\n"
        "._286:\n"
        "	cmp	r2, #0x3\n"
        "	bne	._291	@cond_branch\n"
        "._288:\n"
        "	ldr	r0, ._292\n"
        "._283:\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0xc8\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "	b	._291\n"
        "._293:\n"
        "	.align	2, 0\n"
        "._292:\n"
        "	.word	gEnemyParty\n"
        "._287:\n"
        "	ldr	r0, ._296\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0xc8\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "._291:\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r5, r5, r0\n"
        "	add	r7, r7, #0x1c\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x3\n"
        "	ble	._294	@cond_branch\n"
        "	b	._300\n"
        "._297:\n"
        "	.align	2, 0\n"
        "._296:\n"
        "	.word	gEnemyParty+0x12c\n"
        "._195:\n"
        "	bl	sub_8007ECC\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._298	@cond_branch\n"
        "	b	._352\n"
        "._298:\n"
        "	bl	bitmask_all_link_players_but_self\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._301\n"
        "	mov	r2, #0x64\n"
        "	bl	SendBlock\n"
        "	b	._300\n"
        "._302:\n"
        "	.align	2, 0\n"
        "._301:\n"
        "	.word	+0x201d0c8\n"
        "._196:\n"
        "	bl	GetBlockReceivedStatus\n"
        "	mov	r1, #0xf\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0xf\n"
        "	beq	._303	@cond_branch\n"
        "	b	._352\n"
        "._303:\n"
        "	bl	ResetBlockReceivedFlags\n"
        "	mov	r4, #0x0\n"
        "	lsl	r0, r6, #0x3\n"
        "	sub	r0, r0, r6\n"
        "	lsl	r0, r0, #0x2\n"
        "	mov	r8, r0\n"
        "	ldr	r5, ._310\n"
        "	mov	r7, #0x0\n"
        "._344:\n"
        "	cmp	r4, r6\n"
        "	bne	._305	@cond_branch\n"
        "	ldr	r0, ._310 + 4\n"
        "	add	r0, r7, r0\n"
        "	ldrh	r0, [r0, #0x18]\n"
        "	cmp	r0, #0x2\n"
        "	bgt	._306	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bge	._307	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._308	@cond_branch\n"
        "	b	._341\n"
        "._311:\n"
        "	.align	2, 0\n"
        "._310:\n"
        "	.word	gBlockRecvBuffer\n"
        "	.word	gLinkPlayers\n"
        "._306:\n"
        "	cmp	r0, #0x3\n"
        "	bne	._341	@cond_branch\n"
        "._308:\n"
        "	ldr	r0, ._314\n"
        "	b	._333\n"
        "._315:\n"
        "	.align	2, 0\n"
        "._314:\n"
        "	.word	gPlayerParty+0xc8\n"
        "._307:\n"
        "	ldr	r0, ._317\n"
        "	b	._333\n"
        "._318:\n"
        "	.align	2, 0\n"
        "._317:\n"
        "	.word	gPlayerParty+0x1f4\n"
        "._305:\n"
        "	ldr	r2, ._322\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	mov	r3, #0x1\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._319	@cond_branch\n"
        "	mov	r1, r8\n"
        "	add	r0, r1, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._320	@cond_branch\n"
        "	b	._324\n"
        "._323:\n"
        "	.align	2, 0\n"
        "._322:\n"
        "	.word	gLinkPlayers\n"
        "._319:\n"
        "	mov	r1, r8\n"
        "	add	r0, r1, r2\n"
        "	ldrh	r1, [r0, #0x18]\n"
        "	add	r0, r3, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._324	@cond_branch\n"
        "._320:\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r2, [r0, #0x18]\n"
        "	cmp	r2, #0x2\n"
        "	bgt	._325	@cond_branch\n"
        "	cmp	r2, #0x1\n"
        "	bge	._326	@cond_branch\n"
        "	cmp	r2, #0\n"
        "	beq	._327	@cond_branch\n"
        "	b	._341\n"
        "._325:\n"
        "	cmp	r2, #0x3\n"
        "	bne	._341	@cond_branch\n"
        "._327:\n"
        "	ldr	r0, ._331\n"
        "	b	._333\n"
        "._332:\n"
        "	.align	2, 0\n"
        "._331:\n"
        "	.word	gPlayerParty+0xc8\n"
        "._326:\n"
        "	ldr	r0, ._334\n"
        "	b	._333\n"
        "._335:\n"
        "	.align	2, 0\n"
        "._334:\n"
        "	.word	gPlayerParty+0x1f4\n"
        "._324:\n"
        "	add	r0, r7, r2\n"
        "	ldrh	r2, [r0, #0x18]\n"
        "	cmp	r2, #0x2\n"
        "	bgt	._336	@cond_branch\n"
        "	cmp	r2, #0x1\n"
        "	bge	._337	@cond_branch\n"
        "	cmp	r2, #0\n"
        "	beq	._338	@cond_branch\n"
        "	b	._341\n"
        "._336:\n"
        "	cmp	r2, #0x3\n"
        "	bne	._341	@cond_branch\n"
        "._338:\n"
        "	ldr	r0, ._342\n"
        "._333:\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0x64\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "	b	._341\n"
        "._343:\n"
        "	.align	2, 0\n"
        "._342:\n"
        "	.word	gEnemyParty+0xc8\n"
        "._337:\n"
        "	ldr	r0, ._346\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0x64\n"
        "	bl	gScriptFuncs_End+0x5bc4\n"
        "._341:\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r5, r5, r0\n"
        "	add	r7, r7, #0x1c\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x3\n"
        "	ble	._344	@cond_branch\n"
        "	ldr	r4, ._346 + 4\n"
        "	add	r0, r4, #0\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0x64\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xc8\n"
        "	bl	shedinja_something\n"
        "	mov	r1, #0x96\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r4, r1\n"
        "	bl	shedinja_something\n"
        "	mov	r7, #0xc8\n"
        "	lsl	r7, r7, #0x1\n"
        "	add	r0, r4, r7\n"
        "	bl	shedinja_something\n"
        "	mov	r1, #0xfa\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r4, r1\n"
        "	bl	shedinja_something\n"
        "	ldr	r4, ._346 + 8\n"
        "	add	r0, r4, #0\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0x64\n"
        "	bl	shedinja_something\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xc8\n"
        "	bl	shedinja_something\n"
        "	sub	r7, r7, #0x64\n"
        "	add	r0, r4, r7\n"
        "	bl	shedinja_something\n"
        "	mov	r1, #0xc8\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r4, r1\n"
        "	bl	shedinja_something\n"
        "	add	r7, r7, #0xc8\n"
        "	add	r0, r4, r7\n"
        "	bl	shedinja_something\n"
        "._300:\n"
        "	ldr	r1, ._346 + 12\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._352\n"
        "._347:\n"
        "	.align	2, 0\n"
        "._346:\n"
        "	.word	gEnemyParty+0x1f4\n"
        "	.word	gPlayerParty\n"
        "	.word	gEnemyParty\n"
        "	.word	gBattleCommunication\n"
        "._197:\n"
        "	bl	sub_800B950\n"
        "	ldr	r0, ._349\n"
        "	ldrb	r1, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	mov	r2, #0x0\n"
        "	strb	r1, [r0]\n"
        "	strb	r2, [r0, #0x1]\n"
        "	strb	r2, [r0, #0x2]\n"
        "	b	._352\n"
        "._350:\n"
        "	.align	2, 0\n"
        "._349:\n"
        "	.word	gBattleCommunication\n"
        "._198:\n"
        "	ldr	r0, ._353\n"
        "	add	r1, r0, #1\n"
        "	bl	battle_load_something\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._352	@cond_branch\n"
        "	ldr	r2, ._353 + 4\n"
        "	ldr	r1, ._353 + 8\n"
        "	ldr	r0, [r1]\n"
        "	str	r0, [r2]\n"
        "	ldr	r0, ._353 + 12\n"
        "	str	r0, [r1]\n"
        "	ldr	r0, ._353 + 16\n"
        "	bl	SetMainCallback2\n"
        "	ldr	r3, ._353 + 20\n"
        "	ldrh	r2, [r3]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r2\n"
        "	cmp	r0, #0\n"
        "	beq	._352	@cond_branch\n"
        "	ldr	r1, ._353 + 24\n"
        "	mov	r4, #0x80\n"
        "	lsl	r4, r4, #0x4\n"
        "	add	r0, r4, #0\n"
        "	strh	r0, [r1]\n"
        "	mov	r0, #0x20\n"
        "	orr	r0, r0, r2\n"
        "	strh	r0, [r3]\n"
        "._352:\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._354:\n"
        "	.align	2, 0\n"
        "._353:\n"
        "	.word	gUnknown_02024D1F\n"
        "	.word	gPreBattleCallback1\n"
        "	.word	gMain\n"
        "	.word	debug_sub_80139E4+1\n"
        "	.word	sub_800F808+1\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gTrainerBattleOpponent\n"
        "\n"
    );
}
#else
void sub_800F298(void)
{
    u8 playerId;
    s32 id;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    switch (gBattleCommunication[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
        {
            ewram0.unk0 = 1;
            ewram0.unk1 = 1;
            sub_800E9EC();
            sub_800EAAC();
            SendBlock(bitmask_all_link_players_but_self(), ewram, 0x20);
            gBattleCommunication[0]++;
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            u8 taskId;

            ResetBlockReceivedFlags();
            id = 0;
            if (gBlockRecvBuffer[0][0] == 0x100)
            {
                if (playerId == 0)
                    gBattleTypeFlags |= 12;
                else
                    gBattleTypeFlags |= 8;
                id++;
            }
            if (id == 0)
            {
                s32 i;

                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    if (gBlockRecvBuffer[0][0] != gBlockRecvBuffer[i][0])
                        break;
                }
                if (i == MAX_LINK_PLAYERS)
                {
                    if (playerId == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                    id++;
                }
                if (id == 0)
                {
                    while (id < MAX_LINK_PLAYERS)
                    {
                        if (gBlockRecvBuffer[id][0] == 0x0101 && id != playerId)
                            if (id < playerId)
                                break;
                        if (gBlockRecvBuffer[id][0] > 0x0101 && id != playerId)
                            break;
                        id++;
                    }
                    if (id == MAX_LINK_PLAYERS)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
            }
            sub_800EB08();
            memcpy(ewram1D000, gPlayerParty, sizeof(struct Pokemon) * 3);
            taskId = CreateTask(sub_800DE30, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = 0;
            gTasks[taskId].data[4] = 0;
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                switch (gLinkPlayers[id].lp_field_18)
                {
                case 0:
                    gTasks[taskId].data[3] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 1:
                    gTasks[taskId].data[4] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 2:
                    gTasks[taskId].data[3] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                case 3:
                    gTasks[taskId].data[4] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                }
            }
            ZeroPlayerPartyMons();
            ZeroEnemyPartyMons();
            gBattleCommunication[0]++;
            goto step_2;
        }
        break;
    case 2:
      step_2:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), ewram1D000, sizeof(struct Pokemon) * 2);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerId)
                {
                    switch (gLinkPlayers[id].lp_field_18)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[id].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                }
            }
            gBattleCommunication[0]++;
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), ewram1D000 + 2, sizeof(struct Pokemon));
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerId)
                {
                    switch (gLinkPlayers[id].lp_field_18)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[id].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                }
            }

            shedinja_something(&gPlayerParty[0]);
            shedinja_something(&gPlayerParty[1]);
            shedinja_something(&gPlayerParty[2]);
            shedinja_something(&gPlayerParty[3]);
            shedinja_something(&gPlayerParty[4]);
            shedinja_something(&gPlayerParty[5]);

            shedinja_something(&gEnemyParty[0]);
            shedinja_something(&gEnemyParty[1]);
            shedinja_something(&gEnemyParty[2]);
            shedinja_something(&gEnemyParty[3]);
            shedinja_something(&gEnemyParty[4]);
            shedinja_something(&gEnemyParty[5]);

            gBattleCommunication[0]++;
        }
        break;
    case 6:
        sub_800B950();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        gBattleCommunication[2] = 0;
        break;
    case 7:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gPreBattleCallback1 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(sub_800F808);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                gTrainerBattleOpponent = 0x800;
                gBattleTypeFlags |= BATTLE_TYPE_20;
            }
        }
        break;
    }
}
#endif

#ifdef DEBUG
__attribute__((naked))
void sub_800F808()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	ldr	r4, ._358\n"
        "	ldrh	r2, [r4, #0x2c]\n"
        "	mov	r1, #0x82\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r1, #0\n"
        "	and	r0, r0, r2\n"
        "	cmp	r0, r1\n"
        "	bne	._357	@cond_branch\n"
        "	ldr	r2, ._358 + 4\n"
        "	ldr	r1, ._358 + 8\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r2]\n"
        "	ldr	r0, ._358 + 12\n"
        "	add	r2, r4, r0\n"
        "	ldrb	r1, [r2]\n"
        "	mov	r0, #0x3\n"
        "	neg	r0, r0\n"
        "	and	r0, r0, r1\n"
        "	strb	r0, [r2]\n"
        "	ldr	r1, ._358 + 16\n"
        "	mov	r0, #0x3\n"
        "	strb	r0, [r1, #0x15]\n"
        "	ldr	r0, ._358 + 20\n"
        "	ldr	r0, [r0]\n"
        "	str	r0, [r4]\n"
        "	bl	ZeroEnemyPartyMons\n"
        "	mov	r0, #0x5a\n"
        "	bl	gScriptFuncs_End+0x148c\n"
        "	ldr	r0, ._358 + 24\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._356	@cond_branch\n"
        "	ldr	r0, ._358 + 28\n"
        "	bl	SetMainCallback2\n"
        "	b	._357\n"
        "._359:\n"
        "	.align	2, 0\n"
        "._358:\n"
        "	.word	gMain\n"
        "	.word	gScriptResult\n"
        "	.word	gBattleOutcome\n"
        "	.word	0x43d\n"
        "	.word	gUnknown_03004DC0\n"
        "	.word	gPreBattleCallback1\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	sub_805465C+1\n"
        "._356:\n"
        "	ldr	r0, [r4, #0x8]\n"
        "	bl	SetMainCallback2\n"
        "._357:\n"
        "	ldr	r5, ._361\n"
        "	ldrh	r1, [r5]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._360	@cond_branch\n"
        "	lsr	r0, r1, #0x2\n"
        "	mov	r4, #0x1\n"
        "	and	r0, r0, r4\n"
        "	str	r4, [sp]\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x1\n"
        "	bl	debug_sub_8008264\n"
        "	ldrh	r0, [r5]\n"
        "	lsr	r0, r0, #0x2\n"
        "	and	r0, r0, r4\n"
        "	str	r4, [sp]\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x15\n"
        "	mov	r3, #0x1\n"
        "	bl	debug_sub_8008264\n"
        "	ldrh	r0, [r5]\n"
        "	lsr	r0, r0, #0x2\n"
        "	and	r0, r0, r4\n"
        "	str	r4, [sp]\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x29\n"
        "	mov	r3, #0x1\n"
        "	bl	debug_sub_8008264\n"
        "._360:\n"
        "	ldr	r0, ._361 + 4\n"
        "	bl	sub_800374C\n"
        "	bl	UpdatePaletteFade\n"
        "	bl	RunTasks\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._362:\n"
        "	.align	2, 0\n"
        "._361:\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gUnknown_03004210\n"
        "\n"
    );
}
#else
void sub_800F808(void)
{
    AnimateSprites();
    BuildOamBuffer();
    sub_800374C(&gUnknown_03004210);
    UpdatePaletteFade();
    RunTasks();
}
#endif

void sub_800F828(struct Sprite *sprite)
{
    sprite->data0 = 0;
    sprite->callback = sub_800F838;
}

void sub_800F838(struct Sprite *sprite)
{
    u16 *arr = (u16 *)ewram;

    switch (sprite->data0)
    {
    case 0:
        sprite->data0++;
        sprite->data1 = 0;
        sprite->data2 = 0x281;
        sprite->data3 = 0;
        sprite->data4 = 1;
        // fall through
    case 1:
        sprite->data4--;
        if (sprite->data4 == 0)
        {
            s32 i;
            s32 r2;
            s32 r0;

            sprite->data4 = 2;
            r2 = sprite->data1 + sprite->data3 * 32;
            r0 = sprite->data2 - sprite->data3 * 32;
            for (i = 0; i < 29; i += 2)
            {
                arr[r2 + i] = 0x3D;
                arr[r0 + i] = 0x3D;
            }
            sprite->data3++;
            if (sprite->data3 == 21)
            {
                sprite->data0++;
                sprite->data1 = 32;
            }
        }
        break;
    case 2:
        sprite->data1--;
        if (sprite->data1 == 20)
            SetMainCallback2(sub_800E7C4);
        break;
    }
}

u8 CreateNPCTrainerParty(struct Pokemon *party, u16 trainerNum)
{
    u32 nameHash = 0;
    s32 i;

    if (trainerNum == 0x400)
        return 0;

    if ((gBattleTypeFlags & 0x908) == 8)
    {
        ZeroEnemyPartyMons();
        for (i = 0; i < gTrainers[trainerNum].partySize; i++)
        {
            u32 personalityValue;
            s32 j;
            u8 fixedIV;

            if (gTrainers[trainerNum].doubleBattle == TRUE)
                personalityValue = 0x80;
            else if (gTrainers[trainerNum].encounterMusic_gender & 0x80)
                personalityValue = 0x78;
            else
                personalityValue = 0x88;

            for (j = 0; gTrainers[trainerNum].trainerName[j] != 0xFF; j++)
                nameHash += gTrainers[trainerNum].trainerName[j];

            switch (gTrainers[trainerNum].partyFlags)
            {
            case 0:
            {
                struct TrainerPartyMember0 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);
                break;
            }
            case 1:
            {
                struct TrainerPartyMember1 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                for (j = 0; j < 4; j++)
                {
                    SetMonData(&party[i], MON_DATA_MOVE1 + j, (u8 *)&partyData[i].moves[j]);
                    SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                }
                break;
            }
            case 2:
            {
                struct TrainerPartyMember2 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                SetMonData(&party[i], MON_DATA_HELD_ITEM, (u8 *)&partyData[i].heldItem);
                break;
            }
            case 3:
            {
                struct TrainerPartyMember3 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                SetMonData(&party[i], MON_DATA_HELD_ITEM, (u8 *)&partyData[i].heldItem);
                for (j = 0; j < 4; j++)
                {
                    SetMonData(&party[i], MON_DATA_MOVE1 + j, (u8 *)&partyData[i].moves[j]);
                    SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                }
                break;
            }
            }
        }
        gBattleTypeFlags |= gTrainers[trainerNum].doubleBattle;
    }
    return gTrainers[trainerNum].partySize;
}

void sub_800FCD4(void)
{
    if (REG_VCOUNT < 0xA0 && REG_VCOUNT >= 0x6F )
        REG_BG0CNT = 0x9800;
}

void sub_800FCFC(void)
{
    Random();  // unused return value
    REG_BG0HOFS = gUnknown_030042A4;
    REG_BG0VOFS = gUnknown_030042A0;
    REG_BG1HOFS = gUnknown_030042C0;
    REG_BG1VOFS = gUnknown_030041B4;
    REG_BG2HOFS = gUnknown_03004288;
    REG_BG2VOFS = gUnknown_03004280;
    REG_BG3HOFS = gUnknown_030041B0;
    REG_BG3VOFS = gUnknown_030041B8;
    REG_WIN0H = gUnknown_030042C4;
    REG_WIN0V = gUnknown_03004240;
    REG_WIN1H = gUnknown_03004200;
    REG_WIN1V = gUnknown_03004244;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8089668();
}

void nullsub_36(struct Sprite *sprite)
{
}

void sub_800FDB0(struct Sprite *sprite)
{
    if (sprite->data0 != 0)
        sprite->pos1.x = sprite->data1 + ((sprite->data2 & 0xFF00) >> 8);
    else
        sprite->pos1.x = sprite->data1 - ((sprite->data2 & 0xFF00) >> 8);
    sprite->data2 += 0x180;
    if (sprite->affineAnimEnded)
    {
        FreeSpriteTilesByTag(0x2710);
        FreeSpritePaletteByTag(0x2710);
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void sub_800FE20(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_800FDB0;
    PlaySE(SE_BT_START);
}

void sub_800FE40(u8 taskId)
{
    struct Pokemon *sp4 = NULL;
    struct Pokemon *sp8 = NULL;
    u8 r2 = ewram160CB;
    u32 r7;
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        switch (gLinkPlayers[r2].lp_field_18)
        {
        case 0:
        case 2:
            sp4 = gPlayerParty;
            sp8 = gEnemyParty;
            break;
        case 1:
        case 3:
            sp4 = gEnemyParty;
            sp8 = gPlayerParty;
            break;
        }
    }
    else
    {
        sp4 = gPlayerParty;
        sp8 = gEnemyParty;
    }

    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&sp4[i], MON_DATA_SPECIES2);
        u16 hp = GetMonData(&sp4[i], MON_DATA_HP);
        u32 status = GetMonData(&sp4[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r7 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r7 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[taskId].data[3] = r7;

    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&sp8[i], MON_DATA_SPECIES2);
        u16 hp = GetMonData(&sp8[i], MON_DATA_HP);
        u32 status = GetMonData(&sp8[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r7 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r7 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[taskId].data[4] = r7;
}

void c2_8011A1C(void)
{
    s32 i;
    u8 taskId;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);
    CpuFill32(0, (void *)VRAM, VRAM_SIZE);
    REG_MOSAIC = 0;
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0x5051;
    REG_WININ = 0;
    REG_WINOUT = 0;
    gUnknown_030042C4 = 0xF0;
    gUnknown_03004240 = 0x5051;
    dp12_8087EA4();

    for (i = 0; i < 80; i++)
    {
        gUnknown_03004DE0.unk0[i] = 0xF0;
        gUnknown_03004DE0.unk780[i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gUnknown_03004DE0.unk0[i] = 0xFF10;
        gUnknown_03004DE0.unk780[i] = 0xFF10;
    }
    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;

    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    InitWindowFromConfig(&gUnknown_030041D0, &gWindowConfig_81E71D0);
    InitWindowFromConfig(&gUnknown_03004250, &gWindowConfig_81E71EC);
    sub_800D6D4();
    LoadCompressedPalette(gUnknown_08D004E0, 0, 64);
    sub_800D74C();
    ResetSpriteData();
    ResetTasks();
    sub_800E23C();
    REG_WINOUT = 0x37;
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    taskId = CreateTask(sub_800DE30, 0);
    gTasks[taskId].data[1] = 0x10E;
    gTasks[taskId].data[2] = 0x5A;
    gTasks[taskId].data[5] = 1;
    sub_800FE40(taskId);
    SetMainCallback2(sub_80101B8);
    gBattleCommunication[0] = 0;
}

void sub_80101B8(void)
{
    c2_081284E0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    RunTasks();
}

void c2_081284E0(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        gBattleCommunication[1] = 0xFF;
        gBattleCommunication[0]++;
        break;
    case 1:
        gBattleCommunication[1]--;
        if (gBattleCommunication[1] == 0)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(gMain.savedCallback);
        break;
    }
}

__attribute__((naked))
void debug_sub_8010800()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8010818\n"
        "	bl	debug_sub_80108B8\n"
        "	ldr	r1, ._496\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [r1]\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._497:\n"
        "	.align	2, 0\n"
        "._496:\n"
        "	.word	gBattleBuffersTransferData+0x100\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8010818()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	ldr	r1, ._501\n"
        "	ldr	r0, ._501 + 4\n"
        "	strh	r0, [r1]\n"
        "	add	r2, r1, #0\n"
        "	add	r2, r2, #0x46\n"
        "	strh	r0, [r2]\n"
        "	ldr	r0, ._501 + 8\n"
        "	add	r4, r1, #0\n"
        "	add	r4, r4, #0x48\n"
        "	add	r3, r0, #0\n"
        "	add	r3, r3, #0x12\n"
        "	add	r2, r1, #2\n"
        "	mov	r1, #0x1d\n"
        "._498:\n"
        "	ldrh	r0, [r3]\n"
        "	strh	r0, [r2]\n"
        "	strh	r0, [r4]\n"
        "	add	r4, r4, #0x2\n"
        "	add	r3, r3, #0xa\n"
        "	add	r2, r2, #0x2\n"
        "	sub	r1, r1, #0x1\n"
        "	cmp	r1, #0\n"
        "	bge	._498	@cond_branch\n"
        "	mov	r1, #0x0\n"
        "	ldr	r4, ._501 + 12\n"
        "	ldr	r7, ._501 + 16\n"
        "	ldr	r6, ._501 + 20\n"
        "	mov	r0, #0x30\n"
        "	add	r0, r0, r7\n"
        "	mov	ip, r0\n"
        "._500:\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r4]\n"
        "	add	r5, r1, #1\n"
        "	lsl	r3, r1, #0x3\n"
        "._499:\n"
        "	ldrb	r2, [r4]\n"
        "	lsl	r1, r2, #0x1\n"
        "	add	r1, r1, r3\n"
        "	add	r1, r1, r7\n"
        "	lsl	r0, r2, #0x2\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r6\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	ldrb	r2, [r4]\n"
        "	lsl	r1, r2, #0x1\n"
        "	add	r1, r1, r3\n"
        "	add r1, r1, ip\n"
        "	lsl	r0, r2, #0x2\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r6\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	ldrb	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x3\n"
        "	bls	._499	@cond_branch\n"
        "	add	r1, r5, #0\n"
        "	cmp	r1, #0x5\n"
        "	ble	._500	@cond_branch\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._502:\n"
        "	.align	2, 0\n"
        "._501:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	0x115\n"
        "	.word	UnkDebug0+0x6c\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	gUnknown_02023A14+0xde\n"
        "	.word	UnkDebug0+0x1b4\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80108B8()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	bl	gScriptFuncs_End+0x19f4\n"
        "	mov	r0, #0x0\n"
        "	bl	SetHBlankCallback\n"
        "	mov	r0, #0x0\n"
        "	bl	SetVBlankCallback\n"
        "	mov	r3, #0x0\n"
        "	str	r3, [sp]\n"
        "	ldr	r2, ._507\n"
        "	mov	r0, sp\n"
        "	str	r0, [r2]\n"
        "	mov	r1, #0xc0\n"
        "	lsl	r1, r1, #0x13\n"
        "	str	r1, [r2, #0x4]\n"
        "	ldr	r0, ._507 + 4\n"
        "	str	r0, [r2, #0x8]\n"
        "	ldr	r0, [r2, #0x8]\n"
        "	ldr	r2, ._507 + 8\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r2]\n"
        "	mov	r2, #0x80\n"
        "	lsl	r2, r2, #0x13\n"
        "	mov	r4, #0x9a\n"
        "	lsl	r4, r4, #0x5\n"
        "	add	r0, r4, #0\n"
        "	strh	r0, [r2]\n"
        "	ldr	r0, ._507 + 12\n"
        "	mov	r5, #0x0\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 16\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 20\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 24\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 28\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 32\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 36\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 40\n"
        "	strh	r3, [r0]\n"
        "	add	r2, r2, #0x8\n"
        "	ldr	r4, ._507 + 44\n"
        "	add	r0, r4, #0\n"
        "	strh	r0, [r2]\n"
        "	add	r2, r2, #0x2\n"
        "	ldr	r4, ._507 + 48\n"
        "	add	r0, r4, #0\n"
        "	strh	r0, [r2]\n"
        "	ldr	r0, ._507 + 52\n"
        "	strh	r3, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	strh	r3, [r0]\n"
        "	ldr	r0, ._507 + 56\n"
        "	bl	LZDecompressVram\n"
        "	ldr	r0, ._507 + 60\n"
        "	ldr	r1, ._507 + 64\n"
        "	bl	sub_800D238\n"
        "	ldr	r4, ._507 + 68\n"
        "	mov	r1, #0xa0\n"
        "	lsl	r1, r1, #0x13\n"
        "	add	r0, r4, #0\n"
        "	bl	LZDecompressVram\n"
        "	ldr	r1, ._507 + 72\n"
        "	add	r0, r4, #0\n"
        "	bl	LZDecompressVram\n"
        "	bl	gScriptFuncs_End+0x1a70\n"
        "	ldr	r0, ._507 + 76\n"
        "	bl	SetVBlankCallback\n"
        "	ldr	r0, ._507 + 80\n"
        "	bl	SetMainCallback2\n"
        "	bl	ResetTasks\n"
        "	bl	ResetSpriteData\n"
        "	bl	remove_some_task\n"
        "	ldr	r4, ._507 + 84\n"
        "	add	r0, r4, #0\n"
        "	bl	SetUpWindowConfig\n"
        "	ldr	r0, ._507 + 88\n"
        "	add	r1, r4, #0\n"
        "	bl	InitWindowFromConfig\n"
        "	ldr	r0, ._507 + 92\n"
        "	strb	r5, [r0]\n"
        "	ldr	r0, ._507 + 96\n"
        "	strb	r5, [r0]\n"
        "	ldr	r0, ._507 + 100\n"
        "	strb	r5, [r0]\n"
        "	mov	r4, #0x0\n"
        "._503:\n"
        "	lsl	r0, r4, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x1e\n"
        "	ble	._503	@cond_branch\n"
        "	ldr	r1, ._507 + 104\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	add	r4, r1, #0\n"
        "._504:\n"
        "	bl	debug_sub_8012294\n"
        "	ldrb	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x3\n"
        "	bls	._504	@cond_branch\n"
        "	ldr	r0, ._507 + 100\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "	bl	debug_sub_8012540\n"
        "	bl	debug_nullsub_3\n"
        "	ldr	r1, ._507 + 104\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	bl	debug_sub_80125A0\n"
        "	ldr	r0, ._507 + 108\n"
        "	add	r0, r0, #0x44\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	cmp	r0, #0x8\n"
        "	bne	._505	@cond_branch\n"
        "	bl	debug_sub_801174C\n"
        "	b	._506\n"
        "._508:\n"
        "	.align	2, 0\n"
        "._507:\n"
        "	.word	0x40000d4\n"
        "	.word	0x85006000\n"
        "	.word	0x4000200\n"
        "	.word	gUnknown_030042A4\n"
        "	.word	gUnknown_030042A0\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_030041B4\n"
        "	.word	gUnknown_03004288\n"
        "	.word	gUnknown_03004280\n"
        "	.word	gUnknown_030041B0\n"
        "	.word	gUnknown_030041B8\n"
        "	.word	0x1f09\n"
        "	.word	0x4801\n"
        "	.word	0x4000050\n"
        "	.word	gMonShinyPalette_CircledQuestionMark+0x18\n"
        "	.word	gMonShinyPalette_CircledQuestionMark+0x834\n"
        "	.word	+0x2000000\n"
        "	.word	gMonShinyPalette_CircledQuestionMark+0xa8c\n"
        "	.word	0x50001e0\n"
        "	.word	debug_sub_8011D40+1\n"
        "	.word	debug_sub_8010CAC+1\n"
        "	.word	gWindowConfig_81E6C3C\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._505:\n"
        "	ldr	r0, ._510\n"
        "	mov	r1, #0x0\n"
        "	mov	r4, #0x7\n"
        "	ldr	r2, ._510 + 4\n"
        "	add	r0, r0, r2\n"
        "._509:\n"
        "	strb	r1, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	sub	r4, r4, #0x1\n"
        "	cmp	r4, #0\n"
        "	bge	._509	@cond_branch\n"
        "._506:\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._511:\n"
        "	.align	2, 0\n"
        "._510:\n"
        "	.word	+0x2000000\n"
        "	.word	0x160bb\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8010A7C()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	lsl	r1, r1, #0x18\n"
        "	lsr	r2, r1, #0x18\n"
        "	mov	r1, #0x0\n"
        "	ldr	r5, ._514\n"
        "	cmp	r1, r2\n"
        "	bge	._512	@cond_branch\n"
        "	add	r3, r5, #0\n"
        "._513:\n"
        "	add	r0, r1, r3\n"
        "	strb	r4, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, r2\n"
        "	blt	._513	@cond_branch\n"
        "._512:\n"
        "	add	r1, r1, r5\n"
        "	mov	r0, #0xff\n"
        "	strb	r0, [r1]\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._515:\n"
        "	.align	2, 0\n"
        "._514:\n"
        "	.word	gBattleTextBuff1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8010AAC()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	ip, r0\n"
        "	ldr	r6, ._520\n"
        "	ldr	r4, ._520 + 4\n"
        "	ldr	r5, ._520 + 8\n"
        "	ldrb	r1, [r5]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r7, r0, r1\n"
        "	lsl	r1, r7, #0x1\n"
        "	ldr	r3, ._520 + 12\n"
        "	ldrb	r2, [r3]\n"
        "	mov	r0, #0x46\n"
        "	mul	r2, r2, r0\n"
        "	add	r1, r1, r2\n"
        "	add	r1, r1, r4\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r1, r0]\n"
        "	lsl	r0, r1, #0x3\n"
        "	sub	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r6\n"
        "	ldrb	r0, [r0, #0x10]\n"
        "	add	r6, r3, #0\n"
        "	cmp	r0, #0xfe\n"
        "	beq	._516	@cond_branch\n"
        "	cmp	r0, #0xfe\n"
        "	bgt	._517	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._518	@cond_branch\n"
        "	b	._523\n"
        "._521:\n"
        "	.align	2, 0\n"
        "._520:\n"
        "	.word	gBaseStats\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "._517:\n"
        "	cmp	r0, #0xff\n"
        "	beq	._522	@cond_branch\n"
        "	b	._523\n"
        "._518:\n"
        "	add	r0, r7, #4\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r2\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, #0x2\n"
        "	b	._528\n"
        "._516:\n"
        "	add	r0, r7, #4\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r2\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, #0x3\n"
        "	b	._528\n"
        "._522:\n"
        "	add	r0, r7, #4\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r2\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, #0x4\n"
        "	b	._528\n"
        "._523:\n"
        "	ldrb	r0, [r5]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, #0x4\n"
        "	lsl	r1, r1, #0x1\n"
        "	ldrb	r0, [r6]\n"
        "	mov	r3, #0x46\n"
        "	mul	r0, r0, r3\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r4\n"
        "	ldrh	r2, [r1]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r2\n"
        "	strh	r0, [r1]\n"
        "	mov	r1, ip\n"
        "	cmp	r1, #0\n"
        "	beq	._527	@cond_branch\n"
        "	ldrb	r1, [r5]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, #0x4\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldrb	r1, [r6]\n"
        "	mul	r1, r1, r3\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, r4\n"
        "	ldrh	r1, [r0]\n"
        "	mov	r2, #0x1\n"
        "	eor	r1, r1, r2\n"
        "	b	._528\n"
        "._527:\n"
        "	ldrb	r1, [r5]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, #0x4\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldrb	r1, [r6]\n"
        "	mul	r1, r1, r3\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, ip\n"
        "._528:\n"
        "	strh	r1, [r0]\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8010B80()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r9\n"
        "	mov	r6, r8\n"
        "	push	{r6, r7}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	mov	r0, #0x0\n"
        "	mov	ip, r0\n"
        "	ldr	r4, ._534\n"
        "	ldr	r1, ._534 + 4\n"
        "	mov	r8, r1\n"
        "	ldr	r5, ._534 + 8\n"
        "	ldrb	r1, [r5]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, r8\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r3, ._534 + 12\n"
        "	ldrb	r2, [r3]\n"
        "	mov	r1, #0x46\n"
        "	mul	r1, r1, r2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, r4\n"
        "	ldrb	r7, [r0]\n"
        "	lsl	r1, r7, #0x18\n"
        "	asr	r0, r1, #0x18\n"
        "	mov	r9, r4\n"
        "	add	r2, r5, #0\n"
        "	add	r4, r3, #0\n"
        "	cmp	r0, #0x9\n"
        "	ble	._529	@cond_branch\n"
        "._530:\n"
        "	mov	r3, #0xf6\n"
        "	lsl	r3, r3, #0x18\n"
        "	add	r0, r1, r3\n"
        "	lsr	r7, r0, #0x18\n"
        "	mov	r1, ip\n"
        "	lsl	r0, r1, #0x18\n"
        "	mov	r3, #0x80\n"
        "	lsl	r3, r3, #0x11\n"
        "	add	r0, r0, r3\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	ip, r0\n"
        "	lsl	r1, r7, #0x18\n"
        "	asr	r0, r1, #0x18\n"
        "	cmp	r0, #0x9\n"
        "	bgt	._530	@cond_branch\n"
        "._529:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r6\n"
        "	cmp	r0, #0\n"
        "	beq	._531	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r6\n"
        "	cmp	r0, #0\n"
        "	beq	._532	@cond_branch\n"
        "	mov	r1, ip\n"
        "	lsl	r0, r1, #0x18\n"
        "	mov	r3, #0x80\n"
        "	lsl	r3, r3, #0x11\n"
        "	b	._533\n"
        "._535:\n"
        "	.align	2, 0\n"
        "._534:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "._532:\n"
        "	mov	r1, ip\n"
        "	lsl	r0, r1, #0x18\n"
        "	mov	r3, #0xff\n"
        "	lsl	r3, r3, #0x18\n"
        "._533:\n"
        "	add	r0, r0, r3\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	ip, r0\n"
        "	mov	r1, ip\n"
        "	lsl	r0, r1, #0x18\n"
        "	cmp	r0, #0\n"
        "	bge	._536	@cond_branch\n"
        "	mov	r3, #0x9\n"
        "	mov	ip, r3\n"
        "._536:\n"
        "	mov	r1, ip\n"
        "	lsl	r0, r1, #0x18\n"
        "	asr	r0, r0, #0x18\n"
        "	cmp	r0, #0x9\n"
        "	ble	._542	@cond_branch\n"
        "	mov	r3, #0x0\n"
        "	mov	ip, r3\n"
        "	b	._542\n"
        "._531:\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r6\n"
        "	cmp	r0, #0\n"
        "	beq	._539	@cond_branch\n"
        "	lsl	r0, r7, #0x18\n"
        "	mov	r1, #0x80\n"
        "	lsl	r1, r1, #0x11\n"
        "	add	r0, r0, r1\n"
        "	b	._540\n"
        "._539:\n"
        "	lsl	r0, r7, #0x18\n"
        "	mov	r3, #0xff\n"
        "	lsl	r3, r3, #0x18\n"
        "	add	r0, r0, r3\n"
        "._540:\n"
        "	lsr	r7, r0, #0x18\n"
        "	lsl	r0, r7, #0x18\n"
        "	cmp	r0, #0\n"
        "	bgt	._541	@cond_branch\n"
        "	mov	r7, #0x9\n"
        "._541:\n"
        "	lsl	r0, r7, #0x18\n"
        "	asr	r0, r0, #0x18\n"
        "	cmp	r0, #0x9\n"
        "	ble	._542	@cond_branch\n"
        "	mov	r7, #0x1\n"
        "._542:\n"
        "	ldrb	r0, [r2]\n"
        "	lsl	r2, r0, #0x2\n"
        "	add	r2, r2, r0\n"
        "	mov	r0, r8\n"
        "	ldrb	r0, [r0]\n"
        "	add	r2, r2, r0\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldrb	r1, [r4]\n"
        "	mov	r0, #0x1\n"
        "	eor	r0, r0, r1\n"
        "	mov	r1, #0x46\n"
        "	add	r3, r0, #0\n"
        "	mul	r3, r3, r1\n"
        "	add	r3, r2, r3\n"
        "	add r3, r3, r9\n"
        "	ldrb	r0, [r4]\n"
        "	mul	r0, r0, r1\n"
        "	add	r2, r2, r0\n"
        "	add r2, r2, r9\n"
        "	mov	r1, ip\n"
        "	lsl	r0, r1, #0x18\n"
        "	asr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x1\n"
        "	lsl	r0, r7, #0x18\n"
        "	asr	r0, r0, #0x18\n"
        "	add	r0, r0, r1\n"
        "	strh	r0, [r2]\n"
        "	strh	r0, [r3]\n"
        "	pop	{r3, r4}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8010CAC()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r8\n"
        "	push	{r7}\n"
        "	add	sp, sp, #0xfffffff0\n"
        "	ldr	r4, ._553\n"
        "	ldrh	r1, [r4, #0x28]\n"
        "	mov	r0, #0x81\n"
        "	lsl	r0, r0, #0x2\n"
        "	cmp	r1, r0\n"
        "	bne	._543	@cond_branch\n"
        "	bl	DoSoftReset\n"
        "._543:\n"
        "	ldrh	r0, [r4, #0x2a]\n"
        "	cmp	r0, #0x4\n"
        "	beq	._544	@cond_branch\n"
        "	b	._559\n"
        "._544:\n"
        "	ldr	r0, ._553 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r8, r0\n"
        "	cmp	r1, #0x5\n"
        "	bhi	._546	@cond_branch\n"
        "	ldr	r0, ._553 + 8\n"
        "	mov	r1, #0x0\n"
        "	strb	r1, [r0]\n"
        "	bl	debug_sub_8012628\n"
        "	ldr	r0, ._553 + 12\n"
        "	bl	SetMainCallback2\n"
        "._546:\n"
        "	ldr	r0, ._553 + 16\n"
        "	ldrb	r3, [r0]\n"
        "	cmp	r3, #0\n"
        "	bne	._555	@cond_branch\n"
        "	mov	r1, r8\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x6\n"
        "	bne	._555	@cond_branch\n"
        "	ldr	r0, ._553 + 20\n"
        "	str	r0, [r4, #0x8]\n"
        "	ldr	r4, ._553 + 24\n"
        "	ldr	r0, ._553 + 28\n"
        "	ldrh	r1, [r0]\n"
        "	ldrb	r2, [r0, #0x2]\n"
        "	str	r3, [sp]\n"
        "	str	r3, [sp, #0x4]\n"
        "	str	r3, [sp, #0x8]\n"
        "	str	r3, [sp, #0xc]\n"
        "	add	r0, r4, #0\n"
        "	mov	r3, #0x20\n"
        "	bl	CreateMon\n"
        "	mov	r5, #0x0\n"
        "	add	r6, r4, #0\n"
        "._549:\n"
        "	add	r1, r5, #0\n"
        "	add	r1, r1, #0xd\n"
        "	lsl	r4, r5, #0x1\n"
        "	ldr	r0, ._553 + 32\n"
        "	add	r4, r4, r0\n"
        "	add	r0, r6, #0\n"
        "	add	r2, r4, #0\n"
        "	bl	SetMonData\n"
        "	add	r1, r5, #0\n"
        "	add	r1, r1, #0x11\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r4, r2]\n"
        "	lsl	r2, r0, #0x1\n"
        "	add	r2, r2, r0\n"
        "	lsl	r2, r2, #0x2\n"
        "	ldr	r0, ._553 + 36\n"
        "	add	r2, r2, r0\n"
        "	add	r0, r6, #0\n"
        "	bl	SetMonData\n"
        "	add	r5, r5, #0x1\n"
        "	cmp	r5, #0x3\n"
        "	ble	._549	@cond_branch\n"
        "	ldr	r2, ._553 + 28\n"
        "	mov	r4, #0x3c\n"
        "	ldsh	r0, [r2, r4]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._550	@cond_branch\n"
        "	cmp	r0, #0x2\n"
        "	beq	._551	@cond_branch\n"
        "	b	._555\n"
        "._554:\n"
        "	.align	2, 0\n"
        "._553:\n"
        "	.word	gMain\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	debug_sub_8011498+1\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	debug_sub_80108B8+1\n"
        "	.word	gPlayerParty\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_02023A14+0xde\n"
        "	.word	gBattleMoves+0x4\n"
        "._550:\n"
        "	ldr	r1, ._556\n"
        "	ldr	r0, ._556 + 4\n"
        "	str	r0, [r1]\n"
        "	ldr	r0, ._556 + 8\n"
        "	ldrh	r1, [r2, #0xa]\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x0\n"
        "	bl	EvolutionScene\n"
        "	b	._555\n"
        "._557:\n"
        "	.align	2, 0\n"
        "._556:\n"
        "	.word	gUnknown_03005E94\n"
        "	.word	debug_sub_80108B8+1\n"
        "	.word	gPlayerParty\n"
        "._551:\n"
        "	bl	debug_sub_8012688\n"
        "._555:\n"
        "	ldr	r0, ._565\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0x1\n"
        "	bne	._559	@cond_branch\n"
        "	ldr	r0, ._565 + 4\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0x6\n"
        "	bne	._559	@cond_branch\n"
        "	ldr	r3, ._565 + 8\n"
        "	ldrb	r2, [r3, #0x15]\n"
        "	lsl	r0, r2, #0x1d\n"
        "	lsr	r5, r0, #0x1f\n"
        "	lsl	r0, r2, #0x1f\n"
        "	lsr	r0, r0, #0x1f\n"
        "	lsl	r0, r0, #0x1\n"
        "	orr	r5, r5, r0\n"
        "	add	r5, r5, #0x1\n"
        "	cmp	r5, #0x4\n"
        "	bne	._560	@cond_branch\n"
        "	mov	r5, #0x0\n"
        "._560:\n"
        "	mov	r0, #0x1\n"
        "	add	r1, r5, #0\n"
        "	and	r1, r1, r0\n"
        "	lsl	r1, r1, #0x2\n"
        "	mov	r0, #0x5\n"
        "	neg	r0, r0\n"
        "	and	r0, r0, r2\n"
        "	orr	r0, r0, r1\n"
        "	mov	r1, #0x2\n"
        "	and	r5, r5, r1\n"
        "	lsr	r2, r5, #0x1\n"
        "	sub	r1, r1, #0x4\n"
        "	and	r0, r0, r1\n"
        "	orr	r0, r0, r2\n"
        "	strb	r0, [r3, #0x15]\n"
        "	lsl	r0, r0, #0x1f\n"
        "	lsr	r0, r0, #0x1f\n"
        "	bl	gScriptFuncs_End+0x2aa0\n"
        "	bl	debug_nullsub_3\n"
        "._559:\n"
        "	ldr	r4, ._565 + 12\n"
        "	ldrh	r0, [r4, #0x2a]\n"
        "	cmp	r0, #0x8\n"
        "	bne	._561	@cond_branch\n"
        "	bl	debug_sub_801174C\n"
        "._561:\n"
        "	ldrh	r0, [r4, #0x2a]\n"
        "	cmp	r0, #0x40\n"
        "	bne	._562	@cond_branch\n"
        "	bl	debug_sub_80125E4\n"
        "	ldr	r1, ._565 + 4\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._563	@cond_branch\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._564\n"
        "._566:\n"
        "	.align	2, 0\n"
        "._565:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gSaveBlock2\n"
        "	.word	gMain\n"
        "._563:\n"
        "	mov	r0, #0x6\n"
        "._564:\n"
        "	strb	r0, [r1]\n"
        "	bl	debug_sub_8011E74\n"
        "	ldr	r0, ._570\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "	bl	debug_sub_80125A0\n"
        "._562:\n"
        "	ldr	r0, ._570 + 4\n"
        "	ldrh	r0, [r0, #0x2a]\n"
        "	cmp	r0, #0x80\n"
        "	bne	._567	@cond_branch\n"
        "	bl	debug_sub_80125E4\n"
        "	ldr	r1, ._570\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x6\n"
        "	bne	._568	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._569\n"
        "._571:\n"
        "	.align	2, 0\n"
        "._570:\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gMain\n"
        "._568:\n"
        "	add	r0, r0, #0x1\n"
        "._569:\n"
        "	strb	r0, [r1]\n"
        "	bl	debug_sub_8011E74\n"
        "	ldr	r0, ._575\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "	bl	debug_sub_80125A0\n"
        "._567:\n"
        "	ldr	r0, ._575 + 4\n"
        "	ldrh	r0, [r0, #0x2a]\n"
        "	cmp	r0, #0x20\n"
        "	bne	._572	@cond_branch\n"
        "	bl	debug_sub_80125E4\n"
        "	ldr	r2, ._575 + 8\n"
        "	ldrb	r0, [r2]\n"
        "	add	r1, r0, #0\n"
        "	cmp	r1, #0\n"
        "	beq	._573	@cond_branch\n"
        "	sub	r0, r0, #0x1\n"
        "	strb	r0, [r2]\n"
        "	b	._577\n"
        "._576:\n"
        "	.align	2, 0\n"
        "._575:\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gMain\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "._573:\n"
        "	ldr	r3, ._581\n"
        "	ldrb	r0, [r3]\n"
        "	cmp	r0, #0\n"
        "	beq	._577	@cond_branch\n"
        "	strb	r1, [r3]\n"
        "	mov	r0, #0x4\n"
        "	strb	r0, [r2]\n"
        "	ldr	r0, ._581 + 4\n"
        "	strh	r1, [r0]\n"
        "	bl	debug_sub_8011E5C\n"
        "	bl	debug_sub_8011E74\n"
        "	ldr	r0, ._581 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "._577:\n"
        "	bl	debug_sub_80125A0\n"
        "._572:\n"
        "	ldr	r0, ._581 + 12\n"
        "	ldrh	r0, [r0, #0x2a]\n"
        "	cmp	r0, #0x10\n"
        "	bne	._578	@cond_branch\n"
        "	bl	debug_sub_80125E4\n"
        "	ldr	r2, ._581 + 16\n"
        "	ldrb	r0, [r2]\n"
        "	cmp	r0, #0x4\n"
        "	beq	._579	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r2]\n"
        "	b	._583\n"
        "._582:\n"
        "	.align	2, 0\n"
        "._581:\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gMain\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "._579:\n"
        "	ldr	r3, ._587\n"
        "	ldrb	r1, [r3]\n"
        "	cmp	r1, #0\n"
        "	bne	._583	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r3]\n"
        "	strb	r1, [r2]\n"
        "	ldr	r1, ._587 + 4\n"
        "	mov	r2, #0x80\n"
        "	lsl	r2, r2, #0x1\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	bl	debug_sub_8011E5C\n"
        "	bl	debug_sub_8011E74\n"
        "	ldr	r0, ._587 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "._583:\n"
        "	bl	debug_sub_80125A0\n"
        "._578:\n"
        "	ldr	r0, ._587 + 12\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._584	@cond_branch\n"
        "	b	._607\n"
        "._584:\n"
        "	ldr	r0, ._587 + 16\n"
        "	ldrb	r2, [r0]\n"
        "	ldr	r0, ._587 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r2, r0\n"
        "	sub	r0, r0, #0x1e\n"
        "	cmp	r0, #0x4\n"
        "	bhi	._586	@cond_branch\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._587 + 20\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._588:\n"
        "	.align	2, 0\n"
        "._587:\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gMain\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	._589\n"
        "._589:\n"
        "	.word	._590\n"
        "	.word	._591\n"
        "	.word	._592\n"
        "	.word	._593\n"
        "	.word	._594\n"
        "._591:\n"
        "	bl	debug_sub_8010818\n"
        "	b	._595\n"
        "._592:\n"
        "	ldr	r1, ._597\n"
        "	mov	r0, #0x1f\n"
        "	mov	r2, #0xec\n"
        "	bl	debug_sub_80132C8\n"
        "._595:\n"
        "	bl	debug_sub_8011E5C\n"
        "	bl	debug_sub_8011E74\n"
        "	bl	debug_sub_8012540\n"
        "	bl	debug_nullsub_3\n"
        "	ldr	r0, ._597 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "	b	._607\n"
        "._598:\n"
        "	.align	2, 0\n"
        "._597:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "._593:\n"
        "	ldr	r1, ._600\n"
        "	mov	r0, #0x1f\n"
        "	mov	r2, #0xec\n"
        "	bl	debug_sub_8013294\n"
        "	b	._607\n"
        "._601:\n"
        "	.align	2, 0\n"
        "._600:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._594:\n"
        "	ldr	r3, ._604\n"
        "	add	r2, r3, #0\n"
        "	add	r2, r2, #0x44\n"
        "	ldrh	r1, [r2]\n"
        "	mov	r4, #0x0\n"
        "	ldsh	r0, [r2, r4]\n"
        "	cmp	r0, #0\n"
        "	beq	._602	@cond_branch\n"
        "	sub	r0, r1, #1\n"
        "	strh	r0, [r2]\n"
        "	add	r1, r3, #0\n"
        "	add	r1, r1, #0x8a\n"
        "	ldrh	r0, [r1]\n"
        "	sub	r0, r0, #0x1\n"
        "	strh	r0, [r1]\n"
        "	b	._603\n"
        "._605:\n"
        "	.align	2, 0\n"
        "._604:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._602:\n"
        "	mov	r1, #0x8\n"
        "	strh	r1, [r2]\n"
        "	add	r0, r3, #0\n"
        "	add	r0, r0, #0x8a\n"
        "	strh	r1, [r0]\n"
        "._603:\n"
        "	bl	debug_sub_8012540\n"
        "	b	._607\n"
        "._590:\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8010B80\n"
        "	ldr	r2, ._608\n"
        "	ldr	r0, ._608 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	b	._607\n"
        "._609:\n"
        "	.align	2, 0\n"
        "._608:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "._586:\n"
        "	cmp	r2, #0x4\n"
        "	bne	._611	@cond_branch\n"
        "	cmp	r1, #0x5\n"
        "	bhi	._611	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8010AAC\n"
        "	b	._613\n"
        "._611:\n"
        "	ldr	r6, ._618\n"
        "	ldr	r5, ._618 + 4\n"
        "	ldr	r4, ._618 + 8\n"
        "	ldrb	r0, [r4]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r0, [r5]\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x1\n"
        "	ldr	r2, ._618 + 12\n"
        "	ldrb	r0, [r2]\n"
        "	mov	r3, #0x46\n"
        "	mul	r0, r0, r3\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r6\n"
        "	ldrh	r0, [r1]\n"
        "	sub	r0, r0, #0x1\n"
        "	strh	r0, [r1]\n"
        "	ldrb	r0, [r4]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r5, [r5]\n"
        "	add	r1, r1, r5\n"
        "	lsl	r0, r1, #0x1\n"
        "	ldrb	r2, [r2]\n"
        "	mul	r2, r2, r3\n"
        "	add	r0, r0, r2\n"
        "	add	r3, r0, r6\n"
        "	mov	r4, #0x0\n"
        "	ldsh	r2, [r3, r4]\n"
        "	ldr	r4, ._618 + 16\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r1, r0, #0x1\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0x8\n"
        "	add	r0, r1, r0\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r2, r0\n"
        "	bge	._613	@cond_branch\n"
        "	add	r0, r4, #6\n"
        "	add	r0, r1, r0\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r3]\n"
        "._613:\n"
        "	ldr	r5, ._618 + 4\n"
        "	ldrb	r0, [r5]\n"
        "	cmp	r0, #0\n"
        "	bne	._614	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8010AAC\n"
        "	ldr	r0, ._618 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, #0x4\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "._614:\n"
        "	ldr	r4, ._618 + 8\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r5, [r5]\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "._607:\n"
        "	ldr	r0, ._618 + 20\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._615	@cond_branch\n"
        "	b	._638\n"
        "._615:\n"
        "	ldr	r0, ._618 + 4\n"
        "	ldrb	r2, [r0]\n"
        "	ldr	r0, ._618 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r2, r0\n"
        "	sub	r0, r0, #0x1e\n"
        "	cmp	r0, #0x4\n"
        "	bhi	._617	@cond_branch\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._618 + 24\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._619:\n"
        "	.align	2, 0\n"
        "._618:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	UnkDebug0+0x6c\n"
        "	.word	gMain\n"
        "	.word	._620\n"
        "._620:\n"
        "	.word	._621\n"
        "	.word	._622\n"
        "	.word	._623\n"
        "	.word	._624\n"
        "	.word	._625\n"
        "._622:\n"
        "	bl	debug_sub_8010818\n"
        "	b	._626\n"
        "._623:\n"
        "	ldr	r1, ._628\n"
        "	mov	r0, #0x1f\n"
        "	mov	r2, #0xec\n"
        "	bl	debug_sub_80132C8\n"
        "._626:\n"
        "	bl	debug_sub_8011E5C\n"
        "	bl	debug_sub_8011E74\n"
        "	bl	debug_sub_8012540\n"
        "	bl	debug_nullsub_3\n"
        "	ldr	r0, ._628 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "	b	._638\n"
        "._629:\n"
        "	.align	2, 0\n"
        "._628:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "._624:\n"
        "	ldr	r1, ._631\n"
        "	mov	r0, #0x1f\n"
        "	mov	r2, #0xec\n"
        "	bl	debug_sub_8013294\n"
        "	b	._638\n"
        "._632:\n"
        "	.align	2, 0\n"
        "._631:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._625:\n"
        "	ldr	r3, ._635\n"
        "	add	r2, r3, #0\n"
        "	add	r2, r2, #0x44\n"
        "	ldrh	r1, [r2]\n"
        "	mov	r4, #0x0\n"
        "	ldsh	r0, [r2, r4]\n"
        "	cmp	r0, #0x7\n"
        "	bgt	._633	@cond_branch\n"
        "	add	r0, r1, #1\n"
        "	strh	r0, [r2]\n"
        "	add	r1, r3, #0\n"
        "	add	r1, r1, #0x8a\n"
        "	ldrh	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r1]\n"
        "	b	._634\n"
        "._636:\n"
        "	.align	2, 0\n"
        "._635:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._633:\n"
        "	mov	r1, #0x0\n"
        "	strh	r1, [r2]\n"
        "	add	r0, r3, #0\n"
        "	add	r0, r0, #0x8a\n"
        "	strh	r1, [r0]\n"
        "._634:\n"
        "	bl	debug_sub_8012540\n"
        "	b	._638\n"
        "._621:\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8010B80\n"
        "	ldr	r2, ._639\n"
        "	ldr	r0, ._639 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	b	._638\n"
        "._640:\n"
        "	.align	2, 0\n"
        "._639:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "._617:\n"
        "	cmp	r2, #0x4\n"
        "	bne	._642	@cond_branch\n"
        "	cmp	r1, #0x5\n"
        "	bhi	._642	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8010AAC\n"
        "	b	._644\n"
        "._642:\n"
        "	ldr	r6, ._650\n"
        "	ldr	r5, ._650 + 4\n"
        "	ldr	r4, ._650 + 8\n"
        "	ldrb	r0, [r4]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r0, [r5]\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x1\n"
        "	ldr	r2, ._650 + 12\n"
        "	ldrb	r0, [r2]\n"
        "	mov	r3, #0x46\n"
        "	mul	r0, r0, r3\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r6\n"
        "	ldrh	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r1]\n"
        "	ldrb	r0, [r4]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r5, [r5]\n"
        "	add	r1, r1, r5\n"
        "	lsl	r0, r1, #0x1\n"
        "	ldrb	r2, [r2]\n"
        "	mul	r2, r2, r3\n"
        "	add	r0, r0, r2\n"
        "	add	r3, r0, r6\n"
        "	mov	r4, #0x0\n"
        "	ldsh	r2, [r3, r4]\n"
        "	ldr	r4, ._650 + 16\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r1, r0, #0x1\n"
        "	add	r0, r4, #6\n"
        "	add	r0, r1, r0\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r2, r0\n"
        "	ble	._644	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0x8\n"
        "	add	r0, r1, r0\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r3]\n"
        "._644:\n"
        "	ldr	r5, ._650 + 4\n"
        "	ldrb	r0, [r5]\n"
        "	cmp	r0, #0\n"
        "	bne	._645	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8010AAC\n"
        "	ldr	r0, ._650 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, #0x4\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "._645:\n"
        "	ldr	r4, ._650 + 8\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r5, [r5]\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "._638:\n"
        "	ldr	r0, ._650 + 20\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._646	@cond_branch\n"
        "	ldr	r0, ._650 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	ldr	r2, ._650 + 8\n"
        "	mov	r8, r2\n"
        "	add	r7, r0, #0\n"
        "	cmp	r1, #0x4\n"
        "	bne	._648	@cond_branch\n"
        "	ldrb	r0, [r2]\n"
        "	cmp	r0, #0x5\n"
        "	bhi	._648	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8010AAC\n"
        "	b	._653\n"
        "._651:\n"
        "	.align	2, 0\n"
        "._650:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	UnkDebug0+0x6c\n"
        "	.word	gMain\n"
        "._648:\n"
        "	mov	r4, r8\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r1, [r7]\n"
        "	add	r0, r0, r1\n"
        "	cmp	r0, #0x1e\n"
        "	bne	._652	@cond_branch\n"
        "	mov	r0, #0x2\n"
        "	bl	debug_sub_8010B80\n"
        "	b	._653\n"
        "._652:\n"
        "	ldr	r4, ._655\n"
        "	lsl	r1, r0, #0x1\n"
        "	ldr	r3, ._655 + 4\n"
        "	ldrb	r2, [r3]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r4\n"
        "	ldrh	r0, [r1]\n"
        "	sub	r0, r0, #0xa\n"
        "	strh	r0, [r1]\n"
        "	add	r6, r3, #0\n"
        "	ldr	r5, ._655 + 8\n"
        "	b	._654\n"
        "._656:\n"
        "	.align	2, 0\n"
        "._655:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	UnkDebug0+0x6c\n"
        "._657:\n"
        "	add	r0, r5, #6\n"
        "	add	r0, r1, r0\n"
        "	ldrh	r0, [r0]\n"
        "	ldrh	r2, [r3]\n"
        "	add	r0, r0, r2\n"
        "	strh	r0, [r3]\n"
        "._654:\n"
        "	mov	r1, r8\n"
        "	ldrb	r0, [r1]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r2, [r7]\n"
        "	add	r1, r1, r2\n"
        "	lsl	r2, r1, #0x1\n"
        "	ldrb	r3, [r6]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r3\n"
        "	add	r2, r2, r0\n"
        "	add	r3, r2, r4\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r2, [r3, r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r1, r0, #0x1\n"
        "	add	r0, r5, #0\n"
        "	add	r0, r0, #0x8\n"
        "	add	r0, r1, r0\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r2, r0\n"
        "	blt	._657	@cond_branch\n"
        "._653:\n"
        "	ldr	r5, ._663\n"
        "	ldrb	r0, [r5]\n"
        "	cmp	r0, #0\n"
        "	bne	._658	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8010AAC\n"
        "	ldr	r0, ._663 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, #0x4\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "._658:\n"
        "	ldr	r4, ._663 + 4\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r5, [r5]\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "._646:\n"
        "	ldr	r0, ._663 + 8\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._659	@cond_branch\n"
        "	ldr	r0, ._663\n"
        "	ldrb	r1, [r0]\n"
        "	ldr	r2, ._663 + 4\n"
        "	mov	r8, r2\n"
        "	add	r7, r0, #0\n"
        "	cmp	r1, #0x4\n"
        "	bne	._661	@cond_branch\n"
        "	ldrb	r0, [r2]\n"
        "	cmp	r0, #0x5\n"
        "	bhi	._661	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8010AAC\n"
        "	b	._666\n"
        "._664:\n"
        "	.align	2, 0\n"
        "._663:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gMain\n"
        "._661:\n"
        "	mov	r4, r8\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r1, [r7]\n"
        "	add	r0, r0, r1\n"
        "	cmp	r0, #0x1e\n"
        "	bne	._665	@cond_branch\n"
        "	mov	r0, #0x3\n"
        "	bl	debug_sub_8010B80\n"
        "	b	._666\n"
        "._665:\n"
        "	ldr	r4, ._668\n"
        "	lsl	r1, r0, #0x1\n"
        "	ldr	r3, ._668 + 4\n"
        "	ldrb	r2, [r3]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r4\n"
        "	ldrh	r0, [r1]\n"
        "	add	r0, r0, #0xa\n"
        "	strh	r0, [r1]\n"
        "	add	r6, r3, #0\n"
        "	ldr	r5, ._668 + 8\n"
        "	b	._667\n"
        "._669:\n"
        "	.align	2, 0\n"
        "._668:\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	UnkDebug0+0x6c\n"
        "._670:\n"
        "	ldrh	r0, [r3]\n"
        "	sub	r0, r0, r1\n"
        "	strh	r0, [r3]\n"
        "._667:\n"
        "	mov	r2, r8\n"
        "	ldrb	r0, [r2]\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r0, [r7]\n"
        "	add	r1, r1, r0\n"
        "	lsl	r2, r1, #0x1\n"
        "	ldrb	r3, [r6]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r3\n"
        "	add	r2, r2, r0\n"
        "	add	r3, r2, r4\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r2, [r3, r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r1, r5, #6\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r1, [r0]\n"
        "	cmp	r2, r1\n"
        "	bgt	._670	@cond_branch\n"
        "._666:\n"
        "	ldr	r5, ._672\n"
        "	ldrb	r0, [r5]\n"
        "	cmp	r0, #0\n"
        "	bne	._671	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8010AAC\n"
        "	ldr	r0, ._672 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, #0x4\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "._671:\n"
        "	ldr	r4, ._672 + 4\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r5, [r5]\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	ldrb	r1, [r4]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_80123D8\n"
        "._659:\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	add	sp, sp, #0x10\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._673:\n"
        "	.align	2, 0\n"
        "._672:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8011498()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	ldr	r2, ._687\n"
        "	ldr	r0, ._687 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	r9, r0\n"
        "	ldr	r4, ._687 + 8\n"
        "	ldrh	r1, [r4, #0x28]\n"
        "	mov	r0, #0x81\n"
        "	lsl	r0, r0, #0x2\n"
        "	cmp	r1, r0\n"
        "	bne	._674	@cond_branch\n"
        "	bl	DoSoftReset\n"
        "._674:\n"
        "	ldrh	r0, [r4, #0x2a]\n"
        "	cmp	r0, #0x4\n"
        "	bne	._675	@cond_branch\n"
        "	bl	debug_sub_8012658\n"
        "	ldr	r0, ._687 + 12\n"
        "	bl	SetMainCallback2\n"
        "._675:\n"
        "	ldrh	r0, [r4, #0x2a]\n"
        "	cmp	r0, #0x8\n"
        "	bne	._676	@cond_branch\n"
        "	bl	debug_sub_801174C\n"
        "._676:\n"
        "	ldrh	r0, [r4, #0x2a]\n"
        "	cmp	r0, #0x40\n"
        "	beq	._677	@cond_branch\n"
        "	cmp	r0, #0x80\n"
        "	bne	._678	@cond_branch\n"
        "._677:\n"
        "	bl	debug_sub_8012658\n"
        "	ldr	r0, ._687 + 16\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x2\n"
        "	eor	r1, r1, r2\n"
        "	strb	r1, [r0]\n"
        "	bl	debug_sub_8012628\n"
        "._678:\n"
        "	ldr	r0, ._687 + 8\n"
        "	ldrh	r0, [r0, #0x2a]\n"
        "	cmp	r0, #0x20\n"
        "	beq	._679	@cond_branch\n"
        "	cmp	r0, #0x10\n"
        "	bne	._680	@cond_branch\n"
        "._679:\n"
        "	bl	debug_sub_8012658\n"
        "	ldr	r0, ._687 + 16\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x1\n"
        "	eor	r1, r1, r2\n"
        "	strb	r1, [r0]\n"
        "	bl	debug_sub_8012628\n"
        "._680:\n"
        "	ldr	r0, ._687 + 8\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._681	@cond_branch\n"
        "	ldr	r0, ._687 + 20\n"
        "	mov	r8, r0\n"
        "	ldr	r6, ._687 + 16\n"
        "	ldrb	r4, [r6]\n"
        "	lsl	r4, r4, #0x1\n"
        "	mov	r0, r9\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x15\n"
        "	add	r4, r4, r0\n"
        "	ldr	r5, ._687 + 24\n"
        "	ldrb	r2, [r5]\n"
        "	lsl	r1, r2, #0x1\n"
        "	add	r1, r1, r2\n"
        "	lsl	r1, r1, #0x4\n"
        "	add	r4, r4, r1\n"
        "	add r4, r4, r8\n"
        "	ldrh	r1, [r4]\n"
        "	sub	r1, r1, #0x1\n"
        "	strh	r1, [r4]\n"
        "	ldrb	r3, [r6]\n"
        "	lsl	r1, r3, #0x1\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r2, [r5]\n"
        "	lsl	r0, r2, #0x1\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	mov	r0, r8\n"
        "	add	r4, r1, r0\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r4, r0]\n"
        "	ldr	r5, ._687 + 28\n"
        "	lsl	r0, r3, #0x2\n"
        "	add	r0, r0, r3\n"
        "	lsl	r2, r0, #0x1\n"
        "	add	r0, r5, #0\n"
        "	add	r0, r0, #0x8\n"
        "	add	r0, r2, r0\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r1, r0\n"
        "	bge	._682	@cond_branch\n"
        "	add	r0, r5, #6\n"
        "	add	r0, r2, r0\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r4]\n"
        "._682:\n"
        "	bl	debug_sub_8012294\n"
        "._681:\n"
        "	ldr	r0, ._687 + 8\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._683	@cond_branch\n"
        "	ldr	r1, ._687 + 20\n"
        "	mov	r8, r1\n"
        "	ldr	r6, ._687 + 16\n"
        "	ldrb	r4, [r6]\n"
        "	lsl	r4, r4, #0x1\n"
        "	mov	r0, r9\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x15\n"
        "	add	r4, r4, r0\n"
        "	ldr	r5, ._687 + 24\n"
        "	ldrb	r2, [r5]\n"
        "	lsl	r1, r2, #0x1\n"
        "	add	r1, r1, r2\n"
        "	lsl	r1, r1, #0x4\n"
        "	add	r4, r4, r1\n"
        "	add r4, r4, r8\n"
        "	ldrh	r1, [r4]\n"
        "	add	r1, r1, #0x1\n"
        "	strh	r1, [r4]\n"
        "	ldrb	r3, [r6]\n"
        "	lsl	r1, r3, #0x1\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r2, [r5]\n"
        "	lsl	r0, r2, #0x1\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	mov	r0, r8\n"
        "	add	r4, r1, r0\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r4, r0]\n"
        "	ldr	r5, ._687 + 28\n"
        "	lsl	r0, r3, #0x2\n"
        "	add	r0, r0, r3\n"
        "	lsl	r2, r0, #0x1\n"
        "	add	r0, r5, #6\n"
        "	add	r0, r2, r0\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r1, r0\n"
        "	ble	._684	@cond_branch\n"
        "	add	r0, r5, #0\n"
        "	add	r0, r0, #0x8\n"
        "	add	r0, r2, r0\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r4]\n"
        "._684:\n"
        "	bl	debug_sub_8012294\n"
        "._683:\n"
        "	ldr	r0, ._687 + 8\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._685	@cond_branch\n"
        "	ldr	r6, ._687 + 20\n"
        "	ldr	r5, ._687 + 16\n"
        "	ldrb	r4, [r5]\n"
        "	lsl	r4, r4, #0x1\n"
        "	mov	r0, r9\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x15\n"
        "	add	r4, r4, r0\n"
        "	ldr	r2, ._687 + 24\n"
        "	ldrb	r1, [r2]\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r4, r4, r0\n"
        "	add	r4, r4, r6\n"
        "	ldrh	r0, [r4]\n"
        "	sub	r0, r0, #0xa\n"
        "	strh	r0, [r4]\n"
        "	mov	sl, r5\n"
        "	mov	r8, r6\n"
        "	add	r7, r2, #0\n"
        "	ldr	r6, ._687 + 28\n"
        "	b	._686\n"
        "._688:\n"
        "	.align	2, 0\n"
        "._687:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gMain\n"
        "	.word	debug_sub_8010CAC+1\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	gUnknown_02023A14+0xde\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	UnkDebug0+0x1ac\n"
        "._689:\n"
        "	add	r0, r6, #6\n"
        "	add	r0, r2, r0\n"
        "	ldrh	r0, [r0]\n"
        "	ldrh	r1, [r4]\n"
        "	add	r0, r0, r1\n"
        "	strh	r0, [r4]\n"
        "._686:\n"
        "	mov	r0, sl\n"
        "	ldrb	r5, [r0]\n"
        "	lsl	r4, r5, #0x1\n"
        "	mov	r0, r9\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x15\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r1, [r7]\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r4, r4, r0\n"
        "	add r4, r4, r8\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r4, r0]\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r2, r0, #0x1\n"
        "	add	r0, r6, #0\n"
        "	add	r0, r0, #0x8\n"
        "	add	r0, r2, r0\n"
        "	ldrh	r0, [r0]\n"
        "	cmp	r1, r0\n"
        "	blt	._689	@cond_branch\n"
        "	bl	debug_sub_8012294\n"
        "._685:\n"
        "	ldr	r0, ._692\n"
        "	ldrh	r1, [r0, #0x30]\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._690	@cond_branch\n"
        "	ldr	r6, ._692 + 4\n"
        "	ldr	r5, ._692 + 8\n"
        "	ldrb	r4, [r5]\n"
        "	lsl	r4, r4, #0x1\n"
        "	mov	r0, r9\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x15\n"
        "	add	r4, r4, r0\n"
        "	ldr	r2, ._692 + 12\n"
        "	ldrb	r1, [r2]\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r4, r4, r0\n"
        "	add	r4, r4, r6\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0xa\n"
        "	strh	r0, [r4]\n"
        "	mov	sl, r5\n"
        "	mov	r8, r6\n"
        "	add	r7, r2, #0\n"
        "	ldr	r6, ._692 + 16\n"
        "	b	._691\n"
        "._693:\n"
        "	.align	2, 0\n"
        "._692:\n"
        "	.word	gMain\n"
        "	.word	gUnknown_02023A14+0xde\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	UnkDebug0+0x1ac\n"
        "._694:\n"
        "	ldrh	r0, [r4]\n"
        "	sub	r0, r0, r1\n"
        "	strh	r0, [r4]\n"
        "._691:\n"
        "	mov	r1, sl\n"
        "	ldrb	r5, [r1]\n"
        "	lsl	r4, r5, #0x1\n"
        "	mov	r0, r9\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x15\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r1, [r7]\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r4, r4, r0\n"
        "	add r4, r4, r8\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r2, [r4, r0]\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r1, r6, #6\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r1, [r0]\n"
        "	cmp	r2, r1\n"
        "	bgt	._694	@cond_branch\n"
        "	bl	debug_sub_8012294\n"
        "._690:\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_801174C()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xffffffe8\n"
        "	mov	r0, #0x0\n"
        "	mov	r9, r0\n"
        "	ldr	r1, ._704\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	bl	Random\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x10\n"
        "	lsr	r4, r4, #0x10\n"
        "	mov	r0, #0x3\n"
        "	and	r4, r4, r0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r6, r4, #0x18\n"
        "	ldr	r5, ._704 + 4\n"
        "	lsl	r1, r6, #0x1\n"
        "	add	r1, r1, r6\n"
        "	lsl	r1, r1, #0x1\n"
        "	ldr	r0, ._704 + 8\n"
        "	add	r1, r1, r0\n"
        "	add	r0, r5, #0\n"
        "	bl	StringCopy\n"
        "	lsr	r4, r4, #0x19\n"
        "	strb	r4, [r5, #0x8]\n"
        "	bl	ZeroPlayerPartyMons\n"
        "	bl	ZeroEnemyPartyMons\n"
        "	ldr	r0, ._704 + 12\n"
        "	mov	r1, #0x3c\n"
        "	ldsh	r7, [r0, r1]\n"
        "	mov	r2, r9\n"
        "	str	r2, [sp, #0xc]\n"
        "	cmp	r7, #0x9\n"
        "	ble	._695	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "._696:\n"
        "	sub	r7, r7, #0xa\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r7, #0x9\n"
        "	bgt	._696	@cond_branch\n"
        "	str	r0, [sp, #0xc]\n"
        "._695:\n"
        "	ldr	r2, ._704 + 16\n"
        "	ldr	r1, ._704 + 20\n"
        "	sub	r0, r7, #1\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r3, [r0]\n"
        "	strh	r3, [r2]\n"
        "	ldr	r1, ._704 + 24\n"
        "	mov	r0, #0x8\n"
        "	strb	r0, [r1]\n"
        "	ldr	r1, ._704 + 28\n"
        "	add	r0, sp, #0xc\n"
        "	ldrb	r0, [r0]\n"
        "	strb	r0, [r1]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r3\n"
        "	cmp	r0, #0\n"
        "	beq	._697	@cond_branch\n"
        "	bl	EnterSafariMode\n"
        "._697:\n"
        "	ldr	r5, ._704 + 12\n"
        "	ldrh	r0, [r5, #0x3c]\n"
        "	sub	r0, r0, #0x2\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0x2\n"
        "	bhi	._698	@cond_branch\n"
        "	ldr	r4, ._704 + 32\n"
        "	bl	Random\n"
        "	mov	r1, #0x7\n"
        "	and	r1, r1, r0\n"
        "	add	r1, r1, #0x1\n"
        "	strh	r1, [r4]\n"
        "._698:\n"
        "	ldr	r1, ._704 + 36\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	mov	r7, #0x0\n"
        "._745:\n"
        "	lsl	r0, r7, #0x1\n"
        "	ldr	r3, ._704 + 12\n"
        "	add	r1, r0, r3\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r1, r2]\n"
        "	add	r2, r3, #0\n"
        "	mov	r8, r0\n"
        "	add	r3, r7, #5\n"
        "	mov	sl, r3\n"
        "	cmp	r1, #0\n"
        "	beq	._699	@cond_branch\n"
        "	add	r0, r7, #4\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r1, r2, #0\n"
        "	add	r0, r0, r1\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r0, [r0, r3]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._707	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._701	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._706	@cond_branch\n"
        "	b	._708\n"
        "._705:\n"
        "	.align	2, 0\n"
        "._704:\n"
        "	.word	gUnknown_020297ED\n"
        "	.word	gSaveBlock2\n"
        "	.word	UnkDebug0+0x279\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	UnkDebug0+0x1e0\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	gBattleTerrain\n"
        "	.word	gTrainerBattleOpponent\n"
        "	.word	gPlayerPartyCount\n"
        "._701:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._706	@cond_branch\n"
        "	cmp	r0, #0x3\n"
        "	beq	._707	@cond_branch\n"
        "	b	._708\n"
        "._706:\n"
        "	mov	r6, #0x0\n"
        "	b	._710\n"
        "._707:\n"
        "	mov	r6, #0xfe\n"
        "	b	._710\n"
        "._708:\n"
        "	mov	r6, #0xff\n"
        "._710:\n"
        "	mov	r1, r8\n"
        "	add	r0, r1, r2\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r0, [r0, r3]\n"
        "	add	r1, r7, #5\n"
        "	mov	sl, r1\n"
        "	cmp	r0, #0xc9\n"
        "	bne	._712	@cond_branch\n"
        "	cmp	r1, #0x1d\n"
        "	bgt	._712	@cond_branch\n"
        "	add	r0, r7, #7\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r2\n"
        "	ldrb	r0, [r0]\n"
        "	mov	r9, r0\n"
        "	b	._713\n"
        "._712:\n"
        "	mov	r2, #0x0\n"
        "	mov	r9, r2\n"
        "._713:\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r3, #0x64\n"
        "	mul	r0, r0, r3\n"
        "	ldr	r1, ._719\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._719 + 4\n"
        "	add r1, r1, r8\n"
        "	ldrh	r1, [r1]\n"
        "	add	r2, r7, #1\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldr	r3, ._719 + 4\n"
        "	add	r2, r2, r3\n"
        "	ldrb	r2, [r2]\n"
        "	str	r6, [sp]\n"
        "	mov	r3, #0x0\n"
        "	str	r3, [sp, #0x4]\n"
        "	mov	r3, r9\n"
        "	str	r3, [sp, #0x8]\n"
        "	mov	r3, #0x0\n"
        "	bl	CreateMonWithGenderNatureLetter\n"
        "._699:\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r2, #0x64\n"
        "	add	r1, r0, #0\n"
        "	mul	r1, r1, r2\n"
        "	ldr	r0, ._719\n"
        "	add	r5, r1, r0\n"
        "	ldr	r4, ._719 + 8\n"
        "	mov	r3, r8\n"
        "	add	r6, r3, r4\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0xc\n"
        "	add	r2, r6, #0\n"
        "	bl	SetMonData\n"
        "	sub	r4, r4, #0x4\n"
        "	add	r1, r7, #2\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r4\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r1, [sp, #0x10]\n"
        "	cmp	r0, #0xb\n"
        "	bhi	._714	@cond_branch\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x26\n"
        "	add	r2, r6, #0\n"
        "	bl	SetMonData\n"
        "._714:\n"
        "	add	r1, r7, #3\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r4\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r2, [r0, r3]\n"
        "	str	r1, [sp, #0x14]\n"
        "	cmp	r2, #0\n"
        "	beq	._716	@cond_branch\n"
        "	cmp	r2, #0x3\n"
        "	beq	._716	@cond_branch\n"
        "	cmp	r2, #0x2\n"
        "	bgt	._717	@cond_branch\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._718\n"
        "._720:\n"
        "	.align	2, 0\n"
        "._719:\n"
        "	.word	gEnemyParty\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_02023A14+0x56\n"
        "._717:\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r0, r2]\n"
        "	sub	r0, r0, #0x4\n"
        "._718:\n"
        "	str	r0, [sp, #0xc]\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r3, #0x64\n"
        "	mul	r0, r0, r3\n"
        "	ldr	r1, ._726\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x2e\n"
        "	add	r2, sp, #0xc\n"
        "	bl	SetMonData\n"
        "._716:\n"
        "	ldr	r1, ._726 + 4\n"
        "	add	r1, r1, #0x46\n"
        "	mov	r2, r8\n"
        "	add	r0, r2, r1\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r0, [r0, r3]\n"
        "	ldr	r2, ._726 + 4\n"
        "	cmp	r0, #0\n"
        "	beq	._721	@cond_branch\n"
        "	add	r0, r7, #4\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._729	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._723	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._728	@cond_branch\n"
        "	b	._730\n"
        "._727:\n"
        "	.align	2, 0\n"
        "._726:\n"
        "	.word	gEnemyParty\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._723:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._728	@cond_branch\n"
        "	cmp	r0, #0x3\n"
        "	beq	._729	@cond_branch\n"
        "	b	._730\n"
        "._728:\n"
        "	mov	r6, #0x0\n"
        "	b	._732\n"
        "._729:\n"
        "	mov	r6, #0xfe\n"
        "	b	._732\n"
        "._730:\n"
        "	mov	r6, #0xff\n"
        "._732:\n"
        "	add	r1, r2, #0\n"
        "	add	r1, r1, #0x46\n"
        "	mov	r2, r8\n"
        "	add	r0, r2, r1\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r0, [r0, r3]\n"
        "	cmp	r0, #0xc9\n"
        "	bne	._734	@cond_branch\n"
        "	mov	r0, sl\n"
        "	cmp	r0, #0x1d\n"
        "	bgt	._734	@cond_branch\n"
        "	add	r0, r7, #7\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0]\n"
        "	mov	r9, r0\n"
        "	b	._735\n"
        "._734:\n"
        "	mov	r1, #0x0\n"
        "	mov	r9, r1\n"
        "._735:\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r2, #0x64\n"
        "	mul	r0, r0, r2\n"
        "	ldr	r1, ._741\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._741 + 4\n"
        "	add r1, r1, r8\n"
        "	ldrh	r1, [r1]\n"
        "	add	r2, r7, #1\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldr	r3, ._741 + 4\n"
        "	add	r2, r2, r3\n"
        "	ldrb	r2, [r2]\n"
        "	str	r6, [sp]\n"
        "	mov	r3, #0x0\n"
        "	str	r3, [sp, #0x4]\n"
        "	mov	r3, r9\n"
        "	str	r3, [sp, #0x8]\n"
        "	mov	r3, #0x0\n"
        "	bl	CreateMonWithGenderNatureLetter\n"
        "	ldr	r1, ._741 + 8\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "._721:\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r2, #0x64\n"
        "	add	r1, r0, #0\n"
        "	mul	r1, r1, r2\n"
        "	ldr	r0, ._741\n"
        "	add	r4, r1, r0\n"
        "	ldr	r0, ._741 + 12\n"
        "	mov	r3, r8\n"
        "	add	r5, r3, r0\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0xc\n"
        "	add	r2, r5, #0\n"
        "	bl	SetMonData\n"
        "	ldr	r1, [sp, #0x10]\n"
        "	lsl	r0, r1, #0x1\n"
        "	ldr	r2, ._741 + 16\n"
        "	add	r0, r0, r2\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0xb\n"
        "	bhi	._736	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x26\n"
        "	add	r2, r5, #0\n"
        "	bl	SetMonData\n"
        "._736:\n"
        "	ldr	r3, [sp, #0x14]\n"
        "	lsl	r0, r3, #0x1\n"
        "	ldr	r1, ._741 + 4\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r0, r2]\n"
        "	cmp	r1, #0\n"
        "	beq	._738	@cond_branch\n"
        "	cmp	r1, #0x3\n"
        "	beq	._738	@cond_branch\n"
        "	cmp	r1, #0x2\n"
        "	bgt	._739	@cond_branch\n"
        "	add	r0, r1, #0\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._740\n"
        "._742:\n"
        "	.align	2, 0\n"
        "._741:\n"
        "	.word	gPlayerParty\n"
        "	.word	gUnknown_02023A14+0x98\n"
        "	.word	gPlayerPartyCount\n"
        "	.word	gUnknown_02023A14+0x9c\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._739:\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	sub	r0, r0, #0x4\n"
        "._740:\n"
        "	str	r0, [sp, #0xc]\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r2, #0x64\n"
        "	mul	r0, r0, r2\n"
        "	ldr	r1, ._750\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x2e\n"
        "	add	r2, sp, #0xc\n"
        "	bl	SetMonData\n"
        "._738:\n"
        "	ldr	r3, [sp, #0x14]\n"
        "	lsl	r0, r3, #0x1\n"
        "	ldr	r1, ._750 + 4\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r0, r2]\n"
        "	cmp	r0, #0x2\n"
        "	ble	._743	@cond_branch\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	mov	r3, #0x64\n"
        "	mul	r0, r0, r3\n"
        "	ldr	r1, ._750\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x7\n"
        "	ldr	r2, ._750 + 8\n"
        "	bl	SetMonData\n"
        "	ldr	r2, ._750 + 12\n"
        "	ldrb	r0, [r2]\n"
        "	mov	r1, #0x40\n"
        "	orr	r0, r0, r1\n"
        "	strb	r0, [r2]\n"
        "._743:\n"
        "	mov	r7, sl\n"
        "	cmp	r7, #0x1d\n"
        "	bgt	._744	@cond_branch\n"
        "	b	._745\n"
        "._744:\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp, #0xc]\n"
        "	mov	r0, #0x64\n"
        "	mov	r8, r0\n"
        "	ldr	r1, ._750 + 16\n"
        "	mov	r9, r1\n"
        "	ldr	r2, ._750\n"
        "	mov	sl, r2\n"
        "._747:\n"
        "	mov	r7, #0x0\n"
        "._746:\n"
        "	ldr	r2, [sp, #0xc]\n"
        "	mov	r0, r8\n"
        "	mul	r0, r0, r2\n"
        "	ldr	r3, ._750 + 20\n"
        "	add	r0, r0, r3\n"
        "	add	r5, r7, #0\n"
        "	add	r5, r5, #0xd\n"
        "	lsl	r2, r2, #0x3\n"
        "	lsl	r4, r7, #0x1\n"
        "	mov	r3, r9\n"
        "	add	r1, r4, r3\n"
        "	add	r2, r2, r1\n"
        "	add	r1, r5, #0\n"
        "	bl	SetMonData\n"
        "	ldr	r1, [sp, #0xc]\n"
        "	mov	r0, r8\n"
        "	mul	r0, r0, r1\n"
        "	ldr	r2, ._750 + 20\n"
        "	add	r0, r0, r2\n"
        "	add	r6, r7, #0\n"
        "	add	r6, r6, #0x11\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r4, r1\n"
        "	add r1, r1, r9\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r1, [r1, r3]\n"
        "	lsl	r2, r1, #0x1\n"
        "	add	r2, r2, r1\n"
        "	lsl	r2, r2, #0x2\n"
        "	ldr	r1, ._750 + 24\n"
        "	add	r2, r2, r1\n"
        "	add	r1, r6, #0\n"
        "	bl	SetMonData\n"
        "	ldr	r2, [sp, #0xc]\n"
        "	mov	r0, r8\n"
        "	mul	r0, r0, r2\n"
        "	add r0, r0, sl\n"
        "	lsl	r2, r2, #0x3\n"
        "	ldr	r3, ._750 + 28\n"
        "	add	r1, r4, r3\n"
        "	add	r2, r2, r1\n"
        "	add	r1, r5, #0\n"
        "	bl	SetMonData\n"
        "	ldr	r1, [sp, #0xc]\n"
        "	mov	r0, r8\n"
        "	mul	r0, r0, r1\n"
        "	add r0, r0, sl\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r4, r4, r1\n"
        "	ldr	r1, ._750 + 28\n"
        "	add	r4, r4, r1\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r4, r2]\n"
        "	lsl	r2, r1, #0x1\n"
        "	add	r2, r2, r1\n"
        "	lsl	r2, r2, #0x2\n"
        "	ldr	r3, ._750 + 24\n"
        "	add	r2, r2, r3\n"
        "	add	r1, r6, #0\n"
        "	bl	SetMonData\n"
        "	add	r7, r7, #0x1\n"
        "	cmp	r7, #0x3\n"
        "	ble	._746	@cond_branch\n"
        "	ldr	r0, [sp, #0xc]\n"
        "	add	r0, r0, #0x1\n"
        "	str	r0, [sp, #0xc]\n"
        "	cmp	r0, #0x5\n"
        "	ble	._747	@cond_branch\n"
        "	ldr	r3, ._750 + 32\n"
        "	add	r4, r3, #0\n"
        "	add	r4, r4, #0x44\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r4, r2]\n"
        "	cmp	r0, #0x8\n"
        "	bne	._748	@cond_branch\n"
        "	ldr	r0, ._750 + 12\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x80\n"
        "	b	._753\n"
        "._751:\n"
        "	.align	2, 0\n"
        "._750:\n"
        "	.word	gPlayerParty\n"
        "	.word	gUnknown_02023A14+0x98\n"
        "	.word	UnkDebug0+0x291\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	gUnknown_02023A14+0xde\n"
        "	.word	gEnemyParty\n"
        "	.word	gBattleMoves+0x4\n"
        "	.word	gUnknown_02023A14+0x10e\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._748:\n"
        "	cmp	r0, #0x7\n"
        "	bne	._752	@cond_branch\n"
        "	ldr	r0, ._754\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x20\n"
        "	b	._753\n"
        "._755:\n"
        "	.align	2, 0\n"
        "._754:\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "._752:\n"
        "	cmp	r0, #0x6\n"
        "	bne	._756	@cond_branch\n"
        "	ldr	r2, ._759\n"
        "	ldrb	r0, [r2]\n"
        "	mov	r1, #0x10\n"
        "	orr	r0, r0, r1\n"
        "	strb	r0, [r2]\n"
        "	ldrh	r1, [r3, #0x4]\n"
        "	mov	r2, #0x4\n"
        "	ldsh	r0, [r3, r2]\n"
        "	cmp	r0, #0x5\n"
        "	ble	._757	@cond_branch\n"
        "	ldr	r0, ._759 + 4\n"
        "	sub	r1, r1, #0x2\n"
        "	ldr	r3, ._759 + 8\n"
        "	add	r0, r0, r3\n"
        "	b	._761\n"
        "._760:\n"
        "	.align	2, 0\n"
        "._759:\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	+0x2000000\n"
        "	.word	0x160a3\n"
        "._757:\n"
        "	ldr	r0, ._762\n"
        "	ldr	r2, ._762 + 4\n"
        "	add	r0, r0, r2\n"
        "	b	._761\n"
        "._763:\n"
        "	.align	2, 0\n"
        "._762:\n"
        "	.word	+0x2000000\n"
        "	.word	0x160a3\n"
        "._756:\n"
        "	cmp	r0, #0x5\n"
        "	bne	._764	@cond_branch\n"
        "	ldr	r0, ._766\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x21\n"
        "._753:\n"
        "	orr	r1, r1, r2\n"
        "._761:\n"
        "	strb	r1, [r0]\n"
        "	bl	sub_80408BC\n"
        "	b	._770\n"
        "._767:\n"
        "	.align	2, 0\n"
        "._766:\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "._764:\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._768	@cond_branch\n"
        "	bl	sub_80408BC\n"
        "._768:\n"
        "	ldrh	r3, [r4]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r3\n"
        "	cmp	r0, #0\n"
        "	beq	._769	@cond_branch\n"
        "	ldr	r0, ._772\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x4\n"
        "	orr	r1, r1, r2\n"
        "	strb	r1, [r0]\n"
        "._769:\n"
        "	mov	r0, #0x4\n"
        "	and	r0, r0, r3\n"
        "	cmp	r0, #0\n"
        "	beq	._770	@cond_branch\n"
        "	ldr	r0, ._772\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r2, #0x6\n"
        "	orr	r1, r1, r2\n"
        "	strb	r1, [r0]\n"
        "._770:\n"
        "	ldr	r0, ._772 + 4\n"
        "	ldr	r1, ._772 + 8\n"
        "	str	r1, [r0, #0x8]\n"
        "	ldr	r0, ._772 + 12\n"
        "	bl	SetMainCallback2\n"
        "	bl	ClearBag\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x2\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x3\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x4\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x5\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x6\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x7\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x8\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x9\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0xa\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0xb\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0xc\n"
        "	mov	r1, #0xa\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x13\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x14\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x19\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x22\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x23\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x25\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x49\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x4a\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x4b\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x4c\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x4d\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x4e\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	mov	r0, #0x50\n"
        "	mov	r1, #0x63\n"
        "	bl	AddBagItem\n"
        "	ldr	r4, ._772 + 16\n"
        "	mov	r7, #0xe\n"
        "._771:\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_810CA34\n"
        "	add	r4, r4, #0x8\n"
        "	sub	r7, r7, #0x1\n"
        "	cmp	r7, #0\n"
        "	bge	._771	@cond_branch\n"
        "	add	sp, sp, #0x18\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._773:\n"
        "	.align	2, 0\n"
        "._772:\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	gMain\n"
        "	.word	debug_sub_80108B8+1\n"
        "	.word	unref_sub_800D684+1\n"
        "	.word	UnkDebug0+0x1f4\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8011D40()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._774\n"
        "	ldr	r0, ._774 + 4\n"
        "	str	r0, [r1]\n"
        "	ldr	r0, ._774 + 8\n"
        "	str	r0, [r1, #0x4]\n"
        "	ldr	r0, ._774 + 12\n"
        "	str	r0, [r1, #0x8]\n"
        "	ldr	r0, [r1, #0x8]\n"
        "	sub	r1, r1, #0xc4\n"
        "	ldr	r0, ._774 + 16\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 20\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 24\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 28\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 32\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 36\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 40\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._774 + 44\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	bl	LoadOam\n"
        "	bl	ProcessSpriteCopyRequests\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._775:\n"
        "	.align	2, 0\n"
        "._774:\n"
        "	.word	0x40000d4\n"
        "	.word	+0x2000000\n"
        "	.word	0x6004000\n"
        "	.word	0x80000800\n"
        "	.word	gUnknown_030042A4\n"
        "	.word	gUnknown_030042A0\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_030041B4\n"
        "	.word	gUnknown_03004288\n"
        "	.word	gUnknown_03004280\n"
        "	.word	gUnknown_030041B0\n"
        "	.word	gUnknown_030041B8\n"
        "\n"
    );
}

__attribute__((naked))
void debug_nullsub_45()
{
    asm(
        "	bx	lr\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8011DD4()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._776\n"
        "	ldr	r2, ._776 + 4\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x8\n"
        "	ldr	r0, ._776 + 8\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 12\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 16\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 20\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 24\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 28\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 32\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	add	r1, r1, #0x2\n"
        "	ldr	r0, ._776 + 36\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r1]\n"
        "	bl	LoadOam\n"
        "	bl	ProcessSpriteCopyRequests\n"
        "	bl	TransferPlttBuffer\n"
        "	bl	sub_8089668\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._777:\n"
        "	.align	2, 0\n"
        "._776:\n"
        "	.word	0x4000008\n"
        "	.word	0x9803\n"
        "	.word	gUnknown_030042A4\n"
        "	.word	gUnknown_030042A0\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_030041B4\n"
        "	.word	gUnknown_03004288\n"
        "	.word	gUnknown_03004280\n"
        "	.word	gUnknown_030041B0\n"
        "	.word	gUnknown_030041B8\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8011E5C()
{
    asm(
        "	push	{r4, lr}\n"
        "	mov	r4, #0x0\n"
        "._778:\n"
        "	lsl	r0, r4, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	debug_sub_8011EA0\n"
        "	add	r4, r4, #0x1\n"
        "	cmp	r4, #0x1e\n"
        "	ble	._778	@cond_branch\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8011E74()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	ldr	r0, ._780\n"
        "	ldrb	r5, [r0]\n"
        "	mov	r1, #0x0\n"
        "	strb	r1, [r0]\n"
        "	add	r4, r0, #0\n"
        "._779:\n"
        "	bl	debug_sub_8012294\n"
        "	ldrb	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x3\n"
        "	bls	._779	@cond_branch\n"
        "	ldr	r0, ._780\n"
        "	strb	r5, [r0]\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._781:\n"
        "	.align	2, 0\n"
        "._780:\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8011EA0()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xfffffff4\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r7, r0, #0x18\n"
        "	cmp	r7, #0x22\n"
        "	bls	._782	@cond_branch\n"
        "	b	._815\n"
        "._782:\n"
        "	lsl	r0, r7, #0x2\n"
        "	ldr	r1, ._785\n"
        "	add	r1, r0, r1\n"
        "	ldr	r1, [r1]\n"
        "	str	r0, [sp, #0x8]\n"
        "	mov	pc, r1\n"
        "._786:\n"
        "	.align	2, 0\n"
        "._785:\n"
        "	.word	._784\n"
        "._784:\n"
        "	.word	._812\n"
        "	.word	._817\n"
        "	.word	._814\n"
        "	.word	._815\n"
        "	.word	._816\n"
        "	.word	._812\n"
        "	.word	._817\n"
        "	.word	._814\n"
        "	.word	._815\n"
        "	.word	._816\n"
        "	.word	._812\n"
        "	.word	._817\n"
        "	.word	._814\n"
        "	.word	._815\n"
        "	.word	._816\n"
        "	.word	._812\n"
        "	.word	._817\n"
        "	.word	._814\n"
        "	.word	._815\n"
        "	.word	._816\n"
        "	.word	._812\n"
        "	.word	._817\n"
        "	.word	._814\n"
        "	.word	._815\n"
        "	.word	._816\n"
        "	.word	._812\n"
        "	.word	._817\n"
        "	.word	._814\n"
        "	.word	._815\n"
        "	.word	._816\n"
        "	.word	._817\n"
        "	.word	._848\n"
        "	.word	._848\n"
        "	.word	._848\n"
        "	.word	._848\n"
        "._812:\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x14\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r6, ._823\n"
        "	ldr	r2, ._823 + 4\n"
        "	ldr	r0, [sp, #0x8]\n"
        "	add	r1, r0, r7\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r1, r2\n"
        "	ldrh	r0, [r0]\n"
        "	str	r0, [sp, #0x4]\n"
        "	add	r0, r2, #2\n"
        "	add	r0, r1, r0\n"
        "	ldrb	r0, [r0]\n"
        "	mov	r8, r0\n"
        "	add	r2, r2, #0x4\n"
        "	add	r1, r1, r2\n"
        "	ldrb	r1, [r1]\n"
        "	mov	r9, r1\n"
        "	str	r1, [sp]\n"
        "	ldr	r0, ._823 + 8\n"
        "	add	r1, r6, #0\n"
        "	ldr	r2, [sp, #0x4]\n"
        "	mov	r3, r8\n"
        "	bl	InitWindow\n"
        "	ldr	r0, ._823 + 8\n"
        "	bl	sub_8002F44\n"
        "	ldr	r1, ._823 + 12\n"
        "	mov	sl, r1\n"
        "	lsl	r4, r7, #0x1\n"
        "	ldr	r5, ._823 + 16\n"
        "	ldrb	r0, [r5]\n"
        "	mov	r7, #0x46\n"
        "	mul	r0, r0, r7\n"
        "	add	r0, r4, r0\n"
        "	add r0, r0, sl\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r0, r2]\n"
        "	add	r0, r6, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r2, #0xd3\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldrb	r3, [r5]\n"
        "	lsl	r3, r3, #0x5\n"
        "	add	r3, r3, #0x19\n"
        "	lsl	r3, r3, #0x18\n"
        "	lsr	r3, r3, #0x18\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	ldr	r0, ._823 + 8\n"
        "	add	r1, r6, #0\n"
        "	bl	InitWindow\n"
        "	ldr	r0, ._823 + 8\n"
        "	bl	sub_8002F44\n"
        "	mov	r0, #0xff\n"
        "	strb	r0, [r6]\n"
        "	ldrb	r0, [r5]\n"
        "	mul	r0, r0, r7\n"
        "	add	r4, r4, r0\n"
        "	add r4, r4, sl\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r4, r0]\n"
        "	mov	r0, #0xb\n"
        "	mul	r1, r1, r0\n"
        "	ldr	r0, ._823 + 20\n"
        "	add	r1, r1, r0\n"
        "	add	r0, r6, #0\n"
        "	bl	StringAppend\n"
        "	mov	r1, r9\n"
        "	str	r1, [sp]\n"
        "	ldr	r0, ._823 + 8\n"
        "	add	r1, r6, #0\n"
        "	ldr	r2, [sp, #0x4]\n"
        "	mov	r3, r8\n"
        "	bl	InitWindow\n"
        "	ldr	r0, ._823 + 8\n"
        "	bl	sub_8002F44\n"
        "	b	._848\n"
        "._824:\n"
        "	.align	2, 0\n"
        "._823:\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x6c\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gSpeciesNames\n"
        "._817:\n"
        "	ldr	r6, ._826\n"
        "	ldr	r3, ._826 + 4\n"
        "	lsl	r1, r7, #0x1\n"
        "	ldr	r0, ._826 + 8\n"
        "	ldrb	r2, [r0]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r3\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r1, r2]\n"
        "	add	r0, r6, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	b	._825\n"
        "._827:\n"
        "	.align	2, 0\n"
        "._826:\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004360\n"
        "._814:\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x18\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r6, ._830\n"
        "	ldr	r1, ._830 + 4\n"
        "	mov	sl, r1\n"
        "	ldr	r4, ._830 + 8\n"
        "	ldr	r2, [sp, #0x8]\n"
        "	add	r1, r2, r7\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r1, r4\n"
        "	ldrh	r2, [r0]\n"
        "	add	r0, r4, #2\n"
        "	add	r0, r1, r0\n"
        "	ldrb	r3, [r0]\n"
        "	add	r4, r4, #0x4\n"
        "	add	r1, r1, r4\n"
        "	ldrb	r0, [r1]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r6, #0\n"
        "	mov	r1, sl\n"
        "	bl	InitWindow\n"
        "	add	r0, r6, #0\n"
        "	bl	sub_8002F44\n"
        "	lsl	r4, r7, #0x1\n"
        "	ldr	r5, ._830 + 12\n"
        "	ldrb	r0, [r5]\n"
        "	mov	r1, #0x46\n"
        "	mul	r0, r0, r1\n"
        "	add	r0, r4, r0\n"
        "	ldr	r2, ._830 + 16\n"
        "	add	r0, r0, r2\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r0, r2]\n"
        "	mov	r0, sl\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r2, #0xd3\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldrb	r3, [r5]\n"
        "	lsl	r3, r3, #0x5\n"
        "	add	r3, r3, #0x19\n"
        "	lsl	r3, r3, #0x18\n"
        "	lsr	r3, r3, #0x18\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	add	r0, r6, #0\n"
        "	mov	r1, sl\n"
        "	bl	InitWindow\n"
        "	add	r0, r6, #0\n"
        "	bl	sub_8002F44\n"
        "	mov	r0, #0xff\n"
        "	mov	r1, sl\n"
        "	strb	r0, [r1]\n"
        "	ldrb	r0, [r5]\n"
        "	mov	r2, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r4, r4, r0\n"
        "	ldr	r0, ._830 + 16\n"
        "	add	r4, r4, r0\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._828	@cond_branch\n"
        "	ldrh	r0, [r4]\n"
        "	bl	ItemId_GetItem\n"
        "	add	r1, r0, #0\n"
        "	mov	r0, sl\n"
        "	bl	StringAppend\n"
        "	b	._829\n"
        "._831:\n"
        "	.align	2, 0\n"
        "._830:\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x6c\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "._828:\n"
        "	ldr	r1, ._833\n"
        "	mov	r0, sl\n"
        "	bl	StringAppend\n"
        "._829:\n"
        "	ldr	r6, ._833 + 4\n"
        "	ldr	r1, ._833 + 8\n"
        "	ldr	r5, ._833 + 12\n"
        "	ldr	r2, [sp, #0x8]\n"
        "	add	r4, r2, r7\n"
        "	lsl	r4, r4, #0x1\n"
        "	add	r0, r4, r5\n"
        "	ldrh	r2, [r0]\n"
        "	add	r0, r5, #2\n"
        "	add	r0, r4, r0\n"
        "	ldrb	r3, [r0]\n"
        "	add	r5, r5, #0x4\n"
        "	add	r4, r4, r5\n"
        "	ldrb	r0, [r4]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r6, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r6, #0\n"
        "	bl	sub_8002F44\n"
        "	b	._848\n"
        "._834:\n"
        "	.align	2, 0\n"
        "._833:\n"
        "	.word	UnkDebug0+0x26c\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x6c\n"
        "._816:\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x4\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r5, ._839\n"
        "	ldr	r6, ._839 + 4\n"
        "	ldr	r4, ._839 + 8\n"
        "	ldr	r0, [sp, #0x8]\n"
        "	add	r1, r0, r7\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r1, r4\n"
        "	ldrh	r2, [r0]\n"
        "	add	r0, r4, #2\n"
        "	add	r0, r1, r0\n"
        "	ldrb	r3, [r0]\n"
        "	add	r4, r4, #0x4\n"
        "	add	r1, r1, r4\n"
        "	ldrb	r0, [r1]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "	mov	r4, #0x0\n"
        "	ldr	r3, ._839 + 12\n"
        "	lsl	r1, r7, #0x1\n"
        "	ldr	r0, ._839 + 16\n"
        "	ldrb	r2, [r0]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r3\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r1, r2]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._835	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._836	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._837	@cond_branch\n"
        "	b	._843\n"
        "._840:\n"
        "	.align	2, 0\n"
        "._839:\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x6c\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004360\n"
        "._836:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._841	@cond_branch\n"
        "	cmp	r0, #0x3\n"
        "	beq	._842	@cond_branch\n"
        "	b	._843\n"
        "._837:\n"
        "	mov	r0, #0xb5\n"
        "	b	._844\n"
        "._835:\n"
        "	mov	r0, #0xb6\n"
        "._844:\n"
        "	strb	r0, [r6]\n"
        "	mov	r4, #0x1\n"
        "	b	._847\n"
        "._841:\n"
        "	mov	r0, #0xb5\n"
        "	b	._846\n"
        "._842:\n"
        "	mov	r0, #0xb6\n"
        "._846:\n"
        "	strb	r0, [r6]\n"
        "	strb	r0, [r6, #0x1]\n"
        "	mov	r4, #0x2\n"
        "	b	._847\n"
        "._843:\n"
        "	ldr	r2, ._849\n"
        "	add	r1, r4, r2\n"
        "	mov	r0, #0xac\n"
        "	strb	r0, [r1]\n"
        "	add	r4, r4, #0x1\n"
        "	add	r6, r2, #0\n"
        "._847:\n"
        "	add	r1, r4, r6\n"
        "	mov	r0, #0xff\n"
        "	strb	r0, [r1]\n"
        "._825:\n"
        "	ldr	r5, ._849 + 4\n"
        "	ldr	r4, ._849 + 8\n"
        "	ldr	r0, [sp, #0x8]\n"
        "	add	r1, r0, r7\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r1, r4\n"
        "	ldrh	r2, [r0]\n"
        "	add	r0, r4, #2\n"
        "	add	r0, r1, r0\n"
        "	ldrb	r3, [r0]\n"
        "	add	r4, r4, #0x4\n"
        "	add	r1, r1, r4\n"
        "	ldrb	r0, [r1]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "	b	._848\n"
        "._850:\n"
        "	.align	2, 0\n"
        "._849:\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	UnkDebug0+0x6c\n"
        "._815:\n"
        "	ldr	r6, ._851\n"
        "	ldr	r3, ._851 + 4\n"
        "	lsl	r1, r7, #0x1\n"
        "	ldr	r0, ._851 + 8\n"
        "	ldrb	r2, [r0]\n"
        "	mov	r0, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r3\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r1, r2]\n"
        "	add	r0, r6, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r5, ._851 + 12\n"
        "	ldr	r4, ._851 + 16\n"
        "	lsl	r1, r7, #0x2\n"
        "	add	r1, r1, r7\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r1, r4\n"
        "	ldrh	r2, [r0]\n"
        "	add	r0, r4, #2\n"
        "	add	r0, r1, r0\n"
        "	ldrb	r3, [r0]\n"
        "	add	r4, r4, #0x4\n"
        "	add	r1, r1, r4\n"
        "	ldrb	r0, [r1]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "._848:\n"
        "	add	sp, sp, #0xc\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._852:\n"
        "	.align	2, 0\n"
        "._851:\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	UnkDebug0+0x6c\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012294()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	ldr	r2, ._854\n"
        "	ldr	r0, ._854 + 4\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	cmp	r5, #0x1d\n"
        "	bhi	._853	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x18\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r0, ._854 + 8\n"
        "	mov	sl, r0\n"
        "	ldr	r1, ._854 + 12\n"
        "	mov	r9, r1\n"
        "	ldr	r2, ._854 + 16\n"
        "	mov	r8, r2\n"
        "	ldr	r7, ._854 + 20\n"
        "	ldrb	r1, [r7]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r1, r0, r2\n"
        "	ldrh	r2, [r1]\n"
        "	ldr	r3, ._854 + 24\n"
        "	add	r1, r0, r3\n"
        "	ldrb	r3, [r1]\n"
        "	ldr	r1, ._854 + 28\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0]\n"
        "	str	r0, [sp]\n"
        "	mov	r0, sl\n"
        "	mov	r1, r9\n"
        "	bl	InitWindow\n"
        "	mov	r0, sl\n"
        "	bl	sub_8002F44\n"
        "	ldrb	r4, [r7]\n"
        "	lsl	r4, r4, #0x1\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x5\n"
        "	bl	gScriptFuncs_End+0x4358\n"
        "	add	r5, r0, #0\n"
        "	lsl	r5, r5, #0x18\n"
        "	lsr	r5, r5, #0x15\n"
        "	add	r4, r4, r5\n"
        "	ldr	r6, ._854 + 32\n"
        "	ldrb	r1, [r6]\n"
        "	lsl	r0, r1, #0x1\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r4, r4, r0\n"
        "	ldr	r2, ._854 + 36\n"
        "	add	r4, r4, r2\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r1, [r4, r3]\n"
        "	mov	r0, r9\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r2, #0xd3\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldrb	r3, [r6]\n"
        "	lsl	r3, r3, #0x5\n"
        "	add	r3, r3, #0x19\n"
        "	lsl	r3, r3, #0x18\n"
        "	lsr	r3, r3, #0x18\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	mov	r0, sl\n"
        "	mov	r1, r9\n"
        "	bl	InitWindow\n"
        "	mov	r0, sl\n"
        "	bl	sub_8002F44\n"
        "	mov	r0, #0xff\n"
        "	mov	r1, r9\n"
        "	strb	r0, [r1]\n"
        "	ldrb	r1, [r7]\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r1, r1, r5\n"
        "	ldrb	r2, [r6]\n"
        "	lsl	r0, r2, #0x1\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	ldr	r2, ._854 + 36\n"
        "	add	r1, r1, r2\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r1, [r1, r3]\n"
        "	mov	r0, #0xd\n"
        "	mul	r1, r1, r0\n"
        "	ldr	r0, ._854 + 40\n"
        "	add	r1, r1, r0\n"
        "	mov	r0, r9\n"
        "	bl	StringAppend\n"
        "	ldrb	r1, [r7]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x1\n"
        "	add r8, r8, r0\n"
        "	mov	r1, r8\n"
        "	ldrh	r2, [r1]\n"
        "	ldr	r3, ._854 + 24\n"
        "	add	r1, r0, r3\n"
        "	ldrb	r3, [r1]\n"
        "	ldr	r1, ._854 + 28\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0]\n"
        "	str	r0, [sp]\n"
        "	mov	r0, sl\n"
        "	mov	r1, r9\n"
        "	bl	InitWindow\n"
        "	mov	r0, sl\n"
        "	bl	sub_8002F44\n"
        "._853:\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._855:\n"
        "	.align	2, 0\n"
        "._854:\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x1ac\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	UnkDebug0+0x1ae\n"
        "	.word	UnkDebug0+0x1b0\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_02023A14+0xde\n"
        "	.word	gMoveNames\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80123D8()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	cmp	r5, #0x1d\n"
        "	bhi	._856	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x12\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r4, ._858\n"
        "	ldr	r0, ._858 + 4\n"
        "	mov	r8, r0\n"
        "	ldr	r6, ._858 + 8\n"
        "	ldrh	r1, [r6]\n"
        "	mov	sl, r1\n"
        "	ldrb	r7, [r6, #0x2]\n"
        "	ldrb	r2, [r6, #0x4]\n"
        "	mov	r9, r2\n"
        "	str	r2, [sp]\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, r8\n"
        "	mov	r2, sl\n"
        "	add	r3, r7, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	lsl	r5, r5, #0x1\n"
        "	ldr	r1, ._858 + 12\n"
        "	ldrb	r0, [r1]\n"
        "	mov	r2, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r0, r5, r0\n"
        "	ldr	r1, ._858 + 16\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r0, r2]\n"
        "	lsl	r0, r1, #0x3\n"
        "	sub	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._858 + 20\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0, #0x16]\n"
        "	mov	r2, #0xd\n"
        "	add	r1, r0, #0\n"
        "	mul	r1, r1, r2\n"
        "	ldr	r0, ._858 + 24\n"
        "	add	r1, r1, r0\n"
        "	mov	r0, r8\n"
        "	bl	StringCopy\n"
        "	mov	r1, r9\n"
        "	str	r1, [sp]\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, r8\n"
        "	mov	r2, sl\n"
        "	add	r3, r7, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x12\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldrh	r2, [r6, #0x6]\n"
        "	mov	r9, r2\n"
        "	ldrb	r0, [r6, #0x8]\n"
        "	mov	sl, r0\n"
        "	ldrb	r6, [r6, #0xa]\n"
        "	str	r6, [sp]\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, r8\n"
        "	mov	r3, sl\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r1, ._858 + 12\n"
        "	ldrb	r0, [r1]\n"
        "	mov	r2, #0x46\n"
        "	mul	r0, r0, r2\n"
        "	add	r5, r5, r0\n"
        "	ldr	r0, ._858 + 16\n"
        "	add	r5, r5, r0\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r5, r2]\n"
        "	lsl	r0, r1, #0x3\n"
        "	sub	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._858 + 20\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0, #0x17]\n"
        "	mov	r2, #0xd\n"
        "	add	r1, r0, #0\n"
        "	mul	r1, r1, r2\n"
        "	ldr	r0, ._858 + 24\n"
        "	add	r1, r1, r0\n"
        "	mov	r0, r8\n"
        "	bl	StringCopy\n"
        "	str	r6, [sp]\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, r8\n"
        "	mov	r2, r9\n"
        "	mov	r3, sl\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	b	._857\n"
        "._859:\n"
        "	.align	2, 0\n"
        "._858:\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x1d4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gBaseStats\n"
        "	.word	gAbilityNames\n"
        "._856:\n"
        "	ldr	r6, ._860\n"
        "	ldr	r1, ._860 + 4\n"
        "	add	r0, r6, #0\n"
        "	bl	StringCopy\n"
        "	ldr	r5, ._860 + 8\n"
        "	ldr	r4, ._860 + 12\n"
        "	ldrh	r2, [r4]\n"
        "	ldrb	r3, [r4, #0x2]\n"
        "	ldrb	r0, [r4, #0x4]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "	ldrh	r2, [r4, #0x6]\n"
        "	ldrb	r3, [r4, #0x8]\n"
        "	ldrb	r0, [r4, #0xa]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "._857:\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._861:\n"
        "	.align	2, 0\n"
        "._860:\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gAbilityNames\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	UnkDebug0+0x1d4\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012540()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	ldr	r5, ._862\n"
        "	ldr	r0, ._862 + 4\n"
        "	add	r0, r0, #0x44\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r0, r2]\n"
        "	add	r0, r5, #0\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r4, ._862 + 8\n"
        "	ldr	r1, ._862 + 12\n"
        "	mov	r3, #0x9b\n"
        "	lsl	r3, r3, #0x1\n"
        "	add	r0, r1, r3\n"
        "	ldrh	r2, [r0]\n"
        "	mov	r6, #0x9c\n"
        "	lsl	r6, r6, #0x1\n"
        "	add	r0, r1, r6\n"
        "	ldrb	r3, [r0]\n"
        "	add	r6, r6, #0x2\n"
        "	add	r0, r1, r6\n"
        "	ldrb	r0, [r0]\n"
        "	str	r0, [sp]\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r5, #0\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._863:\n"
        "	.align	2, 0\n"
        "._862:\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gUnknown_02023A14+0x52\n"
        "	.word	gUnknown_Debug_03004370\n"
        "	.word	UnkDebug0+0x6c\n"
        "\n"
    );
}

__attribute__((naked))
void debug_nullsub_3()
{
    asm(
        "	bx	lr\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80125A0()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r4, ._864\n"
        "	ldr	r3, ._864 + 4\n"
        "	ldr	r2, ._864 + 8\n"
        "	ldr	r0, ._864 + 12\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._864 + 16\n"
        "	ldrb	r2, [r1]\n"
        "	mov	r1, #0x8c\n"
        "	mul	r1, r1, r2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, r3\n"
        "	ldr	r0, [r0]\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, #0x6d\n"
        "	strb	r1, [r0]\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._865:\n"
        "	.align	2, 0\n"
        "._864:\n"
        "	.word	+0x2000000\n"
        "	.word	UnkDebug0+0x2c8\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80125E4()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r4, ._866\n"
        "	ldr	r3, ._866 + 4\n"
        "	ldr	r2, ._866 + 8\n"
        "	ldr	r0, ._866 + 12\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r0, r1, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._866 + 16\n"
        "	ldrb	r2, [r1]\n"
        "	mov	r1, #0x8c\n"
        "	mul	r1, r1, r2\n"
        "	add	r0, r0, r1\n"
        "	add	r0, r0, r3\n"
        "	ldr	r0, [r0]\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, #0x81\n"
        "	strb	r1, [r0]\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._867:\n"
        "	.align	2, 0\n"
        "._866:\n"
        "	.word	+0x2000000\n"
        "	.word	UnkDebug0+0x2c8\n"
        "	.word	gUnknown_Debug_030043A0\n"
        "	.word	gUnknown_Debug_030043A4\n"
        "	.word	gUnknown_Debug_03004360\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012628()
{
    asm(
        "	ldr	r3, ._868\n"
        "	ldr	r2, ._868 + 4\n"
        "	ldr	r0, ._868 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r1, r1, #0x2\n"
        "	ldr	r0, ._868 + 12\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r2\n"
        "	ldr	r0, [r1]\n"
        "	add	r0, r0, r3\n"
        "	mov	r1, #0x6d\n"
        "	strb	r1, [r0]\n"
        "	bx	lr\n"
        "._869:\n"
        "	.align	2, 0\n"
        "._868:\n"
        "	.word	+0x2000000\n"
        "	.word	UnkDebug0+0x3e0\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	gUnknown_Debug_03004360\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012658()
{
    asm(
        "	ldr	r3, ._870\n"
        "	ldr	r2, ._870 + 4\n"
        "	ldr	r0, ._870 + 8\n"
        "	ldrb	r1, [r0]\n"
        "	lsl	r1, r1, #0x2\n"
        "	ldr	r0, ._870 + 12\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	add	r1, r1, r2\n"
        "	ldr	r0, [r1]\n"
        "	add	r0, r0, r3\n"
        "	mov	r1, #0x81\n"
        "	strb	r1, [r0]\n"
        "	bx	lr\n"
        "._871:\n"
        "	.align	2, 0\n"
        "._870:\n"
        "	.word	+0x2000000\n"
        "	.word	UnkDebug0+0x3e0\n"
        "	.word	gUnknown_Debug_030043A8\n"
        "	.word	gUnknown_Debug_03004360\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012688()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	mov	r6, r8\n"
        "	push	{r6}\n"
        "	add	sp, sp, #0xfffffff4\n"
        "	mov	r1, #0x0\n"
        "	mov	r4, #0xcd\n"
        "	lsl	r4, r4, #0x1\n"
        "	ldr	r3, ._873\n"
        "	mov	r2, #0x0\n"
        "._872:\n"
        "	add	r0, r1, r3\n"
        "	strb	r2, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, r4\n"
        "	ble	._872	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	bl	SetHBlankCallback\n"
        "	mov	r0, #0x0\n"
        "	bl	SetVBlankCallback\n"
        "	mov	r5, #0x0\n"
        "	str	r5, [sp, #0x8]\n"
        "	ldr	r1, ._873 + 4\n"
        "	add	r0, sp, #0x8\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0xc0\n"
        "	lsl	r0, r0, #0x13\n"
        "	str	r0, [r1, #0x4]\n"
        "	ldr	r0, ._873 + 8\n"
        "	str	r0, [r1, #0x8]\n"
        "	ldr	r0, [r1, #0x8]\n"
        "	ldr	r0, ._873 + 12\n"
        "	strh	r5, [r0]\n"
        "	sub	r0, r0, #0xc\n"
        "	strh	r5, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	strh	r5, [r0]\n"
        "	sub	r0, r0, #0x2\n"
        "	strh	r5, [r0]\n"
        "	add	r0, r0, #0x4\n"
        "	strh	r5, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r5, [r0]\n"
        "	add	r0, r0, #0x2\n"
        "	strh	r5, [r0]\n"
        "	ldr	r4, ._873 + 16\n"
        "	add	r0, r4, #0\n"
        "	bl	SetUpWindowConfig\n"
        "	bl	ResetPaletteFade\n"
        "	ldr	r0, ._873 + 20\n"
        "	strh	r5, [r0]\n"
        "	ldr	r1, ._873 + 24\n"
        "	mov	r0, #0xa0\n"
        "	strh	r0, [r1]\n"
        "	ldr	r0, ._873 + 28\n"
        "	strh	r5, [r0]\n"
        "	ldr	r0, ._873 + 32\n"
        "	strh	r5, [r0]\n"
        "	ldr	r0, ._873 + 36\n"
        "	strh	r5, [r0]\n"
        "	ldr	r0, ._873 + 40\n"
        "	strh	r5, [r0]\n"
        "	ldr	r0, ._873 + 44\n"
        "	strh	r5, [r0]\n"
        "	ldr	r0, ._873 + 48\n"
        "	strh	r5, [r0]\n"
        "	ldr	r1, ._873 + 52\n"
        "	mov	r0, #0x9\n"
        "	strb	r0, [r1]\n"
        "	bl	sub_800D6D4\n"
        "	bl	sub_800DAB8\n"
        "	bl	ResetSpriteData\n"
        "	bl	ResetTasks\n"
        "	bl	FreeAllSpritePalettes\n"
        "	ldr	r1, ._873 + 56\n"
        "	mov	r0, #0x4\n"
        "	strb	r0, [r1]\n"
        "	ldr	r6, ._873 + 60\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r6]\n"
        "	ldr	r0, ._873 + 64\n"
        "	add	r1, r4, #0\n"
        "	bl	InitWindowFromConfig\n"
        "	ldrh	r2, [r6]\n"
        "	lsl	r0, r2, #0x3\n"
        "	ldr	r1, ._873 + 68\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._873 + 72\n"
        "	mov	r8, r1\n"
        "	lsl	r2, r2, #0x2\n"
        "	add r2, r2, r8\n"
        "	ldrb	r1, [r2]\n"
        "	ldrb	r2, [r2, #0x1]\n"
        "	mov	r3, #0x80\n"
        "	lsl	r3, r3, #0x12\n"
        "	ldr	r4, ._873 + 76\n"
        "	ldr	r4, [r4, #0x4]\n"
        "	str	r4, [sp]\n"
        "	ldrh	r4, [r6]\n"
        "	str	r4, [sp, #0x4]\n"
        "	bl	DecompressPicFromTable_2\n"
        "	ldr	r1, ._873 + 80\n"
        "	ldrh	r0, [r6]\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x88\n"
        "	lsl	r1, r1, #0x1\n"
        "	mov	r2, #0x20\n"
        "	bl	LoadCompressedPalette\n"
        "	ldrh	r0, [r6]\n"
        "	mov	r1, #0x1\n"
        "	bl	GetMonSpriteTemplate_803C56C\n"
        "	ldr	r0, ._873 + 84\n"
        "	ldrh	r1, [r6]\n"
        "	lsl	r1, r1, #0x2\n"
        "	add r1, r1, r8\n"
        "	ldrb	r2, [r1, #0x1]\n"
        "	add	r2, r2, #0x28\n"
        "	mov	r1, #0xb0\n"
        "	mov	r3, #0x28\n"
        "	bl	CreateSprite\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	ldr	r3, ._873 + 88\n"
        "	lsl	r1, r4, #0x4\n"
        "	add	r1, r1, r4\n"
        "	lsl	r1, r1, #0x2\n"
        "	add	r0, r3, #0\n"
        "	add	r0, r0, #0x1c\n"
        "	add	r0, r1, r0\n"
        "	ldr	r2, ._873 + 92\n"
        "	str	r2, [r0]\n"
        "	add	r1, r1, r3\n"
        "	ldrb	r2, [r1, #0x5]\n"
        "	mov	r0, #0xf\n"
        "	and	r0, r0, r2\n"
        "	mov	r2, #0x10\n"
        "	orr	r0, r0, r2\n"
        "	strb	r0, [r1, #0x5]\n"
        "	mov	r1, #0x80\n"
        "	lsl	r1, r1, #0x13\n"
        "	mov	r2, #0xfa\n"
        "	lsl	r2, r2, #0x5\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	ldr	r0, ._873 + 96\n"
        "	bl	SetHBlankCallback\n"
        "	ldr	r0, ._873 + 100\n"
        "	bl	SetVBlankCallback\n"
        "	bl	gScriptFuncs_End+0x14f4\n"
        "	ldr	r0, ._873 + 104\n"
        "	mov	r1, #0x0\n"
        "	bl	CreateTask\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r2, ._873 + 108\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r2\n"
        "	strh	r5, [r1, #0x8]\n"
        "	strh	r4, [r1, #0xa]\n"
        "	ldr	r0, ._873 + 112\n"
        "	bl	SetMainCallback2\n"
        "	add	sp, sp, #0xc\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._874:\n"
        "	.align	2, 0\n"
        "._873:\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	0x40000d4\n"
        "	.word	0x85006000\n"
        "	.word	0x400004c\n"
        "	.word	gWindowConfig_81E6C58\n"
        "	.word	gUnknown_030042A4\n"
        "	.word	gUnknown_030042A0\n"
        "	.word	gUnknown_030042C0\n"
        "	.word	gUnknown_030041B4\n"
        "	.word	gUnknown_03004288\n"
        "	.word	gUnknown_03004280\n"
        "	.word	gUnknown_030041B0\n"
        "	.word	gUnknown_030041B8\n"
        "	.word	gBattleTerrain\n"
        "	.word	gReservedSpritePaletteCount\n"
        "	.word	gCurrentMove\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gMonFrontPicTable\n"
        "	.word	gMonFrontPicCoords\n"
        "	.word	gUnknown_081FAF4C\n"
        "	.word	gMonPaletteTable\n"
        "	.word	gUnknown_02024E8C\n"
        "	.word	gSprites\n"
        "	.word	nullsub_37+1\n"
        "	.word	debug_nullsub_45+1\n"
        "	.word	debug_sub_8011DD4+1\n"
        "	.word	debug_sub_8012D10+1\n"
        "	.word	gTasks\n"
        "	.word	debug_sub_8012878+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012878()
{
    asm(
        "	push	{lr}\n"
        "	bl	AnimateSprites\n"
        "	bl	BuildOamBuffer\n"
        "	ldr	r0, ._876\n"
        "	bl	sub_800374C\n"
        "	bl	UpdatePaletteFade\n"
        "	bl	RunTasks\n"
        "	ldr	r0, ._876 + 4\n"
        "	ldrh	r1, [r0, #0x2c]\n"
        "	mov	r0, #0x82\n"
        "	lsl	r0, r0, #0x1\n"
        "	cmp	r1, r0\n"
        "	bne	._875	@cond_branch\n"
        "	ldr	r0, ._876 + 8\n"
        "	bl	SetMainCallback2\n"
        "._875:\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._877:\n"
        "	.align	2, 0\n"
        "._876:\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gMain\n"
        "	.word	debug_sub_80108B8+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80128B4()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	mov	r6, r8\n"
        "	push	{r6}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x9\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r5, ._878\n"
        "	ldr	r4, ._878 + 4\n"
        "	mov	r0, #0x23\n"
        "	mov	r8, r0\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0x90\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r6, ._878 + 8\n"
        "	ldrh	r1, [r6]\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r4, #0x3]\n"
        "	mov	r0, #0xff\n"
        "	strb	r0, [r4, #0x4]\n"
        "	ldrh	r1, [r6]\n"
        "	mov	r0, #0xb\n"
        "	mul	r1, r1, r0\n"
        "	ldr	r0, ._878 + 12\n"
        "	add	r1, r1, r0\n"
        "	add	r0, r4, #0\n"
        "	bl	StringAppend\n"
        "	mov	r0, r8\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0x90\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._879:\n"
        "	.align	2, 0\n"
        "._878:\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gCurrentMove\n"
        "	.word	gSpeciesNames\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012938()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	mov	r6, sl\n"
        "	mov	r5, r9\n"
        "	mov	r4, r8\n"
        "	push	{r4, r5, r6}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	add	r5, r0, #0\n"
        "	lsl	r5, r5, #0x18\n"
        "	lsr	r5, r5, #0x18\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x7\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r6, ._880\n"
        "	ldr	r4, ._880 + 4\n"
        "	mov	r0, #0x25\n"
        "	mov	r8, r0\n"
        "	str	r0, [sp]\n"
        "	add	r0, r6, #0\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0xa2\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	add	r0, r6, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r1, ._880 + 8\n"
        "	add	r0, r4, #0\n"
        "	bl	StringCopy\n"
        "	add	r0, r4, #4\n"
        "	ldr	r1, ._880 + 12\n"
        "	mov	sl, r1\n"
        "	ldr	r2, ._880 + 16\n"
        "	mov	r9, r2\n"
        "	ldrh	r1, [r2]\n"
        "	sub	r1, r1, #0x1\n"
        "	add r1, r1, sl\n"
        "	ldrb	r1, [r1]\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, r8\n"
        "	str	r0, [sp]\n"
        "	add	r0, r6, #0\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0xa2\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	add	r0, r6, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r2, ._880 + 20\n"
        "	ldr	r1, ._880 + 24\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0xa\n"
        "	ldsh	r0, [r0, r1]\n"
        "	lsl	r1, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x2\n"
        "	add	r1, r1, r2\n"
        "	mov	r2, r9\n"
        "	ldrh	r0, [r2]\n"
        "	sub	r0, r0, #0x1\n"
        "	add r0, r0, sl\n"
        "	ldrb	r0, [r0]\n"
        "	neg	r0, r0\n"
        "	strh	r0, [r1, #0x26]\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._881:\n"
        "	.align	2, 0\n"
        "._880:\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	UnkDebug0+0x400\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	gCurrentMove\n"
        "	.word	gSprites\n"
        "	.word	gTasks\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80129F8()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	mov	r6, r8\n"
        "	push	{r6}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	add	r5, r0, #0\n"
        "	lsl	r5, r5, #0x18\n"
        "	lsr	r5, r5, #0x18\n"
        "	ldr	r6, ._882\n"
        "	ldrh	r2, [r6]\n"
        "	lsl	r0, r2, #0x3\n"
        "	ldr	r1, ._882 + 4\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, ._882 + 8\n"
        "	mov	r8, r1\n"
        "	lsl	r2, r2, #0x2\n"
        "	add r2, r2, r8\n"
        "	ldrb	r1, [r2]\n"
        "	ldrb	r2, [r2, #0x1]\n"
        "	mov	r3, #0x80\n"
        "	lsl	r3, r3, #0x12\n"
        "	ldr	r4, ._882 + 12\n"
        "	ldr	r4, [r4, #0x4]\n"
        "	str	r4, [sp]\n"
        "	ldrh	r4, [r6]\n"
        "	str	r4, [sp, #0x4]\n"
        "	bl	DecompressPicFromTable_2\n"
        "	ldr	r1, ._882 + 16\n"
        "	ldrh	r0, [r6]\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	r1, #0x88\n"
        "	lsl	r1, r1, #0x1\n"
        "	mov	r2, #0x20\n"
        "	bl	LoadCompressedPalette\n"
        "	ldr	r4, ._882 + 20\n"
        "	ldr	r0, ._882 + 24\n"
        "	lsl	r2, r5, #0x2\n"
        "	add	r2, r2, r5\n"
        "	lsl	r2, r2, #0x3\n"
        "	add	r2, r2, r0\n"
        "	mov	r1, #0xa\n"
        "	ldsh	r0, [r2, r1]\n"
        "	lsl	r1, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x2\n"
        "	add	r1, r1, r4\n"
        "	ldrh	r0, [r6]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add r0, r0, r8\n"
        "	ldrb	r0, [r0, #0x1]\n"
        "	add	r0, r0, #0x28\n"
        "	strh	r0, [r1, #0x22]\n"
        "	mov	r1, #0xa\n"
        "	ldsh	r0, [r2, r1]\n"
        "	lsl	r1, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x2\n"
        "	add	r1, r1, r4\n"
        "	ldr	r3, ._882 + 28\n"
        "	ldrh	r0, [r6]\n"
        "	sub	r0, r0, #0x1\n"
        "	add	r0, r0, r3\n"
        "	ldrb	r0, [r0]\n"
        "	neg	r0, r0\n"
        "	strh	r0, [r1, #0x26]\n"
        "	mov	r0, #0xa\n"
        "	ldsh	r1, [r2, r0]\n"
        "	lsl	r0, r1, #0x4\n"
        "	add	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r4\n"
        "	mov	r1, #0x0\n"
        "	bl	StartSpriteAnim\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._883:\n"
        "	.align	2, 0\n"
        "._882:\n"
        "	.word	gCurrentMove\n"
        "	.word	gMonFrontPicTable\n"
        "	.word	gMonFrontPicCoords\n"
        "	.word	gUnknown_081FAF4C\n"
        "	.word	gMonPaletteTable\n"
        "	.word	gSprites\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012AC0()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	lsl	r1, r1, #0x18\n"
        "	lsr	r6, r1, #0x18\n"
        "	ldr	r3, ._885\n"
        "	ldr	r4, ._885 + 4\n"
        "	b	._884\n"
        "._886:\n"
        "	.align	2, 0\n"
        "._885:\n"
        "	.word	gCurrentMove\n"
        "	.word	gBaseStats\n"
        "._890:\n"
        "	ldrb	r0, [r1, #0x7]\n"
        "	cmp	r0, #0x2\n"
        "	beq	._887	@cond_branch\n"
        "._884:\n"
        "	add	r2, r3, #0\n"
        "	lsl	r0, r5, #0x18\n"
        "	asr	r0, r0, #0x18\n"
        "	ldrh	r1, [r2]\n"
        "	add	r0, r0, r1\n"
        "	strh	r0, [r2]\n"
        "	lsl	r0, r0, #0x10\n"
        "	cmp	r0, #0\n"
        "	bne	._888	@cond_branch\n"
        "	ldr	r1, ._891\n"
        "	add	r0, r1, #0\n"
        "	strh	r0, [r2]\n"
        "._888:\n"
        "	ldrh	r1, [r2]\n"
        "	ldr	r0, ._891\n"
        "	cmp	r1, r0\n"
        "	bne	._889	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r2]\n"
        "._889:\n"
        "	ldrh	r0, [r3]\n"
        "	lsl	r1, r0, #0x3\n"
        "	sub	r1, r1, r0\n"
        "	lsl	r1, r1, #0x2\n"
        "	add	r1, r1, r4\n"
        "	ldrb	r0, [r1, #0x6]\n"
        "	cmp	r0, #0x2\n"
        "	bne	._890	@cond_branch\n"
        "._887:\n"
        "	bl	debug_sub_80128B4\n"
        "	add	r0, r6, #0\n"
        "	bl	debug_sub_8012938\n"
        "	add	r0, r6, #0\n"
        "	bl	debug_sub_80129F8\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._892:\n"
        "	.align	2, 0\n"
        "._891:\n"
        "	.word	0x19b\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012B2C()
{
    asm(
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x11\n"
        "	ldr	r1, ._893\n"
        "	add	r2, r0, r1\n"
        "	mov	r1, #0x1\n"
        "	strh	r1, [r2]\n"
        "	ldr	r1, ._893 + 4\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x2\n"
        "	strh	r1, [r0]\n"
        "	bx	lr\n"
        "._894:\n"
        "	.align	2, 0\n"
        "._893:\n"
        "	.word	0x600c772\n"
        "	.word	0x600c7b2\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012B4C()
{
    asm(
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x11\n"
        "	ldr	r2, ._895\n"
        "	add	r1, r0, r2\n"
        "	ldr	r3, ._895 + 4\n"
        "	add	r2, r3, #0\n"
        "	strh	r2, [r1]\n"
        "	ldr	r1, ._895 + 8\n"
        "	add	r0, r0, r1\n"
        "	strh	r2, [r0]\n"
        "	bx	lr\n"
        "._896:\n"
        "	.align	2, 0\n"
        "._895:\n"
        "	.word	0x600c772\n"
        "	.word	0x1016\n"
        "	.word	0x600c7b2\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012B70()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	lsl	r1, r1, #0x18\n"
        "	lsr	r6, r1, #0x18\n"
        "	cmp	r6, #0\n"
        "	beq	._897	@cond_branch\n"
        "	mov	r4, #0x1\n"
        "	str	r4, [sp]\n"
        "	mov	r0, #0x18\n"
        "	mov	r1, #0x1c\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0x21\n"
        "	bl	sub_802BBD4\n"
        "	bl	debug_sub_80128B4\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_8012938\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_80129F8\n"
        "	ldr	r1, ._899\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	strh	r4, [r0, #0x8]\n"
        "	b	._898\n"
        "._900:\n"
        "	.align	2, 0\n"
        "._899:\n"
        "	.word	gTasks\n"
        "._897:\n"
        "	str	r6, [sp]\n"
        "	mov	r0, #0x18\n"
        "	mov	r1, #0x1c\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0x21\n"
        "	bl	sub_802BBD4\n"
        "	ldr	r0, ._901\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	mov	r0, #0x2\n"
        "	strh	r0, [r4, #0x8]\n"
        "	ldr	r5, ._901 + 4\n"
        "	ldr	r1, ._901 + 8\n"
        "	mov	r2, #0xa4\n"
        "	lsl	r2, r2, #0x2\n"
        "	mov	r0, #0x1d\n"
        "	str	r0, [sp]\n"
        "	add	r0, r5, #0\n"
        "	mov	r3, #0x1a\n"
        "	bl	InitWindow\n"
        "	add	r0, r5, #0\n"
        "	bl	sub_8002F44\n"
        "	strh	r6, [r4, #0xe]\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8012B2C\n"
        "._898:\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._902:\n"
        "	.align	2, 0\n"
        "._901:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_03004210\n"
        "	.word	UnkDebug0+0x422\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012C08()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r8\n"
        "	push	{r7}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	add	r4, r1, #0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x9\n"
        "	bl	debug_sub_8010A7C\n"
        "	ldr	r7, ._905\n"
        "	ldr	r5, ._905 + 4\n"
        "	mov	r0, #0x23\n"
        "	mov	r8, r0\n"
        "	str	r0, [sp]\n"
        "	add	r0, r7, #0\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0x90\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	add	r0, r7, #0\n"
        "	bl	sub_8002F44\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x7\n"
        "	bl	debug_sub_8010A7C\n"
        "	mov	r0, #0x25\n"
        "	str	r0, [sp]\n"
        "	add	r0, r7, #0\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0xa2\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	add	r0, r7, #0\n"
        "	bl	sub_8002F44\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0x18\n"
        "	mov	r1, #0x1c\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0x21\n"
        "	bl	sub_802BBD4\n"
        "	cmp	r4, #0\n"
        "	beq	._903	@cond_branch\n"
        "	ldr	r1, ._905 + 8\n"
        "	lsl	r4, r6, #0x2\n"
        "	add	r0, r4, r6\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x4\n"
        "	strh	r1, [r0, #0x8]\n"
        "	ldr	r1, ._905 + 12\n"
        "	mov	r0, r8\n"
        "	str	r0, [sp]\n"
        "	add	r0, r7, #0\n"
        "	mov	r2, #0x90\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "	b	._904\n"
        "._906:\n"
        "	.align	2, 0\n"
        "._905:\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gBattleTextBuff1\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_Debug_821F7F3\n"
        "._903:\n"
        "	ldr	r1, ._907\n"
        "	lsl	r4, r6, #0x2\n"
        "	add	r0, r4, r6\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x3\n"
        "	strh	r1, [r0, #0x8]\n"
        "	ldr	r1, ._907 + 4\n"
        "	mov	r0, r8\n"
        "	str	r0, [sp]\n"
        "	add	r0, r7, #0\n"
        "	mov	r2, #0x90\n"
        "	mov	r3, #0x2\n"
        "	bl	InitWindow\n"
        "._904:\n"
        "	add	r5, r4, #0\n"
        "	ldr	r4, ._907 + 8\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r1, ._907 + 12\n"
        "	mov	r2, #0xa4\n"
        "	lsl	r2, r2, #0x2\n"
        "	mov	r0, #0x1d\n"
        "	str	r0, [sp]\n"
        "	add	r0, r4, #0\n"
        "	mov	r3, #0x1a\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r1, ._907\n"
        "	add	r0, r5, r6\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x1\n"
        "	strh	r1, [r0, #0xe]\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8012B2C\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._908:\n"
        "	.align	2, 0\n"
        "._907:\n"
        "	.word	gTasks\n"
        "	.word	UnkDebug0+0x432\n"
        "	.word	gUnknown_03004210\n"
        "	.word	gUnknown_08400D7A\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8012D10()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	ldr	r1, ._911\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r0, r1]\n"
        "	cmp	r0, #0x4\n"
        "	bls	._909	@cond_branch\n"
        "	b	._1067\n"
        "._909:\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._911 + 4\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._912:\n"
        "	.align	2, 0\n"
        "._911:\n"
        "	.word	gTasks\n"
        "	.word	._913\n"
        "._913:\n"
        "	.word	._914\n"
        "	.word	._915\n"
        "	.word	._916\n"
        "	.word	._917\n"
        "	.word	._918\n"
        "._914:\n"
        "	bl	debug_sub_80128B4\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_8012938\n"
        "	ldr	r4, ._920\n"
        "	ldr	r1, ._920 + 4\n"
        "	mov	r2, #0xc8\n"
        "	lsl	r2, r2, #0x1\n"
        "	mov	r0, #0x23\n"
        "	str	r0, [sp]\n"
        "	add	r0, r4, #0\n"
        "	mov	r3, #0x13\n"
        "	bl	InitWindow\n"
        "	add	r0, r4, #0\n"
        "	bl	sub_8002F44\n"
        "	ldr	r1, ._920 + 8\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r1, [r0, #0x8]\n"
        "	add	r1, r1, #0x1\n"
        "	strh	r1, [r0, #0x8]\n"
        "	ldrb	r0, [r0, #0xc]\n"
        "	b	._919\n"
        "._921:\n"
        "	.align	2, 0\n"
        "._920:\n"
        "	.word	gUnknown_03004210\n"
        "	.word	UnkDebug0+0x405\n"
        "	.word	gTasks\n"
        "._915:\n"
        "	ldr	r2, ._924\n"
        "	ldrh	r1, [r2, #0x2e]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._922	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._924 + 4\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xc]\n"
        "	bl	nullsub_8\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	mov	r0, #0x3\n"
        "	neg	r0, r0\n"
        "	and	r0, r0, r1\n"
        "	b	._931\n"
        "._925:\n"
        "	.align	2, 0\n"
        "._924:\n"
        "	.word	gMain\n"
        "	.word	gTasks\n"
        "._922:\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._926	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._928\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xc]\n"
        "	bl	nullsub_8\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	mov	r0, #0x2\n"
        "	b	._927\n"
        "._929:\n"
        "	.align	2, 0\n"
        "._928:\n"
        "	.word	gTasks\n"
        "._926:\n"
        "	mov	r0, #0x20\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._930	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._932\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xc]\n"
        "	bl	nullsub_8\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	and	r0, r0, r1\n"
        "	b	._931\n"
        "._933:\n"
        "	.align	2, 0\n"
        "._932:\n"
        "	.word	gTasks\n"
        "._930:\n"
        "	mov	r0, #0x10\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._934	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._936\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xc]\n"
        "	bl	nullsub_8\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	mov	r0, #0x1\n"
        "._927:\n"
        "	orr	r0, r0, r1\n"
        "._931:\n"
        "	strh	r0, [r4, #0xc]\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "._919:\n"
        "	mov	r1, #0x0\n"
        "	bl	sub_802E3E4\n"
        "	b	._1067\n"
        "._937:\n"
        "	.align	2, 0\n"
        "._936:\n"
        "	.word	gTasks\n"
        "._934:\n"
        "	ldrh	r1, [r2, #0x30]\n"
        "	mov	r4, #0x1\n"
        "	add	r0, r4, #0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._938	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._943\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, #0xc\n"
        "	ldsh	r0, [r0, r2]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._939	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._940	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._941	@cond_branch\n"
        "	b	._1067\n"
        "._944:\n"
        "	.align	2, 0\n"
        "._943:\n"
        "	.word	gTasks\n"
        "._940:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._945	@cond_branch\n"
        "._990:\n"
        "	cmp	r0, #0x3\n"
        "	bne	._946	@cond_branch\n"
        "	b	._1014\n"
        "._946:\n"
        "	b	._1067\n"
        "._941:\n"
        "	ldr	r1, ._952\n"
        "	ldr	r0, ._952 + 4\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	add	r1, r0, r1\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x3f\n"
        "	bls	._949	@cond_branch\n"
        "	b	._1067\n"
        "._949:\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._1019\n"
        "._953:\n"
        "	.align	2, 0\n"
        "._952:\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	gCurrentMove\n"
        "._939:\n"
        "	mov	r0, #0x1\n"
        "	b	._997\n"
        "._945:\n"
        "	ldr	r1, ._957\n"
        "	ldrh	r2, [r1]\n"
        "	mov	r0, #0xcd\n"
        "	lsl	r0, r0, #0x1\n"
        "	cmp	r2, r0\n"
        "	bhi	._955	@cond_branch\n"
        "	add	r0, r2, #1\n"
        "._979:\n"
        "	strh	r0, [r1]\n"
        "	b	._1025\n"
        "._958:\n"
        "	.align	2, 0\n"
        "._957:\n"
        "	.word	gCurrentMove\n"
        "._955:\n"
        "	strh	r4, [r1]\n"
        "	b	._1025\n"
        "._938:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._960	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._966\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0xc\n"
        "	ldsh	r0, [r0, r1]\n"
        "	cmp	r0, #0x1\n"
        "	bne	._961	@cond_branch\n"
        "	b	._1007\n"
        "._961:\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._963	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._964	@cond_branch\n"
        "	b	._1067\n"
        "._967:\n"
        "	.align	2, 0\n"
        "._966:\n"
        "	.word	gTasks\n"
        "._963:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._968	@cond_branch\n"
        "	b	._990\n"
        "._964:\n"
        "	ldr	r1, ._973\n"
        "	ldr	r0, ._973 + 4\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	add	r1, r0, r1\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	bne	._970	@cond_branch\n"
        "	b	._1067\n"
        "._970:\n"
        "	sub	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	b	._1019\n"
        "._974:\n"
        "	.align	2, 0\n"
        "._973:\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	gCurrentMove\n"
        "._968:\n"
        "	ldr	r1, ._977\n"
        "	ldrh	r0, [r1]\n"
        "	cmp	r0, #0x1\n"
        "	bls	._975	@cond_branch\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._979\n"
        "._978:\n"
        "	.align	2, 0\n"
        "._977:\n"
        "	.word	gCurrentMove\n"
        "._975:\n"
        "	ldr	r2, ._980\n"
        "	add	r0, r2, #0\n"
        "	b	._979\n"
        "._981:\n"
        "	.align	2, 0\n"
        "._980:\n"
        "	.word	0x19b\n"
        "._960:\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._982	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._987\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0xc\n"
        "	ldsh	r0, [r0, r1]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._983	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._984	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._985	@cond_branch\n"
        "	b	._1067\n"
        "._988:\n"
        "	.align	2, 0\n"
        "._987:\n"
        "	.word	gTasks\n"
        "._984:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._989	@cond_branch\n"
        "	b	._990\n"
        "._985:\n"
        "	ldr	r3, ._995\n"
        "	ldr	r2, ._995 + 4\n"
        "	ldrh	r0, [r2]\n"
        "	sub	r0, r0, #0x1\n"
        "	add	r1, r0, r3\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x3f\n"
        "	bls	._991	@cond_branch\n"
        "	b	._1067\n"
        "._991:\n"
        "	add	r0, r0, #0x8\n"
        "	strb	r0, [r1]\n"
        "	ldrh	r0, [r2]\n"
        "	sub	r0, r0, #0x1\n"
        "	add	r1, r0, r3\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x40\n"
        "	bls	._1019	@cond_branch\n"
        "	mov	r0, #0x40\n"
        "	strb	r0, [r1]\n"
        "	b	._1019\n"
        "._996:\n"
        "	.align	2, 0\n"
        "._995:\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	gCurrentMove\n"
        "._983:\n"
        "	mov	r0, #0x1\n"
        "	b	._997\n"
        "._989:\n"
        "	ldr	r3, ._1000\n"
        "	ldrh	r2, [r3]\n"
        "	add	r1, r2, #0\n"
        "	add	r1, r1, #0xa\n"
        "	ldr	r0, ._1000 + 4\n"
        "	cmp	r1, r0\n"
        "	bgt	._998	@cond_branch\n"
        "	strh	r1, [r3]\n"
        "	b	._1025\n"
        "._1001:\n"
        "	.align	2, 0\n"
        "._1000:\n"
        "	.word	gCurrentMove\n"
        "	.word	0x19b\n"
        "._998:\n"
        "	ldr	r1, ._1003\n"
        "	add	r0, r2, r1\n"
        "	strh	r0, [r3]\n"
        "	b	._1025\n"
        "._1004:\n"
        "	.align	2, 0\n"
        "._1003:\n"
        "	.word	0xfffffe70\n"
        "._982:\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._1005	@cond_branch\n"
        "	b	._1067\n"
        "._1005:\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._1011\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r2, #0xc\n"
        "	ldsh	r3, [r0, r2]\n"
        "	cmp	r3, #0x1\n"
        "	beq	._1007	@cond_branch\n"
        "	cmp	r3, #0x1\n"
        "	bgt	._1008	@cond_branch\n"
        "	cmp	r3, #0\n"
        "	beq	._1009	@cond_branch\n"
        "	b	._1067\n"
        "._1012:\n"
        "	.align	2, 0\n"
        "._1011:\n"
        "	.word	gTasks\n"
        "._1008:\n"
        "	cmp	r3, #0x2\n"
        "	beq	._1013	@cond_branch\n"
        "	cmp	r3, #0x3\n"
        "	beq	._1014	@cond_branch\n"
        "	b	._1067\n"
        "._1009:\n"
        "	ldr	r1, ._1020\n"
        "	ldr	r0, ._1020 + 4\n"
        "	ldrh	r0, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	add	r2, r0, r1\n"
        "	ldrb	r0, [r2]\n"
        "	add	r1, r0, #0\n"
        "	cmp	r1, #0\n"
        "	bne	._1016	@cond_branch\n"
        "	b	._1067\n"
        "._1016:\n"
        "	cmp	r1, #0x8\n"
        "	bls	._1018	@cond_branch\n"
        "	sub	r0, r0, #0x8\n"
        "	strb	r0, [r2]\n"
        "	b	._1019\n"
        "._1021:\n"
        "	.align	2, 0\n"
        "._1020:\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	gCurrentMove\n"
        "._1018:\n"
        "	strb	r3, [r2]\n"
        "._1019:\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_8012938\n"
        "	b	._1067\n"
        "._1007:\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "._997:\n"
        "	add	r1, r5, #0\n"
        "	bl	debug_sub_8012AC0\n"
        "	b	._1067\n"
        "._1013:\n"
        "	ldr	r2, ._1026\n"
        "	ldrh	r0, [r2]\n"
        "	add	r1, r0, #0\n"
        "	sub	r1, r1, #0xa\n"
        "	cmp	r1, #0x1\n"
        "	ble	._1024	@cond_branch\n"
        "	strh	r1, [r2]\n"
        "	b	._1025\n"
        "._1027:\n"
        "	.align	2, 0\n"
        "._1026:\n"
        "	.word	gCurrentMove\n"
        "._1024:\n"
        "	mov	r1, #0xc8\n"
        "	lsl	r1, r1, #0x1\n"
        "	add	r0, r0, r1\n"
        "	strh	r0, [r2]\n"
        "._1025:\n"
        "	bl	debug_sub_80128B4\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_8012938\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_80129F8\n"
        "	b	._1067\n"
        "._1014:\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x0\n"
        "	bl	debug_sub_8012B70\n"
        "	b	._1067\n"
        "._916:\n"
        "	ldr	r0, ._1032\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1030	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1032 + 4\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xe]\n"
        "	bl	debug_sub_8012B4C\n"
        "	mov	r0, #0x0\n"
        "	b	._1055\n"
        "._1033:\n"
        "	.align	2, 0\n"
        "._1032:\n"
        "	.word	gMain\n"
        "	.word	gTasks\n"
        "._1030:\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._1046	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1035	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1037\n"
        "	lsl	r1, r5, #0x2\n"
        "	add	r1, r1, r5\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r0\n"
        "	ldrb	r1, [r1, #0xe]\n"
        "	add	r0, r5, #0\n"
        "	bl	debug_sub_8012C08\n"
        "	b	._1067\n"
        "._1038:\n"
        "	.align	2, 0\n"
        "._1037:\n"
        "	.word	gTasks\n"
        "._1035:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._1039	@cond_branch\n"
        "	b	._1067\n"
        "._1039:\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	b	._1063\n"
        "._917:\n"
        "	ldr	r0, ._1044\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1042	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1044 + 4\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xe]\n"
        "	bl	debug_sub_8012B4C\n"
        "	mov	r0, #0x0\n"
        "	b	._1055\n"
        "._1045:\n"
        "	.align	2, 0\n"
        "._1044:\n"
        "	.word	gMain\n"
        "	.word	gTasks\n"
        "._1042:\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._1046	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1047	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1050\n"
        "	lsl	r1, r5, #0x2\n"
        "	add	r1, r1, r5\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r0\n"
        "	mov	r2, #0xe\n"
        "	ldsh	r0, [r1, r2]\n"
        "	cmp	r0, #0\n"
        "	bne	._1063	@cond_branch\n"
        "	ldr	r1, ._1050 + 4\n"
        "	ldr	r2, ._1050 + 8\n"
        "	mov	r0, #0x1f\n"
        "	bl	debug_sub_80132C8\n"
        "	b	._1063\n"
        "._1051:\n"
        "	.align	2, 0\n"
        "._1050:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	0x19b\n"
        "._1047:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1067	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	b	._1063\n"
        "._918:\n"
        "	ldr	r0, ._1056\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1054	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1056 + 4\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xe]\n"
        "	bl	debug_sub_8012B4C\n"
        "	mov	r0, #0x0\n"
        "	b	._1055\n"
        "._1057:\n"
        "	.align	2, 0\n"
        "._1056:\n"
        "	.word	gMain\n"
        "	.word	gTasks\n"
        "._1054:\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1058	@cond_branch\n"
        "._1046:\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1060\n"
        "	lsl	r4, r5, #0x2\n"
        "	add	r4, r4, r5\n"
        "	lsl	r4, r4, #0x3\n"
        "	add	r4, r4, r0\n"
        "	ldrb	r0, [r4, #0xe]\n"
        "	bl	debug_sub_8012B4C\n"
        "	mov	r0, #0x1\n"
        "._1055:\n"
        "	strh	r0, [r4, #0xe]\n"
        "	bl	debug_sub_8012B2C\n"
        "	b	._1067\n"
        "._1061:\n"
        "	.align	2, 0\n"
        "._1060:\n"
        "	.word	gTasks\n"
        "._1058:\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1062	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._1065\n"
        "	lsl	r1, r5, #0x2\n"
        "	add	r1, r1, r5\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r0\n"
        "	mov	r2, #0xe\n"
        "	ldsh	r0, [r1, r2]\n"
        "	cmp	r0, #0\n"
        "	bne	._1063	@cond_branch\n"
        "	ldr	r1, ._1065 + 4\n"
        "	ldr	r2, ._1065 + 8\n"
        "	mov	r0, #0x1f\n"
        "	bl	debug_sub_8013294\n"
        "._1063:\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1\n"
        "	bl	debug_sub_8012B70\n"
        "	b	._1067\n"
        "._1066:\n"
        "	.align	2, 0\n"
        "._1065:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_02023A14+0x13e\n"
        "	.word	0x19b\n"
        "._1062:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1067	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x1\n"
        "	bl	debug_sub_8012B70\n"
        "._1067:\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8013240()
{
    asm(
        "	push	{lr}\n"
        "	bl	gScriptFuncs_End+0x2fec\n"
        "	lsl	r0, r0, #0x10\n"
        "	cmp	r0, #0\n"
        "	beq	._1068	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	b	._1069\n"
        "._1068:\n"
        "	mov	r0, #0x0\n"
        "._1069:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8013258()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r6, r1, #0\n"
        "	add	r5, r2, #0\n"
        "	b	._1070\n"
        "._1072:\n"
        "	ldr	r0, ._1074\n"
        "	add	r5, r5, r0\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x5\n"
        "	add	r6, r6, r0\n"
        "	add	r0, r4, #1\n"
        "._1070:\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r4, r0, #0x10\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	gScriptFuncs_End+0x2f60\n"
        "	cmp	r0, #0\n"
        "	bne	._1071	@cond_branch\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x5\n"
        "	cmp	r5, r0\n"
        "	bhi	._1072	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	b	._1073\n"
        "._1075:\n"
        "	.align	2, 0\n"
        "._1074:\n"
        "	.word	0xfffff000\n"
        "._1071:\n"
        "	mov	r0, #0x0\n"
        "._1073:\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8013294()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r5, r1, #0\n"
        "	add	r6, r2, #0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	bl	debug_sub_8013240\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._1076	@cond_branch\n"
        "	bl	gScriptFuncs_End+0x19f4\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r5, #0\n"
        "	add	r2, r6, #0\n"
        "	bl	debug_sub_8013258\n"
        "	add	r4, r0, #0\n"
        "	bl	gScriptFuncs_End+0x1a70\n"
        "	add	r0, r4, #0\n"
        "	b	._1077\n"
        "._1076:\n"
        "	mov	r0, #0x0\n"
        "._1077:\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80132C8()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r5, r1, #0\n"
        "	add	r6, r2, #0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	bl	debug_sub_8013240\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._1078	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x0\n"
        "	add	r2, r5, #0\n"
        "	add	r3, r6, #0\n"
        "	bl	gScriptFuncs_End+0x2d64\n"
        "._1078:\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}


void oac_poke_opponent(struct Sprite *sprite)
{
    sprite->callback = sub_8010278;
    StartSpriteAnimIfDifferent(sprite, 0);
    BeginNormalPaletteFade(0x00020000, 0, 10, 10, 0x3DEF);
}

void sub_8010278(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x += 2;
        if (sprite->pos2.x == 0)
        {
            sprite->callback = sub_80102AC;
            PlayCry1(sprite->data2, 25);
        }
    }
}

void sub_80102AC(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sub_804777C(sprite->data0);
        sub_8043DFC(gHealthboxIDs[sprite->data0]);
        sprite->callback = nullsub_37;
        StartSpriteAnimIfDifferent(sprite, 0);
        BeginNormalPaletteFade(0x00020000, 0, 10, 0, 0x3DEF);
    }
}

void nullsub_37(struct Sprite *sprite)
{
}

void unref_sub_801030C(struct Sprite *sprite)
{
    sprite->data3 = 6;
    sprite->data4 = 1;
    sprite->callback = sub_8010320;
}

void sub_8010320(struct Sprite *sprite)
{
    sprite->data4--;
    if (sprite->data4 == 0)
    {
        sprite->data4 = 8;
        sprite->invisible ^= 1;
        sprite->data3--;
        if (sprite->data3 == 0)
        {
            sprite->invisible = FALSE;
            sprite->callback = nullsub_37;
            gUnknown_03004284 = 0;
        }
    }
}

void sub_8010384(struct Sprite *sprite)
{
    u8 r6 = sprite->data0;
    u16 species;
    u8 yOffset;

    if (ewram17800[r6].unk2 != 0)
        species = ewram17800[r6].unk2;
    else
        species = sprite->data2;

    GetMonData(&gEnemyParty[gBattlePartyID[r6]], MON_DATA_PERSONALITY);  // Unused return value

    if (species == SPECIES_UNOWN)
    {
        u32 personalityValue = GetMonData(&gEnemyParty[gBattlePartyID[r6]], MON_DATA_PERSONALITY);
        u16 unownForm = ((((personalityValue & 0x3000000) >> 18) | ((personalityValue & 0x30000) >> 12) | ((personalityValue & 0x300) >> 6) | (personalityValue & 3)) % 0x1C);
        u16 unownSpecies;

        if (unownForm == 0)
            unownSpecies = SPECIES_UNOWN;  // Use the A Unown form
        else
            unownSpecies = NUM_SPECIES + unownForm;  // Use one of the other Unown letters

        yOffset = gMonFrontPicCoords[unownSpecies].y_offset;
    }
    else if (species == SPECIES_CASTFORM)
    {
        yOffset = gCastformFrontSpriteCoords[gBattleMonForms[r6]].y_offset;
    }
    else if (species > NUM_SPECIES)
    {
        yOffset = gMonFrontPicCoords[SPECIES_NONE].y_offset;
    }
    else
    {
        yOffset = gMonFrontPicCoords[species].y_offset;
    }

    sprite->data3 = 8 - yOffset / 8;
    sprite->data4 = 1;
    sprite->callback = sub_8010494;
}

void sub_8010494(struct Sprite *sprite)
{
    s32 i;

    sprite->data4--;
    if (sprite->data4 == 0)
    {
        sprite->data4 = 2;
        sprite->pos2.y += 8;
        sprite->data3--;
        if (sprite->data3 < 0)
        {
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
        else
        {
            u8 *dst = (u8 *)gUnknown_081FAF4C[GetBankIdentity(sprite->data0)] + (gBattleMonForms[sprite->data0] << 11) + (sprite->data3 << 8);

            for (i = 0; i < 0x100; i++)
                *(dst++) = 0;
            StartSpriteAnim(sprite, gBattleMonForms[sprite->data0]);
        }
    }
}

void sub_8010520(struct Sprite *sprite)
{
    sprite->data3 = 8;
    sprite->data4 = sprite->invisible;
    sprite->callback = sub_801053C;
}

void sub_801053C(struct Sprite *sprite)
{
    sprite->data3--;
    if (sprite->data3 == 0)
    {
        sprite->invisible ^= 1;
        sprite->data3 = 8;
    }
}

void sub_8010574(struct Sprite *sprite)
{
    sprite->invisible = sprite->data4;
    sprite->data4 = FALSE;
    sprite->callback = nullsub_37;
}

void sub_80105A0(struct Sprite *sprite)
{
    sprite->callback = oac_poke_ally_;
}

void oac_poke_ally_(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x -= 2;
        if (sprite->pos2.x == 0)
        {
            sprite->callback = nullsub_86;
            sprite->data1 = 0;
        }
    }
}

void sub_80105DC(struct Sprite *sprite)
{
    sprite->callback = nullsub_86;
}

void nullsub_86(struct Sprite *sprite)
{
}

void sub_80105EC(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x += sprite->data1;
        sprite->pos2.y += sprite->data2;
    }
}

void dp11b_obj_instanciate(u8 bank, u8 b, s8 c, s8 d)
{
    u8 spriteId;
    u8 objectID;

    if (b)
    {
        if (ewram17810[bank].unk0_1)
            return;
    }
    else
    {
        if (ewram17810[bank].unk0_2)
            return;
    }

    spriteId = CreateInvisibleSpriteWithCallback(objc_dp11b_pingpong);
    if (b == TRUE)
    {
        objectID = gHealthboxIDs[bank];
        ewram17810[bank].unk2 = spriteId;
        ewram17810[bank].unk0_1 = 1;
        gSprites[spriteId].data0 = 0x80;
    }
    else
    {
        objectID = gObjectBankIDs[bank];
        ewram17810[bank].unk3 = spriteId;
        ewram17810[bank].unk0_2 = 1;
        gSprites[spriteId].data0 = 0xC0;
    }
    gSprites[spriteId].data1 = c;
    gSprites[spriteId].data2 = d;
    gSprites[spriteId].data3 = objectID;
    gSprites[spriteId].data4 = b;
    gSprites[objectID].pos2.x = 0;
    gSprites[objectID].pos2.y = 0;
}

void dp11b_obj_free(u8 a, u8 b)
{
    u8 r4;

    if (b == TRUE)
    {
        if (!ewram17810[a].unk0_1)
            return;
        r4 = gSprites[ewram17810[a].unk2].data3;
        DestroySprite(&gSprites[ewram17810[a].unk2]);
        ewram17810[a].unk0_1 = 0;
    }
    else
    {
        if (!ewram17810[a].unk0_2)
            return;
        r4 = gSprites[ewram17810[a].unk3].data3;
        DestroySprite(&gSprites[ewram17810[a].unk3]);
        ewram17810[a].unk0_2 = 0;
    }
    gSprites[r4].pos2.x = 0;
    gSprites[r4].pos2.y = 0;
}

void objc_dp11b_pingpong(struct Sprite *sprite)
{
    u8 spriteId = sprite->data3;
    s32 var;

    if (sprite->data4 == 1)
        var = sprite->data0;
    else
        var = sprite->data0;

    gSprites[spriteId].pos2.y = Sin(var, sprite->data2) + sprite->data2;
    sprite->data0 = (sprite->data0 + sprite->data1) & 0xFF;
}

void nullsub_41(void)
{
}

void sub_8010800(void)
{
    sub_8010874();
    gBattleCommunication[1] = 0;
    gBattleMainFunc = bc_8012FAC;
}

__attribute__((naked))
void debug_sub_80138CC()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._1167\n"
        "	ldrb	r0, [r0]\n"
        "	bl	GetBankSide\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._1163	@cond_branch\n"
        "	b	._1186\n"
        "._1163:\n"
        "	ldr	r1, ._1167 + 4\n"
        "	ldr	r2, ._1167 + 8\n"
        "	add	r0, r1, r2\n"
        "	ldrb	r0, [r0]\n"
        "	add	r2, r1, #0\n"
        "	cmp	r0, #0x4\n"
        "	bls	._1165	@cond_branch\n"
        "	b	._1186\n"
        "._1165:\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._1167 + 12\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._1168:\n"
        "	.align	2, 0\n"
        "._1167:\n"
        "	.word	gActiveBank\n"
        "	.word	+0x2000000\n"
        "	.word	0x160fd\n"
        "	.word	._1169\n"
        "._1169:\n"
        "	.word	._1170\n"
        "	.word	._1171\n"
        "	.word	._1172\n"
        "	.word	._1173\n"
        "	.word	._1174\n"
        "._1170:\n"
        "	ldr	r1, ._1177\n"
        "	ldr	r0, ._1177 + 4\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r1\n"
        "	ldr	r1, [r0]\n"
        "	ldr	r0, ._1177 + 8\n"
        "	cmp	r1, r0\n"
        "	bne	._1186	@cond_branch\n"
        "	ldr	r0, ._1177 + 12\n"
        "	add	r1, r2, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	b	._1187\n"
        "._1178:\n"
        "	.align	2, 0\n"
        "._1177:\n"
        "	.word	gBattleBankFunc\n"
        "	.word	gActiveBank\n"
        "	.word	sub_802C098+1\n"
        "	.word	0x160fd\n"
        "._1171:\n"
        "	ldr	r1, ._1180\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r1, #0x2c]\n"
        "	strh	r0, [r1, #0x2e]\n"
        "	ldr	r0, ._1180 + 4\n"
        "	add	r1, r2, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	ldr	r0, ._1180 + 8\n"
        "	add	r1, r2, r0\n"
        "	mov	r0, #0x80\n"
        "	b	._1187\n"
        "._1181:\n"
        "	.align	2, 0\n"
        "._1180:\n"
        "	.word	gMain\n"
        "	.word	0x160fd\n"
        "	.word	0x160fe\n"
        "._1172:\n"
        "	ldr	r0, ._1184\n"
        "	add	r3, r2, r0\n"
        "	ldrb	r0, [r3]\n"
        "	sub	r0, r0, #0x1\n"
        "	strb	r0, [r3]\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._1186	@cond_branch\n"
        "	ldr	r1, ._1184 + 4\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r1, #0x2c]\n"
        "	strh	r0, [r1, #0x2e]\n"
        "	ldr	r0, ._1184 + 8\n"
        "	add	r1, r2, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	mov	r0, #0x80\n"
        "	strb	r0, [r3]\n"
        "	b	._1186\n"
        "._1185:\n"
        "	.align	2, 0\n"
        "._1184:\n"
        "	.word	0x160fe\n"
        "	.word	gMain\n"
        "	.word	0x160fd\n"
        "._1173:\n"
        "	ldr	r0, ._1188\n"
        "	add	r1, r2, r0\n"
        "	ldrb	r0, [r1]\n"
        "	sub	r0, r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._1186	@cond_branch\n"
        "	ldr	r1, ._1188 + 4\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r1, #0x2c]\n"
        "	strh	r0, [r1, #0x2e]\n"
        "	ldr	r0, ._1188 + 8\n"
        "	add	r1, r2, r0\n"
        "	ldrb	r0, [r1]\n"
        "	add	r0, r0, #0x1\n"
        "	b	._1187\n"
        "._1189:\n"
        "	.align	2, 0\n"
        "._1188:\n"
        "	.word	0x160fe\n"
        "	.word	gMain\n"
        "	.word	0x160fd\n"
        "._1174:\n"
        "	ldr	r0, ._1190\n"
        "	add	r1, r2, r0\n"
        "	mov	r0, #0x0\n"
        "._1187:\n"
        "	strb	r0, [r1]\n"
        "._1186:\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._1191:\n"
        "	.align	2, 0\n"
        "._1190:\n"
        "	.word	0x160fd\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80139E4()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	ldr	r0, ._1198\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	cmp	r4, #0\n"
        "	beq	._1192	@cond_branch\n"
        "	ldr	r2, ._1198 + 4\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r2]\n"
        "	ldr	r1, ._1198 + 8\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._1193	@cond_branch\n"
        "	add	r4, r2, #0\n"
        "	add	r5, r1, #0\n"
        "._1194:\n"
        "	bl	debug_sub_80138CC\n"
        "	ldrb	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldrb	r1, [r5]\n"
        "	cmp	r0, r1\n"
        "	bcc	._1194	@cond_branch\n"
        "._1193:\n"
        "	ldr	r0, ._1198 + 12\n"
        "	ldr	r0, [r0]\n"
        "	bl	gScriptFuncs_End+0x3cf4\n"
        "	ldr	r1, ._1198 + 4\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	ldr	r0, ._1198 + 8\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	beq	._1200	@cond_branch\n"
        "	ldr	r5, ._1198 + 16\n"
        "	add	r4, r1, #0\n"
        "._1196:\n"
        "	ldrb	r0, [r4]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r5\n"
        "	ldr	r0, [r0]\n"
        "	bl	gScriptFuncs_End+0x3cf4\n"
        "	ldrb	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	ldr	r1, ._1198 + 8\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldrb	r1, [r1]\n"
        "	cmp	r0, r1\n"
        "	bcc	._1196	@cond_branch\n"
        "	b	._1200\n"
        "._1199:\n"
        "	.align	2, 0\n"
        "._1198:\n"
        "	.word	gUnknown_02023A14+0x50\n"
        "	.word	gActiveBank\n"
        "	.word	gNoOfAllBanks\n"
        "	.word	gBattleMainFunc\n"
        "	.word	gBattleBankFunc\n"
        "._1192:\n"
        "	ldr	r0, ._1202\n"
        "	ldr	r0, [r0]\n"
        "	bl	gScriptFuncs_End+0x3cf4\n"
        "	ldr	r1, ._1202 + 4\n"
        "	strb	r4, [r1]\n"
        "	ldr	r0, ._1202 + 8\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r4, r0\n"
        "	bcs	._1200	@cond_branch\n"
        "	ldr	r5, ._1202 + 12\n"
        "	add	r4, r1, #0\n"
        "._1201:\n"
        "	ldrb	r0, [r4]\n"
        "	lsl	r0, r0, #0x2\n"
        "	add	r0, r0, r5\n"
        "	ldr	r0, [r0]\n"
        "	bl	gScriptFuncs_End+0x3cf4\n"
        "	ldrb	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strb	r0, [r4]\n"
        "	ldr	r1, ._1202 + 8\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldrb	r1, [r1]\n"
        "	cmp	r0, r1\n"
        "	bcc	._1201	@cond_branch\n"
        "._1200:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._1203:\n"
        "	.align	2, 0\n"
        "._1202:\n"
        "	.word	gBattleMainFunc\n"
        "	.word	gActiveBank\n"
        "	.word	gNoOfAllBanks\n"
        "	.word	gBattleBankFunc\n"
        "\n"
    );
}

#ifdef DEBUG
__attribute__((naked))
void sub_8010874()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	mov	r0, #0x0\n"
        "	bl	TurnValuesCleanUp\n"
        "	bl	SpecialStatusesClear\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x0\n"
        "	ldr	r0, ._1215\n"
        "	mov	sl, r0\n"
        "	ldr	r1, ._1215 + 4\n"
        "	mov	r9, r1\n"
        "	ldr	r4, ._1215 + 8\n"
        "	mov	r8, r4\n"
        "	ldr	r0, ._1215 + 12\n"
        "	mov	ip, r0\n"
        "	ldr	r4, ._1215 + 16\n"
        "	mov	r5, #0x0\n"
        "	ldr	r7, ._1215 + 20\n"
        "	ldr	r6, ._1215 + 24\n"
        "._1205:\n"
        "	ldr	r0, ._1215 + 28\n"
        "	add	r0, r5, r0\n"
        "	str	r3, [r0]\n"
        "	mov	r1, #0x0\n"
        "._1204:\n"
        "	add	r0, r4, r1\n"
        "	strb	r3, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, #0x1b\n"
        "	bls	._1204	@cond_branch\n"
        "	mov	r0, #0x2\n"
        "	strb	r0, [r4, #0x16]\n"
        "	ldr	r1, ._1215 + 32\n"
        "	add	r0, r2, r1\n"
        "	strb	r3, [r0]\n"
        "	mov	r0, ip\n"
        "	strh	r3, [r0]\n"
        "	mov	r1, r8\n"
        "	strh	r3, [r1]\n"
        "	mov	r0, r9\n"
        "	strh	r3, [r0]\n"
        "	mov	r1, sl\n"
        "	strh	r3, [r1]\n"
        "	ldr	r0, ._1215 + 36\n"
        "	add	r1, r2, r0\n"
        "	mov	r0, #0xff\n"
        "	strb	r0, [r1]\n"
        "	strh	r3, [r6]\n"
        "	strh	r3, [r7]\n"
        "	ldr	r1, ._1215 + 40\n"
        "	add	r0, r5, r1\n"
        "	str	r3, [r0]\n"
        "	mov	r0, #0x2\n"
        "	add sl, sl, r0\n"
        "	add r9, r9, r0\n"
        "	add r8, r8, r0\n"
        "	add ip, ip, r0\n"
        "	add	r4, r4, #0x1c\n"
        "	add	r5, r5, #0x4\n"
        "	add	r7, r7, #0x2\n"
        "	add	r6, r6, #0x2\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, #0x3\n"
        "	ble	._1205	@cond_branch\n"
        "	mov	r5, #0x0\n"
        "	ldr	r3, ._1215 + 44\n"
        "	ldr	r4, ._1215 + 48\n"
        "	mov	r2, #0x1\n"
        "._1207:\n"
        "	strh	r5, [r4]\n"
        "	mov	r1, #0x0\n"
        "._1206:\n"
        "	add	r0, r3, r1\n"
        "	strb	r5, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, #0xb\n"
        "	bls	._1206	@cond_branch\n"
        "	add	r3, r3, #0xc\n"
        "	add	r4, r4, #0x2\n"
        "	sub	r2, r2, #0x1\n"
        "	cmp	r2, #0\n"
        "	bge	._1207	@cond_branch\n"
        "	mov	r1, #0x0\n"
        "	ldr	r2, ._1215 + 52\n"
        "	strb	r1, [r2]\n"
        "	ldr	r3, ._1215 + 56\n"
        "	strb	r1, [r3]\n"
        "	ldr	r4, ._1215 + 60\n"
        "	strh	r1, [r4]\n"
        "	ldr	r1, ._1215 + 64\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x0\n"
        "._1208:\n"
        "	add	r0, r1, r2\n"
        "	strb	r3, [r0]\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, #0x2b\n"
        "	bls	._1208	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	ldr	r1, ._1215 + 68\n"
        "	str	r0, [r1]\n"
        "	ldr	r2, ._1215 + 72\n"
        "	ldrh	r1, [r2]\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._1210	@cond_branch\n"
        "	ldr	r3, ._1215 + 76\n"
        "	ldrb	r1, [r3, #0x15]\n"
        "	mov	r0, #0x4\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._1210	@cond_branch\n"
        "	mov	r0, #0x80\n"
        "	ldr	r4, ._1215 + 68\n"
        "	str	r0, [r4]\n"
        "._1210:\n"
        "	ldr	r1, ._1215 + 76\n"
        "	ldrb	r0, [r1, #0x15]\n"
        "	lsl	r0, r0, #0x1e\n"
        "	lsr	r0, r0, #0x1f\n"
        "	ldr	r3, ._1215 + 80\n"
        "	ldr	r4, ._1215 + 84\n"
        "	add	r2, r3, r4\n"
        "	mov	r1, #0x0\n"
        "	strb	r0, [r2]\n"
        "	ldr	r0, ._1215 + 88\n"
        "	strb	r1, [r0]\n"
        "	ldr	r2, ._1215 + 92\n"
        "	strb	r1, [r2]\n"
        "	ldr	r3, ._1215 + 96\n"
        "	str	r1, [r3]\n"
        "	mov	r2, #0x0\n"
        "	ldr	r4, ._1215 + 100\n"
        "	strh	r1, [r4]\n"
        "	ldr	r1, ._1215 + 80\n"
        "	ldr	r3, ._1215 + 104\n"
        "	add	r0, r1, r3\n"
        "	strb	r2, [r0]\n"
        "	ldr	r4, ._1215 + 108\n"
        "	add	r0, r1, r4\n"
        "	strb	r2, [r0]\n"
        "	ldr	r1, ._1215 + 112\n"
        "	mov	r2, #0x0\n"
        "	add	r0, r1, #7\n"
        "._1211:\n"
        "	strb	r2, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	cmp	r0, r1\n"
        "	bge	._1211	@cond_branch\n"
        "	mov	r5, #0x0\n"
        "	ldr	r0, ._1215 + 116\n"
        "	strh	r5, [r0]\n"
        "	mov	r0, #0x0\n"
        "	ldr	r1, ._1215 + 120\n"
        "	str	r0, [r1]\n"
        "	ldr	r2, ._1215 + 124\n"
        "	strh	r0, [r2]\n"
        "	ldr	r4, ._1215 + 80\n"
        "	ldr	r3, ._1215 + 128\n"
        "	add	r0, r4, r3\n"
        "	strb	r5, [r0]\n"
        "	ldr	r1, ._1215 + 132\n"
        "	add	r0, r4, r1\n"
        "	strb	r5, [r0]\n"
        "	ldr	r2, ._1215 + 136\n"
        "	strb	r5, [r2]\n"
        "	ldr	r3, ._1215 + 140\n"
        "	strb	r5, [r3]\n"
        "	sub	r1, r1, #0x29\n"
        "	add	r0, r4, r1\n"
        "	strb	r5, [r0]\n"
        "	ldr	r2, ._1215 + 144\n"
        "	add	r0, r4, r2\n"
        "	strb	r5, [r0]\n"
        "	ldr	r3, ._1215 + 148\n"
        "	add	r0, r4, r3\n"
        "	strb	r5, [r0]\n"
        "	ldr	r0, ._1215 + 152\n"
        "	mov	r1, #0xb\n"
        "	bl	GetMonData\n"
        "	ldr	r2, ._1215 + 156\n"
        "	lsl	r1, r0, #0x3\n"
        "	sub	r1, r1, r0\n"
        "	lsl	r1, r1, #0x2\n"
        "	add	r1, r1, r2\n"
        "	ldrb	r1, [r1, #0x8]\n"
        "	mov	r0, #0x64\n"
        "	mul	r0, r0, r1\n"
        "	ldr	r1, ._1215 + 160\n"
        "	bl	gScriptFuncs_End+0x3d30\n"
        "	ldr	r2, ._1215 + 164\n"
        "	add	r1, r4, r2\n"
        "	strb	r0, [r1]\n"
        "	ldr	r3, ._1215 + 168\n"
        "	add	r1, r4, r3\n"
        "	mov	r0, #0x3\n"
        "	strb	r0, [r1]\n"
        "	ldr	r1, ._1215 + 172\n"
        "	add	r0, r4, r1\n"
        "	strb	r5, [r0]\n"
        "	sub	r2, r2, #0x33\n"
        "	add	r1, r4, r2\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	mov	r2, #0x0\n"
        "	mov	r1, #0x0\n"
        "._1212:\n"
        "	ldr	r3, ._1215 + 176\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r0, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r3, r3, #0x20\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r0, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r3, r3, #0x1c\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r0, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r3, r3, #0x8\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r0, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r3, r3, #0x10\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r0, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r3, r3, #0x8\n"
        "	add	r0, r2, r3\n"
        "	add	r0, r0, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, #0x7\n"
        "	ble	._1212	@cond_branch\n"
        "	ldr	r4, ._1215 + 80\n"
        "	ldr	r1, ._1215 + 180\n"
        "	add	r0, r4, r1\n"
        "	mov	r2, #0x0\n"
        "	mov	r1, #0x6\n"
        "	strb	r1, [r0]\n"
        "	sub	r3, r3, #0x3f\n"
        "	add	r0, r4, r3\n"
        "	strb	r1, [r0]\n"
        "	ldr	r1, ._1215 + 184\n"
        "	add	r0, r4, r1\n"
        "	strb	r2, [r0]\n"
        "	ldr	r3, ._1215 + 188\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0xa\n"
        "	add	r0, r3, #0\n"
        "	add	r0, r0, #0x40\n"
        "._1213:\n"
        "	strb	r1, [r0]\n"
        "	sub	r0, r0, #0x1\n"
        "	sub	r2, r2, #0x1\n"
        "	cmp	r2, #0\n"
        "	bge	._1213	@cond_branch\n"
        "	mov	r1, #0x0\n"
        "	strb	r1, [r3, #0x13]\n"
        "	strb	r1, [r3]\n"
        "	strb	r1, [r3, #0x1]\n"
        "	strb	r1, [r3, #0x2]\n"
        "	strb	r1, [r3, #0x3]\n"
        "	strb	r1, [r3, #0x4]\n"
        "	ldrb	r2, [r3, #0x5]\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	and	r0, r0, r2\n"
        "	mov	r2, #0x3\n"
        "	neg	r2, r2\n"
        "	and	r0, r0, r2\n"
        "	strb	r0, [r3, #0x5]\n"
        "	strh	r1, [r3, #0x20]\n"
        "	strh	r1, [r3, #0x22]\n"
        "	strh	r1, [r3, #0x24]\n"
        "	strh	r1, [r3, #0x6]\n"
        "	strh	r1, [r3, #0x26]\n"
        "	strh	r1, [r3, #0x28]\n"
        "	mov	r2, #0x0\n"
        "	add	r5, r3, #0\n"
        "	add	r5, r5, #0x8\n"
        "	mov	r4, #0x0\n"
        "	add	r1, r3, #0\n"
        "	add	r1, r1, #0x14\n"
        "._1214:\n"
        "	add	r0, r2, r5\n"
        "	strb	r4, [r0]\n"
        "	strb	r4, [r1]\n"
        "	strb	r4, [r1, #0x16]\n"
        "	add	r1, r1, #0x1\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, #0x9\n"
        "	ble	._1214	@cond_branch\n"
        "	ldr	r2, ._1215 + 80\n"
        "	ldr	r3, ._1215 + 192\n"
        "	add	r0, r2, r3\n"
        "	mov	r1, #0x0\n"
        "	strb	r1, [r0]\n"
        "	ldr	r4, ._1215 + 196\n"
        "	add	r0, r2, r4\n"
        "	strb	r1, [r0]\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._1216:\n"
        "	.align	2, 0\n"
        "._1215:\n"
        "	.word	gUnknown_02024C4C\n"
        "	.word	gUnknown_02024C44\n"
        "	.word	gMoveHitWith\n"
        "	.word	gLastUsedMove\n"
        "	.word	gDisableStructs\n"
        "	.word	gUnknown_02024C2C\n"
        "	.word	gLockedMove\n"
        "	.word	gStatuses3\n"
        "	.word	gUnknown_02024C70\n"
        "	.word	gUnknown_02024C5C\n"
        "	.word	+0x2017100\n"
        "	.word	gSideTimer\n"
        "	.word	gSideAffecting\n"
        "	.word	gBankAttacker\n"
        "	.word	gBankTarget\n"
        "	.word	gBattleWeather\n"
        "	.word	gWishFutureKnock\n"
        "	.word	gHitMarker\n"
        "	.word	gBattleTypeFlags\n"
        "	.word	gSaveBlock2\n"
        "	.word	+0x2000000\n"
        "	.word	0x16084\n"
        "	.word	gMultiHitCounter\n"
        "	.word	gBattleOutcome\n"
        "	.word	gBattleExecBuffer\n"
        "	.word	gPaydayMoney\n"
        "	.word	0x17130\n"
        "	.word	0x17160\n"
        "	.word	gBattleCommunication\n"
        "	.word	gPauseCounterBattle\n"
        "	.word	gBattleMoveDamage\n"
        "	.word	gUnknown_02024DE8\n"
        "	.word	0x16002\n"
        "	.word	0x160a1\n"
        "	.word	gLeveledUpInBattle\n"
        "	.word	gAbsentBankFlags\n"
        "	.word	0x16086\n"
        "	.word	0x16087\n"
        "	.word	gEnemyParty\n"
        "	.word	gBaseStats\n"
        "	.word	0x4fb\n"
        "	.word	0x16089\n"
        "	.word	0x16088\n"
        "	.word	0x1601b\n"
        "	.word	0x160ac\n"
        "	.word	0x160c8\n"
        "	.word	0x16113\n"
        "	.word	gBattleResults\n"
        "	.word	0x1609e\n"
        "	.word	0x1609f\n"
        "\n"
    );
}
#else
void sub_8010874(void)
{
    s32 i;
    u32 j;
    u8 *r4;

    TurnValuesCleanUp(0);
    SpecialStatusesClear();

    for (i = 0; i < 4; i++)
    {
        gStatuses3[i] = 0;

        r4 = (u8 *)&gDisableStructs[i];
        for (j = 0; j < (u32)0x1C; j++)
            r4[j] = 0;

        gDisableStructs[i].IsFirstTurn = 2;
        gUnknown_02024C70[i] = 0;
        gLastUsedMove[i] = 0;
        gMoveHitWith[i] = 0;
        gUnknown_02024C44[i] = 0;
        gUnknown_02024C4C[i] = 0;
        gUnknown_02024C5C[i] = 0xFF;
        gLockedMove[i] = 0;
        gUnknown_02024C2C[i] = 0;
        ewram17100[i] = 0;
    }

    for (i = 0; i < 2; i++)
    {
        gSideAffecting[i] = 0;

        r4 = (u8 *)&gSideTimer[i];
        for (j = 0; j < 12; j++)
            r4[j] = 0;
    }

    gBankAttacker = 0;
    gBankTarget = 0;
    gBattleWeather = 0;

    r4 = (u8 *)&gWishFutureKnock;
    for (i = 0; i < (u32)0x2C; i++)
        r4[i] = 0;

    gHitMarker = 0;
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) == 0 && gSaveBlock2.optionsBattleSceneOff == TRUE)
        gHitMarker = HITMARKER_NO_ANIMATIONS;
    ewram16084 = gSaveBlock2.optionsBattleStyle;
    gMultiHitCounter = 0;
    gBattleOutcome = 0;
    gBattleExecBuffer = 0;
    gPaydayMoney = 0;
    ewram17130 = 0;
    ewram17160 = 0;
    for (i = 0; i < 8; i++)
        gBattleCommunication[i] = 0;
    gPauseCounterBattle = 0;
    gBattleMoveDamage = 0;
    gUnknown_02024DE8 = 0;
    ewram16002 = 0;
    ewram160A1 = 0;
    gLeveledUpInBattle = 0;
    gAbsentBankFlags = 0;
    ewram16078 = 0;
    ewram16086 = 0;
    ewram16087 = 0;
    ewram16089 = gBaseStats[GetMonData(&gEnemyParty[0], MON_DATA_SPECIES)].catchRate * 100 / 1275;
    ewram16088 = 3;
    ewram1601B = 0;
    ewram16056 = 1;

    for (i = 0; i < 8; i++)
    {
        ewram[i + 0x160AC] = 0;
        ewram[i + 0x160CC] = 0;
        ewram[i + 0x160E8] = 0;
        ewram[i + 0x160F0] = 0;
        ewram[i + 0x16100] = 0;
        ewram[i + 0x16108] = 0;
    }

    ewram160C8 = 6;
    ewram160C9 = 6;
    ewram16113 = 0;
    for (i = 0; i < 11; i++)
        gBattleResults.unk36[i] = 0;
    gBattleResults.BattleTurnCounter = 0;
    gBattleResults.PlayerFaintCounter = 0;
    gBattleResults.OpponentFaintCounter = 0;
    gBattleResults.unk2 = 0;
    gBattleResults.unk3 = 0;
    gBattleResults.unk4 = 0;
    gBattleResults.unk5_0 = 0;
    gBattleResults.unk5_1 = 0;
    gBattleResults.LastOpponentSpecies = 0;
    gBattleResults.LastUsedMove = 0;
    gBattleResults.OpponentMove = 0;
    gBattleResults.Poke1Species = 0;
    gBattleResults.OpponentSpecies = 0;
    gBattleResults.CaughtPoke = 0;
    for (i = 0; i < 10; i++)
    {
        gBattleResults.PokeString1[i] = 0;
        gBattleResults.PokeString2[i] = 0;
        gBattleResults.CaughtNick[i] = 0;
    }
}
#endif

void SwitchInClearStructs(void)
{
    struct DisableStruct sp0 = gDisableStructs[gActiveBank];
    s32 i;
    u8 *ptr;
    u32 *ptr2;

    if (gBattleMoves[gCurrentMove].effect != EFFECT_BATON_PASS)
    {
        for (i = 0; i < 8; i++)
            gBattleMons[gActiveBank].statStages[i] = 6;
        for (i = 0; i < gNoOfAllBanks; i++)
        {
            struct UnknownStruct12 *sp20 = &gUnknown_02024AD0[i];

            if ((sp20->unk0 & 0x04000000) && gDisableStructs[i].BankPreventingEscape == gActiveBank)
                sp20->unk0 &= ~0x04000000;
            if ((gStatuses3[i] & STATUS3_ALWAYS_HITS) && gDisableStructs[i].BankWithSureHit == gActiveBank)
            {
                gStatuses3[i] &= ~STATUS3_ALWAYS_HITS;
                gDisableStructs[i].BankWithSureHit = 0;
            }
        }
    }
    if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        gBattleMons[gActiveBank].status2 &= (STATUS2_CONFUSION | STATUS2_FOCUS_ENERGY | STATUS2_SUBSTITUTE | STATUS2_ESCAPE_PREVENTION | STATUS2_CURSED);
        gStatuses3[gActiveBank] &= (STATUS3_LEECHSEED_RECEIVER | STATUS3_LEECHSEED | STATUS3_ALWAYS_HITS | STATUS3_PERISH_SONG | STATUS3_ROOTED | STATUS3_MUDSPORT | STATUS3_WATERSPORT);

        for (i = 0; i < gNoOfAllBanks; i++)
        {
            if (GetBankSide(gActiveBank) != GetBankSide(i)
             && (gStatuses3[i] & STATUS3_ALWAYS_HITS) != 0
             && (gDisableStructs[i].BankWithSureHit == gActiveBank))
            {
                gStatuses3[i] &= ~STATUS3_ALWAYS_HITS;
                gStatuses3[i] |= 0x10;
            }
        }
    }
    else
    {
        gBattleMons[gActiveBank].status2 = 0;
        gStatuses3[gActiveBank] = 0;
    }

    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gUnknown_02024AD0[i].unk0 & (gBitTable[gActiveBank] << 16))
            gUnknown_02024AD0[i].unk0 &= ~(gBitTable[gActiveBank] << 16);
        if ((gUnknown_02024AD0[i].unk0 & 0xE000) && ewram[0x16020 + i] == gActiveBank)
            gUnknown_02024AD0[i].unk0 &= ~0xE000;
    }

    gActionSelectionCursor[gActiveBank] = 0;
    gMoveSelectionCursor[gActiveBank] = 0;

    ptr = (u8 *)&gDisableStructs[gActiveBank];
    for (i = 0; i < (u32)0x1C; i++)
        ptr[i] = 0;

    if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        gDisableStructs[gActiveBank].SubstituteHP = sp0.SubstituteHP;
        gDisableStructs[gActiveBank].BankWithSureHit = sp0.BankWithSureHit;
        gDisableStructs[gActiveBank].unkF_0 = sp0.unkF_0;
        gDisableStructs[gActiveBank].unkF_4 = sp0.unkF_4;
    }

    gDisableStructs[gActiveBank].IsFirstTurn = 2;
    gLastUsedMove[gActiveBank] = 0;
    gMoveHitWith[gActiveBank] = 0;
    gUnknown_02024C44[gActiveBank] = 0;
    gUnknown_02024C4C[gActiveBank] = 0;
    gUnknown_02024C2C[gActiveBank] = 0;
    gUnknown_02024C5C[gActiveBank] = 0xFF;

    ewram[0x160AC + gActiveBank * 2 + 0] = 0;
    ewram[0x160AC + gActiveBank * 2 + 1] = 0;
    ewram[0x16100 + gActiveBank * 4 + 0] = 0;
    ewram[0x16100 + gActiveBank * 4 + 1] = 0;
    ewram[0x16100 + gActiveBank * 4 + 2] = 0;
    ewram[0x16100 + gActiveBank * 4 + 3] = 0;
    ewram[0x160E8 + gActiveBank * 2 + 0] = 0;
    ewram[0x160E8 + gActiveBank * 2 + 1] = 0;

    ptr2 = (u32 *)(ewram + 0x17100);
    ptr2[gActiveBank] = 0;

    gCurrentMove = 0;
}

void UndoEffectsAfterFainting(void)
{
    s32 i;
    u8 *ptr;
    u32 *ptr2;

    for (i = 0; i < 8; i++)
        gBattleMons[gActiveBank].statStages[i] = 6;
    gBattleMons[gActiveBank].status2 = 0;
    gStatuses3[gActiveBank] = 0;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if ((gBattleMons[i].status2 & STATUS2_ESCAPE_PREVENTION) && gDisableStructs[i].BankPreventingEscape == gActiveBank)
            gBattleMons[i].status2 &= ~STATUS2_ESCAPE_PREVENTION;
        if (gBattleMons[i].status2 & (gBitTable[gActiveBank] << 16))
            gBattleMons[i].status2 &= ~(gBitTable[gActiveBank] << 16);
        if ((gBattleMons[i].status2 & STATUS2_WRAPPED) && ewram[0x16020 + i] == gActiveBank)
            gBattleMons[i].status2 &= ~STATUS2_WRAPPED;
    }
    gActionSelectionCursor[gActiveBank] = 0;
    gMoveSelectionCursor[gActiveBank] = 0;

    ptr = (u8 *)&gDisableStructs[gActiveBank];
    for (i = 0; i < (u32)0x1C; i++)
        ptr[i] = 0;
    gProtectStructs[gActiveBank].Protected = 0;
    gProtectStructs[gActiveBank].Endured = 0;
    gProtectStructs[gActiveBank].OnlyStruggle = 0;
    gProtectStructs[gActiveBank].HelpingHand = 0;
    gProtectStructs[gActiveBank].BounceMove = 0;
    gProtectStructs[gActiveBank].StealMove = 0;
    gProtectStructs[gActiveBank].Flag0Unknown = 0;
    gProtectStructs[gActiveBank].PrlzImmobility = 0;
    gProtectStructs[gActiveBank].ConfusionSelfDmg = 0;
    gProtectStructs[gActiveBank].NotEffective = 0;
    gProtectStructs[gActiveBank].ChargingTurn = 0;
    gProtectStructs[gActiveBank].FleeFlag = 0;
    gProtectStructs[gActiveBank].UsedImprisionedMove = 0;
    gProtectStructs[gActiveBank].LoveImmobility = 0;
    gProtectStructs[gActiveBank].UsedDisabledMove = 0;
    gProtectStructs[gActiveBank].UsedTauntedMove = 0;
    gProtectStructs[gActiveBank].Flag2Unknown = 0;
    gProtectStructs[gActiveBank].FlinchImmobility = 0;
    gProtectStructs[gActiveBank].NotFirstStrike = 0;

    gDisableStructs[gActiveBank].IsFirstTurn = 2;
    gLastUsedMove[gActiveBank] = 0;
    gMoveHitWith[gActiveBank] = 0;
    gUnknown_02024C44[gActiveBank] = 0;
    gUnknown_02024C4C[gActiveBank] = 0;
    gUnknown_02024C2C[gActiveBank] = 0;
    gUnknown_02024C5C[gActiveBank] = 0xFF;

    ewram[0x160E8 + gActiveBank * 2 + 0] = 0;
    ewram[0x160E8 + gActiveBank * 2 + 1] = 0;
    ewram[0x160AC + gActiveBank * 2 + 0] = 0;
    ewram[0x160AC + gActiveBank * 2 + 1] = 0;
    ewram[0x16100 + gActiveBank * 4 + 0] = 0;
    ewram[0x16100 + gActiveBank * 4 + 1] = 0;
    ewram[0x16100 + gActiveBank * 4 + 2] = 0;
    ewram[0x16100 + gActiveBank * 4 + 3] = 0;

    ptr2 = (u32 *)(ewram + 0x17100);
    ptr2[gActiveBank] = 0;

    gBattleMons[gActiveBank].type1 = gBaseStats[gBattleMons[gActiveBank].species].type1;
    gBattleMons[gActiveBank].type2 = gBaseStats[gBattleMons[gActiveBank].species].type2;
}

void bc_8012FAC(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        gActiveBank = gBattleCommunication[1];
        EmitGetAttributes(0, 0, 0);
        MarkBufferBankForExecution(gActiveBank);
        gBattleCommunication[0]++;
        break;
    case 1:
        if (gBattleExecBuffer == 0)
        {
            gBattleCommunication[1]++;
            if (gBattleCommunication[1] == gNoOfAllBanks)
                gBattleMainFunc = BattlePrepIntroSlide;
            else
                gBattleCommunication[0] = 0;
        }
        break;
    }
}

static void BattlePrepIntroSlide(void)
{
    if (gBattleExecBuffer == 0)
    {
        gActiveBank = GetBankByPlayerAI(0);
        EmitBattleIntroSlide(0, gBattleTerrain);
        MarkBufferBankForExecution(gActiveBank);
        gBattleMainFunc = sub_8011384;
        gBattleCommunication[0] = 0;
        gBattleCommunication[1] = 0;
    }
}

void sub_8011384(void)
{
    u8 *ptr;
    s32 i;

    if (gBattleExecBuffer == 0)
    {
        for (gActiveBank = 0; gActiveBank < gNoOfAllBanks; gActiveBank++)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_SAFARI)
             && GetBankSide(gActiveBank) == 0)
            {
                ptr = (u8 *)&gBattleMons[gActiveBank];
                for (i = 0; i < (u32)0x58; i++)
                    ptr[i] = 0;
            }
            else
            {
                u8 r0;

                ptr = (u8 *)&gBattleMons[gActiveBank];
                for (i = 0; i < (u32)0x58; i++)
                    ptr[i] = gBattleBufferB[gActiveBank][4 + i];

                gBattleMons[gActiveBank].type1 = gBaseStats[gBattleMons[gActiveBank].species].type1;
                gBattleMons[gActiveBank].type2 = gBaseStats[gBattleMons[gActiveBank].species].type2;
                gBattleMons[gActiveBank].ability = GetAbilityBySpecies(gBattleMons[gActiveBank].species, gBattleMons[gActiveBank].altAbility);
                r0 = GetBankSide(gActiveBank);
                ewram160BC[r0] = gBattleMons[gActiveBank].hp;
                for (i = 0; i < 8; i++)
                    gBattleMons[gActiveBank].statStages[i] = 6;
                gBattleMons[gActiveBank].status2 = 0;
            }

            if (GetBankIdentity(gActiveBank) == 0)
            {
                dp01_build_cmdbuf_x07_7_7_7(0);
                MarkBufferBankForExecution(gActiveBank);
            }

            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            {
                if (GetBankIdentity(gActiveBank) == 1)
                {
                    dp01_build_cmdbuf_x07_7_7_7(0);
                    MarkBufferBankForExecution(gActiveBank);
                }
                if (GetBankSide(gActiveBank) == 1
                 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                    GetNationalPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBank].species), 2);
            }
            else
            {
                if (GetBankSide(gActiveBank) == 1
                 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                {
                    GetNationalPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBank].species), 2);
                    dp01_build_cmdbuf_x04_4_4_4(0);
                    MarkBufferBankForExecution(gActiveBank);
                }
            }

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (GetBankIdentity(gActiveBank) == 2
                 || GetBankIdentity(gActiveBank) == 3)
                {
                    dp01_build_cmdbuf_x07_7_7_7(0);
                    MarkBufferBankForExecution(gActiveBank);
                }
            }
        }
        gBattleMainFunc = bc_801333C;
    }
}

void bc_801333C(void)
{
    s32 i;

    if (gBattleExecBuffer == 0)
    {
        struct
        {
            u16 hp;
            u32 status;
        } sp0[6];

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    sp0[i].hp = 0xFFFF;
                    sp0[i].status = 0;
                }
                else
                {
                    sp0[i].hp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
                    sp0[i].status = GetMonData(&gEnemyParty[i], MON_DATA_STATUS);
                }
            }
            gActiveBank = GetBankByPlayerAI(1);
            dp01_build_cmdbuf_x30_TODO(0, (u8 *)sp0, 0x80);
            MarkBufferBankForExecution(gActiveBank);

            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    sp0[i].hp = 0xFFFF;
                    sp0[i].status = 0;
                }
                else
                {
                    sp0[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    sp0[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }
            gActiveBank = GetBankByPlayerAI(0);
            dp01_build_cmdbuf_x30_TODO(0, (u8 *)sp0, 0x80);
            MarkBufferBankForExecution(gActiveBank);

            gBattleMainFunc = bc_battle_begin_message;
        }
        else
        {
            // The array gets set here, but nothing is ever done with it.
            // Likely unfinished code.

            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    sp0[i].hp = 0xFFFF;
                    sp0[i].status = 0;
                }
                else
                {
                    sp0[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    sp0[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }

            gBattleMainFunc = bc_8013568;
        }
    }
}

void bc_battle_begin_message(void)
{
    if (gBattleExecBuffer == 0)
    {
        gActiveBank = GetBankByPlayerAI(1);
        PrepareStringBattle(0, gActiveBank);
        gBattleMainFunc = sub_8011800;
    }
}

void bc_8013568(void)
{
    if (gBattleExecBuffer == 0)
    {
        gBattleMainFunc = sub_8011970;
        PrepareStringBattle(0, 0);
    }
}

void sub_8011800(void)
{
    if (gBattleExecBuffer == 0)
    {
        PrepareStringBattle(1, GetBankByPlayerAI(1));
        gBattleMainFunc = sub_8011834;
    }
}

void sub_8011834(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBank = 0; gActiveBank < gNoOfAllBanks; gActiveBank++)
        {
            if (GetBankIdentity(gActiveBank) == 1)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                MarkBufferBankForExecution(gActiveBank);
            }
            if ((gBattleTypeFlags & BATTLE_TYPE_MULTI)
             && GetBankIdentity(gActiveBank) == 3)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                MarkBufferBankForExecution(gActiveBank);
            }
        }
        gBattleMainFunc = bc_801362C;
    }
}

void bc_801362C(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBank = 0; gActiveBank < gNoOfAllBanks; gActiveBank++)
        {
            if (GetBankSide(gActiveBank) == 1
             && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                GetNationalPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBank].species), 2);
        }
        gBattleMainFunc = sub_8011970;
    }
}

void unref_sub_8011950(void)
{
    if (gBattleExecBuffer == 0)
        gBattleMainFunc = sub_8011970;
}

void sub_8011970(void)
{
    if (gBattleExecBuffer == 0)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
            PrepareStringBattle(1, GetBankByPlayerAI(0));
        gBattleMainFunc = sub_80119B4;
    }
}

void sub_80119B4(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBank = 0; gActiveBank < gNoOfAllBanks; gActiveBank++)
        {
            if (GetBankIdentity(gActiveBank) == 0)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                MarkBufferBankForExecution(gActiveBank);
            }
            if ((gBattleTypeFlags & BATTLE_TYPE_MULTI)
             && GetBankIdentity(gActiveBank) == 2)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                MarkBufferBankForExecution(gActiveBank);
            }
        }
        ewram16058 = 0;
        ewram160F9 = 0;
        ewram160E6 = 0;
        gBattleMainFunc = BattleBeginFirstTurn;
    }
}

void unref_sub_8011A68(void)
{
    if (gBattleExecBuffer == 0)
    {
        for (gActiveBank = 0; gActiveBank < gNoOfAllBanks; gActiveBank++)
        {
            if (GetBankSide(gActiveBank) == 0)
            {
                sub_800C704(0, gBattlePartyID[gActiveBank], 0);
                MarkBufferBankForExecution(gActiveBank);
            }
        }
        ewram16058 = 0;
        ewram160F9 = 0;
        ewram160E6 = 0;
        gBattleMainFunc = BattleBeginFirstTurn;
    }
}

void BattleBeginFirstTurn(void)
{
    s32 i;
    s32 j;
    u8 r9 = 0;

    if (gBattleExecBuffer == 0)
    {
        if (ewram16058 == 0)
        {
            for (i = 0; i < gNoOfAllBanks; i++)
                gTurnOrder[i] = i;
            for (i = 0; i < gNoOfAllBanks - 1; i++)
            {
                for (j = i + 1; j < gNoOfAllBanks; j++)
                {
                    if (b_first_side(gTurnOrder[i], gTurnOrder[j], 1) != 0)
                        sub_8012FBC(i, j);
                }
            }
        }
        if (ewram160E6 == 0 && AbilityBattleEffects(0, 0, 0, 0xFF, 0) != 0)
        {
            ewram160E6 = 1;
            return;
        }
        while (ewram16058 < gNoOfAllBanks)
        {
            if (AbilityBattleEffects(0, gTurnOrder[ewram16058], 0, 0, 0) != 0)
                r9++;
            ewram16058++;
            if (r9 != 0)
                return;
        }
        if (AbilityBattleEffects(9, 0, 0, 0, 0) != 0)
            return;
        if (AbilityBattleEffects(11, 0, 0, 0, 0) != 0)
            return;
        while (ewram160F9 < gNoOfAllBanks)
        {
            if (sub_801A02C(0, gTurnOrder[ewram160F9], 0) != 0)
                r9++;
            ewram160F9++;
            if (r9 != 0)
                return;
        }
        // Absolutely pointless for-loop that somehow doesn't get optimized out
        for (i = 0; i < gNoOfAllBanks; i++)
            ;
        for (i = 0; i < 4; i++)
        {
            ewram[0x16068 + i] = 6;
            gActionForBanks[i] = 0xFF;
            gChosenMovesByBanks[i] = 0;
        }
        TurnValuesCleanUp(0);
        SpecialStatusesClear();
        ewram160A6 = gAbsentBankFlags;
        gBattleMainFunc = sub_8012324;
        sub_80156DC();
        for (i = 0; i < 8; i++)
            gBattleCommunication[i] = 0;
        for (i = 0; i < gNoOfAllBanks; i++)
            gBattleMons[i].status2 &= ~8;
        ewram16000 = 0;
        ewram16001 = 0;
        ewram16110 = 0;
        ewram16111 = 0;
        ewram1600C = 0;
        ewram16059 = 0;
        ewram1600E = 0;
        gBattleMoveFlags = 0;
        gRandomTurnNumber = Random();
    }
}

void bc_8013B1C(void)
{
    s32 i;

    if (gBattleExecBuffer == 0)
    {
        gBattleMainFunc = BattleTurnPassed;
        for (i = 0; i < 8; i++)
            gBattleCommunication[i] = 0;
        for (i = 0; i < gNoOfAllBanks; i++)
        {
            gBattleMons[i].status2 &= ~8;
            if ((gBattleMons[i].status1 & 7) && (gBattleMons[i].status2 & 0x1000))
                CancelMultiTurnMoves(i);
        }
        ewram16000 = 0;
        ewram16001 = 0;
        ewram16110 = 0;
        ewram16111 = 0;
        ewram1600E = 0;
        gBattleMoveFlags = 0;
    }
}

void BattleTurnPassed(void)
{
    s32 i;

    TurnValuesCleanUp(1);
    if (gBattleOutcome == 0)
    {
        if (UpdateTurnCounters() != 0)
            return;
        if (TurnBasedEffects() != 0)
            return;
    }
    if (sub_80173A4() != 0)
        return;
    ewram16059 = 0;
    if (sub_80170DC() != 0)
        return;
    TurnValuesCleanUp(0);
    gHitMarker &= ~HITMARKER_NO_ATTACKSTRING;
    gHitMarker &= ~0x80000;
    gHitMarker &= ~0x400000;
    gHitMarker &= ~0x100000;
    ewram16002 = 0;
    ewram160A1 = 0;
    ewram1600C = 0;
    gBattleMoveDamage = 0;
    gBattleMoveFlags = 0;
    for (i = 0; i < 5; i++)
        gBattleCommunication[i] = 0;
    if (gBattleOutcome != 0)
    {
        gFightStateTracker = 12;
        gBattleMainFunc = sub_80138F0;
        return;
    }
    if (gBattleResults.BattleTurnCounter < 0xFF)
        gBattleResults.BattleTurnCounter++;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        gActionForBanks[i] = 0xFF;
        gChosenMovesByBanks[i] = 0;
    }
    for (i = 0; i < 4; i++)
        ewram[0x16068 + i] = 6;
    ewram160A6 = gAbsentBankFlags;
    gBattleMainFunc = sub_8012324;
    gRandomTurnNumber = Random();
}

u8 CanRunFromBattle(void)
{
    u8 r2;
    u8 r6;
    s32 i;

    if (gBattleMons[gActiveBank].item == ITEM_ENIGMA_BERRY)
        r2 = gEnigmaBerries[gActiveBank].holdEffect;
    else
        r2 = ItemId_GetHoldEffect(gBattleMons[gActiveBank].item);
    gStringBank = gActiveBank;
    if (r2 == HOLD_EFFECT_CAN_ALWAYS_RUN)
        return 0;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        return 0;
    if (gBattleMons[gActiveBank].ability == ABILITY_RUN_AWAY)
        return 0;
    r6 = GetBankSide(gActiveBank);
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (r6 != GetBankSide(i)
         && gBattleMons[i].ability == ABILITY_SHADOW_TAG)
        {
            ewram16003 = i;
            gLastUsedAbility = gBattleMons[i].ability;
            gBattleCommunication[5] = 2;
            return 2;
        }
        if (r6 != GetBankSide(i)
         && gBattleMons[gActiveBank].ability != ABILITY_LEVITATE
         && gBattleMons[gActiveBank].type1 != 2
         && gBattleMons[gActiveBank].type2 != 2
         && gBattleMons[i].ability == ABILITY_ARENA_TRAP)
        {
            ewram16003 = i;
            gLastUsedAbility = gBattleMons[i].ability;
            gBattleCommunication[5] = 2;
            return 2;
        }
    }
    i = AbilityBattleEffects(15, gActiveBank, ABILITY_MAGNET_PULL, 0, 0);
    if (i != 0 && (gBattleMons[gActiveBank].type1 == 8 || gBattleMons[gActiveBank].type2 == 8))
    {
        ewram16003 = i - 1;
        gLastUsedAbility = gBattleMons[i - 1].ability;
        gBattleCommunication[5] = 2;
        return 2;
    }
    if ((gBattleMons[gActiveBank].status2 & (STATUS2_ESCAPE_PREVENTION | STATUS2_WRAPPED)) || (gStatuses3[gActiveBank] & STATUS3_ROOTED))
    {
        gBattleCommunication[5] = 0;
        return 1;
    }
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        gBattleCommunication[5] = 1;
        return 1;
    }
    return 0;
}

void sub_8012258(u8 a)
{
    s32 i;
    u8 r4;
    u8 r1;

    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = ewram[0x1606C + i + a * 3];
    r4 = pokemon_order_func(gBattlePartyID[a]);
    r1 = pokemon_order_func(ewram[0x16068 + a]);
    sub_8094C98(r4, r1);
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        for (i = 0; i < 3; i++)
        {
            ewram[0x1606C + i + a * 3] = gUnknown_02038470[i];
            ewram[0x1606C + i + (a ^ 2) * 3] = gUnknown_02038470[i];
        }
    }
    else
    {
        for (i = 0; i < 3; i++)
        {
            ewram[0x1606C + i + a * 3] = gUnknown_02038470[i];
        }
    }
}

/*
void sub_8012324(void)
{
    u8 r5;

    gBattleCommunication[4] = 0;
    // inverted loop
    //_0801234C
    for (gActiveBank = 0; gActiveBank < gNoOfAllBanks; gActiveBank++)
    {
        r5 = GetBankIdentity(gActiveBank);
        switch (gBattleCommunication[gActiveBank])
        {
        case 0:
            ewram[0x016068 + gActiveBank] = 6;
            if (!(gBattleTypeFlags & 0x40)
             && (r5 & 2)
             && !(ewram160A6 & gBitTable[GetBankByPlayerAI(r5 ^ 2)])
             && gBattleCommunication[GetBankByPlayerAI(r5)] != 4)
                break;
            //_080123F8
            if (ewram160A6 & gBitTable[gActiveBank])
            {
                gActionForBanks[gActiveBank] = 13;
                if (!(gBattleTypeFlags & 0x40))
                    gBattleCommunication[gActiveBank] = 4;
                //_08012454
                else
                    gBattleCommunication[gActiveBank] = 3;
                break;
            }
            //_08012468
            if ((gBattleMons[gActiveBank].status2 & 0x1000)
             || (gBattleMons[gActiveBank].status2 & 0x10000000))
            {
                gActionForBanks[gActiveBank] = 0;
                gBattleCommunication[gActiveBank] = 3;
            }
            else
            {
                dp01_build_cmdbuf_x12_a_bb(0, gActionForBanks[0], gBattleBufferB[0][1] | (gBattleBufferB[0][2] << 8));
                MarkBufferBankForExecution(gActiveBank);
                gBattleCommunication[gActiveBank]++;
            }
            break;
        case 1:
        }
    }
}
*/
