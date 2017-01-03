#include "global.h"
#include "asm.h"
#include "menu.h"
#include "pokemon.h"
#include "string_util.h"

extern u8 gStringVar1[];
extern u8 gStringVar4[];

extern u8 *(gNatureNames[]);
extern const u8 gOtherText_Terminator4[];
extern const u8 gOtherText_Nature[];

extern const u8 gOtherText_Met[];
extern const u8 gOtherText_Egg2[];
extern const u8 gOtherText_ObtainedInTrade[];
extern const u8 gOtherText_FatefulEncounter[];
extern const u8 gOtherText_Met2[];

u8 *sub_80A1E9C(u8 *dest, u8 *src, u8);
u8 sub_80A0664(struct Pokemon *pokemon);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);

#define CHAR_NEWLINE (0xFE)

#ifdef NONMATCHING
void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *pokemon, u8 left, u8 top) {
    u8 nature;
    u8 *ptr = gStringVar4;

    nature = GetNature(pokemon);
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);

    if (nature != NATURE_BOLD && nature != NATURE_GENTLE) {
        ptr = StringCopy(ptr, gOtherText_Terminator4);
    }

    ptr = StringCopy(ptr, gOtherText_Nature);

    if (sub_80A0664(pokemon) == TRUE) {
        u8 locationMet;

        locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);

        if (GetMonData(pokemon, MON_DATA_MET_LEVEL) == 0) {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, 5);
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Egg2);
        } else if (locationMet < 88) {
            u8 levelMet;

            levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        } else {
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
    } else {
        u8 gameMet;

        gameMet = GetMonData(pokemon, MON_DATA_MET_GAME);
        if (gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == 3) {
            u8 locationMet;

            locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF) {
                u8 levelMet;

                levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                ptr[0] = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_FatefulEncounter);
            } else if (locationMet <= 88) {
                u8 levelMet;

                levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                ptr[0] = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = sub_80A1E9C(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            } else {
                ptr[0] = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_ObtainedInTrade);
            }
        } else {
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }

    }

    MenuPrint(gStringVar4, left, top);
}
#else
__attribute__((naked))
void PokemonSummaryScreen_PrintTrainerMemo(void) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	adds r7, r0, 0\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	mov r9, r1\n\
	lsls r2, 24\n\
	lsrs r2, 24\n\
	mov r8, r2\n\
	ldr r5, _080A0838 @ =gStringVar4\n\
	bl GetNature\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	ldr r1, _080A083C @ =gNatureNames\n\
	lsls r0, r4, 2\n\
	adds r0, r1\n\
	ldr r1, [r0]\n\
	adds r0, r5, 0\n\
	movs r2, 0xE\n\
	bl sub_80A1E9C\n\
	adds r5, r0, 0\n\
	cmp r4, 0x5\n\
	beq _080A07DA\n\
	cmp r4, 0x15\n\
	beq _080A07DA\n\
	ldr r1, _080A0840 @ =gOtherText_Terminator4\n\
	bl StringCopy\n\
	adds r5, r0, 0\n\
_080A07DA:\n\
	ldr r1, _080A0844 @ =gOtherText_Nature\n\
	adds r0, r5, 0\n\
	bl StringCopy\n\
	adds r5, r0, 0\n\
	adds r0, r7, 0\n\
	bl sub_80A0664\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x1\n\
	bne _080A0898\n\
	adds r0, r7, 0\n\
	movs r1, 0x23\n\
	bl GetMonData\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	adds r0, r7, 0\n\
	movs r1, 0x24\n\
	bl GetMonData\n\
	cmp r0, 0\n\
	bne _080A0850\n\
	adds r0, r5, 0\n\
	movs r1, 0x5\n\
	bl PokemonSummaryScreen_CopyPokemonLevel\n\
	adds r5, r0, 0\n\
	movs r0, 0xFE\n\
	strb r0, [r5]\n\
	adds r5, 0x1\n\
	ldr r4, _080A0848 @ =gStringVar1\n\
	adds r0, r4, 0\n\
	adds r1, r6, 0\n\
	bl CopyLocationName\n\
	adds r0, r5, 0\n\
	adds r1, r4, 0\n\
	movs r2, 0xE\n\
	bl sub_80A1E9C\n\
	adds r5, r0, 0\n\
	ldr r1, _080A084C @ =gOtherText_Egg2\n\
	bl StringCopy\n\
	b _080A0934\n\
	.align 2, 0\n\
