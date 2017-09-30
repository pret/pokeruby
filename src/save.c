#include "global.h"
#include "gba/gba.h"
#include "gba/flash_internal.h"
#include "save.h"
#include "load_save.h"
#include "overworld.h"
#include "save_failed_screen.h"

#define GETVALIDSTATUSBITFIELD ((1 << ARRAY_COUNT(gSaveSectionLocations)) - 1)
#define GETCHUNKSIZE(chunk, n) ((sizeof(chunk) - (0xF80 * (n - 1))) >= 0xF80 ? 0xF80 : (sizeof(chunk) - (0xF80 * (n - 1))))
#define GETBLOCKOFFSET(n) (0xF80 * (n - 1))
#define TOTALNUMSECTORS ((ARRAY_COUNT(gSaveSectionLocations) * 2) + (ARRAY_COUNT(gHallOfFameSaveSectionLocations) * 2)) // there are 2 slots, so double each array count and get the sum.

extern struct SaveSection unk_2000000; // slow save RAM

u16 gLastWrittenSector;
u32 gLastSaveCounter;
u16 gLastKnownGoodSector;
u32 gDamagedSaveSectors;
u32 gSaveCounter;
struct SaveSection *gFastSaveSection; // the pointer is in fast IWRAM but may sometimes point to the slower EWRAM.
u16 gUnknown_03005EB4;
u16 gSaveFileStatus;
u32 gGameContinueCallback;

extern struct PokemonStorage gPokemonStorage;
extern struct HallOfFame gHallOfFame;

static EWRAM_DATA u32 gLastSaveSectorStatus = 0; // used but in an unferenced function, so unused

const struct SaveSectionLocation gSaveSectionLocations[] =
{
    {((u8 *) &gSaveBlock2) + GETBLOCKOFFSET(1), GETCHUNKSIZE(gSaveBlock2, 1)},
    {((u8 *) &gSaveBlock1) + GETBLOCKOFFSET(1), GETCHUNKSIZE(gSaveBlock1, 1)},
    {((u8 *) &gSaveBlock1) + GETBLOCKOFFSET(2), GETCHUNKSIZE(gSaveBlock1, 2)},
    {((u8 *) &gSaveBlock1) + GETBLOCKOFFSET(3), GETCHUNKSIZE(gSaveBlock1, 3)},
    {((u8 *) &gSaveBlock1) + GETBLOCKOFFSET(4), GETCHUNKSIZE(gSaveBlock1, 4)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(1), GETCHUNKSIZE(gPokemonStorage, 1)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(2), GETCHUNKSIZE(gPokemonStorage, 2)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(3), GETCHUNKSIZE(gPokemonStorage, 3)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(4), GETCHUNKSIZE(gPokemonStorage, 4)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(5), GETCHUNKSIZE(gPokemonStorage, 5)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(6), GETCHUNKSIZE(gPokemonStorage, 6)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(7), GETCHUNKSIZE(gPokemonStorage, 7)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(8), GETCHUNKSIZE(gPokemonStorage, 8)},
    {((u8 *) &gPokemonStorage) + GETBLOCKOFFSET(9), GETCHUNKSIZE(gPokemonStorage, 9)}
};

const struct SaveSectionLocation gHallOfFameSaveSectionLocations[] =
{
    {((u8 *) &gHallOfFame) + GETBLOCKOFFSET(1), GETCHUNKSIZE(struct HallOfFame, 1)}, // gHallOfFame is not a proper sym, so the struct must be used.
    {((u8 *) &gHallOfFame) + GETBLOCKOFFSET(2), GETCHUNKSIZE(struct HallOfFame, 2)}
};

const u8 gFlashSectors[] = { 0x1E, 0x1F };

void ClearSaveData(void)
{
    u16 i;

    for (i = 0; i < NUM_SECTORS; i++)
        EraseFlashSector(i);
}

void ResetSaveCounters(void)
{
    gSaveCounter = 0;
    gLastWrittenSector = 0;
    gDamagedSaveSectors = 0;
}

bool32 SetDamagedSectorBits(u8 op, u8 bit)
{
    bool32 retVal = FALSE;

    switch (op)
    {
    case ENABLE:
        gDamagedSaveSectors |= (1 << bit);
        break;
    case DISABLE:
        gDamagedSaveSectors &= ~(1 << bit);
        break;
    case CHECK: // unused
        if (gDamagedSaveSectors & (1 << bit))
            retVal = TRUE;
        break;
    }

    return retVal;
}

