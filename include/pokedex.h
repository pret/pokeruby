#ifndef GUARD_POKEDEX_H
#define GUARD_POKEDEX_H

#include "sprite.h"

void ResetPokedex(void);
void sub_808C0A0(void);
void sub_808C0B8(void);
void CB2_InitPokedex(void);
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
bool8 sub_808F250(u8 taskId);
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
const u8 *GetPokemonCategory(u16);

s8 sub_8090D90(u16, u8);
u16 GetNationalPokedexCount(u8);
u16 GetHoennPokedexCount(u8);
bool8 sub_8090FC0(void);
u16 sub_8090FF4(void);
void sub_8091060(u16);
void sub_8091154(u16 order, u8, u8);
u8 sub_80911C8(u16 num, u8, u8);
u8 sub_8091260(u16 num, u8, u8, u8);
void sub_8091304(const u8 *name, u8, u8);

void sub_8091458(u16 height, u8 i, u8 i1);
void sub_8091564(u16 weight, u8 i, u8 i1);
void sub_8091738(u16, u16, u16);
void sub_80917CC(u16 i, u16 i1);
u16 sub_8091818(u8, u16, u16, u16);

u8 sub_8091A4C(u16 gender, s16, s16, u16);

#endif // GUARD_POKEDEX_H
