#include "global.h"
#include "gba/gba.h"
#include "gba/flash_internal.h"
#include "save.h"
#include "asm.h"
#include "load_save.h"
#include "rom4.h"
#include "save_failed_screen.h"

extern u32 gLastSaveSectorStatus; // used but in an unferenced function, so unused
extern u16 gLastWrittenSector;
extern u32 gLastSaveCounter;
extern u16 gLastKnownGoodSector;
extern u32 gDamagedSaveSectors;
extern u32 gSaveCounter;
extern struct SaveSection unk_2000000; // slow save RAM
extern struct SaveSection *gFastSaveSection; // the pointer is in fast IWRAM but may sometimes point to the slower EWRAM.
extern u16 gUnknown_03005EB4;
extern u16 gSaveFileStatus;
extern u32 gGameContinueCallback;

extern struct PokemonStorage gPokemonStorage;
extern struct HallOfFame gHallOfFame;

const struct SaveSectionLocation gSaveSectionLocations[] =
{
	{((u8 *) &gSaveBlock2),							0x890},
	{((u8 *) &gSaveBlock1) + 0xF80 * 0,			0xF80},
	{((u8 *) &gSaveBlock1) + 0xF80 * 1,			0xF80},
	{((u8 *) &gSaveBlock1) + 0xF80 * 2,			0xF80},
	{((u8 *) &gSaveBlock1) + 0xF80 * 3,			0xC40},
	{((u8 *) &gPokemonStorage) + 0xF80 * 0,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 1,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 2,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 3,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 4,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 5,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 6,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 7,	0xF80},
	{((u8 *) &gPokemonStorage) + 0xF80 * 8,	0x7D0}
};

const struct SaveSectionLocation gHallOfFameSaveSectionLocations[] =
{
	{((u8 *) &gHallOfFame) + 0xF80 * 0, 0xF80},
	{((u8 *) &gHallOfFame) + 0xF80 * 1, 0xF80}
};

const u8 gFlashSectors[] = { 0x1E, 0x1F };

void ClearSaveData(void)
{
    u16 i;

    for (i = 0; i < NUM_SECTORS; i++)
        EraseFlashSector(i);
}

// ResetSaveCounters
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
        gLastWrittenSector = gLastWrittenSector % 14;
        gSaveCounter++;
        retVal = 1;

        for (i = 0; i < 14; i++)
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
    sector %= 14;
    sector += 14 * (gSaveCounter % 2);

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
    gLastWrittenSector = gLastWrittenSector % 14;
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
    sector %= 14;
    sector += 14 * (gSaveCounter % 2);

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
    sector %= 14;
    sector += 14 * (gSaveCounter % 2);

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
    sector %= 14;
    sector += 14 * (gSaveCounter % 2);

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
        retVal = sub_8125974(location);
        sub_81258BC(0xFFFF, location);
    }

    return retVal;
}

u8 sub_81258BC(u16 a1, const struct SaveSectionLocation *location)
{
    u16 i;
    u16 checksum;
    u16 v3 = 14 * (gSaveCounter % 2);
    u16 id;

    for (i = 0; i < 14; i++)
    {
        sub_8125BF8(i + v3, gFastSaveSection);
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

u8 sub_8125974(const struct SaveSectionLocation *location)
{
    u16 i;
    u16 checksum;
    u32 v2 = 0;
    u32 v3 = 0;
    u32 v4;
    bool8 v5;
    u8 v14;
    u8 v10;

    v4 = 0;
    v5 = FALSE;

    for (i = 0; i < 14; i++)
    {
        sub_8125BF8(i, gFastSaveSection);
        if (gFastSaveSection->security == UNKNOWN_CHECK_VALUE)
        {
            v5 = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, location[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                v2 = gFastSaveSection->counter;
                v4 |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (v5)
    {
        if (v4 == 0x3FFF)
            v14 = 1;
        else
            v14 = 255;
    }
    else
    {
        v14 = 0;
    }

    v4 = 0;
    v5 = FALSE;

    for (i = 0; i < 14; i++)
    {
        sub_8125BF8(i + 14, gFastSaveSection);
        if (gFastSaveSection->security == UNKNOWN_CHECK_VALUE)
        {
            v5 = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, location[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                v3 = gFastSaveSection->counter;
                v4 |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (v5)
    {
        if (v4 == 0x3FFF)
            v10 = 1;
        else
            v10 = 255;
    }
    else
    {
        v10 = 0;
    }

    if (v14 == 1 && v10 == 1)
    {
        if ((v2 == -1 && v3 == 0) || (v2 == 0 && v3 == -1))
        {
            if ((unsigned)(v2 + 1) < (unsigned)(v3 + 1))
            {
                gSaveCounter = v3;
            }
            else
            {
                gSaveCounter = v2;
            }
        }
        else
        {
            if (v2 < v3)
            {
                gSaveCounter = v3;
            }
            else
            {
                gSaveCounter = v2;
            }
        }
        return 1;
    }

    if (v14 == 1)
    {
        gSaveCounter = v2;
        if (v10 == 255)
            return 255;
        return 1;
    }

    if (v10 == 1)
    {
        gSaveCounter = v3;
        if (v14 == 255)
            return 255;
        return 1;
    }

    if (v14 == 0 && v10 == 0)
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
    sub_8125BF8(a1, section);
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

u8 sub_8125BF8(u8 sector, struct SaveSection *section)
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
    case HOF_DELETE_SAVE: // deletes save before HOF case. unused
        for (i = 28; i < 32; i++)
            EraseFlashSector(i);
    case HOF_SAVE: // hall of fame.
        if (GetGameStat(10) < 999)
            IncrementGameStat(10);
        for (i = 0; i < 2; i++)
            HandleWriteSectorNBytes(28 + i, gHallOfFameSaveSectionLocations[i].data, gHallOfFameSaveSectionLocations[i].size);
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    case NORMAL_SAVE: // normal save.
    default:
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    case LINK_SAVE: // link save. update only the pokemon, i think.
        SaveSerializedGame();
        for (i = 0; i < 5; i++)
            save_write_to_flash(i, gSaveSectionLocations);
        break;
    case EREADER_SAVE: // used in mossdeep "game corner" before/after battling old man e-reader trainer
        SaveSerializedGame();
        save_write_to_flash(0, gSaveSectionLocations);
        break;
    case DIFFERENT_FILE_SAVE: // there is a different file, so erase the file and overwrite it completely.
        for (i = 28; i < 32; i++)
            EraseFlashSector(i);
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
    u8 retVal = sub_812550C(14, gSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    if (retVal == 0xFF)
        return 1;
    else
        return 0;
}

u8 sub_8125DDC(void) // trade.s save
{
    sub_812556C(14, gSaveSectionLocations);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    return 0;
}

u8 sub_8125E04(void) // trade.s save
{
    sub_8125758(14, gSaveSectionLocations);
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

u8 sub_8125E6C(void)
{
    u8 retVal = 0;
    u16 val = ++gUnknown_03005EB4;
    if (val <= 4)
    {
        sub_812556C(gUnknown_03005EB4 + 1, gSaveSectionLocations);
        sub_81257F0(val, gSaveSectionLocations);
    }
    else
    {
        sub_81257F0(val, gSaveSectionLocations);
        retVal = 1;
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
        result = sub_8125B88(28, gHallOfFameSaveSectionLocations[0].data, gHallOfFameSaveSectionLocations[0].size);
        if (result == 1)
            result = sub_8125B88(29, gHallOfFameSaveSectionLocations[1].data, gHallOfFameSaveSectionLocations[1].size);
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
