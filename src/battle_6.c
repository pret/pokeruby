#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "data2.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom3.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;

extern struct Window gUnknown_03004210;

extern void (*gBattleBankFunc[])(void);

extern u8 gActiveBank;
extern u8 gActionSelectionCursor[];
extern u8 gDisplayedStringBattle[];
extern u8 gMoveSelectionCursor[];
extern u8 gBattleBufferA[][0x200];
extern u8 gBankInMenu;
extern u16 gBattlePartyID[];
extern u8 gHealthboxIDs[];
extern u8 gDoingBattleAnim;
extern u8 gObjectBankIDs[];
extern u16 gBattleTypeFlags;
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern u8 gUnknown_02038470[];
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u8 gUnknown_03004344;
extern u8 gUnknown_0300434C[];

extern const u8 gUnknown_08400CA8[];
extern const u8 gUnknown_08400CF3[];
extern const u8 gUnknown_08400D38[];

#if ENGLISH
#define SUB_803037C_TILE_DATA_OFFSET 440
#elif GERMAN
#define SUB_803037C_TILE_DATA_OFFSET 444
#endif

extern void sub_802C68C(void);
extern void sub_802E1B0(void);
extern void sub_802E3B4();
extern void sub_802E220();
extern void sub_802E2D4();
extern void sub_802E004(void);
extern void sub_802DF30(void);
extern void sub_80325B8(void);
extern void PlayerBufferExecCompleted(void);
extern void bx_t1_healthbar_update(void);
extern void nullsub_91(void);
extern void sub_802D924(u8);
extern void sub_802E434(void);
extern bool8 mplay_80342A4(u8);
extern void move_anim_start_t2_for_situation();
extern void bx_blink_t1(void);
extern void sub_8047858();
extern u8 GetBankSide(u8);
extern void sub_80E43C0();
extern void oamt_add_pos2_onto_pos1();
extern void sub_8078B34(struct Sprite *);
extern void oamt_set_x3A_32();
extern void sub_80318FC();
extern bool8 IsDoubleBattle(void);
extern void sub_802F934();
extern void sub_802D500(void);
extern void dp11b_obj_free();
extern bool8 sub_8078874(u8);
extern bool8 move_anim_start_t3();
extern void sub_802E460(void);
extern void b_link_standby_message(void);
extern void sub_802D18C(void);

void sub_80304A8(void);
void sub_8030E38(struct Sprite *);
void task05_08033660(u8);
void sub_8031064(void);

void sub_803037C(void)
{
    int r4;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 160;
    FillWindowRect(&gUnknown_03004210, 10, 2, 15, 27, 18);
    FillWindowRect(&gUnknown_03004210, 10, 2, 35, 16, 38);

    gBattleBankFunc[gActiveBank] = sub_802C098;

    InitWindow(&gUnknown_03004210, gUnknown_08400CF3, 400, 18, 35);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 12, 11679, 0);

    for (r4 = 0; r4 < 4; r4++)
        nullsub_8(r4);

    sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);

    StrCpyDecodeToDisplayedStringBattle((u8 *) gUnknown_08400CA8);
    InitWindow(&gUnknown_03004210, gDisplayedStringBattle, SUB_803037C_TILE_DATA_OFFSET, 2, 35);
    sub_8002F44(&gUnknown_03004210);
}

void nullsub_42()
{
}

void sub_8030468(void)
{
    sub_814A5C0(0, 0xFFFF, 12, 0x2D9F, 0);
    sub_80304A8();
    gBattleBankFunc[gActiveBank] = sub_802C68C;
}

void sub_80304A8(void)
{
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 320;
    sub_802E1B0();
    gUnknown_03004344 = 0xFF;
    sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
    if (gBattleBufferA[gActiveBank][2] != 1)
    {
        InitWindow(&gUnknown_03004210, gUnknown_08400D38, 656, 23, 55);
        sub_8002F44(&gUnknown_03004210);
    }
    sub_802E220();
    sub_802E2D4();
}

void PlayerHandleOpenBag(void)
{
    s32 i;

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gBattleBankFunc[gActiveBank] = sub_802E004;
    gBankInMenu = gActiveBank;
    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = gBattleBufferA[gActiveBank][1 + i];
}

void sub_8030594(void)
{
    s32 i;

    gUnknown_0300434C[gActiveBank] = CreateTask(TaskDummy, 0xFF);
    gTasks[gUnknown_0300434C[gActiveBank]].data[0] = gBattleBufferA[gActiveBank][1] & 0xF;
    ewram[0x16054] = gBattleBufferA[gActiveBank][1] >> 4;
    ewram[0x1609D] = gBattleBufferA[gActiveBank][2];
    ewram[0x160C0] = gBattleBufferA[gActiveBank][3];
    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = gBattleBufferA[gActiveBank][4 + i];
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gBattleBankFunc[gActiveBank] = sub_802DF30;
    gBankInMenu = gActiveBank;
}

