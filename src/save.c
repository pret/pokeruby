#include "global.h"
#include "gba/flash_internal.h"

struct SaveSectionLocation
{
    void *data;
    u16 size;
};

struct SaveSection
{
    u8 data[0xFF4];
    u16 id;
    u16 checksum;
    u32 unknown;
    u32 counter;
};

extern struct SaveSection unk_2000000;

extern u16 gUnknown_03005E9C;
extern u32 gUnknown_03005EA0;
extern u16 gUnknown_03005EA4;
extern u32 gUnknown_03005EA8;
extern u32 gUnknown_03005EAC;
extern struct SaveSection *gUnknown_03005EB0;
extern u16 gUnknown_03005EB4;

u8 sub_81252D8(u16, struct SaveSectionLocation *);
u8 sub_8125440(u8, u8 *);
u8 sub_81255B8(u16, struct SaveSectionLocation *);
u8 sub_81258BC(u16, struct SaveSectionLocation *);
u8 sub_8125BF8(u8, struct SaveSection *);
u8 sub_8125974(struct SaveSectionLocation *);

void calls_flash_erase_block(void)
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

u32 sub_812546C(void)
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

u32 sub_81254C8(void)
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

u8 sub_8125758(u16 a1)
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

u8 sub_81257F0(u16 a1)
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
