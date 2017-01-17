#include "global.h"
#include "asm.h"
#include "link.h"
#include "main.h"
#include "m4a.h"
#include "palette.h"
#include "pokemon.h"
#include "sound.h"
#include "sprite.h"
#include "text.h"

struct UnknownStruct1
{
    u8 unk0;
    u8 unk1;
    u8 unk2[0x1FE];
};

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    u8 filler2[7];
    u8 unk9;
    u8 fillerA[2];
};

extern u32 gBitTable[];
extern u16 gBattleTypeFlags;

extern struct UnknownStruct1 gUnknown_02023A60[];
extern u8 gUnknown_02024A60;
extern u32 gUnknown_02024A64;
extern u16 gUnknown_02024A6A[];
extern u8 gUnknown_02024BE0[];
extern u8 gUnknown_02024E6D;
extern struct Window gUnknown_03004210;
extern MainCallback gUnknown_030042D0;
extern void (*gUnknown_03004330[])(void);
extern u8 gUnknown_03004340[];
extern u8 gUnknown_0300434C[];
extern void (*const gUnknown_083FE4F4[])(void);

extern u8 unk_2000000[];

#define EWRAM_17800 ((u8 *)(unk_2000000 + 0x17800))
#define EWRAM_17810 ((struct UnknownStruct2 *)(unk_2000000 + 0x17810))

extern void nullsub_10();
extern void sub_8045A5C();
extern void sub_804777C();
extern void sub_8043DFC();
extern s16 sub_8045C78();
extern void sub_80440EC();
extern void sub_80324F8();
extern void nullsub_9(u16);
extern void sub_8043DB0();
extern void move_anim_start_t4();
extern void c3_0802FDF4(u8);
extern void sub_8031F88();
extern void sub_8141828();
extern void c2_8011A1C(void);
extern void sub_800832C();
extern void dp01_prepare_buffer_wireless_probably();

void sub_811DA94(void);
void sub_811E0A0(void);
void dp01_tbl3_exec_completed(void);

void nullsub_74(void)
{
}

void sub_811DA78(void)
{
    gUnknown_03004330[gUnknown_02024A60] = sub_811DA94;
}

void sub_811DA94(void)
{
    if (gUnknown_02024A64 & gBitTable[gUnknown_02024A60])
    {
        if (gUnknown_02023A60[gUnknown_02024A60].unk0 <= 0x38)
            gUnknown_083FE4F4[gUnknown_02023A60[gUnknown_02024A60].unk0]();
        else
            dp01_tbl3_exec_completed();
    }
}

void sub_811DAE4(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].callback == SpriteCallbackDummy)
        dp01_tbl3_exec_completed();
}

void sub_811DB1C(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].callback == SpriteCallbackDummy)
    {
        nullsub_10(0);
        FreeSpriteOamMatrix(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        DestroySprite(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DB84(void)
{
    if ((--EWRAM_17810[gUnknown_02024A60].unk9) == 0xFF)
    {
        EWRAM_17810[gUnknown_02024A60].unk9 = 0;
        dp01_tbl3_exec_completed();
    }
}

void sub_811DBC0(void)
{
    bool8 r6 = FALSE;
    
    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & 0x40)))
    {
        if (gSprites[gUnknown_03004340[gUnknown_02024A60]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    else
    {
        if (gSprites[gUnknown_03004340[gUnknown_02024A60]].callback == SpriteCallbackDummy
         && gSprites[gUnknown_03004340[gUnknown_02024A60 ^ 2]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = FALSE;
    if (r6)
    {
        EWRAM_17810[gUnknown_02024A60].unk9 = 3;
        gUnknown_03004330[gUnknown_02024A60] = sub_811DB84;
    }
}

void sub_811DCA0(void)
{
    u8 r2;
    
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 8))
    {
        r2 = EWRAM_17810[gUnknown_02024A60 ^ 2].unk0 & 8;
        if (!r2 && (++EWRAM_17810[gUnknown_02024A60].unk9) != 1)
        {
            EWRAM_17810[gUnknown_02024A60].unk9 = r2;
            if (IsDoubleBattle() && !(gBattleTypeFlags & 0x40))
            {
                DestroySprite(&gSprites[gUnknown_0300434C[gUnknown_02024A60 ^ 2]]);
                sub_8045A5C(gUnknown_03004340[gUnknown_02024A60 ^ 2], &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60 ^ 2]], 0);
                sub_804777C(gUnknown_02024A60 ^ 2);
                sub_8043DFC(gUnknown_03004340[gUnknown_02024A60 ^ 2]);
            }
            DestroySprite(&gSprites[gUnknown_0300434C[gUnknown_02024A60]]);
            sub_8045A5C(gUnknown_03004340[gUnknown_02024A60], &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], 0);
            sub_804777C(gUnknown_02024A60);
            sub_8043DFC(gUnknown_03004340[gUnknown_02024A60]);
            (s8)EWRAM_17810[4].unk9 &= ~1;
            gUnknown_03004330[gUnknown_02024A60] = sub_811DBC0;
        }
    }
}

void sub_811DDE8(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].animEnded
     && gSprites[gUnknown_02024BE0[gUnknown_02024A60]].pos2.x == 0)
        dp01_tbl3_exec_completed();
}

