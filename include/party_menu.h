#ifndef GUARD_PARTY_MENU_H
#define GUARD_PARTY_MENU_H

#include "task.h"

struct PartyMenuItem
{
    const u8 *text;
    TaskFunc func;
};

struct PartyPopupMenu
{
    u8 unk0;
    u8 unk1;
    const u8 *unk4;
};

// TODO: Unify these two structs

struct Unk201B000
{
    //u8 filler0[0x260];
    struct Pokemon unk0[6];
    u8 filler258[1];
    u8 unk259;
    u8 filler25A[6];
    u8 unk260;
    u8 unk261;
    u8 unk262;
    u8 unk263;
    // Stat growth upon level-up. First 6 bytes = old stats, Second 6 bytes = new stats.
    s16 statGrowths[NUM_STATS * 2];
    u8 filler27C[2];
    s16 unk27E;
    s16 unk280;
    s16 unk282;
};

struct Struct201B000
{
    u8 filler0[0x259];
    u8 unk259;
    u8 filler25A[6];
    u8 unk260;
    u8 unk261;
    u8 unk262;
    s16 unk264;
    s16 unk266;
    u8 filler268[10];
    u16 unk272;
    u8 filler274[14];
    u16 unk282;
};

struct Unk2001000
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
    void* unkC;
    u16 array[53561];
};

extern u8 ewram[];
#define ewram01000 (*(struct Unk2001000 *)(ewram + 0x01000))
#define ewram1B000 (*(struct Unk201B000 *)(ewram + 0x1B000))
#define ewram1B000_alt (*(struct Struct201B000 *)(ewram + 0x1B000))
#define EWRAM_1B000 ewram1B000_alt

void sub_806AEDC(void);
void sub_806AF4C(u8 arg0, u8 arg1, void* arg2, u8 arg3);
void OpenPartyMenu(u8, u8);
void OpenPartyMenu();
bool8 sub_806B124(void);
u8 IsLinkDoubleBattle(void);
u8 sub_806B58C(u8);
u8 sub_806B58C(u8);
void sub_806BC3C(u8, u8);
u8 sub_806BD58(u8, u8);
u8 sub_806BD58(u8, u8);
u16 sub_806BD80(u8);
void task_pc_turn_off();
void sub_806BF74(u8 arg0, u8 arg1);
void sub_806C994(u8 arg0, u8 arg1);
u8 sub_806CA38(u8 taskID);
void sub_806CB74(u8 taskId);
void sub_806CCE4(void);
void sub_806CD44(u8 taskId);
void sub_806D538(u8 arg0, u8 arg1);
void sub_806D5A4(void);
void SetMonIconAnim();
void TryCreatePartyMenuMonIcon(u8, u8, struct Pokemon *);
void LoadHeldItemIconGraphics(void);
void PartyMenuTryGiveMonHeldItem(u8 taskId, u16 newItem, TaskFunc c);
void CreateHeldItemIcons_806DC34(); // undefined args
void CreateHeldItemIcons_806DC34();
u8 GetMonIconSpriteId_maybe();
void SetHeldItemIconVisibility();
void TryPrintPartyMenuMonNickname();
void PrintPartyMenuMonNicknames(void);
void PrintPartyMenuMonNicknames(void);
void GetMonNickname(struct Pokemon *mon, u8 *nickname);
void PartyMenuClearLevelStatusTilemap();
void PartyMenuPrintMonLevelOrStatus();
void PartyMenuPrintMonsLevelOrStatus(void);
void PartyMenuPrintMonsLevelOrStatus(void);
void PartyMenuDoPrintHP(u8, int, u16, u16);
void PartyMenuTryPrintMonsHP(void);
void nullsub_13(void);
void PartyMenuDrawHPBars(void);
void sub_806E6F0();
void sub_806E750(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, int);
void sub_806E7D0(u8, const struct PartyPopupMenu *);
TaskFunc PartyMenuGetPopupMenuFunc(u8, const struct PartyPopupMenu *, const struct PartyMenuItem *, u8);
void Task_RareCandy3(u8);
void sub_8070C54(u8);
void DoEvolutionStoneItemEffect(u8, u16, TaskFunc);
u8 GetItemEffectType();
u8 sub_806E834(const u8 *message, u8 arg1);
void sub_806E8D0(u8 taskId, u16 b, TaskFunc c);
void party_menu_link_mon_held_item_object(u8);
void Task_ConfirmGiveHeldItem(u8);
void DisplayGiveHeldItemMessage(u8, u16, u8);
void DisplayTakeHeldItemMessage(u8, u16, u8);
void Task_ConfirmTakeHeldMail(u8);
u16 ItemIdToBattleMoveId(u16);
bool8 pokemon_has_move(struct Pokemon *, u16);
void TeachMonTMMove(u8, u16, TaskFunc);
void Task_TeamMonTMMove(u8);
void Task_TeamMonTMMove2(u8);
void Task_TeamMonTMMove3(u8);
void Task_TeamMonTMMove4(u8);
void sub_806F358(u8);
void sub_806F390(u8);
void sub_806F44C(u8);
void TMMoveUpdateMoveSlot(u8);
void StopTryingToTeachMove_806F614(u8);
void StopTryingToTeachMove_806F67C(u8);
void StopTryingToTeachMove_806F6B4(u8);
void sub_806F8AC(u8 taskId);
void sub_806FA18(u8 taskId);
void sub_806FB0C(u8 taskId);
void sub_806FB44(u8);
void PartyMenuUpdateLevelOrStatus(struct Pokemon *, u8);
void GetMedicineItemEffectMessage(u16);
bool8 ExecuteTableBasedItemEffect__(u8, u16, u8);
void UseMedicine(u8, u16, TaskFunc);
bool8 IsBlueYellowRedFlute(u16);
void sub_8070048(u8, u16, TaskFunc);
void sub_8070088(u8);
void sub_80701DC(u8 taskId);
void DoPPRecoveryItemEffect(u8, u16, TaskFunc);
void DoRecoverPP(u8);
void DoPPUpItemEffect(u8, u16, TaskFunc);
void DoRareCandyItemEffect(u8, u16, TaskFunc);
void Task_RareCandy1(u8);
void Task_RareCandy2(u8);
void PrintStatGrowthsInLevelUpWindow(u8 taskId);
void PrintNewStatsInLevelUpWindow(u8 taskId);
void RedrawPokemonInfoInMenu(u8, struct Pokemon *);
void sub_806CA60(u8 taskId);
void sub_806CD5C(u8 taskId);
void DoTakeMail(u8 taskId, TaskFunc func);
void PartyMenuTryGiveMonHeldItem_806ECE8(u8 taskId, TaskFunc func);
void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func);
void sub_806D668(u8 partyID);
void TaughtMove(u8 taskId);
void StopTryingToTeachMove_806F588(u8 taskId);

#endif // GUARD_PARTY_MENU_H
