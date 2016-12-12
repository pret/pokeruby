#include "global.h"
#include "save.h"
#include "asm.h"
#include "gba/gba.h"
#include "rom4.h"
#include "gba/flash_internal.h"

extern struct SaveSection unk_2000000;

extern u32 gUnknown_02039284;

extern u32 gUnknown_3004820;

extern u16 gUnknown_03005E9C;
extern u32 gUnknown_03005EA0;
extern u16 gUnknown_03005EA4;
extern u32 gUnknown_03005EA8;
extern u32 gUnknown_03005EAC;
extern struct SaveSection *gUnknown_03005EB0;
extern u16 gUnknown_03005EB4;
extern u16 gSaveFileStatus;
extern u32 gUnknown_03005EBC;

extern struct SaveSectionLocation gSaveSectionLocations[];
extern struct SaveSectionLocation gHallOfFameSaveSectionLocations[];
extern u8 gUnknown_08401E24[];

void ClearSaveData(void)
{
    u16 i;
    for (i = 0; i < 32; i++)
        EraseFlashSector(i);
}

void sub_81251B8(void)
{
    gUnknown_03005EAC = 0;
    gUnknown_03005E9C = 0;
    gUnknown_03005EA8 = 0;
}

bool32 sub_81251D4(u8 op, u8 bit)
{
    bool32 retVal = FALSE;

    switch (op)
    {
    case 0:
        gUnknown_03005EA8 |= 1 << bit;
        break;
    case 1:
        gUnknown_03005EA8 &= ~(1 << bit);
        break;
    case 2:
        if (gUnknown_03005EA8 & (1 << bit))
            retVal = TRUE;
        break;
    }

    return retVal;
}

u8 save_write_to_flash(u16 a1, struct SaveSectionLocation *a2)
{
    u32 retVal;
    u16 i;

    gUnknown_03005EB0 = &unk_2000000;

    if (a1 != 0xFFFF)
    {
        retVal = sub_81252D8(a1, a2);
    }
    else
    {
        gUnknown_03005EA4 = gUnknown_03005E9C;
        gUnknown_03005EA0 = gUnknown_03005EAC;
        gUnknown_03005E9C++;
        gUnknown_03005E9C = gUnknown_03005E9C % 14;
        gUnknown_03005EAC++;
        retVal = 1;
        for (i = 0; i < 14; i++)
            sub_81252D8(i, a2);
        if (gUnknown_03005EA8)
        {
            retVal = 0xFF;
            gUnknown_03005E9C = gUnknown_03005EA4;
            gUnknown_03005EAC = gUnknown_03005EA0;
        }
    }

    return retVal;
}

u8 sub_81252D8(u16 a1, struct SaveSectionLocation *a2)
{
    u16 i;
    u16 sector;
    u8 *data;
    u16 size;

    sector = a1 + gUnknown_03005E9C;
    sector %= 14;
    sector += 14 * (gUnknown_03005EAC % 2);

    data = a2[a1].data;
    size = a2[a1].size;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)gUnknown_03005EB0)[i] = 0;

    gUnknown_03005EB0->id = a1;
    gUnknown_03005EB0->unknown = 0x8012025;
    gUnknown_03005EB0->counter = gUnknown_03005EAC;

    for (i = 0; i < size; i++)
        gUnknown_03005EB0->data[i] = data[i];

    gUnknown_03005EB0->checksum = sub_8125C10(data, size);
    return sub_8125440(sector, gUnknown_03005EB0->data);
}

u8 sub_81253C8(u8 sector, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = &unk_2000000;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)section)[i] = 0;

    section->unknown = 0x8012025;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    section->id = sub_8125C10(data, size); // id instead of checksum?
    return sub_8125440(sector, section->data);
}

u8 sub_8125440(u8 sector, u8 *data)
{
    if (ProgramFlashSectorAndVerify(sector, data))
    {
        sub_81251D4(0, sector);
        return 0xFF;
    }
    else
    {
        sub_81251D4(1, sector);
        return 1;
    }
}

