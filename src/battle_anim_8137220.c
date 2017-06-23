#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "link.h"
#include "main.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

extern u8 gActiveBank;
extern void (*gBattleBankFunc[])(void);
extern u32 gBattleExecBuffer;
extern void (*gWallyBufferCommands[])(void);
extern u32 gBitTable[];
extern u8 gBattleBufferA[][0x200];
extern u8 gObjectBankIDs[];
extern MainCallback gPreBattleCallback1;
extern bool8 gDoingBattleAnim;
extern u16 gScriptItemId;
extern u16 gBattlePartyID[];
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern struct Window gUnknown_03004210;
extern u8 gUnknown_0300434C[];

// TODO: include rom3.h when my other PR gets merged
extern void dp01_build_cmdbuf_x21_a_bb(u8, u8, u16);
extern void dp01_build_cmdbuf_x23_aa_0(u8, u16);

extern void nullsub_14(void);
extern void PrepareBagForWallyTutorial(void);
extern void sub_8141828();
extern void sub_8045A5C();
extern void sub_804777C();
extern void sub_8043DFC();
extern bool8 IsDoubleBattle(void);
extern void c3_0802FDF4(u8);

void WallyBufferRunCommand(void);
void sub_81374FC(void);
void sub_81376B8(void);
void WallyBufferExecCompleted(void);

void unref_sub_8137220(void)
{
}

void SetBankFuncToWallyBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBank] = WallyBufferRunCommand;
    ewram[0x160A8] = 0;
    ewram[0x160A9] = 0;
    ewram[0x160AA] = 0;
    ewram[0x160AB] = 0;
}

void WallyBufferRunCommand(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBank])
    {
        if (gBattleBufferA[gActiveBank][0] < 0x39)
            gWallyBufferCommands[gBattleBufferA[gActiveBank][0]]();
        else
            WallyBufferExecCompleted();
    }
}

void sub_81372BC(void)
{
    u8 r4;

    switch (ewram[0x160A8])
    {
    case 0:
        ewram[0x160AA] = 64;
        ewram[0x160A8]++;
        // fall through
    case 1:
        r4 = --ewram[0x160AA];
        if (r4 == 0)
        {
            PlaySE(SE_SELECT);
            dp01_build_cmdbuf_x21_a_bb(1, 0, 0);
            WallyBufferExecCompleted();
            ewram[0x160A8]++;
            ewram[0x160A9] = r4;
            ewram[0x160AA] = 64;
        }
        break;
    case 2:
        r4 = --ewram[0x160AA];
        if (r4 == 0)
        {
            PlaySE(SE_SELECT);
            dp01_build_cmdbuf_x21_a_bb(1, 0, 0);
            WallyBufferExecCompleted();
            ewram[0x160A8]++;
            ewram[0x160A9] = r4;
            ewram[0x160AA] = 64;
        }
        break;
    case 3:
        r4 = --ewram[0x160AA];
        if (r4 == 0)
        {
            dp01_build_cmdbuf_x21_a_bb(1, 9, 0);
            WallyBufferExecCompleted();
            ewram[0x160A8]++;
            ewram[0x160A9] = r4;
            ewram[0x160AA] = 64;
        }
        break;
    case 4:
        if (--ewram[0x160AA] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_8(0);
            sub_802E3E4(1, 0);
            ewram[0x160AA] = 64;
            ewram[0x160A8]++;
        }
        break;
    case 5:
        if (--ewram[0x160AA] == 0)
        {
            PlaySE(SE_SELECT);
            DestroyMenuCursor();
            dp01_build_cmdbuf_x21_a_bb(1, 1, 0);
            WallyBufferExecCompleted();
        }
        break;
    }
}

void sub_813741C(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        WallyBufferExecCompleted();
}

void sub_8137454(void)
{
    if (gUnknown_03004210.state == 0)
        WallyBufferExecCompleted();
}

void sub_813746C(void)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

void bx_wait_t5(void)
{
    if (!gDoingBattleAnim)
        WallyBufferExecCompleted();
}

void sub_81374C4(void)
{
    if (!gPaletteFade.active)
    {
        gBattleBankFunc[gActiveBank] = sub_81374FC;
        nullsub_14();
        PrepareBagForWallyTutorial();
    }
}

void sub_81374FC(void)
{
    if (gMain.callback2 == sub_800F808
     && !gPaletteFade.active)
    {
        dp01_build_cmdbuf_x23_aa_0(1, gScriptItemId);
        WallyBufferExecCompleted();
    }
}

void sub_8137538(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gPlayerParty[gBattlePartyID[gActiveBank]]);

    if (!ewram17810[gActiveBank ^ 2].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_7)
        sub_8141828(gActiveBank ^ 2, &gPlayerParty[gBattlePartyID[gActiveBank ^ 2]]);

    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_3)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank ^ 2]]);
            sub_8045A5C(gHealthboxIDs[gActiveBank ^ 2], &gPlayerParty[gBattlePartyID[gActiveBank ^ 2]], 0);
            sub_804777C(gActiveBank ^ 2);
            sub_8043DFC(gHealthboxIDs[gActiveBank ^ 2]);
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gPlayerParty[gBattlePartyID[gActiveBank]], 0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        ewram17840.unk9_0 = 0;
        gBattleBankFunc[gActiveBank] = sub_81376B8;
    }
}

void sub_81376B8(void)
{
    bool8 r4 = FALSE;

    if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
        r4 = TRUE;
    if (r4 && ewram17810[gActiveBank].unk1_0 && ewram17810[gActiveBank ^ 2].unk1_0)
    {
        ewram17810[gActiveBank].unk0_7 = 0;
        ewram17810[gActiveBank].unk1_0 = 0;
        ewram17810[gActiveBank ^ 2].unk0_7 = 0;
        ewram17810[gActiveBank ^ 2].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        CreateTask(c3_0802FDF4, 10);
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        WallyBufferExecCompleted();
    }
}

void sub_81377B0(void)
{
    s16 r4;

    r4 = sub_8045C78(gActiveBank, gHealthboxIDs[gActiveBank], 0, 0);
    sub_8043DFC(gHealthboxIDs[gActiveBank]);
    if (r4 != -1)
    {
        sub_80440EC(gHealthboxIDs[gActiveBank], r4, 0);
    }
    else
    {
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        WallyBufferExecCompleted();
    }
}

void bx_blink_t5(void)
{
    u8 spriteId = gObjectBankIDs[gActiveBank];

    if (gSprites[spriteId].data1 == 32)
    {
        gSprites[spriteId].data1 = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        WallyBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data1 % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data1++;
    }
}

void sub_813789C(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        WallyBufferExecCompleted();
    }
}

// Duplicate of sub_813741C
void sub_8137908(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        WallyBufferExecCompleted();
}

void sub_8137940(void)
{
    if (!ewram17810[gActiveBank].unk0_5)
        WallyBufferExecCompleted();
}

void WallyBufferExecCompleted(void)
{
    gBattleBankFunc[gActiveBank] = WallyBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 multiplayerId = GetMultiplayerId();

        dp01_prepare_buffer_wireless_probably(2, 4, &multiplayerId);
        gBattleBufferA[gActiveBank][0] = 0x38;
    }
    else
    {
        gBattleExecBuffer &= ~gBitTable[gActiveBank];
    }
}

void unref_sub_81379E4(void)
{
    if (!ewram17810[gActiveBank].unk0_4)
        WallyBufferExecCompleted();
}
