#ifndef GUARD_LOAD_SAVE_H
#define GUARD_LOAD_SAVE_H

void CheckForFlashMemory(void);
bool32 GetSecretBase2Field_9(void);
void ClearSecretBase2Field_9(void);
void SetSecretBase2Field_9(void);
void SetSecretBase2Field_9_AndHideBG(void);
void ClearSecretBase2Field_9_2(void);
void SavePlayerParty(void);
void LoadPlayerParty(void);
void SaveSerializedGame(void);
void LoadSerializedGame(void);
void LoadPlayerData(void);
void SavePlayerData(void);

#endif // GUARD_LOAD_SAVE_H