void bx_t3_healthbar_update(void)
{
    s16 r4;
    
    r4 = sub_8045C78(gUnknown_02024A60, gUnknown_03004340[gUnknown_02024A60], 0, 0);
    sub_8043DFC(gUnknown_03004340[gUnknown_02024A60]);
    if (r4 != -1)
    {
        sub_80440EC(gUnknown_03004340[gUnknown_02024A60], r4, 0);
    }
    else
    {
        sub_80324F8(&gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], gUnknown_02024A60);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DE98(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].pos1.y + gSprites[gUnknown_02024BE0[gUnknown_02024A60]].pos2.y > 160)
    {
        nullsub_9(GetMonData(&gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], MON_DATA_SPECIES));
        FreeOamMatrix(gSprites[gUnknown_02024BE0[gUnknown_02024A60]].oam.matrixNum);
        DestroySprite(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        sub_8043DB0(gUnknown_03004340[gUnknown_02024A60]);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DF34(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x40))
    {
        FreeSpriteOamMatrix(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        DestroySprite(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        sub_8043DB0(gUnknown_03004340[gUnknown_02024A60]);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DFA0(void)
{
    if (gUnknown_03004210.state == 0)
        dp01_tbl3_exec_completed();
}

void bx_blink_t3(void)
{
    u8 spriteId = gUnknown_02024BE0[gUnknown_02024A60];
    if (gSprites[spriteId].data1 == 32)
    {
        gSprites[spriteId].data1 = 0;
        gSprites[spriteId].invisible = FALSE;
        gUnknown_02024E6D = 0;
        dp01_tbl3_exec_completed();
    }
    else
    {
        if ((gSprites[spriteId].data1 % 4) == 0)
        {
            gSprites[spriteId].invisible ^= 1;
        }
        gSprites[spriteId].data1++;   
    }
}

void sub_811E034(void)
{
    if (gSprites[gUnknown_03004340[gUnknown_02024A60]].callback == SpriteCallbackDummy)
    {
        if (EWRAM_17800[gUnknown_02024A60 * 4] & 4)
            move_anim_start_t4(gUnknown_02024A60, gUnknown_02024A60, gUnknown_02024A60, 6);
        gUnknown_03004330[gUnknown_02024A60] = sub_811E0A0;
    }
}

void sub_811E0A0(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x40))
        dp01_tbl3_exec_completed();
}

void sub_811E0CC(void)
{
    if (EWRAM_17810[gUnknown_02024A60].unk1 & 1)
    {
        EWRAM_17810[gUnknown_02024A60].unk0 &= 0x7F;
        (s8)EWRAM_17810[gUnknown_02024A60].unk1 &= ~1;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        CreateTask(c3_0802FDF4, 10);
        sub_80324F8(&gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], gUnknown_02024A60);
        StartSpriteAnim(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]], 0);
        sub_8045A5C(gUnknown_03004340[gUnknown_02024A60], &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], 0);
        sub_804777C(gUnknown_02024A60);
        sub_8043DFC(gUnknown_03004340[gUnknown_02024A60]);
        sub_8031F88(gUnknown_02024A60);
        gUnknown_03004330[gUnknown_02024A60] = sub_811E034;
    }
}

void sub_811E1BC(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x88))
        sub_8141828(gUnknown_02024A60, &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]]);
    if (gSprites[gUnknown_0300434C[gUnknown_02024A60]].callback == SpriteCallbackDummy
     && !(EWRAM_17810[gUnknown_02024A60].unk0 & 8))
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gUnknown_02024A60]]);
        gUnknown_03004330[gUnknown_02024A60] = sub_811E0CC;
    }
}

void sub_811E258(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        m4aSongNumStop(0x5A);
        gMain.inBattle = FALSE;
        gMain.callback1 = gUnknown_030042D0;
        SetMainCallback2(c2_8011A1C);
    }
}

void sub_811E29C(void)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & 2)
        {
            sub_800832C();
            gUnknown_03004330[gUnknown_02024A60] = sub_811E258;
        }
        else
        {
            m4aSongNumStop(0x5A);
            gMain.inBattle = FALSE;
            gMain.callback1 = gUnknown_030042D0;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

void dp01_tbl3_exec_completed(void)
{
    u8 multiplayerId;
    
    gUnknown_03004330[gUnknown_02024A60] = sub_811DA94;
    if (gBattleTypeFlags & 2)
    {
        multiplayerId = GetMultiplayerId();
        dp01_prepare_buffer_wireless_probably(2, 4, &multiplayerId);
        gUnknown_02023A60[gUnknown_02024A60].unk0 = 0x38;
    }
    else
    {
        gUnknown_02024A64 &= ~gBitTable[gUnknown_02024A60];
    }
}

void sub_811E38C(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x10))
        dp01_tbl3_exec_completed();
}

void sub_811E3B8(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x20))
        dp01_tbl3_exec_completed();
}

/*
extern int dp01_getattr_by_ch1_for_player_pokemon(u8, void *);
extern void dp01_build_cmdbuf_x1D_1D_numargs_varargs(int, u16, void *);

void dp01t_00_3_getattr(void)
{
    u8 unk[4];
    int r6 = 0;
    s32 i;
    
    if (*((u8 *)&gUnknown_02023A60 + 2 + gUnknown_02024A60 * 0x200) == 0)
    {
        r6 = dp01_getattr_by_ch1_for_player_pokemon(gUnknown_02024A6A[gUnknown_02024A60], unk);
    }
    else
    {
        u8 r4 = *((u8 *)&gUnknown_02023A60 + gUnknown_02024A60 * 0x200 + 2);
        
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += dp01_getattr_by_ch1_for_player_pokemon(i, unk + r6);
            r4 >>= 1;
        }
    }
    dp01_build_cmdbuf_x1D_1D_numargs_varargs(1, r6, unk);
    dp01_tbl3_exec_completed();
}
*/
