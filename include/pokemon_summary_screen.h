#ifndef GUARD_POKEMON_SUMMARY_SCREEN_H
#define GUARD_POKEMON_SUMMARY_SCREEN_H

#include "main.h"
#include "task.h"

extern const u8 *const gNatureNames[];

// The Pokemon Summary Screen can operate in different modes. Certain features,
// such as move re-ordering, are available in the different modes.
enum PokemonSummaryScreenMode
{
    PSS_MODE_NORMAL,
    PSS_MODE_MOVES_ONLY,
    PSS_MODE_SELECT_MOVE,
    PSS_MODE_UNKNOWN, // TODO: this mode might be used by pokemon_storage_system
    PSS_MODE_NO_MOVE_ORDER_EDIT,
    PSS_MODE_PC_NORMAL,
    PSS_MODE_PC_MOVES_ONLY,
};

enum PokemonSummaryScreenPage
{
	PSS_PAGE_INFO,
	PSS_PAGE_SKILLS,
	PSS_PAGE_BATTLE_MOVES,
	PSS_PAGE_CONTEST_MOVES,
};

struct PokemonSummaryScreenStruct
{
    /*0x00*/ union {
        struct Pokemon *partyMons;
        struct BoxPokemon *boxMons;
    } monList;
    /*0x04*/ MainCallback callback;
    /*0x08*/ u8 mode; // see enum PokemonSummaryScreenMode
    /*0x09*/ u8 monIndex;
    /*0x0A*/ u8 maxMonIndex;
    /*0x0B*/ u8 page; // enum PokemonSummaryScreenPage
    /*0x0C*/ u8 monSpriteId;
    /*0x0D*/ u8 ballSpriteId;
    /*0x0E*/ bool8 usingPC;
    /*0x0F*/ u8 inputHandlingTaskId;
    /*0x10*/ struct Pokemon loadedMon;
    /*0x74*/ u8 loadGfxState;
    /*0x75*/ u8 firstPage;
    /*0x76*/ u8 lastPage;
    /*0x77*/ u8 unk77;
    /*0x78*/ u8 unk78;
    /*0x79*/ u8 selectedMoveIndex;
    /*0x7A*/ u8 switchMoveIndex;
    /*0x7B*/ bool8 disableMoveOrderEditing;
    /*0x7C*/ u16 moveToLearn;
    /*0x7E*/ u8 headerTextId; // used as index into sPageHeaderTexts
    /*0x7F*/ u8 headerActionTextId; // used as index into sPageHeaderTexts
    /*0x80*/ u8 bgToggle;
    /*0x84*/ TaskFunc unk84;
};

void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, MainCallback, u8);
void ShowSelectMovePokemonSummaryScreen(struct Pokemon *, u8, u8, MainCallback, u16);
u8 sub_809FA30(void);
u8 GetPrimaryStatus(u32);
u8 GetMonStatusAndPokerus();
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);
bool8 CheckPartyPokerus(struct Pokemon *, u8);


#endif // GUARD_POKEMON_SUMMARY_SCREEN_H