u32 sub_812546C(struct SaveSectionLocation *a1)
{
    gUnknown_03005EB0 = &unk_2000000;
    gUnknown_03005EA4 = gUnknown_03005E9C;
    gUnknown_03005EA0 = gUnknown_03005EAC;
    gUnknown_03005E9C++;
    gUnknown_03005E9C = gUnknown_03005E9C % 14;
    gUnknown_03005EAC++;
    gUnknown_03005EB4 = 0;
    gUnknown_03005EA8 = 0;
    return 0;
}

u32 sub_81254C8(struct SaveSectionLocation *a1)
{
    gUnknown_03005EB0 = &unk_2000000;
    gUnknown_03005EA4 = gUnknown_03005E9C;
    gUnknown_03005EA0 = gUnknown_03005EAC;
    gUnknown_03005EB4 = 0;
    gUnknown_03005EA8 = 0;
    return 0;
}

u8 sub_812550C(u16 a1, struct SaveSectionLocation *a2)
{
    u8 retVal;

    if (gUnknown_03005EB4 < a1 - 1)
    {
        retVal = 1;
        sub_81252D8(gUnknown_03005EB4, a2);
        gUnknown_03005EB4++;
        if (gUnknown_03005EA8)
        {
            retVal = 0xFF;
            gUnknown_03005E9C = gUnknown_03005EA4;
            gUnknown_03005EAC = gUnknown_03005EA0;
        }
    }
    else
    {
        retVal = 0xFF;
    }

    return retVal;
}

u8 sub_812556C(u16 a1, struct SaveSectionLocation *a2)
{
    u8 retVal = 1;
    sub_81255B8(a1 - 1, a2);
    if (gUnknown_03005EA8)
    {
        retVal = 0xFF;
        gUnknown_03005E9C = gUnknown_03005EA4;
        gUnknown_03005EAC = gUnknown_03005EA0;
    }
    return retVal;
}

u8 sub_81255B8(u16 a1, struct SaveSectionLocation *a2)
{
    u16 i;
    u16 sector;
    u8 *data;
    u16 size;
    u8 status;

    sector = a1 + gUnknown_03005E9C;
    sector %= 14;
    sector += 14 * (gUnknown_03005EAC % 2);

    data = a2[a1].data;
    size = a2[a1].size;

    for (i = 0; i < sizeof(struct SaveSection); i++)
        ((char *)gUnknown_03005EB0)[i] = 0;

    gUnknown_03005EB0->id = a1;
    gUnknown_03005EB0->unknown = 0x8012025;
    gUnknown_03005EB0->counter = gUnknown_03005EAC;

    for (i = 0; i < size; i++)
        gUnknown_03005EB0->data[i] = data[i];

    gUnknown_03005EB0->checksum = sub_8125C10(data, size);

    EraseFlashSector(sector);

    status = 1;

    for (i = 0; i < 0xFF8; i++)
    {
        if (ProgramFlashByte(sector, i, ((u8 *)gUnknown_03005EB0)[i]))
        {
            status = 0xFF;
            break;
        }
    }

    if (status == 0xFF)
    {
        sub_81251D4(0, sector);
        return 0xFF;
    }
    else
    {
        status = 1;

        for (i = 0; i < 7; i++)
        {
            if (ProgramFlashByte(sector, 0xFF9 + i, ((u8 *)gUnknown_03005EB0)[0xFF9 + i]))
            {
                status = 0xFF;
                break;
            }
        }

        if (status == 0xFF)
        {
            sub_81251D4(0, sector);
            return 0xFF;
        }
        else
        {
            sub_81251D4(1, sector);
            return 1;
        }
    }
}

u8 sub_8125758(u16 a1, struct SaveSectionLocation *a2)
{
    u16 sector;

    sector = a1 + gUnknown_03005E9C - 1;
    sector %= 14;
    sector += 14 * (gUnknown_03005EAC % 2);

    if (ProgramFlashByte(sector, 0xFF8, ((u8 *)gUnknown_03005EB0)[0xFF8]))
    {
        sub_81251D4(0, sector);
        gUnknown_03005E9C = gUnknown_03005EA4;
        gUnknown_03005EAC = gUnknown_03005EA0;
        return 0xFF;
    }
    else
    {
        sub_81251D4(1u, sector);
        return 1;
    }
}

