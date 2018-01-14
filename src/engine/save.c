#include "global.h"
#include "gba/gba.h"
#include "gba/flash_internal.h"
#include "save.h"
#include "load_save.h"
#include "overworld.h"
#include "save_failed_screen.h"
#include "ewram.h"

#define FILE_SIGNATURE 0x08012025  // signature value to determine if a sector is in use

#define TOTALNUMSECTORS ((ARRAY_COUNT(sSaveBlockChunks) * 2) + (ARRAY_COUNT(sHallOfFameChunks) * 2)) // there are 2 slots, so double each array count and get the sum.

struct SaveBlockChunk
{
    u8 *data;
    u16 size;
};

struct SaveSection
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

static u8 WriteChunk(u16, const struct SaveBlockChunk *);
static u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size);
static u8 TryWriteSector(u8, u8 *);
static u32 RestoreSaveBackupVarsAndIncrement(const struct SaveBlockChunk *location);
static u32 RestoreSaveBackupVars(const struct SaveBlockChunk *location);
static u8 sub_812550C(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_812556C(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_81255B8(u16, const struct SaveBlockChunk *location);
static u8 sub_8125758(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_81257F0(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_812587C(u16 a1, const struct SaveBlockChunk *location);
static u8 sub_81258BC(u16, const struct SaveBlockChunk *location);
static u8 GetSaveValidStatus(const struct SaveBlockChunk *location);
static u8 sub_8125B88(u8 a1, u8 *data, u16 size);
static u8 DoReadFlashWholeSection(u8, struct SaveSection *);
static u16 CalculateChecksum(void *, u16);
bool8 unref_sub_8125F4C(struct UnkSaveSection *a1);
u8 unref_sub_8125FA0(void);
u8 unref_sub_8125FF0(u8 *data, u16 size);
u8 unref_sub_8126068(u8 sector, u8 *data, u32 size);
u8 unref_sub_8126080(u8 sector, u8 *data);

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

static EWRAM_DATA u32 gLastSaveSectorStatus = 0; // used but in an unferenced function, so unused

// Each 4 KiB flash sector contains 3968 bytes of actual data followed by a 128 byte footer
#define SECTOR_DATA_SIZE 3968
#define SECTOR_FOOTER_SIZE 128

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

const u8 gFlashSectors[] = { 0x1E, 0x1F };

void Save_EraseAllData(void)
{
    u16 i;

    for (i = 0; i < NUM_SECTORS; i++)
        EraseFlashSector(i);
}

void Save_ResetSaveCounters(void)
{
    gSaveCounter = 0;
    gLastWrittenSector = 0;
    gDamagedSaveSectors = 0;
}

enum
{
    ENABLE,
    DISABLE,
    CHECK // unused
};

static bool32 SetSectorDamagedStatus(u8 op, u8 sectorNum)
{
    bool32 retVal = FALSE;

    switch (op)
    {
    case ENABLE:
        gDamagedSaveSectors |= (1 << sectorNum);
        break;
    case DISABLE:
        gDamagedSaveSectors &= ~(1 << sectorNum);
        break;
    case CHECK: // unused
        if (gDamagedSaveSectors & (1 << sectorNum))
            retVal = TRUE;
        break;
    }

    return retVal;
}

static u8 WriteSaveBlockChunks(u16 a1, const struct SaveBlockChunk *chunks)
{
    u32 retVal;
    u16 i;

    gFastSaveSection = eSaveSection;

    if (a1 != 0xFFFF) // for link
    {
        retVal = WriteChunk(a1, chunks);
    }
    else
    {
        gLastKnownGoodSector = gLastWrittenSector; // backup the current written sector before attempting to write.
        gLastSaveCounter = gSaveCounter;
        gLastWrittenSector++;
        gLastWrittenSector %= ARRAY_COUNT(sSaveBlockChunks);
        gSaveCounter++;
        retVal = SAVE_STATUS_OK;

        for (i = 0; i < ARRAY_COUNT(sSaveBlockChunks); i++)
            WriteChunk(i, chunks);

        // Check for any bad sectors
        if (gDamagedSaveSectors != 0) // skip the damaged sector.
        {
            retVal = SAVE_STATUS_ERROR;
            gLastWrittenSector = gLastKnownGoodSector;
            gSaveCounter = gLastSaveCounter;
        }
    }

    return retVal;
}

static u8 WriteChunk(u16 chunkId, const struct SaveBlockChunk *chunks)
{
    u16 i;
    u16 sectorNum;
    u8 *data;
    u16 size;

    sectorNum = chunkId + gLastWrittenSector;
    sectorNum %= ARRAY_COUNT(sSaveBlockChunks);
    sectorNum += ARRAY_COUNT(sSaveBlockChunks) * (gSaveCounter % 2);

    data = chunks[chunkId].data;
    size = chunks[chunkId].size;

    // clear save section.
    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((u8 *)gFastSaveSection)[i] = 0;

    gFastSaveSection->id = chunkId;
    gFastSaveSection->signature = FILE_SIGNATURE;
    gFastSaveSection->counter = gSaveCounter;
    for (i = 0; i < size; i++)
        gFastSaveSection->data[i] = data[i];
    gFastSaveSection->checksum = CalculateChecksum(data, size);

    return TryWriteSector(sectorNum, gFastSaveSection->data);
}

static u8 HandleWriteSectorNBytes(u8 sectorNum, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = eSaveSection;

    for (i = 0; i < sizeof(struct SaveSection); i++)
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
        SetSectorDamagedStatus(ENABLE, sectorNum); // set damaged sector bits.
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(DISABLE, sectorNum); // unset damaged sector bits. it's safe now.
        return SAVE_STATUS_OK;
    }
}

static u32 RestoreSaveBackupVarsAndIncrement(const struct SaveBlockChunk *chunk) // chunk is unused
{
    gFastSaveSection = eSaveSection;
    gLastKnownGoodSector = gLastWrittenSector;
    gLastSaveCounter = gSaveCounter;
    gLastWrittenSector++;
    gLastWrittenSector = gLastWrittenSector % ARRAY_COUNT(sSaveBlockChunks);
    gSaveCounter++;
    gUnknown_03005EB4 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

static u32 RestoreSaveBackupVars(const struct SaveBlockChunk *chunk) // only ever called once, and gSaveBlock2 is passed to this function. chunk is unused
{
    gFastSaveSection = eSaveSection;
    gLastKnownGoodSector = gLastWrittenSector;
    gLastSaveCounter = gSaveCounter;
    gUnknown_03005EB4 = 0;
    gDamagedSaveSectors = 0;
    return 0;
}

static u8 sub_812550C(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal;

    if (gUnknown_03005EB4 < a1 - 1)
    {
        retVal = 1;
        WriteChunk(gUnknown_03005EB4, chunk);
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

static u8 sub_812556C(u16 a1, const struct SaveBlockChunk *chunk)
{
    u8 retVal = 1;

    sub_81255B8(a1 - 1, chunk);

    if (gDamagedSaveSectors)
    {
        retVal = 0xFF;
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
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

    sector = chunkId + gLastWrittenSector;
    sector %= ARRAY_COUNT(sSaveBlockChunks);
    sector += ARRAY_COUNT(sSaveBlockChunks) * (gSaveCounter % 2);

    data = chunks[chunkId].data;
    size = chunks[chunkId].size;

    // clear temp save section.
    for (i = 0; i < sizeof(struct SaveSection); i++)
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

    status = 1;

    for (i = 0; i < sizeof(struct UnkSaveSection); i++)
    {
        if (ProgramFlashByte(sector, i, gFastSaveSection->data[i]))
        {
            status = 0xFF;
            break;
        }
    }

    if (status == 0xFF)
    {
        SetSectorDamagedStatus(ENABLE, sector);
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
            SetSectorDamagedStatus(ENABLE, sector);
            return 0xFF;
        }
        else
        {
            SetSectorDamagedStatus(DISABLE, sector);
            return 1;
        }
    }
}

static u8 sub_8125758(u16 a1, const struct SaveBlockChunk *chunk)
{
    u16 sector;

    sector = a1 + gLastWrittenSector - 1;
    sector %= ARRAY_COUNT(sSaveBlockChunks);
    sector += ARRAY_COUNT(sSaveBlockChunks) * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), ((u8 *)gFastSaveSection)[sizeof(struct UnkSaveSection)]))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetSectorDamagedStatus(ENABLE, sector);
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(DISABLE, sector);
        return SAVE_STATUS_OK;
    }
}

static u8 sub_81257F0(u16 a1, const struct SaveBlockChunk *chunk)
{
    u16 sector;

    sector = a1 + gLastWrittenSector - 1;
    sector %= ARRAY_COUNT(sSaveBlockChunks);
    sector += ARRAY_COUNT(sSaveBlockChunks) * (gSaveCounter % 2);

    if (ProgramFlashByte(sector, sizeof(struct UnkSaveSection), 0x25))
    {
        // sector is damaged, so enable the bit in gDamagedSaveSectors and restore the last written sector and save counter.
        SetSectorDamagedStatus(ENABLE, sector);
        gLastWrittenSector = gLastKnownGoodSector;
        gSaveCounter = gLastSaveCounter;
        return SAVE_STATUS_ERROR;
    }
    else
    {
        SetSectorDamagedStatus(DISABLE, sector);
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
    u16 v3 = ARRAY_COUNT(sSaveBlockChunks) * (gSaveCounter % 2);
    u16 id;

    for (i = 0; i < ARRAY_COUNT(sSaveBlockChunks); i++)
    {
        DoReadFlashWholeSection(i + v3, gFastSaveSection);
        id = gFastSaveSection->id;
        if (id == 0)
            gLastWrittenSector = i;
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
    u16 i;
    bool8 signatureValid;
    u16 checksum;
    u32 saveSlot1Counter = 0;
    u32 saveSlot2Counter = 0;
    u8 slot1Status;
    u8 slot2Status;
    u32 validChunks;
    const u32 ALL_CHUNKS = (1 << ARRAY_COUNT(sSaveBlockChunks)) - 1;  // bitmask of all saveblock chunks

    // check save slot 1.
    validChunks = 0;
    signatureValid = FALSE;
    for (i = 0; i < ARRAY_COUNT(sSaveBlockChunks); i++)
    {
        DoReadFlashWholeSection(i, gFastSaveSection);
        if (gFastSaveSection->signature == FILE_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, chunks[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                saveSlot1Counter = gFastSaveSection->counter;
                validChunks |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (signatureValid)
    {
        if (validChunks == ALL_CHUNKS)
            slot1Status = SAVE_STATUS_OK;
        else
            slot1Status = SAVE_STATUS_ERROR;
    }
    else
    {
        slot1Status = SAVE_STATUS_EMPTY;
    }

    // check save slot 2.
    validChunks = 0;
    signatureValid = FALSE;
    for (i = 0; i < ARRAY_COUNT(sSaveBlockChunks); i++)
    {
        DoReadFlashWholeSection(i + ARRAY_COUNT(sSaveBlockChunks), gFastSaveSection);
        if (gFastSaveSection->signature == FILE_SIGNATURE)
        {
            signatureValid = TRUE;
            checksum = CalculateChecksum(gFastSaveSection->data, chunks[gFastSaveSection->id].size);
            if (gFastSaveSection->checksum == checksum)
            {
                saveSlot2Counter = gFastSaveSection->counter;
                validChunks |= 1 << gFastSaveSection->id;
            }
        }
    }

    if (signatureValid)
    {
        if (validChunks == ALL_CHUNKS)
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
        if ((saveSlot1Counter == -1 && saveSlot2Counter == 0) || (saveSlot1Counter == 0 && saveSlot2Counter == -1))
        {
            if ((unsigned)(saveSlot1Counter + 1) < (unsigned)(saveSlot2Counter + 1))
                gSaveCounter = saveSlot2Counter;
            else
                gSaveCounter = saveSlot1Counter;
        }
        else
        {
            if (saveSlot1Counter < saveSlot2Counter)
                gSaveCounter = saveSlot2Counter;
            else
                gSaveCounter = saveSlot1Counter;
        }
        return SAVE_STATUS_OK;
    }

    if (slot1Status == SAVE_STATUS_OK)
    {
        gSaveCounter = saveSlot1Counter;
        if (slot2Status == SAVE_STATUS_ERROR)
            return SAVE_STATUS_ERROR;
        else
            return SAVE_STATUS_OK;
    }

    if (slot2Status == SAVE_STATUS_OK)
    {
        gSaveCounter = saveSlot2Counter;
        if (slot1Status == SAVE_STATUS_ERROR)
            return SAVE_STATUS_ERROR;
        else
            return SAVE_STATUS_OK;
    }

    if (slot1Status == SAVE_STATUS_EMPTY && slot2Status == SAVE_STATUS_EMPTY)
    {
        gSaveCounter = 0;
        gLastWrittenSector = 0;
        return SAVE_STATUS_EMPTY;
    }

    gSaveCounter = 0;
    gLastWrittenSector = 0;
    return 2;
}

static u8 sub_8125B88(u8 a1, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = eSaveSection;

    DoReadFlashWholeSection(a1, section);
    if (section->signature == FILE_SIGNATURE)
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

static u8 DoReadFlashWholeSection(u8 sector, struct SaveSection *section)
{
    ReadFlash(sector, 0, section->data, sizeof(struct SaveSection));
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

u8 Save_WriteDataInternal(u8 saveType)
{
    u8 i;

    switch (saveType)
    {
    case SAVE_HALL_OF_FAME_ERASE_BEFORE: // wipes all normal save data, then saves hall of fame, unused
        for (i = (ARRAY_COUNT(sSaveBlockChunks) * 2 + 0); i < TOTALNUMSECTORS; i++)
            EraseFlashSector(i);
        // fall through
    case SAVE_HALL_OF_FAME: // hall of fame.
        if (GetGameStat(10) < 999)
            IncrementGameStat(10);
        for (i = 0; i < ARRAY_COUNT(sHallOfFameChunks); i++)
            HandleWriteSectorNBytes((ARRAY_COUNT(sSaveBlockChunks) * 2 + 0) + i, sHallOfFameChunks[i].data, sHallOfFameChunks[i].size);
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
    case SAVE_OVERWRITE_DIFFERENT_FILE: // there is a different file, so erase the file and overwrite it completely.
        for (i = (ARRAY_COUNT(sSaveBlockChunks) * 2 + 0); i < TOTALNUMSECTORS; i++)
            EraseFlashSector(i); // erase HOF.
        SaveSerializedGame();
        WriteSaveBlockChunks(0xFFFF, sSaveBlockChunks);
        break;
    }
    return 0;
}

u8 Save_WriteData(u8 saveType) // TrySave
{
    if (gFlashMemoryPresent != TRUE)
        return SAVE_STATUS_ERROR;

    Save_WriteDataInternal(saveType);
    if (!gDamagedSaveSectors)
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
    sub_8125758(ARRAY_COUNT(sSaveBlockChunks), sSaveBlockChunks);
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

bool8 sub_8125E6C(void)
{
    u8 retVal = FALSE;
    u16 val = ++gUnknown_03005EB4;
    if (val <= 4)
    {
        sub_812556C(gUnknown_03005EB4 + 1, sSaveBlockChunks);
        sub_81257F0(val, sSaveBlockChunks);
    }
    else
    {
        sub_81257F0(val, sSaveBlockChunks);
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
        gSaveFileStatus = SAVE_STATUS_NO_FLASH;
        return SAVE_STATUS_ERROR;
    }

    switch (a1)
    {
    case 0:
    default:
        result = sub_812587C(0xFFFF, sSaveBlockChunks);
        LoadSerializedGame();
        gSaveFileStatus = result;
        gGameContinueCallback = 0;
        break;
    case 3:
        result = sub_8125B88((ARRAY_COUNT(sSaveBlockChunks) * 2 + 0), sHallOfFameChunks[0].data, sHallOfFameChunks[0].size);
        if (result == 1)
            result = sub_8125B88((ARRAY_COUNT(sSaveBlockChunks) * 2 + 1), sHallOfFameChunks[1].data, sHallOfFameChunks[1].size);
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

    if (a1->signature != FILE_SIGNATURE)
        return FALSE;

    return TRUE;
}

u8 unref_sub_8125FA0(void)
{
    u16 i;
    u8 v0 = Save_WriteData(0);

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
    struct UnkSaveSection *section = (struct UnkSaveSection *)eSaveSection;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)section)[i] = 0;

    section->signature = FILE_SIGNATURE;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    gLastSaveSectorStatus = ProgramFlashSectorAndVerifyNBytes(gFlashSectors[0], section, sizeof(struct SaveSection));

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
    ReadFlash(sector, 0, data, sizeof(struct SaveSection));
    return 1;
}