void sub_8030674(void)
{
    sub_80325B8();
    BeginNormalPaletteFade(0xFFFFFFFF, 2, 0, 16, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);
        u32 curHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, curHP, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, 0, r7);
        sub_80440EC(gHealthboxIDs[gActiveBank], 0, 0);
    }
    gBattleBankFunc[gActiveBank] = bx_t1_healthbar_update;
}

void PlayerHandleExpBarUpdate(void)
{
    u8 r7 = gBattleBufferA[gActiveBank][1];

    if (GetMonData(&gPlayerParty[r7], MON_DATA_LEVEL) >= 100)
    {
        PlayerBufferExecCompleted();
    }
    else
    {
        u16 r4;
        u8 taskId;

        load_gfxc_health_bar(1);
        GetMonData(&gPlayerParty[r7], MON_DATA_SPECIES);  // unused return value
        r4 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
        taskId = CreateTask(sub_802D924, 10);
        gTasks[taskId].data[0] = r7;
        gTasks[taskId].data[1] = r4;
        gTasks[taskId].data[2] = gActiveBank;
        gBattleBankFunc[gActiveBank] = nullsub_91;
    }
}

void PlayerHandleStatusIconUpdate(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gPlayerParty[gBattlePartyID[gActiveBank]], 9);
        ewram17810[gActiveBank].unk0_4 = 0;
        gBattleBankFunc[gActiveBank] = sub_802E434;
    }
}

void PlayerHandleStatusAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBank][1],
          gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8) | (gBattleBufferA[gActiveBank][4] << 16) | (gBattleBufferA[gActiveBank][5] << 24));
        gBattleBankFunc[gActiveBank] = sub_802E434;
    }
}

void PlayerHandleStatusXor(void)
{
    u8 val = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_STATUS) ^ gBattleBufferA[gActiveBank][1];

    SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_STATUS, &val);
    PlayerBufferExecCompleted();
}

void sub_803097C(void)
{
    PlayerBufferExecCompleted();
}

void PlayerHandleDMATransfer(void)
{
    u32 val1 = gBattleBufferA[gActiveBank][1]
            | (gBattleBufferA[gActiveBank][2] << 8)
            | (gBattleBufferA[gActiveBank][3] << 16)
            | (gBattleBufferA[gActiveBank][4] << 24);
    u16 val2 = gBattleBufferA[gActiveBank][5] | (gBattleBufferA[gActiveBank][6] << 8);

    const u8 *src = &gBattleBufferA[gActiveBank][7];
    u8 *dst = (u8 *)val1;
    u32 size = val2;

    while (1)
    {
        if (size <= 0x1000)
        {
            DmaCopy16(3, src, dst, size);
            break;
        }
        DmaCopy16(3, src, dst, 0x1000);
        src += 0x1000;
        dst += 0x1000;
        size -= 0x1000;
    }
    PlayerBufferExecCompleted();
}

void sub_8030A3C(void)
{
    PlayBGM(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    PlayerBufferExecCompleted();
}

void sub_8030A6C(void)
{
    PlayerBufferExecCompleted();
}

void sub_8030A78(void)
{
    dp01_build_cmdbuf_x21_a_bb(1, 0, 0);
    PlayerBufferExecCompleted();
}

void sub_8030A8C(void)
{
    dp01_build_cmdbuf_x22_a_three_bytes(1, 0, 0);
    PlayerBufferExecCompleted();
}

void sub_8030AA0(void)
{
    dp01_build_cmdbuf_x23_aa_0(1, 0);
    PlayerBufferExecCompleted();
}

void sub_8030AB4(void)
{
    dp01_build_cmdbuf_x24_aa_0(1, 0);
    PlayerBufferExecCompleted();
}

void sub_8030AC8(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    PlayerBufferExecCompleted();
}

void sub_8030AE4(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBank][1];
    PlayerBufferExecCompleted();
}

void sub_8030B1C(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    PlayerBufferExecCompleted();
}

void sub_8030B34(void)
{
    gUnknown_020238C8.unk0_7 ^= 1;
    PlayerBufferExecCompleted();
}

void PlayerHandleHitAnimation(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].invisible == TRUE)
    {
        PlayerBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = 1;
        gSprites[gObjectBankIDs[gActiveBank]].data1 = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = bx_blink_t1;
    }
}

void sub_8030BCC(void)
{
    PlayerBufferExecCompleted();
}

void PlayerHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBankSide(gActiveBank) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8), pan);
    PlayerBufferExecCompleted();
}

void sub_8030C1C(void)
{
    PlayFanfare(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    PlayerBufferExecCompleted();
}

void PlayerHandleFaintingCry(void)
{
    u16 species = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES);

    PlayCry3(species, -25, 5);
    PlayerBufferExecCompleted();
}

