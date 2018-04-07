#include "global.h"
#include "debug.h"
#include "constants/species.h"
#include "constants/items.h"
#include "string_util.h"
#include "new_game.h"
#include "mystery_event_script.h"
#include "berry.h"
#include "mail_data.h"

#if DEBUG

extern u8 gUnknown_Debug_845DAE1[];
extern u8 gUnknown_Debug_845DAE1End[];

size_t debug_sub_813C404(u8 * dest)
{
    size_t size = gUnknown_Debug_845DAE1End - gUnknown_Debug_845DAE1;
    memcpy(dest, gUnknown_Debug_845DAE1, size);
    unref_sub_812620C(dest, gUnknown_Debug_845DAE1);
    return size;
}

extern u8 gUnknown_Debug_845E3E0[];
extern u8 gUnknown_Debug_845E3E0End[];

size_t debug_sub_813C430(u8 * dest)
{
    size_t size = gUnknown_Debug_845E3E0End - gUnknown_Debug_845E3E0;
    memcpy(dest, gUnknown_Debug_845E3E0, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E3E0);
    return size;
}

extern u8 gUnknown_Debug_845E422[];
extern u8 gUnknown_Debug_845E422End[];

size_t debug_sub_813C45C(u8 * dest)
{
    size_t size = gUnknown_Debug_845E422End - gUnknown_Debug_845E422;
    memcpy(dest, gUnknown_Debug_845E422, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E422);
    return size;
}

extern u8 gUnknown_Debug_845E402[];
extern u8 gUnknown_Debug_845E402End[];

size_t debug_sub_813C488(u8 * dest)
{
    size_t size = gUnknown_Debug_845E402End - gUnknown_Debug_845E402;
    memcpy(dest, gUnknown_Debug_845E402, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E402);
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
    unref_sub_81261B4(dest, gUnknown_Debug_845E619);
    return size;
}

extern u8 gUnknown_Debug_845E712[];
extern u8 gUnknown_Debug_845E712End[];

size_t debug_sub_813C500(u8 * dest)
{
    size_t size = gUnknown_Debug_845E712End - gUnknown_Debug_845E712;
    memcpy(dest, gUnknown_Debug_845E712, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E712);
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
    unref_sub_812620C(dest, gUnknown_Debug_845E797);
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

extern const u8 Str_842E23C[]; //static const u8 Str_842E23C[] = _("ガイブ");

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
    unref_sub_81261B4(dest, gUnknown_Debug_845DDB2);
    return size;
}

extern const u8 Str_842E240[];
extern const u8 Str_842E248[];

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
extern const u8 Str_842E238[];