u8 save_write_to_flash(u16 a1, const struct SaveSectionLocation *location)
{
    u32 retVal;
    u16 i;

    gFastSaveSection = &unk_2000000;

    if (a1 != 0xFFFF) // for link
    {
        retVal = HandleWriteSector(a1, location);
    }
    else
    {
        gLastKnownGoodSector = gLastWrittenSector; // backup the current written sector before attempting to write.
        gLastSaveCounter = gSaveCounter;
        gLastWrittenSector++;
        gLastWrittenSector = gLastWrittenSector % ARRAY_COUNT(gSaveSectionLocations);
        gSaveCounter++;
        retVal = 1;

        for (i = 0; i < ARRAY_COUNT(gSaveSectionLocations); i++)
            HandleWriteSector(i, location);

        if (gDamagedSaveSectors != 0) // skip the damaged sector.
        {
            retVal = 0xFF;
            gLastWrittenSector = gLastKnownGoodSector;
            gSaveCounter = gLastSaveCounter;
        }
    }

    return retVal;
}

u8 HandleWriteSector(u16 a1, const struct SaveSectionLocation *location)
{
    u16 i;
    u16 sector;
    u8 *data;
    u16 size;

    sector = a1 + gLastWrittenSector;
    sector %= ARRAY_COUNT(gSaveSectionLocations);
    sector += ARRAY_COUNT(gSaveSectionLocations) * (gSaveCounter % 2);

    data = location[a1].data;
    size = location[a1].size;

    // clear save section.
    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = a1;
    gFastSaveSection->security = UNKNOWN_CHECK_VALUE;
    gFastSaveSection->counter = gSaveCounter;

    for (i = 0; i < size; i++)
        gFastSaveSection->data[i] = data[i];

    gFastSaveSection->checksum = CalculateChecksum(data, size);
    return TryWriteSector(sector, gFastSaveSection->data);
}

u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = &unk_2000000;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)section)[i] = 0;

    section->security = UNKNOWN_CHECK_VALUE;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    section->id = CalculateChecksum(data, size); // though this appears to be incorrect, it might be some sector checksum instead of a whole save checksum and only appears to be relevent to HOF data, if used.
    return TryWriteSector(sector, section->data);
}

u8 TryWriteSector(u8 sector, u8 *data)
{
    if (ProgramFlashSectorAndVerify(sector, data) != 0) // is damaged?
    {
        SetDamagedSectorBits(ENABLE, sector); // set damaged sector bits.
        return 0xFF;
    }
    else
    {
        SetDamagedSectorBits(DISABLE, sector); // unset damaged sector bits. it's safe now.
        return 1;
    }
}

u32 RestoreSaveBackupVarsAndIncrement(const struct SaveSectionLocation *location) // location is unused
{
    gFastSaveSection = &unk_2000000;
    gLastKnownGoodSector = gLastWrittenSector;
    gLastSaveCounter = gSaveCounter;
    gLastWrittenSector++;
    gLastWrittenSector = gLastWrittenSector % ARRAY_COUNT(gSaveSectionLocations);
    gSaveCounter++;
    gUnknown_03005EB4 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

u32 RestoreSaveBackupVars(const struct SaveSectionLocation *location) // only ever called once, and gSaveBlock2 is passed to this function. location is unused
{
    gFastSaveSection = &unk_2000000;
    gLastKnownGoodSector = gLastWrittenSector;
    gLastSaveCounter = gSaveCounter;
    gUnknown_03005EB4 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

u8 sub_812550C(u16 a1, const struct SaveSectionLocation *location)
{
    u8 retVal;

    if (gUnknown_03005EB4 < a1 - 1)
    {
        retVal = 1;
        HandleWriteSector(gUnknown_03005EB4, location);
        gUnknown_03005EB4++;
        if (gDamagedSaveSectors)
        {
            retVal = 0xFF;
            gLastWrittenSector = gLastKnownGoodSector;
            gSaveCounter = gLastSaveCounter;
        }
    }
    else
    {
        retVal = 0xFF;
    }

    return retVal;
}

u8 sub_812556C(u16 a1, const struct SaveSectionLocation *location)
{
    u8 retVal = 1;

    sub_81255B8(a1 - 1, location);

    if (gDamagedSaveSectors)
    {
        retVal = 0xFF;
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
    }
    return retVal;
}

u8 sub_81255B8(u16 a1, const struct SaveSectionLocation *location)
{
    u16 i;
    u16 sector;
    u8 *data;
    u16 size;
    u8 status;

    sector = a1 + gLastWrittenSector;
    sector %= ARRAY_COUNT(gSaveSectionLocations);
    sector += ARRAY_COUNT(gSaveSectionLocations) * (gSaveCounter % 2);

    data = location[a1].data;
    size = location[a1].size;

    // clear temp save section.
    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = a1;
    gFastSaveSection->security = UNKNOWN_CHECK_VALUE;
    gFastSaveSection->counter = gSaveCounter;

    // set temp section's data.
    for (i = 0; i < size; i++)
        gFastSaveSection->data[i] = data[i];

    // calculate checksum.
    gFastSaveSection->checksum = CalculateChecksum(data, size);

    EraseFlashSector(sector);

    status = 1;

    for (i = 0; i < sizeof(struct UnkSaveSection); i++)
    {
        if (ProgramFlashByte(sector, i, ((u8 *)gFastSaveSection)[i]))
        {
            status = 0xFF;
            break;
        }
    }

    if (status == 0xFF)
    {
        SetDamagedSectorBits(ENABLE, sector);
        return 0xFF;
    }
    else
    {
        status = 1;

        for (i = 0; i < 7; i++)
        {
            if (ProgramFlashByte(sector, 0xFF9 + i, ((u8 *)gFastSaveSection)[0xFF9 + i]))
            {
                status = 0xFF;
                break;
            }
        }

        if (status == 0xFF)
        {
            SetDamagedSectorBits(ENABLE, sector);
            return 0xFF;
        }
        else
        {
            SetDamagedSectorBits(DISABLE, sector);
            return 1;
        }
    }
}

u8 sub_8125758(u16 a1, const struct SaveSectionLocation *location)
{
    u16 sector;

    sector = a1 + gLastWrittenSector - 1;
    sector %= ARRAY_COUNT(gSaveSectionLocations);
    sector += ARRAY_COUNT(gSaveSectionLocations) * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), ((u8 *)gFastSaveSection)[sizeof(struct UnkSaveSection)]))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetDamagedSectorBits(ENABLE, sector);
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
        return 0xFF;
    }
    else
    {
        SetDamagedSectorBits(DISABLE, sector);
        return 1;
    }
}