void PlayerHandleIntroSlide(void)
{
    sub_80E43C0(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    PlayerBufferExecCompleted();
}

void PlayerHandleTrainerBallThrow(void)
{
    u8 paletteNum;
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data0 = 50;
    gSprites[gObjectBankIDs[gActiveBank]].data2 = -40;
    gSprites[gObjectBankIDs[gActiveBank]].data4 = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    gSprites[gObjectBankIDs[gActiveBank]].data5 = gActiveBank;
    oamt_set_x3A_32(&gSprites[gObjectBankIDs[gActiveBank]], sub_8030E38);
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 1);
    paletteNum = AllocSpritePalette(0xD6F8);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[gSaveBlock2.playerGender].data, 0x100 + paletteNum * 16, 32);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = paletteNum;
    taskId = CreateTask(task05_08033660, 5);
    gTasks[taskId].data[0] = gActiveBank;
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    ewram17810[4].unk9 |= 1;
    gBattleBankFunc[gActiveBank] = nullsub_91;
}

void sub_8030E38(struct Sprite *sprite)
{
    u8 r4 = sprite->data5;

    FreeSpriteOamMatrix(sprite);
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    DestroySprite(sprite);
    sub_80318FC(&gPlayerParty[gBattlePartyID[r4]], r4);
    StartSpriteAnim(&gSprites[gObjectBankIDs[r4]], 0);
}

void task05_08033660(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        u8 savedActiveBank = gActiveBank;

        gActiveBank = gTasks[taskId].data[0];
        if (!IsDoubleBattle() || (gBattleTypeFlags & 0x40))
        {
            gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
            sub_802F934(gActiveBank, 0);
        }
        else
        {
            gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
            sub_802F934(gActiveBank, 0);
            gActiveBank ^= 2;
            gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
            sub_80318FC(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
            sub_802F934(gActiveBank, 0);
            gActiveBank ^= 2;
        }
        gBattleBankFunc[gActiveBank] = sub_802D500;
        gActiveBank = savedActiveBank;
        DestroyTask(taskId);
    }
}

void sub_8030FAC(void)
{
    if (gBattleBufferA[gActiveBank][1] != 0 && GetBankSide(gActiveBank) == 0)
    {
        PlayerBufferExecCompleted();
    }
    else
    {
        ewram17810[gActiveBank].unk0_0 = 1;
        gUnknown_02024E68[gActiveBank] = sub_8044804(gActiveBank, (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBank][4], gBattleBufferA[gActiveBank][1], gBattleBufferA[gActiveBank][2]);
        ewram17810[gActiveBank].unk5 = 0;
        if (gBattleBufferA[gActiveBank][2] != 0)
            ewram17810[gActiveBank].unk5 = 0x5D;
        gBattleBankFunc[gActiveBank] = sub_8031064;
    }
}

void sub_8031064(void)
{
    if (ewram17810[gActiveBank].unk5++ > 0x5C)
    {
        ewram17810[gActiveBank].unk5 = 0;
        PlayerBufferExecCompleted();
    }
}

void sub_80310A4(void)
{
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    PlayerBufferExecCompleted();
}

void sub_80310F0(void)
{
    dp11b_obj_free(gActiveBank, 1);
    dp11b_obj_free(gActiveBank, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandleSpriteInvisibility(void)
{
    if (sub_8078874(gActiveBank))
    {
        gSprites[gObjectBankIDs[gActiveBank]].invisible = gBattleBufferA[gActiveBank][1];
        sub_8031F88(gActiveBank);
    }
    PlayerBufferExecCompleted();
}

void PlayerHandleBattleAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u8 val2 = gBattleBufferA[gActiveBank][1];
        u16 val = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

        if (move_anim_start_t3(gActiveBank, gActiveBank, gActiveBank, val2, val))
            PlayerBufferExecCompleted();
        else
            gBattleBankFunc[gActiveBank] = sub_802E460;
    }
}

void PlayerHandleLinkStandbyMsg(void)
{
    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        b_link_standby_message();
        // fall through
    case 1:
        dp11b_obj_free(gActiveBank, 1);
        dp11b_obj_free(gActiveBank, 0);
        break;
    case 2:
        b_link_standby_message();
        break;
    }
    PlayerBufferExecCompleted();
}

void PlayerHandleResetActionMoveSelection(void)
{
    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        gActionSelectionCursor[gActiveBank] = 0;
        gMoveSelectionCursor[gActiveBank] = 0;
        break;
    case 1:
        gActionSelectionCursor[gActiveBank] = 0;
        break;
    case 2:
        gMoveSelectionCursor[gActiveBank] = 0;
        break;
    }
    PlayerBufferExecCompleted();
}

void sub_80312A0(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBank][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    PlayerBufferExecCompleted();
    gBattleBankFunc[gActiveBank] = sub_802D18C;
}

void nullsub_43(void)
{
}
