#ifndef GUARD_POKEDEX_H
#define GUARD_POKEDEX_H

#include "sprite.h"

struct PokedexListItem
{
    u16 dexNum;
    u16 seen:1;
    u16 owned:1;
};

struct PokedexView
{
    struct PokedexListItem unk0[386];
    u16 unk608;
    u8 unk60A_1:1;
    u8 unk60A_2:1;
    u8 unk60B;
    u16 unk60C;
    u16 selectedPokemon;
    u16 unk610;
    u16 dexMode;    //National or Hoenn
    u16 unk614;
    u16 dexOrder;
    u16 unk618;
    u16 unk61A;
    u16 unk61C;
    u16 unk61E[4];
    u16 unk626;     //sprite id of selected Pokemon
    u16 unk628;
    u16 unk62A;
    u8 unk62C;
    u8 unk62D;
    u8 unk62E;
    u8 unk62F;
    s16 unk630;
    s16 unk632;
    u16 unk634;
    u16 unk636;
    u16 unk638;
    u16 unk63A[4];
    u8 filler642[8];
    u8 unk64A;
    u8 unk64B;
    u8 unk64C_1:1;
    u8 selectedScreen;
    u8 unk64E;
    u8 unk64F;
    u8 menuIsOpen;      //menuIsOpen
    u8 unk651;
    u16 menuCursorPos;     //Menu cursor position
    s16 menuY;     //Menu Y position (inverted because we use REG_BG0VOFS for this)
    u8 unk656[8];
    u8 unk65E[8];
};

void ResetPokedex(void);
void sub_808C0A0(void);
void sub_808C0B8(void);
void ClearPokedexView(struct PokedexView *pokedexView);
void CB2_InitPokedex(void);
u8 unref_sub_808C540(void (*func)(u8));
void MainCB(void);
void Task_PokedexShowMainScreen(u8 taskId);
void Task_PokedexMainScreen(u8 taskId);
void sub_808C898(u8 taskId);
void Task_PokedexMainScreenMenu(u8 taskId);
void sub_808CA64(u8 taskId);
void sub_808CAE4(u8 taskId);
void sub_808CB8C(u8 taskId);
void Task_ClosePokedex(u8 taskId);
void sub_808CCC4(u8 taskId);
void Task_PokedexResultsScreen(u8 taskId);
void sub_808CEF8(u8 taskId);
void Task_PokedexResultsScreenMenu(u8 taskId);
void sub_808D118(u8 taskId);
void sub_808D198(u8 taskId);
void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId);
void Task_PokedexResultsScreenExitPokedex(u8 taskId);
bool8 sub_808D344(u8 a);
void sub_808D640(void);
void SortPokedex(u8 dexMode, u8 sortMode);
void sub_808DBE8(u8 a, u16 b, u16 c);
void sub_808DEB0(u16 a, u8 b, u8 c, u16 d);
void sub_808DF88(u16 a, u8 b, u8 c, u16 d);
u8 sub_808DFE4(u16 a, u8 b, u8 c);
void sub_808E090(u8 a, u8 b, u16 c);
void sub_808E0CC(u16 a, u16 b);
bool8 sub_808E208(u8 a, u8 b, u8 c);
void sub_808E398(u8 a, u16 b);
u16 sub_808E48C(u16 a, u16 b);
void sub_808E6BC(void);
u8 sub_808E71C(void);
u8 sub_808E82C(void);
u16 sub_808E888(u16 a1);
u32 sub_808E8C8(u16 a, u16 b, u16 c);
void sub_808E978(u8 a);
void nullsub_58(struct Sprite *sprite);
void sub_808ED94(struct Sprite *sprite);
void sub_808EDB8(struct Sprite *sprite);
void sub_808EE28(struct Sprite *sprite);
void sub_808EF38(struct Sprite *sprite);
void sub_808EF8C(struct Sprite *sprite);
void sub_808F08C(struct Sprite *sprite);
void sub_808F0B4(struct Sprite *sprite);
void sub_808F168(struct Sprite *sprite);
u8 sub_808F210(struct PokedexListItem *item, u8 b);
bool8 sub_808F250(u8 taskId);
u8 sub_808F284(struct PokedexListItem *item, u8 b);
void Task_InitPageScreenMultistep(u8 taskId);
void Task_PageScreenProcessInput(u8 taskId);
void sub_808F888(u8 taskId);
void Task_ClosePageScreen(u8 taskId);
void Task_InitAreaScreenMultistep(u8 taskId);
void Task_AreaScreenProcessInput(u8 taskId);
void sub_808FA00(u8 taskId);
void Task_InitCryScreenMultistep(u8 taskId);
void Task_CryScreenProcessInput(u8 taskId);
void sub_808FFBC(u8 taskId);
void sub_8090040(u8 a);
void Task_InitSizeScreenMultistep(u8 taskId);
void Task_SizeScreenProcessInput(u8 taskId);
void sub_8090498(u8 taskId);
void sub_80904FC(u16 a);
void sub_8090540(u16 a);
void sub_8090584(u8 a, u16 b);
void sub_8090644(u8 a, u16 b);
u8 sub_809070C(u16 dexNum, u32 b, u32 c);

// ASM
void sub_8090750(u8);
void sub_8090A3C(u8);

void sub_8090C68(void);
u8 *GetPokemonCategory(u16);

bool8 sub_8090D90(u16, u8);
u16 GetNationalPokedexCount(u8);
u16 GetHoennPokedexCount(u8);
bool8 sub_8090FC0(void);
u16 sub_8090FF4(void);
void sub_8091060(u16);
void sub_8091154(u16 order, int i, int i1);
void sub_80911C8(u16 num, int i, int i1);
void sub_8091260(u16 num, int i, int i1, int i2);
void sub_8091304(u8 name[12], int i, int i1);

void sub_8091458(u16 height, int i, int i1);
void sub_8091564(u16 weight, int i, int i1);
void sub_8091738(u16, u16, u16);
void sub_80917CC(int i, int i1);
u16 sub_8091818(u8, u16, u16, u16);

u16 sub_80918EC(u16 a, s16 b, s16 c, u16 d);    //Not sure of return type
u8 sub_8091A4C(u8 gender, int i, int i1, int i2);

#endif // GUARD_POKEDEX_H