u8 sub_81257F0(u16 a1, const struct SaveSectionLocation *location)
{
    u16 sector;

    sector = a1 + gLastWrittenSector - 1;
    sector %= ARRAY_COUNT(gSaveSectionLocations);
    sector += ARRAY_COUNT(gSaveSectionLocations) * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), 0x25))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetDamagedSectorBits(ENABLE, sector);
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
        return 0xFF;
    }
    else
    {
        SetDamagedSectorBits(DISABLE, sector);
        return 1;
    }
}

u8 sub_812587C(u16 a1, const struct SaveSectionLocation *location)
{
    u8 retVal;
    gFastSaveSection = &unk_2000000;
    if (a1 != 0xFFFF)
    {
        retVal = 0xFF;
    }
    else
    {
        retVal = GetSaveValidStatus(location);
        sub_81258BC(0xFFFF, location);
    }

    return retVal;
}

u8 sub_81258BC(u16 a1, const struct SaveSectionLocation *location)
{
    u16 i;
    u16 checksum;
    u16 v3 = ARRAY_COUNT(gSaveSectionLocations) * (gSaveCounter % 2);
    u16 id;

    for (i = 0; i < ARRAY_COUNT(gSaveSectionLocations); i++)
    {
        DoReadFlashWholeSection(i + v3, gFastSaveSection);
        id = gFastSaveSection->id;
        if (id == 0)
            gLastWrittenSector = i;
        checksum = CalculateChecksum(gFastSaveSection->data, location[id].size);
        if (gFastSaveSection->security == UNKNOWN_CHECK_VALUE
         && gFastSaveSection->checksum == checksum)
        {
            u16 j;
            for (j = 0; j < location[id].size; j++)
                ((u8 *)location[id].data)[j] = gFastSaveSection->data[j];
        }
    }

    return 1;
}

