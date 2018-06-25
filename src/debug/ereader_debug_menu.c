#include "global.h"
#include "debug.h"
#include "constants/species.h"
#include "constants/items.h"
#include "string_util.h"
#include "new_game.h"
#include "load_save.h"
#include "start_menu.h"
#include "mystery_event_script.h"
#include "berry.h"
#include "mail_data.h"

const u8 Str_842E238[] = _("タマゴ");

#if DEBUG

extern u8 gUnknown_Debug_845DAE1[];
extern u8 gUnknown_Debug_845DAE1End[];

size_t debug_sub_813C404(u8 * dest)
{
    size_t size = gUnknown_Debug_845DAE1End - gUnknown_Debug_845DAE1;
    memcpy(dest, gUnknown_Debug_845DAE1, size);
    debug_sub_812620C(dest, gUnknown_Debug_845DAE1);
    return size;
}

extern u8 gUnknown_Debug_845E3E0[];
extern u8 gUnknown_Debug_845E3E0End[];

size_t debug_sub_813C430(u8 * dest)
{
    size_t size = gUnknown_Debug_845E3E0End - gUnknown_Debug_845E3E0;
    memcpy(dest, gUnknown_Debug_845E3E0, size);
    debug_sub_812620C(dest, gUnknown_Debug_845E3E0);
    return size;
}

extern u8 gUnknown_Debug_845E422[];
extern u8 gUnknown_Debug_845E422End[];

size_t debug_sub_813C45C(u8 * dest)
{
    size_t size = gUnknown_Debug_845E422End - gUnknown_Debug_845E422;
    memcpy(dest, gUnknown_Debug_845E422, size);
    debug_sub_812620C(dest, gUnknown_Debug_845E422);
    return size;
}

extern u8 gUnknown_Debug_845E402[];
extern u8 gUnknown_Debug_845E402End[];

size_t debug_sub_813C488(u8 * dest)
{
    size_t size = gUnknown_Debug_845E402End - gUnknown_Debug_845E402;
    memcpy(dest, gUnknown_Debug_845E402, size);
    debug_sub_812620C(dest, gUnknown_Debug_845E402);
    return size;
}

extern u8 gUnknown_Debug_845E606[];
extern u8 gUnknown_Debug_845E606End[];

size_t debug_sub_813C4B4(u8 * dest)
{
    size_t size = gUnknown_Debug_845E606End - gUnknown_Debug_845E606;
    memcpy(dest, gUnknown_Debug_845E606, size);
    return size;
}

extern u8 gUnknown_Debug_845E619[];
extern u8 gUnknown_Debug_845E619End[];

size_t debug_sub_813C4D4(u8 * dest)
{
    size_t size = gUnknown_Debug_845E619End - gUnknown_Debug_845E619;
    memcpy(dest, gUnknown_Debug_845E619, size);
    debug_sub_81261B4(dest, gUnknown_Debug_845E619);
    return size;
}

extern u8 gUnknown_Debug_845E712[];
extern u8 gUnknown_Debug_845E712End[];

size_t debug_sub_813C500(u8 * dest)
{
    size_t size = gUnknown_Debug_845E712End - gUnknown_Debug_845E712;
    memcpy(dest, gUnknown_Debug_845E712, size);
    debug_sub_812620C(dest, gUnknown_Debug_845E712);
    return size;
}

extern u8 gUnknown_Debug_845E797[];
extern u8 gUnknown_Debug_845E797End[];
extern u8 gUnknown_Debug_845E7B5[];

size_t debug_sub_813C52C(u8 * dest, u16 itemId)
{
    u8 * ptr;
    size_t size = gUnknown_Debug_845E797End - gUnknown_Debug_845E797;
    memcpy(dest, gUnknown_Debug_845E797, size);
    ptr = gUnknown_Debug_845E7B5 - gUnknown_Debug_845E797 + dest;
    ptr += 3;
    ptr[0] = itemId;
    ptr[1] = itemId >> 8;
    debug_sub_812620C(dest, gUnknown_Debug_845E797);
    return size;
}

size_t debug_sub_813C580(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_POTION);
}

size_t debug_sub_813C58C(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_POKE_BALL);
}

size_t debug_sub_813C598(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_CHERI_BERRY);
}

size_t debug_sub_813C5A4(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_TM01_FOCUS_PUNCH);
}

extern u8 gUnknown_Debug_845DDB2[];
extern u8 gUnknown_Debug_845DDB2End[];
extern u8 gUnknown_Debug_845DDD6[];

const u8 Str_842E23C[] = _("ガイブ");

