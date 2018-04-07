#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

// Ruby/Sapphire's save data is Flash 128K, which is 32 save sectors.
#define NUM_SECTORS 32 // defined in agb_flash but not in a header

#define SAVE_STATUS_EMPTY 0
#define SAVE_STATUS_OK 1
#define SAVE_STATUS_NO_FLASH 4
#define SAVE_STATUS_ERROR 0xFF

extern u16 gSaveFileStatus;

void Save_EraseAllData(void);
void Save_ResetSaveCounters(void);

enum
{
    SAVE_NORMAL,
    SAVE_LINK,
    SAVE_EREADER,
    SAVE_HALL_OF_FAME,
    SAVE_OVERWRITE_DIFFERENT_FILE,
    SAVE_HALL_OF_FAME_ERASE_BEFORE, // unused
};

u8 Save_WriteDataInternal(u8 saveType);
u8 Save_WriteData(u8 saveType);

u8 sub_8125D80(void);
bool8 sub_8125DA8(void);
u8 sub_8125DDC(void);
u8 sub_8125E04(void);
u8 sub_8125E2C(void);
bool8 sub_8125E6C(void);
u8 Save_LoadGameData(u8 a1);
void sub_813B79C(void);

#endif // GUARD_SAVE_H
