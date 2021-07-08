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
static void sub_8133EF8(u8 taskId);

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
    ePartyMenu2.pmUnk272 = 3;
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

    gPartyMenu.pokemon = &gPlayerParty[sprites[ePartyMenu.slotId2].data[0]];
    hp = GetMonData(gPartyMenu.pokemon, MON_DATA_HP);

    if (hp == 0 || userPartyId == recipientPartyId || GetMonData(gPartyMenu.pokemon, MON_DATA_MAX_HP) == hp)
    {
        CantUseSoftboiled(taskId);
        return;
    }

    PlaySE(SE_USE_ITEM);

    gPartyMenu.primarySelectedMonIndex = gSprites[ePartyMenu.slotId].data[0];

    pokemon = &gPlayerParty[gPartyMenu.primarySelectedMonIndex];
    gPartyMenu.pokemon = pokemon;
    gPartyMenu.secondarySelectedIndex = 0;
    gPartyMenu.unkC = -0x8000;
    gPartyMenu.unk10 = sub_8133EF8;


    gTasks[taskId].data[10] = GetMonData(gPartyMenu.pokemon, MON_DATA_MAX_HP);
    gTasks[taskId].data[11] = GetMonData(gPartyMenu.pokemon, MON_DATA_HP);
    gTasks[taskId].data[12] = gTasks[taskId].data[10] / 5;

    PartyMenuEraseMsgBoxAndFrame();
    gTasks[taskId].func = sub_806FA18;
    ePartyMenu2.pmUnk282 = gTasks[taskId].data[11];
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

static void sub_8133EF8(u8 taskId)
{
    sub_806CCE4();
    ePartyMenu2.unk261 = 2;
    DestroySprite(&gSprites[ePartyMenu.slotId]);
    Menu_EraseWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    PrintPartyMenuPromptText(0, 0);
    SwitchTaskToFollowupFunc(ePartyMenu.unk0);
}