size_t debug_sub_813C5B4(u8 * dest)
{
    u8 * saveBerry = (u8 *)&gSaveBlock1.enigmaBerry;
    u8 * berry = (u8 *)(dest - gUnknown_Debug_845DDB2 + gUnknown_Debug_845DDD6);
    size_t size = gUnknown_Debug_845DDB2End - gUnknown_Debug_845DDB2;
    int i;

    debug_sub_80C2C18(Str_842E23C, 0, 0);

    for (i = 0; i < 0x1000; i++)
        dest[i] = 0;

    for (i = 0; i < size; i++)
        dest[i] = gUnknown_Debug_845DDB2[i];

    for (i = 0; i < sizeof(struct EnigmaBerry); i++)
        berry[i] = saveBerry[i];

    ClearEnigmaBerries();
    debug_sub_81261B4(dest, gUnknown_Debug_845DDB2);
    return size;
}

const u8 Str_842E240[] = _("ENGLISH");
const u8 Str_842E248[] = _("TOURNAMENT");

void debug_sub_813C638(struct Pokemon * mon, u16 species, u8 level, u16 itemId)
{
    u32 _itemId;
    ZeroMonData(mon);
    CreateMon(mon, species, level, 32, FALSE, 0, TRUE, 9999);
    SetMonData(mon, MON_DATA_OT_NAME, Str_842E240);
    SetMonData(mon, MON_DATA_NICKNAME, Str_842E248);
    _itemId = itemId;
    SetMonData(mon, MON_DATA_HELD_ITEM, &_itemId);
}

void debug_sub_813C6AC(struct Pokemon *mon, struct MailStruct *mail)
{
    u16 itemId;
    ClearMailStruct(mail);
    itemId = GetMonData(mon, MON_DATA_HELD_ITEM);
    if (ItemIsMail(itemId))
    {
        u8 * name = mail->playerName;
        u8 * id = mail->trainerId;
        u8 nameBuf[8];
        int i;

        for (i = 0; i < 9; i++)
            mail->words[i] = i + 1;

        GetMonData(mon, MON_DATA_OT_NAME, nameBuf);
        StringCopyN(name, nameBuf, OT_NAME_LENGTH + 1);

        write_word_to_mem(GetMonData(mon, MON_DATA_OT_ID), id);

        mail->species = SpeciesToMailSpecies(GetMonData(mon, MON_DATA_SPECIES), GetMonData(mon, MON_DATA_PERSONALITY));
        mail->itemId = itemId;

    }
}

extern u8 gUnknown_Debug_845E443[];
extern u8 gUnknown_Debug_845E443End[];
extern u8 gUnknown_Debug_845E467[];
extern u8 gUnknown_Debug_845E4CB[];

size_t debug_sub_813C740(u8 * dest)
{
    struct MailStruct mail;
    u8 * src = gUnknown_Debug_845E443;
    u8 * end = gUnknown_Debug_845E443End;
    struct Pokemon *mon = gEnemyParty;
    size_t size = end - src;
    u8 dataBuffer[11];

    memcpy(dest, src, size);
    debug_sub_813C638(mon, SPECIES_PIKACHU, 5, ITEM_NONE);
    dataBuffer[0] = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, dataBuffer);
    dataBuffer[0] = 3;
    SetMonData(mon, MON_DATA_FRIENDSHIP, dataBuffer);
    dataBuffer[0] = 255;
    SetMonData(mon, MON_DATA_MET_LOCATION, dataBuffer);

    StringCopyN(dataBuffer, Str_842E238, POKEMON_NAME_LENGTH + 1);
    SetMonData(mon, MON_DATA_NICKNAME, dataBuffer);

    dataBuffer[0] = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_LANGUAGE, dataBuffer);

    memcpy(gUnknown_Debug_845E467 - src + dest, mon, sizeof(struct Pokemon));

    memcpy(gUnknown_Debug_845E4CB - src + dest, &mail, sizeof(struct MailStruct));

    return size;
}

size_t debug_sub_813C810(u8 * dest)
{
    struct MailStruct mail;
    u8 * src = gUnknown_Debug_845E443;
    u8 * end = gUnknown_Debug_845E443End;
    struct Pokemon *mon = gEnemyParty;
    size_t size = end - src;

    memcpy(dest, src, size);
    debug_sub_813C638(mon, SPECIES_UNOWN, 21, ITEM_DREAM_MAIL);
    debug_sub_813C6AC(mon, &mail);

    memcpy(gUnknown_Debug_845E467 - src + dest, mon, sizeof(struct Pokemon));

    memcpy(gUnknown_Debug_845E4CB - src + dest, &mail, sizeof(struct MailStruct));

    debug_sub_812620C(dest, src);

    return size;
}

