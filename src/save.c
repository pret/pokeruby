#include "global.h"
#include "gba/gba.h"
#include "gba/flash_internal.h"
#include "save.h"
#include "load_save.h"
#include "overworld.h"
#include "pokemon.h"
#include "save_failed_screen.h"
#include "ewram.h"

#define FILE_SIGNATURE 0x08012025  // signature value to determine if a sector is in use

//#define TOTAL_FLASH_SECTORS ((ARRAY_COUNT(sSaveBlockChunks) * 2) + (ARRAY_COUNT(sHallOfFameChunks) * 2)) // there are 2 slots, so double each array count and get the sum.
#define TOTAL_FLASH_SECTORS 32

struct SaveBlockChunk
{
    u8 *data;
    u16 size;
};

struct SaveSector
{
    u8 data[0xFF4];
    u16 id;
    u16 checksum;
    u32 signature;
    u32 counter;
}; // size is 0x1000

// headless save section?
struct UnkSaveSection
{
    u8 data[0xFF4];
    u32 signature;
}; // size is 0xFF8

static u8 WriteSingleChunk(u16, const struct SaveBlockChunk *);
static u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size);
static u8 TryWriteSector(u8, u8 *);
static u32 RestoreSaveBackupVarsAndIncrement(const struct SaveBlockChunk *location);
static u32 RestoreSaveBackupVars(const struct SaveBlockChunk *location);
static u8 sub_812550C(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_812556C(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_81255B8(u16, const struct SaveBlockChunk *location);
static u8 WriteSomeFlashByteToPrevSector(u16 a1, const struct SaveBlockChunk *location);
static u8 WriteSomeFlashByte0x25ToPrevSector(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_812587C(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_81258BC(u16, const struct SaveBlockChunk *location);
static u8 GetSaveValidStatus(const struct SaveBlockChunk *location);
static u8 ReadSomeUnknownSectorAndVerify(u8 a1, u8 *data, u16 size);
static u8 DoReadFlashWholeSection(u8, struct SaveSector *);
static u16 CalculateChecksum(void *, u16);
bool8 unref_sub_8125F4C(struct UnkSaveSection *a1);
u8 unref_sub_8125FA0(void);
u8 unref_sub_8125FF0(u8 *data, u16 size);
u8 unref_sub_8126068(u8 sector, u8 *data, u32 size);
u8 unref_sub_8126080(u8 sector, u8 *data);

// Sector num to begin writing save data. Sectors are rotated each time the game is saved. (possibly to avoid wear on flash memory?)
u16 gFirstSaveSector;
u32 gPrevSaveCounter;
u16 gLastKnownGoodSector;
u32 gDamagedSaveSectors;
u32 gSaveCounter;
struct SaveSector *gFastSaveSection; // the pointer is in fast IWRAM but may sometimes point to the slower EWRAM.
u16 gUnknown_03005EB4;
u16 gSaveFileStatus;
u32 gGameContinueCallback;

static EWRAM_DATA u32 gLastSaveSectorStatus = 0; // used but in an unferenced function, so unused

// Each 4 KiB flash sector contains 3968 bytes of actual data followed by a 128 byte footer
#define SECTOR_DATA_SIZE 3968
#define SECTOR_FOOTER_SIZE 128

/*
 * Sector Layout:
 * 
 * Sectors 0 - 13:      Save Slot 1
 * Sectors 14 - 27:     Save Slot 2
 * Sectors 28 - 29:     Hall of Fame
 * Sectors 30 - 31:     e-Reader battle tower data, maybe?
 * 
 * There are two save slots for saving the player's game data. We alternate between
 * them each time the game is saved, so that if the current save slot is corrupt,
 * we can load the previous one. We also rotate the sectors in each save slot
 * so that the same data is not always being written to the same sector. This
 * might be done to reduce wear on the flash memory, but I'm not sure, since all
 * 14 sectors get written anyway.
 */

#define HALL_OF_FAME_SECTOR 28

#define NUM_SECTORS_PER_SAVE_SLOT 14  // Number of sectors occupied by a save slot
#define NUM_HALL_OF_FAME_SECTORS 2

// Divide save blocks into individual chunks to be written to flash sectors

#define SAVEBLOCK_CHUNK(structure, chunkNum)                                \
{                                                                           \
    (u8 *)&structure + chunkNum * SECTOR_DATA_SIZE,                         \
    min(sizeof(structure) - chunkNum * SECTOR_DATA_SIZE, SECTOR_DATA_SIZE)  \
}                                                                           \

static const struct SaveBlockChunk sSaveBlockChunks[] =
{
    SAVEBLOCK_CHUNK(gSaveBlock2, 0),

    SAVEBLOCK_CHUNK(gSaveBlock1, 0),
    SAVEBLOCK_CHUNK(gSaveBlock1, 1),
    SAVEBLOCK_CHUNK(gSaveBlock1, 2),
    SAVEBLOCK_CHUNK(gSaveBlock1, 3),

    SAVEBLOCK_CHUNK(gPokemonStorage, 0),
    SAVEBLOCK_CHUNK(gPokemonStorage, 1),
    SAVEBLOCK_CHUNK(gPokemonStorage, 2),
    SAVEBLOCK_CHUNK(gPokemonStorage, 3),
    SAVEBLOCK_CHUNK(gPokemonStorage, 4),
    SAVEBLOCK_CHUNK(gPokemonStorage, 5),
    SAVEBLOCK_CHUNK(gPokemonStorage, 6),
    SAVEBLOCK_CHUNK(gPokemonStorage, 7),
    SAVEBLOCK_CHUNK(gPokemonStorage, 8),
};

static const struct SaveBlockChunk sHallOfFameChunks[] =
{
    SAVEBLOCK_CHUNK(*eHallOfFame, 0),
    SAVEBLOCK_CHUNK(*eHallOfFame, 1),
};

void Save_EraseAllData(void)
{
    u16 i;

    for (i = 0; i < NUM_SECTORS; i++)
        EraseFlashSector(i);
}

void Save_ResetSaveCounters(void)
{
    gSaveCounter = 0;
    gFirstSaveSector = 0;
    gDamagedSaveSectors = 0;
}

enum
{
    SECTOR_DAMAGED,
    SECTOR_OK,
    SECTOR_CHECK, // unused
};

static bool32 SetSectorDamagedStatus(u8 op, u8 sectorNum)
{
    bool32 retVal = FALSE;

    switch (op)
    {
    case SECTOR_DAMAGED:
        gDamagedSaveSectors |= (1 << sectorNum);
        break;
    case SECTOR_OK:
        gDamagedSaveSectors &= ~(1 << sectorNum);
        break;
    case SECTOR_CHECK: // unused
        if (gDamagedSaveSectors & (1 << sectorNum))
            retVal = TRUE;
        break;
    }

    return retVal;
}

// If chunkId is 0xFFFF, this function will write all of the chunks pointed to by 'chunks'.
// Otherwise, it will write a single chunk with the given 'chunkId'.
static u8 WriteSaveBlockChunks(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u32 retVal;
    u16 i;

    gFastSaveSection = eSaveSection;

    if (chunkId != 0xFFFF)  // write single chunk
    {
        retVal = WriteSingleChunk(chunkId, chunks);
    }
    else  // write all chunks
    {
        gLastKnownGoodSector = gFirstSaveSector;
        gPrevSaveCounter = gSaveCounter;
        gFirstSaveSector++;
        gFirstSaveSector %= NUM_SECTORS_PER_SAVE_SLOT;
        gSaveCounter++;
        retVal = SAVE_STATUS_OK;

        for (i = 0; i < NUM_SECTORS_PER_SAVE_SLOT; i++)
            WriteSingleChunk(i, chunks);

        // Check for any bad sectors
        if (gDamagedSaveSectors != 0) // skip the damaged sector.
        {
            retVal = SAVE_STATUS_ERROR;
            gFirstSaveSector = gLastKnownGoodSector;
            gSaveCounter = gPrevSaveCounter;
        }
    }

    return retVal;
}

static u8 WriteSingleChunk(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 sectorNum;
    u8 *chunkData;
    u16 chunkSize;

    // select sector number
    sectorNum = chunkId + gFirstSaveSector;
    sectorNum %= NUM_SECTORS_PER_SAVE_SLOT;
    // select save slot
    sectorNum += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    chunkData = chunks[chunkId].data;
    chunkSize = chunks[chunkId].size;

    // clear save section.
    for (i = 0; i < sizeof(struct SaveSector); i++)
        ((u8 *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = chunkId;
    gFastSaveSection->signature = FILE_SIGNATURE;
    gFastSaveSection->counter = gSaveCounter;
    for (i = 0; i < chunkSize; i++)
        gFastSaveSection->data[i] = chunkData[i];
    gFastSaveSection->checksum = CalculateChecksum(chunkData, chunkSize);

    return TryWriteSector(sectorNum, gFastSaveSection->data);
}

static u8 HandleWriteSectorNBytes(u8 sectorNum, u8 *data, u16 size)
{
    u16 i;
    struct SaveSector *section = eSaveSection;

    for (i = 0; i < sizeof(struct SaveSector); i++)
        ((char *)section)[i] = 0;

    section->signature = FILE_SIGNATURE;
    for (i = 0; i < size; i++)
        section->data[i] = data[i];
    section->id = CalculateChecksum(data, size); // though this appears to be incorrect, it might be some sector checksum instead of a whole save checksum and only appears to be relevent to HOF data, if used.

    return TryWriteSector(sectorNum, section->data);
}

static u8 TryWriteSector(u8 sectorNum, u8 *data)
{
    if (ProgramFlashSectorAndVerify(sectorNum, data) != 0) // is damaged?
    {
        SetSectorDamagedStatus(SECTOR_DAMAGED, sectorNum); // set damaged sector bits.
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(SECTOR_OK, sectorNum); // unset damaged sector bits. it's safe now.
        return SAVE_STATUS_OK;
    }
}

static u32 RestoreSaveBackupVarsAndIncrement(const struct SaveBlockChunk *chunk) // chunk is unused
{
    gFastSaveSection = eSaveSection;
    gLastKnownGoodSector = gFirstSaveSector;
    gPrevSaveCounter = gSaveCounter;
    gFirstSaveSector++;
    gFirstSaveSector %= NUM_SECTORS_PER_SAVE_SLOT;
    gSaveCounter++;
    gUnknown_03005EB4 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

static u32 RestoreSaveBackupVars(const struct SaveBlockChunk *chunk) // chunk is unused
{
    gFastSaveSection = eSaveSection;
    gLastKnownGoodSector = gFirstSaveSector;
    gPrevSaveCounter = gSaveCounter;
    gUnknown_03005EB4 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

static u8 sub_812550C(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal;

    if (gUnknown_03005EB4 < a1 - 1)
    {
        retVal = SAVE_STATUS_OK;
        WriteSingleChunk(gUnknown_03005EB4, chunk);
        gUnknown_03005EB4++;
        if (gDamagedSaveSectors)
        {
            retVal = SAVE_STATUS_ERROR;
            gFirstSaveSector = gLastKnownGoodSector;
            gSaveCounter = gPrevSaveCounter;
        }
    }
    else
    {
        retVal = SAVE_STATUS_ERROR;
    }

    return retVal;
}

static u8 sub_812556C(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal = SAVE_STATUS_OK;

    sub_81255B8(a1 - 1, chunk);

    if (gDamagedSaveSectors)
    {
        retVal = SAVE_STATUS_ERROR;
        gFirstSaveSector = gLastKnownGoodSector;
        gSaveCounter = gPrevSaveCounter;
    }
    return retVal;
}

static u8 sub_81255B8(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 sector;
    u8 *data;
    u16 size;
    u8 status;

    // select sector number
    sector = chunkId + gFirstSaveSector;
    sector %= NUM_SECTORS_PER_SAVE_SLOT;
    // select save slot
    sector += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    data = chunks[chunkId].data;
    size = chunks[chunkId].size;

    // clear temp save section.
    for (i = 0; i < sizeof(struct SaveSector); i++)
        ((char *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = chunkId;
    gFastSaveSection->signature = FILE_SIGNATURE;
    gFastSaveSection->counter = gSaveCounter;

    // set temp section's data.
    for (i = 0; i < size; i++)
        gFastSaveSection->data[i] = data[i];

    // calculate checksum.
    gFastSaveSection->checksum = CalculateChecksum(data, size);

    EraseFlashSector(sector);

    status = SAVE_STATUS_OK;

    for (i = 0; i < sizeof(struct UnkSaveSection); i++)
    {
        if (ProgramFlashByte(sector, i, gFastSaveSection->data[i]))
        {
            status = SAVE_STATUS_ERROR;
            break;
        }
    }

    if (status == SAVE_STATUS_ERROR)
    {
        SetSectorDamagedStatus(SECTOR_DAMAGED, sector);
        return SAVE_STATUS_ERROR;
    }
    else
    {
        status = SAVE_STATUS_OK;

        for (i = 0; i < 7; i++)
        {
            if (ProgramFlashByte(sector, 0xFF9 + i, ((u8 *)gFastSaveSection)[0xFF9 + i]))
            {
                status = SAVE_STATUS_ERROR;
                break;
            }
        }

        if (status == SAVE_STATUS_ERROR)
        {
            SetSectorDamagedStatus(SECTOR_DAMAGED, sector);
            return SAVE_STATUS_ERROR;
        }
        else
        {
            SetSectorDamagedStatus(SECTOR_OK, sector);
            return SAVE_STATUS_OK;
        }
    }
}

static u8 WriteSomeFlashByteToPrevSector(u16 a1, const struct SaveBlockChunk *chunk)
{
    u16 sector;

    // select sector number
    sector = a1 + gFirstSaveSector - 1;
    sector %= NUM_SECTORS_PER_SAVE_SLOT;
    // select save slot
    sector += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), ((u8 *)gFastSaveSection)[sizeof(struct UnkSaveSection)]))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetSectorDamagedStatus(SECTOR_DAMAGED, sector);
        gFirstSaveSector = gLastKnownGoodSector;
        gSaveCounter = gPrevSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(SECTOR_OK, sector);
        return SAVE_STATUS_OK;
    }
}

static u8 WriteSomeFlashByte0x25ToPrevSector(u16 a1, const struct SaveBlockChunk *chunk)
{
    u16 sector;

    sector = a1 + gFirstSaveSector - 1;
    sector %= NUM_SECTORS_PER_SAVE_SLOT;
    sector += NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), 0x25))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetSectorDamagedStatus(SECTOR_DAMAGED, sector);
        gFirstSaveSector = gLastKnownGoodSector;
        gSaveCounter = gPrevSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(SECTOR_OK, sector);
        return SAVE_STATUS_OK;
    }
}

static u8 sub_812587C(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal;
    gFastSaveSection = eSaveSection;
    if (a1 != 0xFFFF)
    {
        retVal = SAVE_STATUS_ERROR;
    }
    else
    {
        retVal = GetSaveValidStatus(chunk);
        sub_81258BC(0xFFFF, chunk);
    }

    return retVal;
}

static u8 sub_81258BC(u16 a1, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 checksum;
    u16 sector = NUM_SECTORS_PER_SAVE_SLOT * (gSaveCounter % 2);
    u16 id;

    for (i = 0; i < NUM_SECTORS_PER_SAVE_SLOT; i++)
    {
        DoReadFlashWholeSection(i + sector, gFastSaveSection);
        id = gFastSaveSection->id;
        if (id == 0)
            gFirstSaveSector = i;
        checksum = CalculateChecksum(gFastSaveSection->data, chunks[id].size);
        if (gFastSaveSection->signature == FILE_SIGNATURE
         && gFastSaveSection->checksum == checksum)
        {
            u16 j;
            for (j = 0; j < chunks[id].size; j++)
                chunks[id].data[j] = gFastSaveSection->data[j];
        }
    }

    return 1;
}

static u8 GetSaveValidStatus(const struct SaveBlockChunk *chunks)
{
    u16 sector;
    bool8 signatureValid;
    u16 checksum;
    u32 slot1saveCounter = 0;
    u32 slot2saveCounter = 0;
    u8 slot1Status;
    u8 slot2Status;
    u32 validSectors;
    const u32 ALL_SECTORS = (1 << NUM_SECTORS_PER_SAVE_SLOT) - 1;  // bitmask of all saveblock sectors

    // check save slot 1.
    validSectors = 0;
    signatureValid = FALSE;
    for (sector = 0; sector < NUM_SECTORS_PER_SAVE_SLOT; sector++)
    {
        DoReadFlashWholeSection(sector, gFastSaveSection);
        if (gFastSaveSection->signature == FILE_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, chunks[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                slot1saveCounter = gFastSaveSection->counter;
                validSectors |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (signatureValid)
    {
        if (validSectors == ALL_SECTORS)
            slot1Status = SAVE_STATUS_OK;
        else
            slot1Status = SAVE_STATUS_ERROR;
    }
    else
    {
        slot1Status = SAVE_STATUS_EMPTY;
    }

    // check save slot 2.
    validSectors = 0;
    signatureValid = FALSE;
    for (sector = 0; sector < NUM_SECTORS_PER_SAVE_SLOT; sector++)
    {
        DoReadFlashWholeSection(NUM_SECTORS_PER_SAVE_SLOT + sector, gFastSaveSection);
        if (gFastSaveSection->signature == FILE_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, chunks[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                slot2saveCounter = gFastSaveSection->counter;
                validSectors |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (signatureValid)
    {
        if (validSectors == ALL_SECTORS)
            slot2Status = SAVE_STATUS_OK;
        else
            slot2Status = SAVE_STATUS_ERROR;
    }
    else
    {
        slot2Status = SAVE_STATUS_EMPTY;
    }

    if (slot1Status == SAVE_STATUS_OK && slot2Status == SAVE_STATUS_OK)
    {
        // Choose counter of the most recent save file
        if ((slot1saveCounter == -1 && slot2saveCounter == 0) || (slot1saveCounter == 0 && slot2saveCounter == -1))
        {
            if ((unsigned)(slot1saveCounter + 1) < (unsigned)(slot2saveCounter + 1))
                gSaveCounter = slot2saveCounter;
            else
                gSaveCounter = slot1saveCounter;
        }
        else
        {
            if (slot1saveCounter < slot2saveCounter)
                gSaveCounter = slot2saveCounter;
            else
                gSaveCounter = slot1saveCounter;
        }
        return SAVE_STATUS_OK;
    }

    if (slot1Status == SAVE_STATUS_OK)
    {
        gSaveCounter = slot1saveCounter;
        if (slot2Status == SAVE_STATUS_ERROR)
            return SAVE_STATUS_ERROR;
        else
            return SAVE_STATUS_OK;
    }

    if (slot2Status == SAVE_STATUS_OK)
    {
        gSaveCounter = slot2saveCounter;
        if (slot1Status == SAVE_STATUS_ERROR)
            return SAVE_STATUS_ERROR;
        else
            return SAVE_STATUS_OK;
    }

    if (slot1Status == SAVE_STATUS_EMPTY && slot2Status == SAVE_STATUS_EMPTY)
    {
        gSaveCounter = 0;
        gFirstSaveSector = 0;
        return SAVE_STATUS_EMPTY;
    }

    gSaveCounter = 0;
    gFirstSaveSector = 0;
    return 2;
}

static u8 ReadSomeUnknownSectorAndVerify(u8 sector, u8 *data, u16 size)
{
    u16 i;
    struct SaveSector *section = eSaveSection;

    DoReadFlashWholeSection(sector, section);
    if (section->signature == FILE_SIGNATURE)
    {
        u16 checksum = CalculateChecksum(section->data, size);
        if (section->id == checksum)
        {
            for (i = 0; i < size; i++)
                data[i] = section->data[i];
            return SAVE_STATUS_OK;
        }
        else
        {
            return 2;
        }
    }
    else
    {
        return SAVE_STATUS_EMPTY;
    }
}

static u8 DoReadFlashWholeSection(u8 sector, struct SaveSector *section)
{
    ReadFlash(sector, 0, section->data, sizeof(struct SaveSector));
    return 1;
}

static u16 CalculateChecksum(void *data, u16 size)
{
    u16 i;
    u32 checksum = 0;

    for (i = 0; i < (size / 4); i++)
        checksum += *((u32 *)data)++;

    return ((checksum >> 16) + checksum);
}

#if DEBUG
void sub_813B79C(void)
{
    struct SaveSector *sbSector;
    struct SaveSector *hofSector;
    const struct SaveBlockChunk *sbChunks;
    const struct SaveBlockChunk *hofChunks;
    u16 i;

    sbSector = eSaveSection;
    sbChunks = sSaveBlockChunks;
    for (i = 0; i < NUM_SECTORS_PER_SAVE_SLOT * 2; i++)
    {
        DoReadFlashWholeSection(i, sbSector);
        sbSector->checksum = CalculateChecksum(sbSector, sbChunks[sbSector->id].size);
        ProgramFlashSectorAndVerify(i, sbSector->data);
    }

    hofSector = eSaveSection;
    hofChunks = sHallOfFameChunks;
    for (i = 0; i < NUM_HALL_OF_FAME_SECTORS; i++)
    {
        DoReadFlashWholeSection(HALL_OF_FAME_SECTOR + i, hofSector);
        hofSector->id = CalculateChecksum(hofSector, hofChunks[i].size);  // why id?
        ProgramFlashSectorAndVerify(HALL_OF_FAME_SECTOR + i, hofSector->data);
    }
}
#endif

u8 Save_WriteDataInternal(u8 saveType)
{
    u8 i;

    switch (saveType)
    {
    case SAVE_HALL_OF_FAME_ERASE_BEFORE: // wipes all hall of fame data, then saves hall of fame. unused
        for (i = HALL_OF_FAME_SECTOR; i < TOTAL_FLASH_SECTORS; i++)
            EraseFlashSector(i);
        // fall through
    case SAVE_HALL_OF_FAME: // hall of fame.
        if (GetGameStat(GAME_STAT_ENTERED_HOF) < 999)
            IncrementGameStat(GAME_STAT_ENTERED_HOF);
        for (i = 0; i < NUM_HALL_OF_FAME_SECTORS; i++)
            HandleWriteSectorNBytes(HALL_OF_FAME_SECTOR + i, sHallOfFameChunks[i].data, sHallOfFameChunks[i].size);
        SaveSerializedGame();
        WriteSaveBlockChunks(0xFFFF, sSaveBlockChunks);
        break;
    case SAVE_NORMAL: // normal save. also called by overwriting your own save.
    default:
        SaveSerializedGame();
        WriteSaveBlockChunks(0xFFFF, sSaveBlockChunks);
        break;
    case SAVE_LINK: // link save. updates only gSaveBlock1 and gSaveBlock2.
        SaveSerializedGame();
        for (i = 0; i < 5; i++)
            WriteSaveBlockChunks(i, sSaveBlockChunks);
        break;
    case SAVE_EREADER: // used in mossdeep "game corner" before/after battling old man e-reader trainer
        SaveSerializedGame();
        WriteSaveBlockChunks(0, sSaveBlockChunks);
        break;
    case SAVE_OVERWRITE_DIFFERENT_FILE: // there is a different file, so overwrite it completely.
        // Erase Hall of Fame.
        for (i = HALL_OF_FAME_SECTOR; i < TOTAL_FLASH_SECTORS; i++)
            EraseFlashSector(i);
        SaveSerializedGame();
        WriteSaveBlockChunks(0xFFFF, sSaveBlockChunks);
        break;
    }
    return 0;
}

#if DEBUG
extern u32 gUnknown_Debug_03004BD0;
#endif

u8 Save_WriteData(u8 saveType) // TrySave
{
    if (gFlashMemoryPresent != TRUE)
        return SAVE_STATUS_ERROR;

    Save_WriteDataInternal(saveType);
    if (!gDamagedSaveSectors
#if DEBUG
        && gUnknown_Debug_03004BD0 == 0
#endif
        )
        return SAVE_STATUS_OK;

    DoSaveFailedScreen(saveType);
    return SAVE_STATUS_ERROR;
}

u8 sub_8125D80(void) // trade.s save
{
    if (gFlashMemoryPresent != TRUE)
        return 1;
    SaveSerializedGame();
    RestoreSaveBackupVarsAndIncrement(sSaveBlockChunks);
    return 0;
}

bool8 sub_8125DA8(void) // trade.s save
{
    u8 retVal = sub_812550C(ARRAY_COUNT(sSaveBlockChunks), sSaveBlockChunks);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    if (retVal == SAVE_STATUS_ERROR)
        return 1;
    else
        return 0;
}

u8 sub_8125DDC(void) // trade.s save
{
    sub_812556C(ARRAY_COUNT(sSaveBlockChunks), sSaveBlockChunks);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    return 0;
}

u8 sub_8125E04(void) // trade.s save
{
    WriteSomeFlashByteToPrevSector(ARRAY_COUNT(sSaveBlockChunks), sSaveBlockChunks);
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(0);
    return 0;
}

u8 sub_8125E2C(void)
{
    if (gFlashMemoryPresent != TRUE)
        return 1;

    SaveSerializedGame();
    RestoreSaveBackupVars(sSaveBlockChunks);
    sub_812556C(gUnknown_03005EB4 + 1, sSaveBlockChunks);
    return 0;
}

// something to do with multiplayer. Possibly record mizing?
bool8 sub_8125E6C(void)
{
    u8 retVal = FALSE;
    u16 val = ++gUnknown_03005EB4;
    if (val <= 4)
    {
        sub_812556C(gUnknown_03005EB4 + 1, sSaveBlockChunks);
        WriteSomeFlashByte0x25ToPrevSector(val, sSaveBlockChunks);
    }
    else
    {
        WriteSomeFlashByte0x25ToPrevSector(val, sSaveBlockChunks);
        retVal = TRUE;
    }
    if (gDamagedSaveSectors)
        DoSaveFailedScreen(1);
    return retVal;
}

u8 Save_LoadGameData(u8 saveType)
{
    u8 result;

    if (gFlashMemoryPresent != TRUE)
    {
        gSaveFileStatus = SAVE_STATUS_NO_FLASH;
        return SAVE_STATUS_ERROR;
    }

    switch (saveType)
    {
    case SAVE_NORMAL:
    default:
        result = sub_812587C(0xFFFF, sSaveBlockChunks);
        LoadSerializedGame();
        gSaveFileStatus = result;
        gGameContinueCallback = 0;
        break;
    case SAVE_HALL_OF_FAME:
        result = ReadSomeUnknownSectorAndVerify(HALL_OF_FAME_SECTOR, sHallOfFameChunks[0].data, sHallOfFameChunks[0].size);
        if (result == SAVE_STATUS_OK)
            result = ReadSomeUnknownSectorAndVerify(HALL_OF_FAME_SECTOR + 1, sHallOfFameChunks[1].data, sHallOfFameChunks[1].size);
        break;
    }

    return result;
}

const u8 sUnusedFlashSectors[] = { 30, 31 };

bool8 unref_sub_8125F4C(struct UnkSaveSection *a1)
{
    u16 i;
    char *raw = (char *)a1;

    for (i = 0; i < sizeof(struct SaveSector); i++)
        raw[i] = 0;

    ReadFlash(sUnusedFlashSectors[0], 0, a1->data, 4096);

    if (a1->signature != FILE_SIGNATURE)
        return FALSE;

    return TRUE;
}

u8 unref_sub_8125FA0(void)
{
    u16 i;
    u8 status = Save_WriteData(SAVE_NORMAL);

    for (i = 0; i < 2; i++)
        EraseFlashSector(sUnusedFlashSectors[i]);

    if (status == SAVE_STATUS_ERROR)
    {
        return 3;
    }
    else if (status == 3)
    {
        return 2;
    }
    else
    {
        Save_LoadGameData(SAVE_NORMAL);
        return 1;
    }
}

u8 unref_sub_8125FF0(u8 *data, u16 size)
{
    u16 i;
    struct UnkSaveSection *section = (struct UnkSaveSection *)eSaveSection;

    for (i = 0; i < sizeof(struct SaveSector); i++)
        ((char *)section)[i] = 0;

    section->signature = FILE_SIGNATURE;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    gLastSaveSectorStatus = ProgramFlashSectorAndVerifyNBytes(sUnusedFlashSectors[0], section, sizeof(struct SaveSector));

    if (gLastSaveSectorStatus)
        return SAVE_STATUS_ERROR;
    else
        return SAVE_STATUS_OK;
}

u8 unref_sub_8126068(u8 sector, u8 *data, u32 size)
{
    if (ProgramFlashSectorAndVerify(sector, data))
        return SAVE_STATUS_ERROR;
    else
        return SAVE_STATUS_OK;
}

u8 unref_sub_8126080(u8 sector, u8 *data)
{
    ReadFlash(sector, 0, data, sizeof(struct SaveSector));
    return 1;
}

asm(".section .rodata\n"
    "\t.align 2");
