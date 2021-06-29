#include "global.h"
#include "fldeff_softboiled.h"
#include "menu.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_menu.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "task.h"
#include "ewram.h"

struct Struct201C000 {
    struct Pokemon *monPointer;
    u8 filler4[1];
    u8 donorMonId;
    u16 unk6;
    u8 filler8[4];
    s32 unkC;
    void* unk10;
    u8 filler14[26];
    s16 unk2E;
};

#if ENGLISH
#define WINDOW_LEFT 3
#define WINDOW_RIGHT 26
#elif GERMAN
#define WINDOW_LEFT 0
#define WINDOW_RIGHT 29
#endif

// extern
extern u8 gPartyMenuMessage_IsPrinting;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gUnknown_0202E8F4;

// Static
static void sub_8133D50(u8 taskId);
static void Task_ChooseNewMonForSoftboiled(u8 taskId);
static void CantUseSoftboiled(u8 taskId);
static void sub_8133EF8(void);

bool8 SetUpFieldMove_SoftBoiled(void) {
    u16 maxHp;
    u16 hp;
    u16 minHp;

    maxHp = GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_MAX_HP);
    hp = GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HP);

    minHp = (maxHp / 5);
    if (hp >= minHp)
    {
        return TRUE;
    }

    return FALSE;
}

void sub_8133D28(u8 taskid) {
    ePartyMenu.unkC = sub_8133D50;
    ewram1B000.pmUnk272 = 3;
    DoPokemonMenu_Switch(taskid);
}

static void sub_8133D50(u8 taskId) {
    u8 userPartyId, recipientPartyId;
    u16 hp;
    struct Pokemon *pokemon;
    //struct Task *task;

    struct Sprite *sprites = gSprites;

    userPartyId = sprites[ePartyMenu.slotId].data[0];
    recipientPartyId = sprites[ePartyMenu.slotId2].data[0];

    if (userPartyId > 5 || recipientPartyId > 5)
    {
        sub_806CD44(taskId);
        return;
    }

    EWRAM_1C000.monPointer = &gPlayerParty[sprites[ePartyMenu.slotId2].data[0]];
    hp = GetMonData(EWRAM_1C000.monPointer, MON_DATA_HP);

    if (hp == 0 || userPartyId == recipientPartyId || GetMonData(EWRAM_1C000.monPointer, MON_DATA_MAX_HP) == hp)
    {
        CantUseSoftboiled(taskId);
        return;
    }

    PlaySE(SE_USE_ITEM);

    EWRAM_1C000.donorMonId = gSprites[ePartyMenu.slotId].data[0];

    pokemon = &gPlayerParty[EWRAM_1C000.donorMonId];
    EWRAM_1C000.monPointer = pokemon;
    EWRAM_1C000.unk6 = 0;
    EWRAM_1C000.unkC = -0x8000;
    EWRAM_1C000.unk10 = sub_8133EF8;


    gTasks[taskId].data[10] = GetMonData(EWRAM_1C000.monPointer, MON_DATA_MAX_HP);
    gTasks[taskId].data[11] = GetMonData(EWRAM_1C000.monPointer, MON_DATA_HP);
    gTasks[taskId].data[12] = gTasks[taskId].data[10] / 5;

    PartyMenuEraseMsgBoxAndFrame();
    gTasks[taskId].func = sub_806FA18;
    ewram1B000.pmUnk282 = gTasks[taskId].data[11];
}

static void Task_ChooseNewMonForSoftboiled(u8 taskId) {
    if (gPartyMenuMessage_IsPrinting)
    {
        return;
    }

    Menu_EraseWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    PrintPartyMenuPromptText(3, 0);
    gTasks[taskId].func = HandlePartyMenuSwitchPokemonInput;
}

static void CantUseSoftboiled(u8 taskId) {
    gUnknown_0202E8F4 = 0;
    PartyMenuEraseMsgBoxAndFrame();
    DisplayPartyMenuMessage(gOtherText_CantUseOnPoke, 1);
    gTasks[taskId].func = Task_ChooseNewMonForSoftboiled;
}

static void sub_8133EF8(void) {
    sub_806CCE4();
    ewram1B000.unk261 = 2;
    DestroySprite(&gSprites[ePartyMenu.slotId]);
    Menu_EraseWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    PrintPartyMenuPromptText(0, 0);
    SwitchTaskToFollowupFunc(ePartyMenu.unk0);
}