size_t debug_sub_813C888(u8 * dest)
{
    struct MailStruct mail;
    u8 * src = gUnknown_Debug_845E443;
    u8 * end = gUnknown_Debug_845E443End;
    struct Pokemon *mon = gEnemyParty;
    size_t size = end - src;

    memcpy(dest, src, size);
    debug_sub_813C638(mon, SPECIES_UNOWN, 21, ITEM_DREAM_MAIL);
    debug_sub_813C6AC(mon, &mail);
    mon->box.checksum = 0;

    memcpy(gUnknown_Debug_845E467 - src + dest, mon, sizeof(struct Pokemon));

    memcpy(gUnknown_Debug_845E4CB - src + dest, &mail, sizeof(struct MailStruct));

    debug_sub_812620C(dest, src);

    return size;
}

void debug_sub_813C904(void)
{
    debug_sub_813C638(gPlayerParty + 0, SPECIES_CHARMELEON, 50, ITEM_QUICK_CLAW);
    debug_sub_813C638(gPlayerParty + 1, SPECIES_WARTORTLE, 50, ITEM_FOCUS_BAND);
    debug_sub_813C638(gPlayerParty + 2, SPECIES_IVYSAUR, 50, ITEM_LUM_BERRY);
}

extern u8 gUnknown_Debug_845E4EF[];
extern u8 gUnknown_Debug_845E4EFEnd[];
extern u8 gUnknown_Debug_845E506[];

const u8 Str_842E253[] = _("　そら　　カードイー");

size_t debug_sub_813C93C(u8 * dest)
{
    u8 * src = gUnknown_Debug_845E4EF;
    size_t size = gUnknown_Debug_845E4EFEnd - src;
    struct BattleTowerEReaderTrainer ereaderTrainer;

    memcpy(dest, src, size);
    SavePlayerParty();
    debug_sub_813C904();
    debug_sub_8075DB4(&ereaderTrainer, Str_842E253 + 5, 9999);
    LoadPlayerParty();

    memcpy(gUnknown_Debug_845E506 - src + dest, &ereaderTrainer, sizeof(ereaderTrainer));

    return size;
}

const u8 Str_842E25E[] = _("ポケコッコ");
const u8 Str_842E264[] = _("ticket");
const u8 Str_842E26B[] = _("{PKMN}");
const u8 Str_842E26E[] = _("wrong　{PKMN}");
const u8 Str_842E277[] = _("ribbon");
const u8 Str_842E27E[] = _("DEX");
const u8 Str_842E282[] = _("message");
const u8 Str_842E28A[] = _("egg");
const u8 Str_842E28E[] = _("RAM　seed");
const u8 Str_842E297[] = _("trainer");
const u8 Str_842E29F[] = _("clock");
const u8 Str_842E2A5[] = _("item");
const u8 Str_842E2AA[] = _("goods");
const u8 Str_842E2B0[] = _("potion");
const u8 Str_842E2B7[] = _("ball");
const u8 Str_842E2BC[] = _("cheri　berry");
const u8 Str_842E2C8[] = _("TM01");

const struct UnkDebugMenu3Items gUnknown_Debug_842E2D0[] = {
    {Str_842E264, debug_sub_813C404},
    {Str_842E26B, debug_sub_813C810},
    {Str_842E26E, debug_sub_813C888},
    {Str_842E277, debug_sub_813C430},
    {Str_842E27E, debug_sub_813C488},
    {Str_842E282, debug_sub_813C45C},
    {Str_842E28A, debug_sub_813C740},
    {Str_842E28E, debug_sub_813C5B4},
    {Str_842E297, debug_sub_813C93C},
    {Str_842E29F, debug_sub_813C4B4},
    {Str_842E2A5, debug_sub_813C4D4},
    {Str_842E2AA, debug_sub_813C500},
    {Str_842E2B0, debug_sub_813C580},
    {Str_842E2B7, debug_sub_813C58C},
    {Str_842E2BC, debug_sub_813C598},
    {Str_842E2C8, debug_sub_813C5A4}
};

extern u8 gUnknown_Debug_845E306[];

const u8 gUnknown_Debug_842E350 = 16;

u8 *const gUnknown_Debug_842E354[] = {
    gUnknown_Debug_845DAE1,
    gUnknown_Debug_845DDB2,
    gUnknown_Debug_845E306,
    gUnknown_Debug_845E3E0,
    gUnknown_Debug_845E3E0,
    gUnknown_Debug_845E402,
    gUnknown_Debug_845E402,
    gUnknown_Debug_845E422,
    gUnknown_Debug_845E422,
    gUnknown_Debug_845E443
};

#endif // DEBUG
