#ifndef GUARD_BATTLE_UTIL_H
#define GUARD_BATTLE_UTIL_H

#define BS_GET_TARGET                   0
#define BS_GET_ATTACKER                 1
#define BS_GET_EFFECT_BANK              2
#define BS_GET_SCRIPTING_BANK           10
#define BS_GET_PLAYER1                  11
#define BS_GET_OPPONENT1                12
#define BS_GET_PLAYER2                  13
#define BS_GET_OPPONENT2                14

void TryClearRageStatuses(void);
void BattleScriptPush(const u8* BS_ptr);
void PressurePPLoseOnUsingImprision(u8 bankAtk);
void PressurePPLoseOnUsingPerishSong(u8 bankAtk);
void sub_80155A4(u8);
void CancelMultiTurnMoves(u8 bank);
bool8 WasUnableToUseMove(u8 bank);
void PrepareStringBattle(u16 stringId, u8 bank);
void ResetSentPokesToOpponentValue(void);
void sub_8015740(u8 bank);
void sub_80157C4(u8 bank);
bool8 HandleWishPerishSongOnTurnEnd(void);
void BattleScriptExecute(const u8* BS_ptr);
void BattleScriptPushCursorAndCallback(u8* BS_ptr);
u8 IsMonDisobedient(void);

#endif // GUARD_BATTLE_UTIL_H