_080A0838: .4byte gStringVar4\n\
_080A083C: .4byte gNatureNames\n\
_080A0840: .4byte gOtherText_Terminator4\n\
_080A0844: .4byte gOtherText_Nature\n\
_080A0848: .4byte gStringVar1\n\
_080A084C: .4byte gOtherText_Egg2\n\
_080A0850:\n\
	cmp r6, 0x57\n\
	bhi _080A08E8\n\
	adds r0, r7, 0\n\
	movs r1, 0x24\n\
	bl GetMonData\n\
	adds r1, r0, 0\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	adds r0, r5, 0\n\
	bl PokemonSummaryScreen_CopyPokemonLevel\n\
	adds r5, r0, 0\n\
	movs r0, 0xFE\n\
	strb r0, [r5]\n\
	adds r5, 0x1\n\
	ldr r4, _080A0890 @ =gStringVar1\n\
	adds r0, r4, 0\n\
	adds r1, r6, 0\n\
	bl CopyLocationName\n\
	adds r0, r5, 0\n\
	adds r1, r4, 0\n\
	movs r2, 0xE\n\
	bl sub_80A1E9C\n\
	adds r5, r0, 0\n\
	ldr r1, _080A0894 @ =gOtherText_Met\n\
	bl StringCopy\n\
	b _080A0934\n\
	.align 2, 0\n\
_080A0890: .4byte gStringVar1\n\
_080A0894: .4byte gOtherText_Met\n\
_080A0898:\n\
	adds r0, r7, 0\n\
	movs r1, 0x25\n\
	bl GetMonData\n\
	lsls r0, 24\n\
	movs r1, 0xFF\n\
	lsls r1, 24\n\
	adds r0, r1\n\
	lsrs r0, 24\n\
	cmp r0, 0x2\n\
	bhi _080A08E8\n\
	adds r0, r7, 0\n\
	movs r1, 0x23\n\
	bl GetMonData\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0xFF\n\
	bne _080A08E4\n\
	adds r0, r7, 0\n\
	movs r1, 0x24\n\
	bl GetMonData\n\
	adds r1, r0, 0\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	adds r0, r5, 0\n\
	bl PokemonSummaryScreen_CopyPokemonLevel\n\
	adds r5, r0, 0\n\
	movs r0, 0xFE\n\
	strb r0, [r5]\n\
	adds r5, 0x1\n\
	ldr r1, _080A08E0 @ =gOtherText_FatefulEncounter\n\
	b _080A08F0\n\
	.align 2, 0\n\
_080A08E0: .4byte gOtherText_FatefulEncounter\n\
_080A08E4:\n\
	cmp r6, 0x57\n\
	bls _080A08FC\n\
_080A08E8:\n\
	movs r0, 0xFE\n\
	strb r0, [r5]\n\
	adds r5, 0x1\n\
	ldr r1, _080A08F8 @ =gOtherText_ObtainedInTrade\n\
_080A08F0:\n\
	adds r0, r5, 0\n\
	bl StringCopy\n\
	b _080A0934\n\
	.align 2, 0\n\
_080A08F8: .4byte gOtherText_ObtainedInTrade\n\
_080A08FC:\n\
	adds r0, r7, 0\n\
	movs r1, 0x24\n\
	bl GetMonData\n\
	adds r1, r0, 0\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	adds r0, r5, 0\n\
	bl PokemonSummaryScreen_CopyPokemonLevel\n\
	adds r5, r0, 0\n\
	movs r0, 0xFE\n\
	strb r0, [r5]\n\
	adds r5, 0x1\n\
	ldr r4, _080A094C @ =gStringVar1\n\
	adds r0, r4, 0\n\
	adds r1, r6, 0\n\
	bl CopyLocationName\n\
	adds r0, r5, 0\n\
	adds r1, r4, 0\n\
	movs r2, 0xE\n\
	bl sub_80A1E9C\n\
	adds r5, r0, 0\n\
	ldr r1, _080A0950 @ =gOtherText_Met2\n\
	bl StringCopy\n\
_080A0934:\n\
	ldr r0, _080A0954 @ =gStringVar4\n\
	mov r1, r9\n\
	mov r2, r8\n\
	bl MenuPrint\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080A094C: .4byte gStringVar1\n\
_080A0950: .4byte gOtherText_Met2\n\
_080A0954: .4byte gStringVar4\n\
    .syntax divided\n");
}
#endif