u8 sub_81257F0(u16 a1, struct SaveSectionLocation *a2)
{
    u16 sector;

    sector = a1 + gUnknown_03005E9C - 1;
    sector %= 14;
    sector += 14 * (gUnknown_03005EAC % 2);

    if (ProgramFlashByte(sector, 0xFF8, 0x25))
    {
        sub_81251D4(0, sector);
        gUnknown_03005E9C = gUnknown_03005EA4;
        gUnknown_03005EAC = gUnknown_03005EA0;
        return 0xFF;
    }
    else
    {
        sub_81251D4(1u, sector);
        return 1;
    }
}

u8 sub_812587C(u16 a1, struct SaveSectionLocation *a2)
{
    u8 retVal;
    gUnknown_03005EB0 = &unk_2000000;
    if (a1 != 0xFFFF)
    {
        retVal = 0xFF;
    }
    else
    {
        retVal = sub_8125974(a2);
        sub_81258BC(0xFFFF, a2);
    }

    return retVal;
}

u8 sub_81258BC(u16 a1, struct SaveSectionLocation *a2)
{
    u16 i;
    u16 checksum;
    u16 v3 = 14 * (gUnknown_03005EAC % 2);
    u16 id;

    for (i = 0; i < 14; i++)
    {
        sub_8125BF8(i + v3, gUnknown_03005EB0);
        id = gUnknown_03005EB0->id;
        if (id == 0)
            gUnknown_03005E9C = i;
        checksum = sub_8125C10(gUnknown_03005EB0->data, a2[id].size);
        if (gUnknown_03005EB0->unknown == 0x8012025
         && gUnknown_03005EB0->checksum == checksum)
        {
            u16 j;
            for (j = 0; j < a2[id].size; j++)
                ((u8 *)a2[id].data)[j] = gUnknown_03005EB0->data[j];
        }
    }

    return 1;
}

u8 sub_8125974(struct SaveSectionLocation *a1)
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
        sub_8125BF8(i, gUnknown_03005EB0);
        if (gUnknown_03005EB0->unknown == 0x8012025)
        {
            v5 = TRUE;
            checksum = sub_8125C10(gUnknown_03005EB0->data, a1[gUnknown_03005EB0->id].size);
            if (gUnknown_03005EB0->checksum == checksum)
            {
                v2 = gUnknown_03005EB0->counter;
                v4 |= 1 << gUnknown_03005EB0->id;
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
        sub_8125BF8(i + 14, gUnknown_03005EB0);
        if (gUnknown_03005EB0->unknown == 0x8012025)
        {
            v5 = TRUE;
            checksum = sub_8125C10(gUnknown_03005EB0->data, a1[gUnknown_03005EB0->id].size);
            if (gUnknown_03005EB0->checksum == checksum)
            {
                v3 = gUnknown_03005EB0->counter;
                v4 |= 1 << gUnknown_03005EB0->id;
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
                gUnknown_03005EAC = v3;
            }
            else
            {
                gUnknown_03005EAC = v2;
            }
        }
        else
        {
            if (v2 < v3)
            {
                gUnknown_03005EAC = v3;
            }
            else
            {
                gUnknown_03005EAC = v2;
            }
        }
        return 1;
    }

    if (v14 == 1)
    {
        gUnknown_03005EAC = v2;
        if (v10 == 255)
            return 255;
        return 1;
    }

    if (v10 == 1)
    {
        gUnknown_03005EAC = v3;
        if (v14 == 255)
            return 255;
        return 1;
    }

    if (v14 == 0 && v10 == 0)
    {
        gUnknown_03005EAC = 0;
        gUnknown_03005E9C = 0;
        return 0;
    }

    gUnknown_03005EAC = 0;
    gUnknown_03005E9C = 0;
    return 2;
}