#ifdef NONMATCHING
size_t debug_sub_813C740(u8 * dest)
{
    struct MailStruct mail;
    struct Pokemon *mon = gEnemyParty;
    size_t size = gUnknown_Debug_845E443End - gUnknown_Debug_845E443;
    u8 dataBuffer[11];

    memcpy(dest, gUnknown_Debug_845E443, size);
    debug_sub_813C638(mon, SPECIES_PIKACHU, 5, ITEM_NONE);
    dataBuffer[0] = TRUE;
    SetMonData(mon, MON_DATA_IS_EGG, dataBuffer);
    dataBuffer[0] = 3;
    SetMonData(mon, MON_DATA_FRIENDSHIP, dataBuffer);
    dataBuffer[0] = 255;
    SetMonData(mon, MON_DATA_MET_LOCATION, dataBuffer);

    StringCopyN(dataBuffer, Str_842E238, POKEMON_NAME_LENGTH);
    SetMonData(mon, MON_DATA_NICKNAME, dataBuffer);

    dataBuffer[0] = LANGUAGE_JAPANESE;
    SetMonData(mon, MON_DATA_LANGUAGE, dataBuffer);

    // nonmatching pointer arithmetic
    memcpy(gUnknown_Debug_845E467 - gUnknown_Debug_845E443 + dest, mon, sizeof(struct Pokemon));

    memcpy(gUnknown_Debug_845E4CB - gUnknown_Debug_845E443 + dest, &mail, sizeof(struct MailStruct));

    return size;
}
#else
__attribute__((naked)) size_t debug_sub_813C740(u8 * dest)
{
    asm("\tpush\t{r4, r5, r6, lr}\n"
        "\tmov\tr6, sl\n"
        "\tmov\tr5, r9\n"
        "\tmov\tr4, r8\n"
        "\tpush\t{r4, r5, r6}\n"
        "\tadd\tsp, sp, #0xffffffd0\n"
        "\tadd\tr6, r0, #0\n"
        "\tldr\tr0, ._29        @ gUnknown_Debug_845E443\n"
        "\tmov\tr8, r0\n"
        "\tldr\tr1, ._29 + 4    @ gUnknown_Debug_845E4EF\n"
        "\tldr\tr5, ._29 + 8    @ gEnemyParty\n"
        "\tsub\tr1, r1, r0\n"
        "\tmov\tr9, r1\n"
        "\tadd\tr0, r6, #0\n"
        "\tmov\tr1, r8\n"
        "\tmov\tr2, r9\n"
        "\tbl\tmemcpy\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x19\n"
        "\tmov\tr2, #0x5\n"
        "\tmov\tr3, #0x0\n"
        "\tbl\tdebug_sub_813C638\n"
        "\tadd\tr4, sp, #0x24\n"
        "\tmov\tr0, #0x1\n"
        "\tmov\tsl, r0\n"
        "\tmov\tr1, sl\n"
        "\tstrb\tr1, [r4]\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x2d\n"
        "\tadd\tr2, r4, #0\n"
        "\tbl\tSetMonData\n"
        "\tmov\tr0, #0x3\n"
        "\tstrb\tr0, [r4]\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x20\n"
        "\tadd\tr2, r4, #0\n"
        "\tbl\tSetMonData\n"
        "\tmov\tr0, #0xff\n"
        "\tstrb\tr0, [r4]\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x23\n"
        "\tadd\tr2, r4, #0\n"
        "\tbl\tSetMonData\n"
        "\tldr\tr1, ._29 + 12   @ Str_842E238\n"
        "\tadd\tr0, r4, #0\n"
        "\tmov\tr2, #0xb\n"
        "\tbl\tStringCopyN\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x2\n"
        "\tadd\tr2, r4, #0\n"
        "\tbl\tSetMonData\n"
        "\tmov\tr0, sl\n"
        "\tstrb\tr0, [r4]\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x3\n"
        "\tadd\tr2, r4, #0\n"
        "\tbl\tSetMonData\n"
        "\tldr\tr0, ._29 + 16   @ gUnknown_Debug_845E467\n"
        "\tadd\tr0, r6, r0\n"
        "\tmov\tr1, r8\n"
        "\tsub\tr0, r0, r1\n"
        "\tadd\tr1, r5, #0\n"
        "\tmov\tr2, #0x64\n"
        "\tbl\tmemcpy\n"
        "\tldr\tr0, ._29 + 20   @ gUnknown_Debug_845E4CB\n"
        "\tadd\tr6, r6, r0\n"
        "\tmov\tr0, r8\n"
        "\tsub\tr6, r6, r0\n"
        "\tadd\tr0, r6, #0\n"
        "\tmov\tr1, sp\n"
        "\tmov\tr2, #0x24\n"
        "\tbl\tmemcpy\n"
        "\tmov\tr0, r9\n"
        "\tadd\tsp, sp, #0x30\n"
        "\tpop\t{r3, r4, r5}\n"
        "\tmov\tr8, r3\n"
        "\tmov\tr9, r4\n"
        "\tmov\tsl, r5\n"
        "\tpop\t{r4, r5, r6}\n"
        "\tpop\t{r1}\n"
        "\tbx\tr1\n"
        "._30:\n"
        "\t.align\t2, 0\n"
        "._29:\n"
        "\t.word\tgUnknown_Debug_845E443\n"
        "\t.word\tgUnknown_Debug_845E4EF\n"
        "\t.word\tgEnemyParty\n"
        "\t.word\tStr_842E238\n"
        "\t.word\tgUnknown_Debug_845E467\n"
        "\t.word\tgUnknown_Debug_845E4CB");
}
#endif // NONMATCHING

