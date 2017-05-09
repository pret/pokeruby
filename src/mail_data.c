#include "global.h"
#include "name_string_util.h"
#include "pokemon.h"
#include "species.h"
#include "text.h"

void sub_80A2B40(struct MailStruct *);
u16 sub_80A2D44(u16, u32);
bool8 itemid_is_mail(u16);
u16 sub_809D474(u32);

void sub_80A2B18(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        sub_80A2B40(&gSaveBlock1.mail[i]);
}

void sub_80A2B40(struct MailStruct *mail)
{
    int i;

    for (i = 0; i < 9; i++)
        mail->words[i] = -1;

    for (i = 0; i < 8; i++)
        mail->playerName[i] = -1;

    for (i = 0; i < 4; i++)
        mail->trainerId[i] = 0;

    mail->species = 1;
    mail->itemId = 0;
}

bool8 sub_80A2B94(struct Pokemon *mon)
{
    u16 heldItem = GetMonData(mon, MON_DATA_HELD_ITEM);
    if (itemid_is_mail(heldItem) && GetMonData(mon, MON_DATA_MAIL) != 0xFF)
        return TRUE;
    else
        return FALSE;
}

u8 sub_80A2BC4(struct Pokemon *mon, u16 itemId)
{
    u16 _itemId;
    u8 heldItem[2];
    u8 id;
    u8 i;
    u16 species;
    u32 personality;

    _itemId = itemId;
    heldItem[0] = _itemId;
    heldItem[1] = _itemId >> 8;
    id = 0;

    while (id < 6)
    {
        if (gSaveBlock1.mail[id].itemId == 0)
        {
            for (i = 0; i < 9; i++)
                gSaveBlock1.mail[id].words[i] = -1;

            for (i = 0; i < 7; i++)
                gSaveBlock1.mail[id].playerName[i] = gSaveBlock2.playerName[i];
            gSaveBlock1.mail[id].playerName[i] = EOS;
            PadNameString(gSaveBlock1.mail[id].playerName, 0);

            for (i = 0; i < 4; i++)
                gSaveBlock1.mail[id].trainerId[i] = gSaveBlock2.playerTrainerId[i];

            species = GetBoxMonData(mon, MON_DATA_SPECIES);
            personality = GetBoxMonData(mon, MON_DATA_PERSONALITY);
            gSaveBlock1.mail[id].species = sub_80A2D44(species, personality);
            gSaveBlock1.mail[id].itemId = _itemId;
            SetMonData(mon, MON_DATA_MAIL, &id);
            SetMonData(mon, MON_DATA_HELD_ITEM, heldItem);
            return id;
        }
        id++;
    }

    return -1;
}

u16 sub_80A2D44(u16 species, u32 personality)
{
    if (species != SPECIES_UNOWN)
        return species;
    return ((sub_809D474(personality) << 16) + (30000 << 16)) >> 16;
}