u8 GetSaveValidStatus(const struct SaveSectionLocation *location)
{
    u16 i;
    u16 checksum;
    u32 saveSlot1Counter = 0;
    u32 saveSlot2Counter = 0;
    u32 slotCheckField = 0;
    bool8 securityPassed = FALSE;
    u8 saveSlot1Status;
    u8 saveSlot2Status;

    // check save slot 1.
    for (i = 0; i < ARRAY_COUNT(gSaveSectionLocations); i++)
    {
        DoReadFlashWholeSection(i, gFastSaveSection);
        if (gFastSaveSection->security == UNKNOWN_CHECK_VALUE)
        {
            securityPassed = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, location[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                saveSlot1Counter = gFastSaveSection->counter;
                slotCheckField |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (securityPassed)
    {
        if (slotCheckField == GETVALIDSTATUSBITFIELD)
            saveSlot1Status = 1;
        else
            saveSlot1Status = 255;
    }
    else
    {
        saveSlot1Status = 0;
    }

    slotCheckField = 0;
    securityPassed = FALSE;

    // check save slot 2.
    for (i = 0; i < ARRAY_COUNT(gSaveSectionLocations); i++)
    {
        DoReadFlashWholeSection(i + ARRAY_COUNT(gSaveSectionLocations), gFastSaveSection);
        if (gFastSaveSection->security == UNKNOWN_CHECK_VALUE)
        {
            securityPassed = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, location[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                saveSlot2Counter = gFastSaveSection->counter;
                slotCheckField |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (securityPassed)
    {
        if (slotCheckField == GETVALIDSTATUSBITFIELD)
            saveSlot2Status = 1;
        else
            saveSlot2Status = 255;
    }
    else
    {
        saveSlot2Status = 0;
    }

    if (saveSlot1Status == 1 && saveSlot2Status == 1)
    {
        if ((saveSlot1Counter == -1 && saveSlot2Counter == 0) || (saveSlot1Counter == 0 && saveSlot2Counter == -1))
        {
            if ((unsigned)(saveSlot1Counter + 1) < (unsigned)(saveSlot2Counter + 1))
            {
                gSaveCounter = saveSlot2Counter;
            }
            else
            {
                gSaveCounter = saveSlot1Counter;
            }
        }
        else
        {
            if (saveSlot1Counter < saveSlot2Counter)
            {
                gSaveCounter = saveSlot2Counter;
            }
            else
            {
                gSaveCounter = saveSlot1Counter;
            }
        }
        return 1;
    }

    if (saveSlot1Status == 1)
    {
        gSaveCounter = saveSlot1Counter;
        if (saveSlot2Status == 255)
            return 255;
        return 1;
    }

    if (saveSlot2Status == 1)
    {
        gSaveCounter = saveSlot2Counter;
        if (saveSlot1Status == 255)
            return 255;
        return 1;
    }

    if (saveSlot1Status == 0 && saveSlot2Status == 0)
    {
        gSaveCounter = 0;
        gLastWrittenSector = 0;
        return 0;
    }

    gSaveCounter = 0;
    gLastWrittenSector = 0;
    return 2;
}

u8 sub_8125B88(u8 a1, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = &unk_2000000;
    DoReadFlashWholeSection(a1, section);
    if (section->security == UNKNOWN_CHECK_VALUE)
    {
        u16 checksum = CalculateChecksum(section->data, size);
        if (section->id == checksum)
        {
            for (i = 0; i < size; i++)
                data[i] = section->data[i];
            return 1;
        }
        else
        {
            return 2;
        }
    }
    else
    {
        return 0;
    }
}

u8 DoReadFlashWholeSection(u8 sector, struct SaveSection *section)
{
    ReadFlash(sector, 0, section->data, sizeof(struct SaveSection));
    return 1;
}

u16 CalculateChecksum(void *data, u16 size)
{
    u16 i;
    u32 checksum = 0;

    for (i = 0; i < (size / 4); i++)
        checksum += *((u32 *)data)++;

    return ((checksum >> 16) + checksum);
}

u8 HandleSavingData(u8 saveType)
{
    u8 i;
    switch (saveType)
    {
    case HOF_DELETE_SAVE: // deletes HOF before overwriting HOF completely. unused
        for (i = (ARRAY_COUNT(gSaveSectionLocations) * 2 + 0); i < TOTALNUMSECTORS; i++)
            EraseFlashSector(i);
    case HOF_SAVE: // hall of fame.
        if (GetGameStat(10) < 999)
            IncrementGameStat(10);
        for (i = 0; i < ARRAY_COUNT(gHallOfFameSaveSectionLocations); i++)
            HandleWriteSectorNBytes((ARRAY_COUNT(gSaveSectionLocations) * 2 + 0) + i, gHallOfFameSaveSectionLocations[i].data, gHallOfFameSaveSectionLocations[i].size);
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    case NORMAL_SAVE: // normal save. also called by overwriting your own save.
    default:
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    case LINK_SAVE: // link save. updates only gSaveBlock1 and gSaveBlock2.
        SaveSerializedGame();
        for (i = 0; i < 5; i++)
            save_write_to_flash(i, gSaveSectionLocations);
        break;
    case EREADER_SAVE: // used in mossdeep "game corner" before/after battling old man e-reader trainer
        SaveSerializedGame();
        save_write_to_flash(0, gSaveSectionLocations);
        break;
    case DIFFERENT_FILE_SAVE: // there is a different file, so erase the file and overwrite it completely.
        for (i = (ARRAY_COUNT(gSaveSectionLocations) * 2 + 0); i < TOTALNUMSECTORS; i++)
            EraseFlashSector(i); // erase HOF.
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    }
    return 0;
}

u8 TrySavingData(u8 saveType) // TrySave
{
    if (gFlashMemoryPresent != TRUE)
        return 0xFF;
    HandleSavingData(saveType);
    if (!gDamagedSaveSectors)
        return 1;
    DoSaveFailedScreen(saveType);
    return 0xFF;
}

u8 sub_8125D80(void) // trade.s save
{
    if (gFlashMemoryPresent != TRUE)
        return 1;
    SaveSerializedGame();
    RestoreSaveBackupVarsAndIncrement(gSaveSectionLocations);
    return 0;
}

bool8 sub_8125DA8(void) // trade.s save
{
    u8 retVal = sub_812550C(ARRAY_COUNT(gSaveSectionLocations), gSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    if (retVal == 0xFF)
        return 1;
    else
        return 0;
}

u8 sub_8125DDC(void) // trade.s save
{
    sub_812556C(ARRAY_COUNT(gSaveSectionLocations), gSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    return 0;
}

u8 sub_8125E04(void) // trade.s save
{
    sub_8125758(ARRAY_COUNT(gSaveSectionLocations), gSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    return 0;
}

u8 sub_8125E2C(void)
{
    if (gFlashMemoryPresent != TRUE)
        return 1;

    SaveSerializedGame();
    RestoreSaveBackupVars(gSaveSectionLocations);
    sub_812556C(gUnknown_03005EB4 + 1, gSaveSectionLocations);
    return 0;
}

bool8 sub_8125E6C(void)
{
    u8 retVal = FALSE;
    u16 val = ++gUnknown_03005EB4;
    if (val <= 4)
    {
        sub_812556C(gUnknown_03005EB4 + 1, gSaveSectionLocations);
        sub_81257F0(val, gSaveSectionLocations);
    }
    else
    {
        sub_81257F0(val, gSaveSectionLocations);
        retVal = TRUE;
    }
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(1);
    return retVal;
}

u8 sub_8125EC8(u8 a1)
{
    u8 result;

    if (gFlashMemoryPresent != TRUE)
    {
        gSaveFileStatus = 4;
        return 0xFF;
    }

    switch (a1)
    {
    case 0:
    default:
        result = sub_812587C(0xFFFF, gSaveSectionLocations);
        LoadSerializedGame();
        gSaveFileStatus = result;
        gGameContinueCallback = 0;
        break;
    case 3:
        result = sub_8125B88((ARRAY_COUNT(gSaveSectionLocations) * 2 + 0), gHallOfFameSaveSectionLocations[0].data, gHallOfFameSaveSectionLocations[0].size);
        if (result == 1)
            result = sub_8125B88((ARRAY_COUNT(gSaveSectionLocations) * 2 + 1), gHallOfFameSaveSectionLocations[1].data, gHallOfFameSaveSectionLocations[1].size);
        break;
    }

    return result;
}

bool8 unref_sub_8125F4C(struct UnkSaveSection *a1)
{
    u16 i;
    char *raw = (char *)a1;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        raw[i] = 0;

    ReadFlash(gFlashSectors[0], 0, a1->data, 4096);

    if (a1->security != UNKNOWN_CHECK_VALUE)
        return FALSE;

    return TRUE;
}

u8 unref_sub_8125FA0(void)
{
    u16 i;
    u8 v0 = TrySavingData(0);

    for (i = 0; i < 2; i++)
        EraseFlashSector(gFlashSectors[i]);

    if (v0 == 255)
    {
        return 3;
    }
    else if (v0 == 3)
    {
        return 2;
    }
    else
    {
        sub_8125EC8(0);
        return 1;
    }
}

u8 unref_sub_8125FF0(u8 *data, u16 size)
{
    u16 i;
    struct UnkSaveSection *section = (struct UnkSaveSection *)&unk_2000000;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)section)[i] = 0;

    section->security = UNKNOWN_CHECK_VALUE;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    gLastSaveSectorStatus = ProgramFlashSectorAndVerifyNBytes(gFlashSectors[0], (u8 *)section, sizeof(struct SaveSection));

    if (gLastSaveSectorStatus)
        return 0xFF;
    else
        return 1;
}

u8 unref_sub_8126068(u8 sector, u8 *data, u32 size)
{
    if (ProgramFlashSectorAndVerify(sector, data))
        return 255;
    else
        return 1;
}

u8 unref_sub_8126080(u8 sector, u8 *data)
{
    ReadFlash(sector, 0, data, sizeof(struct SaveSection));
    return 1;
}