#ifdef NONMATCHING
// same reason as before
size_t debug_sub_813C810(u8 * dest)
{
    struct MailStruct mail;
    size_t size = gUnknown_Debug_845E443End - gUnknown_Debug_845E443;
    struct Pokemon *mon = gEnemyParty;

    memcpy(dest, gUnknown_Debug_845E443, size);
    debug_sub_813C638(mon, SPECIES_UNOWN, 5, ITEM_NONE);
    debug_sub_813C6AC(mon, &mail);

    // nonmatching pointer arithmetic
    memcpy(gUnknown_Debug_845E467 - gUnknown_Debug_845E443 + dest, mon, sizeof(struct Pokemon));

    memcpy(gUnknown_Debug_845E4CB - gUnknown_Debug_845E443 + dest, &mail, sizeof(struct MailStruct));

    unref_sub_812620C(dest, gUnknown_Debug_845E443);

    return size;
}
#else
__attribute__((naked)) size_t debug_sub_813C810(u8 * dest)
{
    asm("\tpush\t{r4, r5, r6, lr}\n"
        "\tmov\tr6, r8\n"
        "\tpush\t{r6}\n"
        "\tadd\tsp, sp, #0xffffffdc\n"
        "\tadd\tr6, r0, #0\n"
        "\tldr\tr5, ._31        @ gUnknown_Debug_845E443\n"
        "\tldr\tr0, ._31 + 4    @ gUnknown_Debug_845E4EF\n"
        "\tldr\tr4, ._31 + 8    @ gEnemyParty\n"
        "\tsub\tr0, r0, r5\n"
        "\tmov\tr8, r0\n"
        "\tadd\tr0, r6, #0\n"
        "\tadd\tr1, r5, #0\n"
        "\tmov\tr2, r8\n"
        "\tbl\tmemcpy\n"
        "\tadd\tr0, r4, #0\n"
        "\tmov\tr1, #0xc9\n"
        "\tmov\tr2, #0x15\n"
        "\tmov\tr3, #0x82\n"
        "\tbl\tdebug_sub_813C638\n"
        "\tadd\tr0, r4, #0\n"
        "\tmov\tr1, sp\n"
        "\tbl\tdebug_sub_813C6AC\n"
        "\tldr\tr0, ._31 + 12   @ gUnknown_Debug_845E467\n"
        "\tadd\tr0, r6, r0\n"
        "\tsub\tr0, r0, r5\n"
        "\tadd\tr1, r4, #0\n"
        "\tmov\tr2, #0x64\n"
        "\tbl\tmemcpy\n"
        "\tldr\tr0, ._31 + 16   @ gUnknown_Debug_845E4CB\n"
        "\tadd\tr0, r6, r0\n"
        "\tsub\tr0, r0, r5\n"
        "\tmov\tr1, sp\n"
        "\tmov\tr2, #0x24\n"
        "\tbl\tmemcpy\n"
        "\tadd\tr0, r6, #0\n"
        "\tadd\tr1, r5, #0\n"
        "\tbl\tunref_sub_812620C\n"
        "\tmov\tr0, r8\n"
        "\tadd\tsp, sp, #0x24\n"
        "\tpop\t{r3}\n"
        "\tmov\tr8, r3\n"
        "\tpop\t{r4, r5, r6}\n"
        "\tpop\t{r1}\n"
        "\tbx\tr1\n"
        "._32:\n"
        "\t.align\t2, 0\n"
        "._31:\n"
        "\t.word\tgUnknown_Debug_845E443\n"
        "\t.word\tgUnknown_Debug_845E4EF\n"
        "\t.word\tgEnemyParty\n"
        "\t.word\tgUnknown_Debug_845E467\n"
        "\t.word\tgUnknown_Debug_845E4CB");
}
#endif // NONMATCHING

#endif // DEBUG