u8 sub_8125B88(u8 a1, u8 *data, u16 size)
{
    u16 i;
    struct SaveSection *section = &unk_2000000;
    sub_8125BF8(a1, section);
    if (section->unknown == 0x8012025)
    {
        u16 checksum = sub_8125C10(section->data, size);
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
    ReadFlash(sector, 0, section->data, 0x1000);
    return 1;
}

u16 sub_8125C10(void *data, u16 size)
{
    u16 i;
    u32 checksum = 0;

    for (i = 0; i < (size / 4); i++)
        checksum += *((u32 *)data)++;

    return ((checksum >> 16) + checksum);
}

u8 sub_8125C3C(u8 a1)
{
    u8 i;
    switch (a1)
    {
    case 5:
        for (i = 28; i < 32; i++)
            EraseFlashSector(i);
    case 3:
        if (sub_8053108(10) < 999)
            sav12_xor_increment(10);
        for (i = 0; i < 2; i++)
            sub_81253C8(28 + i, gHallOfFameSaveSectionLocations[i].data, gHallOfFameSaveSectionLocations[i].size);
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    case 0:
    default:
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    case 1:
        SaveSerializedGame();
        for (i = 0; i < 5; i++)
            save_write_to_flash(i, gSaveSectionLocations);
        break;
    case 2:
        SaveSerializedGame();
        save_write_to_flash(0, gSaveSectionLocations);
        break;
    case 4:
        for (i = 28; i < 32; i++)
            EraseFlashSector(i);
        SaveSerializedGame();
        save_write_to_flash(0xFFFF, gSaveSectionLocations);
        break;
    }
    return 0;
}

u8 sub_8125D44(u8 a1)
{
    if (gUnknown_3004820 != 1)
        return 0xFF;
    sub_8125C3C(a1);
    if (!gUnknown_03005EA8)
        return 1;
    fullscreen_save_activate(a1);
    return 0xFF;
}

u8 sub_8125D80(void)
{
    if (gUnknown_3004820 != 1)
        return 1;
    SaveSerializedGame();
    sub_812546C(gSaveSectionLocations);
    return 0;
}

bool8 sub_8125DA8(void)
{
    u8 v0 = sub_812550C(14, gSaveSectionLocations);
    if (gUnknown_03005EA8)
        fullscreen_save_activate(0);
    if (v0 == 0xFF)
        return 1;
    else
        return 0;
}

u8 sub_8125DDC(void)
{
    sub_812556C(14, gSaveSectionLocations);
    if (gUnknown_03005EA8)
        fullscreen_save_activate(0);
    return 0;
}

u8 sub_8125E04(void)
{
    sub_8125758(14, gSaveSectionLocations);
    if (gUnknown_03005EA8)
        fullscreen_save_activate(0);
    return 0;
}

u8 sub_8125E2C(void)
{
    if (gUnknown_3004820 != 1)
        return 1;

    SaveSerializedGame();
    sub_81254C8(gSaveSectionLocations);
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
    if (gUnknown_03005EA8)
        fullscreen_save_activate(1);
    return retVal;
}

u8 sub_8125EC8(u8 a1)
{
    u8 result;

    if (gUnknown_3004820 != 1)
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
        gUnknown_03005EBC = 0;
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

    for (i = 0; i < 0x1000; i++)
        raw[i] = 0;

    ReadFlash(gUnknown_08401E24[0], 0, a1->data, 4096);

    if (a1->unknown != 0x8012025)
        return FALSE;

    return TRUE;
}

u8 unref_sub_8125FA0(void)
{
    u16 i;
    u8 v0 = sub_8125D44(0);

    for (i = 0; i < 2; i++)
        EraseFlashSector(gUnknown_08401E24[i]);

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

    for (i = 0; i < 0x1000; i++)
        ((char *)section)[i] = 0;

    section->unknown = 0x8012025;

    for (i = 0; i < size; i++)
        section->data[i] = data[i];

    gUnknown_02039284 = ProgramFlashSectorAndVerifyNBytes(gUnknown_08401E24[0], (u8 *)section, 0x1000);

    if (gUnknown_02039284)
        return 255;
    else
        return 1;
}

u8 unref_sub_8126068(u8 sector, u8 *data, u32 size)
{
    if (ProgramFlashSectorAndVerify(sector, data, size))
        return 255;
    else
        return 1;
}

u8 unref_sub_8126080(u8 sector, u8 *data)
{
    ReadFlash(sector, 0, data, 0x1000);
    return 1;
}
