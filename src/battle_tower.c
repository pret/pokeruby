#include "global.h"
#include "battle.h"
#include "battle_setup.h"
#include "battle_tower.h"
#include "battle_transition.h"
#include "data2.h"
#include "easy_chat.h"
#include "event_data.h"
#include "item.h"
#include "items.h"
#include "main.h"
#include "map_object_constants.h"
#include "moves.h"
#include "new_game.h"
#include "overworld.h"
#include "pokedex.h"
#include "rng.h"
#include "save.h"
#include "script_pokemon_80C4.h"
#include "species.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trainer.h"
#include "vars.h"

#include "data/battle_tower/trainers.h"

const u16 gBattleTowerHeldItems[] = {
	ITEM_NONE,
	ITEM_KINGS_ROCK,
	ITEM_SITRUS_BERRY,
	ITEM_ORAN_BERRY,
	ITEM_CHESTO_BERRY,
	ITEM_HARD_STONE,
	ITEM_FOCUS_BAND,
	ITEM_PERSIM_BERRY,
	ITEM_MIRACLE_SEED,
	ITEM_BERRY_JUICE,
	ITEM_MACHO_BRACE,
	ITEM_SILVER_POWDER,
	ITEM_CHERI_BERRY,
	ITEM_BLACK_GLASSES,
	ITEM_BLACK_BELT,
	ITEM_SOUL_DEW,
	ITEM_CHOICE_BAND,
	ITEM_MAGNET,
	ITEM_SILK_SCARF,
	ITEM_WHITE_HERB,
	ITEM_DEEP_SEA_SCALE,
	ITEM_DEEP_SEA_TOOTH,
	ITEM_MYSTIC_WATER,
	ITEM_SHARP_BEAK,
	ITEM_QUICK_CLAW,
	ITEM_LEFTOVERS,
	ITEM_RAWST_BERRY,
	ITEM_LIGHT_BALL,
	ITEM_POISON_BARB,
	ITEM_NEVER_MELT_ICE,
	ITEM_ASPEAR_BERRY,
	ITEM_SPELL_TAG,
	ITEM_BRIGHT_POWDER,
	ITEM_LEPPA_BERRY,
	ITEM_SCOPE_LENS,
	ITEM_TWISTED_SPOON,
	ITEM_METAL_COAT,
	ITEM_MENTAL_HERB,
	ITEM_CHARCOAL,
	ITEM_PECHA_BERRY,
	ITEM_SOFT_SAND,
	ITEM_LUM_BERRY,
	ITEM_DRAGON_SCALE,
	ITEM_DRAGON_FANG,
	ITEM_IAPAPA_BERRY,
	ITEM_WIKI_BERRY,
	ITEM_SEA_INCENSE,
	ITEM_SHELL_BELL,
	ITEM_SALAC_BERRY,
	ITEM_LANSAT_BERRY,
	ITEM_APICOT_BERRY,
	ITEM_STARF_BERRY,
	ITEM_LIECHI_BERRY,
	ITEM_STICK,
	ITEM_LAX_INCENSE,
	ITEM_AGUAV_BERRY,
	ITEM_FIGY_BERRY,
	ITEM_THICK_CLUB,
	ITEM_MAGO_BERRY,
	ITEM_METAL_POWDER,
	ITEM_PETAYA_BERRY,
	ITEM_LUCKY_PUNCH,
	ITEM_GANLON_BERRY,
};

#include "data/battle_tower/level_50_mons.h"
#include "data/battle_tower/level_100_mons.h"

const u8 gUnknown_08405E60[] = {
	4,
	7,
	8,
	13,
	14,
	15,
	16,
	17,
	18,
	19,
	20,
	21,
	23,
	29,
	32,
	34,
	36,
	38,
	39,
	41,
	43,
	45,
	46,
	47,
	53,
	56,
	64,
	66,
	72,
	73, 
};

const u8 gUnknown_08405E7E[] = {
	3,
	6,
	9,
	10,
	11,
	12,
	22,
	30,
	33,
	35,
	40,
	42,
	44,
	48,
	49,
	50,
	51,
	65,
	67,
	71,
};

const u8 gUnknown_08405E92[] = {
	MAP_OBJ_GFX_HIKER,
	MAP_OBJ_GFX_TUBER_M,
	MAP_OBJ_GFX_MAN_4,
	MAP_OBJ_GFX_BOY_4,
	MAP_OBJ_GFX_MANIAC,
	MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
	MAP_OBJ_GFX_BLACK_BELT,
	MAP_OBJ_GFX_MAN_6,
	MAP_OBJ_GFX_MAN_6,
	MAP_OBJ_GFX_CAMPER,
	MAP_OBJ_GFX_MANIAC,
	MAP_OBJ_GFX_PSYCHIC_M,
	MAP_OBJ_GFX_GENTLEMAN,
	MAP_OBJ_GFX_SCHOOL_KID_M,
	MAP_OBJ_GFX_MAN_3,
	MAP_OBJ_GFX_OLD_MAN_1,
	MAP_OBJ_GFX_YOUNGSTER,
	MAP_OBJ_GFX_FISHERMAN,
	MAP_OBJ_GFX_CYCLING_TRIATHLETE_M,
	MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
	MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
	MAP_OBJ_GFX_MAN_4,
	MAP_OBJ_GFX_MAN_6,
	MAP_OBJ_GFX_LITTLE_BOY_1,
	MAP_OBJ_GFX_SAILOR,
	MAP_OBJ_GFX_MANIAC,
	MAP_OBJ_GFX_MAN_5,
	MAP_OBJ_GFX_CAMPER,
	MAP_OBJ_GFX_BUG_CATCHER,
	MAP_OBJ_GFX_HIKER,
};

const u8 gUnknown_08405EB0[] = {
	MAP_OBJ_GFX_WOMAN_3,
	MAP_OBJ_GFX_TUBER_F,
	MAP_OBJ_GFX_WOMAN_7,
	MAP_OBJ_GFX_WOMAN_1,
	MAP_OBJ_GFX_WOMAN_3,
	MAP_OBJ_GFX_BEAUTY,
	MAP_OBJ_GFX_LASS,
	MAP_OBJ_GFX_GIRL_3,
	MAP_OBJ_GFX_WOMAN_2,
	MAP_OBJ_GFX_OLD_WOMAN_1,
	MAP_OBJ_GFX_CYCLING_TRIATHLETE_F,
	MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
	MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
	MAP_OBJ_GFX_GIRL_3,
	MAP_OBJ_GFX_WOMAN_7,
	MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
	MAP_OBJ_GFX_PICNICKER,
	MAP_OBJ_GFX_WOMAN_3,
	MAP_OBJ_GFX_PICNICKER,
	MAP_OBJ_GFX_LASS,
};

const u16 gBattleTowerBanlist[] = {
	SPECIES_MEW,
	SPECIES_MEWTWO,
	SPECIES_HO_OH,
	SPECIES_LUGIA,
	SPECIES_CELEBI,
	SPECIES_KYOGRE,
	SPECIES_GROUDON,
	SPECIES_RAYQUAZA,
	SPECIES_JIRACHI,
	SPECIES_DEOXYS,
	0xFFFF,
};

// Item prizes for battle tower streaks of 5 or fewer sets.
const u16 ShortStreakPrizes[] = {
	ITEM_HP_UP,
	ITEM_PROTEIN,
	ITEM_IRON,
	ITEM_CALCIUM,
	ITEM_CARBOS,
	ITEM_ZINC,
};

// Item prizes for battle tower streaks of greater than 5 sets.
const u16 LongStreakPrizes[] = {
	ITEM_BRIGHT_POWDER,
	ITEM_WHITE_HERB,
	ITEM_QUICK_CLAW,
	ITEM_LEFTOVERS,
	ITEM_MENTAL_HERB,
	ITEM_KINGS_ROCK,
	ITEM_FOCUS_BAND,
	ITEM_SCOPE_LENS,
	ITEM_CHOICE_BAND,
};

extern void sub_81360D0(void);
extern u16 gSpecialVar_0x8004;
extern u8 gUnknown_08400E23[];
extern u8 gUnknown_08400E29[];
extern u8 gUnknown_08400E2E[];
extern u8 gUnknown_08400E30[];

extern u8 gTrainerClassToPicIndex[];
extern u8 gTrainerClassToNameIndex[];
extern u16 gTrainerBattleOpponent;
extern u16 gBattleTypeFlags;
extern u8 gSelectedOrderFromParty[];
extern struct Pokemon gUnknown_030042FC[];
extern u8 gBattleOutcome;
extern struct BattlePokemon gBattleMons[];

extern void ValidateBattleTowerRecordChecksums(void);
extern void sub_813601C(void);
extern void sub_81349FC(u8);
extern void sub_81360AC(struct BattleTowerEReaderTrainer *);
extern void sub_8135A3C(void);
extern void sub_8135CFC(void);
static void SetBattleTowerRecordChecksum(struct BattleTowerRecord *);
static void ClearBattleTowerRecord(struct BattleTowerRecord *);

#define ewram160FB (ewram[0x160FB])


void sub_8134548(void)
{
	u8 var1 = 0;
	s32 levelType;

	for (levelType = 0; levelType < 2; levelType++)
	{
		switch (gSaveBlock2.filler_A8.var_4AE[levelType])
		{
		case 0:
		default:
			sub_813461C(levelType);
			if (!var1)
			{
				VarSet(VAR_0x4000, 5);
			}
			break;
		case 1:
			sub_813461C(levelType);
			VarSet(VAR_0x4000, 1);
			var1++;
			break;
		case 4:
			VarSet(VAR_0x4000, 2);
			var1++;
			break;
		case 5:
			VarSet(VAR_0x4000, 3);
			var1++;
			break;
		case 2:
			VarSet(VAR_0x4000, 4);
			var1++;
			break;
		case 3:
		case 6:
			break;
		}
	}

	if ((gSaveBlock2.filler_A8.var_4AE[0] == 3 || gSaveBlock2.filler_A8.var_4AE[0] == 6)
		&& (gSaveBlock2.filler_A8.var_4AE[1] == 3 || gSaveBlock2.filler_A8.var_4AE[1] == 6))
	{
		VarSet(VAR_0x4000, 5);
	}

	ValidateBattleTowerRecordChecksums();
}

void sub_813461C(u8 levelType)
{
	gSaveBlock2.filler_A8.var_4AE[levelType] = 0;
	gSaveBlock2.filler_A8.var_4B0[levelType] = 1;
	gSaveBlock2.filler_A8.var_4B4[levelType] = 1;
}

// u8 sub_8134650(u8 levelType, u16 b)
// {
// 	u8 trainerTeamLevel;
// 	s32 i;
// 	u32 numValid = 0;

// 	sub_813601C();

// 	if (gScriptResult || gSaveBlock2.filler_A8.ereaderTrainer.unk2 != b)
// 	{
// 		return 0;
// 	}

// 	trainerTeamLevel = 50;
// 	if (levelType != 0)
// 	{
// 		trainerTeamLevel = 100;
// 	}

// 	for (i = 0; i < 3; i++)
// 	{
// 		if (!gSaveBlock2.filler_A8.ereaderTrainer.party[i].level != trainerTeamLevel)
// 		{
// 			return 0;
// 		}

// 		CheckMonBattleTowerBanlist(gSaveBlock2.filler_A8.ereaderTrainer.party[i].unk0, gSaveBlock2.filler_A8.ereaderTrainer.party[i].unk2, 1, levelType, &numValid);
// 	}

// 	return numValid == 3;
// }

__attribute__((naked))
u8 sub_8134650(u8 levelType, u16 b)
{
	asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    sub sp, 0x2C\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    lsls r1, 16\n\
    lsrs r6, r1, 16\n\
    add r4, sp, 0x28\n\
    movs r0, 0\n\
    strb r0, [r4]\n\
    bl sub_813601C\n\
    ldr r0, _08134684 @ =gScriptResult\n\
    ldrh r0, [r0]\n\
    adds r7, r4, 0\n\
    cmp r0, 0\n\
    bne _08134680\n\
    ldr r1, _08134688 @ =gSaveBlock2\n\
    ldr r2, _0813468C @ =0x0000049a\n\
    adds r0, r1, r2\n\
    ldrh r0, [r0]\n\
    cmp r0, r6\n\
    beq _08134690\n\
_08134680:\n\
    movs r0, 0\n\
    b _081346E2\n\
    .align 2, 0\n\
_08134684: .4byte gScriptResult\n\
_08134688: .4byte gSaveBlock2\n\
_0813468C: .4byte 0x0000049a\n\
_08134690:\n\
    movs r6, 0x32\n\
    cmp r5, 0\n\
    beq _08134698\n\
    movs r6, 0x64\n\
_08134698:\n\
    movs r4, 0\n\
    mov r8, r1\n\
_0813469C:\n\
    movs r0, 0x2C\n\
    muls r0, r4\n\
    mov r3, r8\n\
    adds r1, r0, r3\n\
    movs r2, 0x9B\n\
    lsls r2, 3\n\
    adds r0, r1, r2\n\
    ldrb r2, [r0]\n\
    cmp r2, r6\n\
    bne _08134680\n\
    ldr r3, _081346F0 @ =0x000004cc\n\
    adds r0, r1, r3\n\
    ldrh r0, [r0]\n\
    adds r3, 0x2\n\
    adds r1, r3\n\
    ldrh r1, [r1]\n\
    str r2, [sp]\n\
    add r2, sp, 0x10\n\
    str r2, [sp, 0x4]\n\
    add r2, sp, 0x1C\n\
    str r2, [sp, 0x8]\n\
    str r7, [sp, 0xC]\n\
    movs r2, 0x1\n\
    adds r3, r5, 0\n\
    bl CheckMonBattleTowerBanlist\n\
    adds r4, 0x1\n\
    cmp r4, 0x2\n\
    ble _0813469C\n\
    movs r1, 0\n\
    ldrb r0, [r7]\n\
    cmp r0, 0x3\n\
    bne _081346E0\n\
    movs r1, 0x1\n\
_081346E0:\n\
    adds r0, r1, 0\n\
_081346E2:\n\
    add sp, 0x2C\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_081346F0: .4byte 0x000004cc\n\
.syntax divided\n");
}

// bool8 sub_81346F4(void)
// {
// 	s32 i;
// 	u32 j;
// 	u32 arr[4];
// 	u16 var2 = sub_8135D3C(gSaveBlock2.filler_A8.battleTowerLevelType);

// 	if (sub_8134650(gSaveBlock2.filler_A8.battleTowerLevelType))
// 	{
// 		gSaveBlock2.filler_A8.battleTowerTrainerId = 0xC8;
// 		return TRUE;
// 	}

// 	for (i = 0; i < 5; i++)
// 	{
// 		u32 var_or = 0;
// 		u32 var_add = 0;
// 		for (j = 0; j < 40; j++)
// 		{
// 			var_or |= gSaveBlock2.filler_A8.var_0A4[i][j];
// 			var_add += gSaveBlock2.filler_A8.var_0A4[i][j];
// 		}

		
// 	}
// }

__attribute__((naked))
bool8 sub_81346F4(void)
{
	asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x18\n\
    movs r0, 0\n\
    mov r9, r0\n\
    ldr r4, _08134738 @ =gSaveBlock2\n\
    ldr r1, _0813473C @ =0x00000554\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    lsls r0, 31\n\
    lsrs r7, r0, 31\n\
    adds r0, r7, 0\n\
    bl sub_8135D3C\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    adds r0, r7, 0\n\
    mov r1, r8\n\
    bl sub_8134650\n\
    lsls r0, 24\n\
    adds r1, r4, 0\n\
    cmp r0, 0\n\
    beq _08134744\n\
    ldr r2, _08134740 @ =0x00000564\n\
    adds r1, r2\n\
    movs r0, 0xC8\n\
    strb r0, [r1]\n\
    b _081347DE\n\
    .align 2, 0\n\
_08134738: .4byte gSaveBlock2\n\
_0813473C: .4byte 0x00000554\n\
_08134740: .4byte 0x00000564\n\
_08134744:\n\
    movs r5, 0\n\
    movs r3, 0xA4\n\
    mov r12, r3\n\
    mov r10, sp\n\
_0813474C:\n\
    mov r0, r12\n\
    muls r0, r5\n\
    movs r4, 0\n\
    movs r1, 0\n\
    movs r2, 0\n\
    adds r6, r5, 0x1\n\
    str r6, [sp, 0x14]\n\
    ldr r6, _081347B4 @ =gSaveBlock2 + 0x14C\n\
    adds r3, r0, r6\n\
_0813475E:\n\
    ldm r3!, {r0}\n\
    orrs r4, r0\n\
    adds r1, r0\n\
    adds r2, 0x1\n\
    cmp r2, 0x27\n\
    bls _0813475E\n\
    mov r3, r12\n\
    muls r3, r5\n\
    ldr r0, _081347B8 @ =gSaveBlock2\n\
    adds r2, r3, r0\n\
    movs r6, 0xA7\n\
    lsls r6, 1\n\
    adds r0, r2, r6\n\
    ldrh r0, [r0]\n\
    cmp r0, r8\n\
    bne _081347A4\n\
    subs r6, 0x2\n\
    adds r0, r2, r6\n\
    ldrb r0, [r0]\n\
    cmp r0, r7\n\
    bne _081347A4\n\
    cmp r4, 0\n\
    beq _081347A4\n\
    ldr r2, _081347BC @ =gSaveBlock2 + 0x1EC\n\
    adds r0, r3, r2\n\
    ldr r0, [r0]\n\
    cmp r0, r1\n\
    bne _081347A4\n\
    mov r3, r10\n\
    adds r3, 0x4\n\
    mov r10, r3\n\
    subs r3, 0x4\n\
    stm r3!, {r5}\n\
    movs r6, 0x1\n\
    add r9, r6\n\
_081347A4:\n\
    ldr r5, [sp, 0x14]\n\
    cmp r5, 0x4\n\
    ble _0813474C\n\
    mov r0, r9\n\
    cmp r0, 0\n\
    bne _081347C0\n\
    movs r0, 0\n\
    b _081347E0\n\
    .align 2, 0\n\
_081347B4: .4byte gSaveBlock2 + 0x14C\n\
_081347B8: .4byte gSaveBlock2\n\
_081347BC: .4byte gSaveBlock2 + 0x1EC\n\
_081347C0:\n\
    bl Random\n\
    ldr r4, _081347F0 @ =gSaveBlock2\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r1, r9\n\
    bl __modsi3\n\
    lsls r0, 2\n\
    add r0, sp\n\
    ldr r0, [r0]\n\
    adds r0, 0x64\n\
    ldr r1, _081347F4 @ =0x00000564\n\
    adds r4, r1\n\
    strb r0, [r4]\n\
_081347DE:\n\
    movs r0, 0x1\n\
_081347E0:\n\
    add sp, 0x18\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_081347F0: .4byte gSaveBlock2\n\
_081347F4: .4byte 0x00000564\n\
.syntax divided\n");
}

// void sub_81347F8(void)
// {
// 	bool8 levelType = gSaveBlock2.filler_A8.battleTowerLevelType;
// 	if (sub_81346F4())
// 	{
// 		sub_81349FC(gSaveBlock2.filler_A8.battleTowerTrainerId);
// 		gSaveBlock2.filler_A8.var_4C1[gSaveBlock2.filler_A8.var_4B0[levelType]] = gSaveBlock2.filler_A8.battleTowerTrainerId;
// 	}
// 	else
// 	{
// 		u16 var1;

// 		if (gSaveBlock2.filler_A8.var_4B4[levelType] > 7)
// 		{
// 			while (1)
// 			{
// 				s32 i;
// 				u32 temp = ((Random() & 0xFF) * 30) >> 8;
// 				var1 = temp + 70;
// 				for (i = 0; i < gSaveBlock2.filler_A8.var_4B0[levelType] - 1 && var1 != gSaveBlock2.filler_A8.var_4C1[i]; i++) // TODO: [i + 1]???
// 				{ }

// 				if (i == gSaveBlock2.filler_A8.var_4B0[levelType] - 1)
// 				{
// 					break;
// 				}
// 			}
// 		}
// 		else
// 		{
// 			if (gSaveBlock2.filler_A8.var_4B0[levelType] == 7)
// 			{
// 				while (1)
// 				{
// 					s32 i;
// 					u32 temp = ((Random() & 0xFF) * 5);
// 					u32 temp2 = (((gSaveBlock2.filler_A8.var_4B4[levelType] - 1) * 10) + 20);
// 					var1 = temp / 128 + temp2;
// 					for (i = 0; i < gSaveBlock2.filler_A8.var_4B0[levelType] - 1 && gSaveBlock2.filler_A8.var_4C1[i] != var1; i++) // TODO: [i + 1]????
// 					{ }

// 					if (i == gSaveBlock2.filler_A8.var_4B0[levelType] - 1)
// 					{
// 						break;
// 					}
// 				}
// 			}
// 			else
// 			{
// 				while (1)
// 				{
// 					s32 i;
// 					u32 temp = ((Random() & 0xFF) * 320);
// 					u32 temp2 = ((gSaveBlock2.filler_A8.var_4B4[levelType] - 1) * 10);
// 					var1 = temp + temp2;
// 					for (i = 0; i < gSaveBlock2.filler_A8.var_4B0[levelType] - 1 && gSaveBlock2.filler_A8.var_4C1[i] != var1; i++)
// 					{ }

// 					if (i == gSaveBlock2.filler_A8.var_4B0[levelType] - 1)
// 					{
// 						break;
// 					}
// 				}
// 			}
// 		}

// 		gSaveBlock2.filler_A8.battleTowerTrainerId = var1;
// 		sub_81349FC(gSaveBlock2.filler_A8.battleTowerTrainerId);

// 		if (gSaveBlock2.filler_A8.var_4B0[levelType] < 7)
// 		{
// 			gSaveBlock2.filler_A8.var_4C1[gSaveBlock2.filler_A8.var_4B0[levelType]] = gSaveBlock2.filler_A8.battleTowerTrainerId;
// 		}
// 	}
// }

__attribute__((naked))
void sub_81347F8(void)
{
	asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r5, _08134838 @ =gSaveBlock2\n\
    ldr r1, _0813483C @ =0x00000554\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    lsls r0, 31\n\
    lsrs r6, r0, 31\n\
    bl sub_81346F4\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08134848\n\
    ldr r2, _08134840 @ =0x00000564\n\
    adds r4, r5, r2\n\
    ldrb r0, [r4]\n\
    bl sub_81349FC\n\
    lsls r0, r6, 1\n\
    movs r3, 0xAB\n\
    lsls r3, 3\n\
    adds r1, r5, r3\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    adds r0, r5, r0\n\
    ldr r1, _08134844 @ =0x00000569\n\
    adds r0, r1\n\
    ldrb r1, [r4]\n\
    b _081349DC\n\
    .align 2, 0\n\
_08134838: .4byte gSaveBlock2\n\
_0813483C: .4byte 0x00000554\n\
_08134840: .4byte 0x00000564\n\
_08134844: .4byte 0x00000569\n\
_08134848:\n\
    lsls r0, r6, 1\n\
    ldr r2, _081348D8 @ =0x0000055c\n\
    adds r1, r5, r2\n\
    adds r1, r0, r1\n\
    ldrh r1, [r1]\n\
    adds r7, r0, 0\n\
    cmp r1, 0x7\n\
    bls _0813485A\n\
    b _0813495C\n\
_0813485A:\n\
    movs r3, 0xAB\n\
    lsls r3, 3\n\
    adds r0, r5, r3\n\
    adds r1, r7, r0\n\
    ldrh r0, [r1]\n\
    cmp r0, 0x7\n\
    bne _081348E4\n\
    adds r6, r5, 0\n\
    mov r9, r7\n\
    adds r5, r1, 0\n\
    ldr r0, _081348DC @ =0x0000056a\n\
    adds r0, r6\n\
    mov r10, r0\n\
    mov r8, r5\n\
_08134876:\n\
    bl Random\n\
    movs r1, 0xFF\n\
    ands r1, r0\n\
    lsls r2, r1, 2\n\
    adds r2, r1\n\
    ldr r1, _081348D8 @ =0x0000055c\n\
    adds r4, r6, r1\n\
    mov r3, r9\n\
    adds r0, r3, r4\n\
    ldrh r1, [r0]\n\
    subs r1, 0x1\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 1\n\
    adds r0, 0x14\n\
    lsrs r2, 7\n\
    adds r2, r0\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    movs r1, 0\n\
    ldrh r0, [r5]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    bge _081348C8\n\
    mov r3, r10\n\
    ldrb r0, [r3]\n\
    cmp r0, r2\n\
    beq _081348C8\n\
    subs r0, r4, 0x4\n\
    adds r0, r7, r0\n\
    ldrh r0, [r0]\n\
    subs r3, r0, 0x1\n\
    adds r4, 0xE\n\
_081348BA:\n\
    adds r1, 0x1\n\
    cmp r1, r3\n\
    bge _081348C8\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, r2\n\
    bne _081348BA\n\
_081348C8:\n\
    mov r3, r8\n\
    ldrh r0, [r3]\n\
    subs r0, 0x1\n\
    ldr r4, _081348E0 @ =gSaveBlock2\n\
    cmp r1, r0\n\
    bne _08134876\n\
    b _081349B6\n\
    .align 2, 0\n\
_081348D8: .4byte 0x0000055c\n\
_081348DC: .4byte 0x0000056a\n\
_081348E0: .4byte gSaveBlock2\n\
_081348E4:\n\
    adds r6, r5, 0\n\
    mov r9, r7\n\
    adds r5, r1, 0\n\
    ldr r2, _08134950 @ =0x0000056a\n\
    adds r2, r6\n\
    mov r10, r2\n\
    mov r8, r5\n\
_081348F2:\n\
    bl Random\n\
    movs r1, 0xFF\n\
    ands r1, r0\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsrs r2, r0, 6\n\
    ldr r3, _08134954 @ =0x0000055c\n\
    adds r4, r6, r3\n\
    mov r1, r9\n\
    adds r0, r1, r4\n\
    ldrh r1, [r0]\n\
    subs r1, 0x1\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 1\n\
    adds r0, r2, r0\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    movs r1, 0\n\
    ldrh r0, [r5]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    bge _08134942\n\
    mov r3, r10\n\
    ldrb r0, [r3]\n\
    cmp r0, r2\n\
    beq _08134942\n\
    subs r0, r4, 0x4\n\
    adds r0, r7, r0\n\
    ldrh r0, [r0]\n\
    subs r3, r0, 0x1\n\
    adds r4, 0xE\n\
_08134934:\n\
    adds r1, 0x1\n\
    cmp r1, r3\n\
    bge _08134942\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, r2\n\
    bne _08134934\n\
_08134942:\n\
    mov r3, r8\n\
    ldrh r0, [r3]\n\
    subs r0, 0x1\n\
    ldr r4, _08134958 @ =gSaveBlock2\n\
    cmp r1, r0\n\
    bne _081348F2\n\
    b _081349B6\n\
    .align 2, 0\n\
_08134950: .4byte 0x0000056a\n\
_08134954: .4byte 0x0000055c\n\
_08134958: .4byte gSaveBlock2\n\
_0813495C:\n\
    movs r2, 0xAB\n\
    lsls r2, 3\n\
    adds r0, r5, r2\n\
    adds r6, r7, r0\n\
    ldr r3, _081349EC @ =0x0000056a\n\
    adds r3, r5\n\
    mov r8, r3\n\
    adds r5, r6, 0\n\
_0813496C:\n\
    bl Random\n\
    movs r1, 0xFF\n\
    ands r1, r0\n\
    lsls r0, r1, 4\n\
    subs r0, r1\n\
    lsls r0, 1\n\
    asrs r0, 8\n\
    adds r0, 0x46\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    movs r1, 0\n\
    ldrh r0, [r6]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    bge _081349AC\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    ldr r4, _081349F0 @ =gSaveBlock2\n\
    cmp r0, r2\n\
    beq _081349AC\n\
    ldrh r0, [r5]\n\
    subs r3, r0, 0x1\n\
    ldr r0, _081349EC @ =0x0000056a\n\
    adds r4, r0\n\
_0813499E:\n\
    adds r1, 0x1\n\
    cmp r1, r3\n\
    bge _081349AC\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, r2\n\
    bne _0813499E\n\
_081349AC:\n\
    ldrh r0, [r6]\n\
    subs r0, 0x1\n\
    ldr r4, _081349F0 @ =gSaveBlock2\n\
    cmp r1, r0\n\
    bne _0813496C\n\
_081349B6:\n\
    ldr r1, _081349F4 @ =0x00000564\n\
    adds r0, r4, r1\n\
    strb r2, [r0]\n\
    ldr r2, _081349F4 @ =0x00000564\n\
    adds r5, r4, r2\n\
    ldrb r0, [r5]\n\
    bl sub_81349FC\n\
    movs r3, 0xAB\n\
    lsls r3, 3\n\
    adds r0, r4, r3\n\
    adds r1, r7, r0\n\
    ldrh r0, [r1]\n\
    cmp r0, 0x6\n\
    bhi _081349DE\n\
    adds r0, r4, r0\n\
    ldr r1, _081349F8 @ =0x00000569\n\
    adds r0, r1\n\
    ldrb r1, [r5]\n\
_081349DC:\n\
    strb r1, [r0]\n\
_081349DE:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_081349EC: .4byte 0x0000056a\n\
_081349F0: .4byte gSaveBlock2\n\
_081349F4: .4byte 0x00000564\n\
_081349F8: .4byte 0x00000569\n\
.syntax divided\n");
}

void sub_81349FC(u8 trainerIndex)
{
	u32 i;
	u8 trainerClass;

	if (trainerIndex < 100)
	{
		trainerClass = gBattleTowerTrainers[trainerIndex].trainerClass;
	}
	else if (trainerIndex < 200)
	{
		trainerClass = gSaveBlock2.filler_A8.var_14C[trainerIndex - 100].trainerClass;
	}
	else
	{
		trainerClass = gSaveBlock2.filler_A8.ereaderTrainer.trainerClass;
	}

	for (i = 0; i < 30 && gUnknown_08405E60[i] != trainerClass; i++);
	if (i != 30)
	{
		u8 trainerObjectGfxId = gUnknown_08405E92[i];
		VarSet(0x4010, trainerObjectGfxId);
		return;
	}

	for (i = 0; i < 20 && gUnknown_08405E7E[i] != trainerClass; i++);
	if (i != 20)
	{
		u8 trainerObjectGfxId = gUnknown_08405EB0[i];
		VarSet(0x4010, trainerObjectGfxId);
		return;
	}

	VarSet(0x4010, MAP_OBJ_GFX_BOY_1);
}

void sub_8134AB4()
{
	sub_81349FC(200);
}

// void sub_8134AC0(struct BattleTowerRecord *record)
// {
// 	u16 var1[5];
// 	u16 var2[5];
// 	s32 i, j, k;
// 	s16 l = 0;

// 	for (i = 0; i < 5; i++)
// 	{
// 		k = 0;
// 		for (j = 0; j < 4 && gSaveBlock2.filler_A8.var_14C[i].var_C[i] != record->var_C[j]; j++);
// 		if (j == 4)
// 		{
// 			for (k = 0; k < 7 && gSaveBlock2.filler_A8.var_14C[i].var_8 == record->var_8; k++)
// 			{
// 				if (record->var_8 == 0xFF)
// 				{
// 					k = 7;
// 					break;
// 				}
// 			}
// 		}

// 		if (k == 7)
// 		{
// 			break;
// 		}
// 	}

// 	if (i < 5)
// 	{
// 		gSaveBlock2.filler_A8.var_14C[i] = *record;
// 		return;
// 	}

// 	i = 0;
// 	while (i < 5)
// 	{
// 		if (gSaveBlock2.filler_A8.var_14C[i].var_2 == 0)
// 		{
// 			if (i > 4)
// 			{
// 				break;
// 			}

// 			gSaveBlock2.filler_A8.var_14C[i] = *record;
// 			return;
// 		}

// 		i++;
// 	}

// 	var1[0] = gSaveBlock2.filler_A8.var_14C[0].var_2;
// 	var2[0] = 0;
// 	l++;

// 	for (i = 1; i < 5; i++)
// 	{
// 		for (j = 0; gSaveBlock2.filler_A8.var_14C[i].var_2 <= var1[0] && j < l; j++)
// 		{
// 			if (gSaveBlock2.filler_A8.var_14C[i].var_2 < var1[0])
// 			{
// 				j = 0;
// 				l = 1;
// 				var1[0] = gSaveBlock2.filler_A8.var_14C[i].var_2;
// 				var2[0] = i;
// 				break;
// 			}
// 		}

// 		if (j == l)
// 		{
// 			var1[l] = gSaveBlock2.filler_A8.var_14C[i].var_2;
// 			var2[l] = i;
// 			l++;
// 		}
// 	}

// 	gSaveBlock2.filler_A8.var_14C[var2[(Random() % l)]] = *record;
// }

__attribute__((naked))
void sub_8134AC0(struct BattleTowerRecord *record)
{
	asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x1C\n\
    movs r7, 0\n\
    mov r8, r0\n\
    movs r5, 0\n\
    ldr r0, _08134B3C @ =gSaveBlock2\n\
    mov r12, r0\n\
    mov r1, r8\n\
    ldrb r1, [r1, 0xC]\n\
    str r1, [sp, 0x18]\n\
    movs r2, 0xAA\n\
    lsls r2, 1\n\
    add r2, r12\n\
    mov r10, r2\n\
    mov r9, r5\n\
_08134AE6:\n\
    movs r6, 0\n\
    movs r3, 0\n\
    ldr r0, _08134B40 @ =gSaveBlock2 + 0x158\n\
    add r0, r9\n\
    ldrb r0, [r0]\n\
    ldr r1, [sp, 0x18]\n\
    cmp r0, r1\n\
    bne _08134B14\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    ldr r1, _08134B40 @ =gSaveBlock2 + 0x158\n\
    adds r2, r0, r1\n\
    mov r4, r8\n\
    adds r4, 0xC\n\
_08134B02:\n\
    adds r2, 0x1\n\
    adds r3, 0x1\n\
    cmp r3, 0x3\n\
    bgt _08134B14\n\
    adds r1, r4, r3\n\
    ldrb r0, [r2]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    beq _08134B02\n\
_08134B14:\n\
    cmp r3, 0x4\n\
    bne _08134B54\n\
    movs r6, 0\n\
    mov r2, r10\n\
    ldrb r0, [r2]\n\
    mov r3, r8\n\
    ldrb r3, [r3, 0x8]\n\
    cmp r0, r3\n\
    bne _08134B54\n\
    adds r1, r0, 0\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    adds r0, 0x4\n\
    ldr r3, _08134B44 @ =gSaveBlock2 + 0x150\n\
    adds r2, r0, r3\n\
_08134B32:\n\
    cmp r1, 0xFF\n\
    bne _08134B48\n\
    movs r6, 0x7\n\
    b _08134B54\n\
    .align 2, 0\n\
_08134B3C: .4byte gSaveBlock2\n\
_08134B40: .4byte gSaveBlock2 + 0x158\n\
_08134B44: .4byte gSaveBlock2 + 0x150\n\
_08134B48:\n\
    adds r6, 0x1\n\
    cmp r6, 0x6\n\
    bgt _08134B54\n\
    ldrb r0, [r2]\n\
    cmp r0, r1\n\
    beq _08134B32\n\
_08134B54:\n\
    cmp r6, 0x7\n\
    beq _08134B64\n\
    movs r0, 0xA4\n\
    add r10, r0\n\
    add r9, r0\n\
    adds r5, 0x1\n\
    cmp r5, 0x4\n\
    ble _08134AE6\n\
\n\
_08134B64:\n\
    cmp r5, 0x4\n\
    bgt _08134B76\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    add r0, r12\n\
    movs r1, 0xA6\n\
    lsls r1, 1\n\
    adds r0, r1\n\
    b _08134B9E\n\
_08134B76:\n\
    movs r5, 0\n\
    movs r1, 0xA7\n\
    lsls r1, 1\n\
    add r1, r12\n\
    b _08134B88\n\
_08134B80:\n\
    adds r1, 0xA4\n\
    adds r5, 0x1\n\
    cmp r5, 0x4\n\
    bgt _08134BA8\n\
_08134B88:\n\
    ldrh r0, [r1]\n\
    cmp r0, 0\n\
    bne _08134B80\n\
    cmp r5, 0x4\n\
    bgt _08134BA8\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    add r0, r12\n\
    movs r2, 0xA6\n\
    lsls r2, 1\n\
    adds r0, r2\n\
_08134B9E:\n\
    mov r1, r8\n\
    movs r2, 0xA4\n\
    bl memcpy\n\
    b _08134C5E\n\
\n\
_08134BA8:\n\
    mov r2, sp\n\
    movs r3, 0xA7\n\
    lsls r3, 1\n\
    mov r1, r12\n\
    adds r0, r1, r3\n\
    ldrh r0, [r0]\n\
    movs r1, 0\n\
    strh r0, [r2]\n\
    add r0, sp, 0xC\n\
    strh r1, [r0]\n\
    adds r7, 0x1\n\
    movs r5, 0x1\n\
    add r2, sp, 0xC  @var2 = r2\n\
    mov r9, r2\n\
    mov r10, r3\n\
_08134BC6:\n\
    movs r3, 0\n\
    adds r0, r5, 0x1\n\
    mov r12, r0\n\
    cmp r3, r7\n\
    bge _08134C0A\n\
    movs r1, 0xA4\n\
    adds r0, r5, 0\n\
    muls r0, r1\n\
    ldr r2, _08134BFC @ =gSaveBlock2\n\
    adds r0, r2\n\
    mov r1, r10\n\
    adds r4, r0, r1\n\
    mov r6, sp\n\
_08134BE0:\n\
    lsls r0, r3, 1\n\
    add r0, sp\n\
    ldrh r2, [r4]\n\
    adds r1, r2, 0\n\
    ldrh r0, [r0]\n\
    cmp r1, r0\n\
    bcs _08134C00\n\
    movs r3, 0\n\
    movs r7, 0x1\n\
    strh r2, [r6]\n\
    mov r2, r9\n\
    strh r5, [r2]\n\
    b _08134C0A\n\
    .align 2, 0\n\
_08134BFC: .4byte gSaveBlock2\n\
_08134C00:\n\
    cmp r1, r0\n\
    bhi _08134C0A\n\
    adds r3, 0x1\n\
    cmp r3, r7\n\
    blt _08134BE0\n\
_08134C0A:\n\
    cmp r3, r7\n\
    bne _08134C2A\n\
    lsls r1, r7, 1\n\
    mov r3, sp\n\
    adds r2, r3, r1\n\
    movs r3, 0xA4\n\
    adds r0, r5, 0\n\
    muls r0, r3\n\
    ldr r3, _08134C70 @ =gSaveBlock2\n\
    adds r0, r3\n\
    add r0, r10\n\
    ldrh r0, [r0]\n\
    strh r0, [r2]\n\
    add r1, r9\n\
    strh r5, [r1]\n\
    adds r7, 0x1\n\
_08134C2A:\n\
    mov r5, r12\n\
    cmp r5, 0x4\n\
    ble _08134BC6\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    adds r1, r7, 0\n\
    bl __modsi3\n\
    adds r5, r0, 0\n\
    ldr r2, _08134C70 @ =gSaveBlock2\n\
    lsls r0, r5, 1\n\
    add r0, sp\n\
    adds r0, 0xC\n\
    ldrh r1, [r0]\n\
    movs r0, 0xA4\n\
    muls r0, r1\n\
    adds r0, r2\n\
    movs r1, 0xA6\n\
    lsls r1, 1\n\
    adds r0, r1\n\
    mov r1, r8\n\
    movs r2, 0xA4\n\
    bl memcpy\n\
_08134C5E:\n\
    add sp, 0x1C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08134C70: .4byte gSaveBlock2\n\
.syntax divided\n");
}

u8 get_trainer_class_pic_index(void)
{
	if (gSaveBlock2.filler_A8.battleTowerTrainerId == 200)
	{
		return gTrainerClassToPicIndex[gSaveBlock2.filler_A8.ereaderTrainer.trainerClass];
	}
	else if (gSaveBlock2.filler_A8.battleTowerTrainerId < 100)
	{
		return gTrainerClassToPicIndex[gBattleTowerTrainers[gSaveBlock2.filler_A8.battleTowerTrainerId].trainerClass];
	}
	else
	{
		return gTrainerClassToPicIndex[gSaveBlock2.filler_A8.var_14C[gSaveBlock2.filler_A8.battleTowerTrainerId - 100].trainerClass];
	}
}

u8 get_trainer_class_name_index(void)
{
	if (gSaveBlock2.filler_A8.battleTowerTrainerId == 200)
	{
		return gTrainerClassToNameIndex[gSaveBlock2.filler_A8.ereaderTrainer.trainerClass];
	}
	else if (gSaveBlock2.filler_A8.battleTowerTrainerId >= 100)
	{
		return gTrainerClassToNameIndex[gSaveBlock2.filler_A8.var_14C[gSaveBlock2.filler_A8.battleTowerTrainerId - 100].trainerClass];
	}
	else
	{
		return gTrainerClassToNameIndex[gBattleTowerTrainers[gSaveBlock2.filler_A8.battleTowerTrainerId].trainerClass];
	}
}

void get_trainer_name(u8* dest)
{
	s32 i;

	if (gSaveBlock2.filler_A8.battleTowerTrainerId == 200)
	{
		for (i = 0; i < 7; i++)
		{
			dest[i] = gSaveBlock2.filler_A8.ereaderTrainer.name[i];
		}
	}
	else if (gSaveBlock2.filler_A8.battleTowerTrainerId < 100)
	{
		for (i = 0; i < 7; i++)
		{
			dest[i] = gBattleTowerTrainers[gSaveBlock2.filler_A8.battleTowerTrainerId].name[i];
		}
	}
	else
	{
		for (i = 0; i < 7; i++)
		{
			dest[i] = gSaveBlock2.filler_A8.var_14C[gSaveBlock2.filler_A8.battleTowerTrainerId - 100].name[i];
		}
	}

	dest[i] = 0xFF;
}

__attribute__((naked))
void sub_8134DD4(void)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x28\n\
	movs r0, 0\n\
	str r0, [sp, 0x18]\n\
	movs r1, 0x3C\n\
	str r1, [sp, 0x1C]\n\
	add r4, sp, 0xC\n\
	movs r0, 0xFF\n\
	strb r0, [r4]\n\
	bl ZeroEnemyPartyMons\n\
	ldr r1, _08134E04 @ =gSaveBlock2\n\
	ldr r2, _08134E08 @ =0x00000564\n\
	adds r0, r1, r2\n\
	ldrb r0, [r0]\n\
	cmp r0, 0x13\n\
	bhi _08134E0C\n\
	movs r3, 0x6\n\
	str r3, [sp, 0x14]\n\
	b _08134ED8\n\
	.align 2, 0\n\
_08134E04: .4byte gSaveBlock2\n\
_08134E08: .4byte 0x00000564\n\
_08134E0C:\n\
	cmp r0, 0x1D\n\
	bhi _08134E1A\n\
	movs r0, 0x9\n\
	str r0, [sp, 0x14]\n\
	movs r1, 0x1E\n\
	str r1, [sp, 0x18]\n\
	b _08134ED8\n\
_08134E1A:\n\
	cmp r0, 0x27\n\
	bhi _08134E28\n\
	movs r2, 0xC\n\
	str r2, [sp, 0x14]\n\
	movs r3, 0x3C\n\
	str r3, [sp, 0x18]\n\
	b _08134ED8\n\
_08134E28:\n\
	cmp r0, 0x31\n\
	bhi _08134E36\n\
	movs r0, 0xF\n\
	str r0, [sp, 0x14]\n\
	movs r1, 0x5A\n\
	str r1, [sp, 0x18]\n\
	b _08134ED8\n\
_08134E36:\n\
	cmp r0, 0x3B\n\
	bhi _08134E44\n\
	movs r2, 0x12\n\
	str r2, [sp, 0x14]\n\
	movs r3, 0x78\n\
	str r3, [sp, 0x18]\n\
	b _08134ED8\n\
_08134E44:\n\
	cmp r0, 0x45\n\
	bhi _08134E52\n\
	movs r0, 0x15\n\
	str r0, [sp, 0x14]\n\
	movs r1, 0x96\n\
	str r1, [sp, 0x18]\n\
	b _08134ED8\n\
_08134E52:\n\
	cmp r0, 0x4F\n\
	bhi _08134E60\n\
	movs r2, 0x1F\n\
	str r2, [sp, 0x14]\n\
	movs r3, 0xB4\n\
	str r3, [sp, 0x18]\n\
	b _08134ED8\n\
_08134E60:\n\
	cmp r0, 0x63\n\
	bhi _08134E72\n\
	movs r0, 0x1F\n\
	str r0, [sp, 0x14]\n\
	movs r1, 0xC8\n\
	str r1, [sp, 0x18]\n\
	movs r2, 0x64\n\
	str r2, [sp, 0x1C]\n\
	b _08134ED8\n\
_08134E72:\n\
	cmp r0, 0xC8\n\
	bne _08134E9C\n\
	movs r6, 0\n\
_08134E78:\n\
	movs r0, 0x64\n\
	muls r0, r6\n\
	ldr r1, _08134E94 @ =gEnemyParty\n\
	adds r0, r1\n\
	movs r1, 0x2C\n\
	muls r1, r6\n\
	ldr r2, _08134E98 @ =gSaveBlock2 + 0x4CC\n\
	adds r1, r2\n\
	bl sub_803ADE8\n\
	adds r6, 0x1\n\
	cmp r6, 0x2\n\
	ble _08134E78\n\
	b _08135082\n\
	.align 2, 0\n\
_08134E94: .4byte gEnemyParty\n\
_08134E98: .4byte gSaveBlock2 + 0x4CC\n\
_08134E9C:\n\
	movs r6, 0\n\
	adds r4, r1, 0\n\
	ldr r3, _08134ECC @ =0xffffc158\n\
	adds r5, r4, r3\n\
_08134EA4:\n\
	movs r0, 0x64\n\
	muls r0, r6\n\
	ldr r1, _08134ED0 @ =gEnemyParty\n\
	adds r0, r1\n\
	ldr r2, _08134ED4 @ =0x00000564\n\
	adds r1, r4, r2\n\
	ldrb r2, [r1]\n\
	movs r1, 0xA4\n\
	muls r1, r2\n\
	adds r1, r5\n\
	movs r2, 0x2C\n\
	muls r2, r6\n\
	adds r1, r2\n\
	bl sub_803ADE8\n\
	adds r6, 0x1\n\
	cmp r6, 0x2\n\
	ble _08134EA4\n\
	b _08135082\n\
	.align 2, 0\n\
_08134ECC: .4byte 0xffffc158\n\
_08134ED0: .4byte gEnemyParty\n\
_08134ED4: .4byte 0x00000564\n\
_08134ED8:\n\
	ldr r2, _08134EF4 @ =gSaveBlock2\n\
	ldr r3, _08134EF8 @ =0x00000554\n\
	adds r0, r2, r3\n\
	ldrb r1, [r0]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	adds r1, r2, 0\n\
	cmp r0, 0\n\
	beq _08134F00\n\
	ldr r0, _08134EFC @ =gBattleTowerLevel100Mons\n\
	mov r10, r0\n\
	movs r2, 0x64\n\
	str r2, [sp, 0x10]\n\
	b _08134F08\n\
	.align 2, 0\n\
_08134EF4: .4byte gSaveBlock2\n\
_08134EF8: .4byte 0x00000554\n\
_08134EFC: .4byte gBattleTowerLevel100Mons\n\
_08134F00:\n\
	ldr r3, _08134F54 @ =gBattleTowerLevel50Mons\n\
	mov r10, r3\n\
	movs r0, 0x32\n\
	str r0, [sp, 0x10]\n\
_08134F08:\n\
	ldr r2, _08134F58 @ =gBattleTowerTrainers\n\
	ldr r3, _08134F5C @ =0x00000564\n\
	adds r0, r1, r3\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 1\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	adds r0, r2\n\
	ldrb r0, [r0, 0x9]\n\
	str r0, [sp, 0x20]\n\
	movs r6, 0\n\
_08134F1E:\n\
	bl Random\n\
	movs r1, 0xFF\n\
	ands r1, r0\n\
	ldr r2, [sp, 0x1C]\n\
	adds r0, r1, 0\n\
	muls r0, r2\n\
	asrs r0, 8\n\
	ldr r3, [sp, 0x18]\n\
	adds r7, r0, r3\n\
	ldr r0, [sp, 0x20]\n\
	cmp r0, 0\n\
	beq _08134F48\n\
	lsls r0, r7, 4\n\
	add r0, r10\n\
	ldrb r0, [r0, 0x3]\n\
	ldr r1, [sp, 0x20]\n\
	ands r0, r1\n\
	cmp r0, r1\n\
	beq _08134F48\n\
	b _0813507C\n\
_08134F48:\n\
	movs r5, 0\n\
	lsls r0, r7, 4\n\
	mov r2, r10\n\
	adds r3, r0, r2\n\
	movs r4, 0\n\
	b _08134F64\n\
	.align 2, 0\n\
_08134F54: .4byte gBattleTowerLevel50Mons\n\
_08134F58: .4byte gBattleTowerTrainers\n\
_08134F5C: .4byte 0x00000564\n\
_08134F60:\n\
	adds r4, 0x64\n\
	adds r5, 0x1\n\
_08134F64:\n\
	cmp r5, r6\n\
	bge _08134F7E\n\
	ldr r1, _08135094 @ =gEnemyParty\n\
	adds r0, r4, r1\n\
	movs r1, 0xB\n\
	movs r2, 0\n\
	str r3, [sp, 0x24]\n\
	bl GetMonData\n\
	ldr r3, [sp, 0x24]\n\
	ldrh r2, [r3]\n\
	cmp r0, r2\n\
	bne _08134F60\n\
_08134F7E:\n\
	cmp r5, r6\n\
	bne _0813507C\n\
	movs r5, 0\n\
	cmp r5, r6\n\
	bge _08134FCC\n\
	ldr r3, _08135098 @ =gBattleTowerHeldItems\n\
	mov r9, r3\n\
	lsls r0, r7, 4\n\
	add r0, r10\n\
	mov r8, r0\n\
	movs r3, 0\n\
_08134F94:\n\
	ldr r0, _08135094 @ =gEnemyParty\n\
	adds r4, r3, r0\n\
	adds r0, r4, 0\n\
	movs r1, 0xC\n\
	movs r2, 0\n\
	str r3, [sp, 0x24]\n\
	bl GetMonData\n\
	ldr r3, [sp, 0x24]\n\
	cmp r0, 0\n\
	beq _08134FC4\n\
	adds r0, r4, 0\n\
	movs r1, 0xC\n\
	movs r2, 0\n\
	bl GetMonData\n\
	mov r2, r8\n\
	ldrb r1, [r2, 0x2]\n\
	lsls r1, 1\n\
	add r1, r9\n\
	ldr r3, [sp, 0x24]\n\
	ldrh r1, [r1]\n\
	cmp r0, r1\n\
	beq _08134FCC\n\
_08134FC4:\n\
	adds r3, 0x64\n\
	adds r5, 0x1\n\
	cmp r5, r6\n\
	blt _08134F94\n\
_08134FCC:\n\
	cmp r5, r6\n\
	bne _0813507C\n\
	movs r5, 0\n\
	cmp r5, r6\n\
	bge _08134FEE\n\
	add r0, sp, 0x4\n\
	ldrh r0, [r0]\n\
	cmp r0, r7\n\
	beq _08134FEE\n\
	add r1, sp, 0x4\n\
_08134FE0:\n\
	adds r1, 0x2\n\
	adds r5, 0x1\n\
	cmp r5, r6\n\
	bge _08134FEE\n\
	ldrh r0, [r1]\n\
	cmp r0, r7\n\
	bne _08134FE0\n\
_08134FEE:\n\
	cmp r5, r6\n\
	bne _0813507C\n\
	lsls r0, r6, 1\n\
	add r0, sp\n\
	adds r0, 0x4\n\
	strh r7, [r0]\n\
	movs r3, 0x64\n\
	adds r0, r6, 0\n\
	muls r0, r3\n\
	ldr r1, _08135094 @ =gEnemyParty\n\
	adds r0, r1\n\
	lsls r4, r7, 4\n\
	mov r3, r10\n\
	adds r2, r4, r3\n\
	ldrh r1, [r2]\n\
	ldrb r2, [r2, 0xC]\n\
	str r2, [sp]\n\
	ldr r2, [sp, 0x10]\n\
	ldr r3, [sp, 0x14]\n\
	bl CreateMonWithEVSpread\n\
	movs r5, 0\n\
	adds r0, r6, 0x1\n\
	mov r9, r0\n\
	mov r8, r4\n\
	movs r0, 0x64\n\
	adds r7, r6, 0\n\
	muls r7, r0\n\
	mov r0, r10\n\
	adds r0, 0x4\n\
	adds r4, r0\n\
	ldr r3, _08135094 @ =gEnemyParty\n\
_0813502E:\n\
	ldrh r1, [r4]\n\
	lsls r2, r5, 24\n\
	lsrs r2, 24\n\
	adds r0, r7, r3\n\
	str r3, [sp, 0x24]\n\
	bl SetMonMoveSlot\n\
	ldrh r0, [r4]\n\
	ldr r3, [sp, 0x24]\n\
	cmp r0, 0xDA\n\
	bne _0813504A\n\
	movs r0, 0\n\
	mov r1, sp\n\
	strb r0, [r1, 0xC]\n\
_0813504A:\n\
	adds r4, 0x2\n\
	adds r5, 0x1\n\
	cmp r5, 0x3\n\
	ble _0813502E\n\
	movs r2, 0x64\n\
	adds r4, r6, 0\n\
	muls r4, r2\n\
	ldr r3, _08135094 @ =gEnemyParty\n\
	adds r4, r3\n\
	adds r0, r4, 0\n\
	movs r1, 0x20\n\
	add r2, sp, 0xC\n\
	bl SetMonData\n\
	mov r0, r8\n\
	add r0, r10\n\
	ldrb r2, [r0, 0x2]\n\
	lsls r2, 1\n\
	ldr r0, _08135098 @ =gBattleTowerHeldItems\n\
	adds r2, r0\n\
	adds r0, r4, 0\n\
	movs r1, 0xC\n\
	bl SetMonData\n\
	mov r6, r9\n\
_0813507C:\n\
	cmp r6, 0x3\n\
	beq _08135082\n\
	b _08134F1E\n\
_08135082:\n\
	add sp, 0x28\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08135094: .4byte gEnemyParty\n\
_08135098: .4byte gBattleTowerHeldItems\n\
.syntax divided\n");
}

u32 CountBattleTowerBanlistCaught()
{
	s32 i;
	u32 numCaught = 0;

	for (i = 0; gBattleTowerBanlist[i] != 0xFFFF; i++)
	{
		if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleTowerBanlist[i]), FLAG_GET_CAUGHT))
		{
			numCaught++;
		}
	}

	return numCaught;
}

u8 AppendBattleTowerBannedSpeciesName(u16 species, u8 curIndexToAppend, s32 numToAppend)
{
	if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
	{
		curIndexToAppend++;

		switch (curIndexToAppend - 1)
		{
		case 0:
		case 2:
		case 4:
		case 6:
		case 8:
		case 10:
			if (numToAppend == curIndexToAppend)
			{
				StringAppend(gStringVar1, gUnknown_08400E23);
			}
			else if (numToAppend > curIndexToAppend)
			{
				StringAppend(gStringVar1, gUnknown_08400E29);
			}
			break;
		case 1:
			if (curIndexToAppend == numToAppend)
			{
				StringAppend(gStringVar1, gUnknown_08400E23);
			}
			else
			{
				StringAppend(gStringVar1, gUnknown_08400E29);
			}

			StringAppend(gStringVar1, gUnknown_08400E30);
			break;
		case 3:
		case 5:
		case 7:
		case 9:
		default:
			if (curIndexToAppend == numToAppend)
			{
				StringAppend(gStringVar1, gUnknown_08400E23);
			}
			else
			{
				StringAppend(gStringVar1, gUnknown_08400E29);
			}

			StringAppend(gStringVar1, gUnknown_08400E2E);
			break;
		}

		StringAppend(gStringVar1, gSpeciesNames[species]);
	}

	return curIndexToAppend;
}

__attribute__((naked))
void CheckMonBattleTowerBanlist()
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r2, [sp, 0x20]\n\
    ldr r4, [sp, 0x24]\n\
    mov r9, r4\n\
    ldr r4, [sp, 0x28]\n\
    mov r10, r4\n\
    ldr r7, [sp, 0x2C]\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    lsls r1, 16\n\
    lsrs r6, r1, 16\n\
    lsls r3, 24\n\
    lsrs r3, 24\n\
    mov r12, r3\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    mov r8, r2\n\
    movs r2, 0\n\
    movs r0, 0xCE\n\
    lsls r0, 1\n\
    cmp r4, r0\n\
    beq _081352CE\n\
    cmp r4, 0\n\
    beq _081352CE\n\
    ldr r0, _081352DC @ =gBattleTowerBanlist\n\
    ldrh r1, [r0]\n\
    ldr r5, _081352E0 @ =0x0000ffff\n\
    adds r3, r0, 0\n\
    cmp r1, r5\n\
    beq _08135264\n\
    cmp r1, r4\n\
    beq _08135258\n\
    adds r1, r3, 0\n\
_0813524A:\n\
    adds r1, 0x2\n\
    adds r2, 0x1\n\
    ldrh r0, [r1]\n\
    cmp r0, r5\n\
    beq _08135264\n\
    cmp r0, r4\n\
    bne _0813524A\n\
_08135258:\n\
    lsls r0, r2, 1\n\
    adds r0, r3\n\
    ldrh r1, [r0]\n\
    ldr r0, _081352E0 @ =0x0000ffff\n\
    cmp r1, r0\n\
    bne _081352CE\n\
_08135264:\n\
    mov r0, r12\n\
    cmp r0, 0\n\
    bne _08135270\n\
    mov r1, r8\n\
    cmp r1, 0x32\n\
    bhi _081352CE\n\
_08135270:\n\
    movs r2, 0\n\
    ldrb r3, [r7]\n\
    cmp r2, r3\n\
    bge _08135290\n\
    mov r1, r9\n\
    ldrh r0, [r1]\n\
    cmp r0, r4\n\
    beq _08135290\n\
    adds r5, r3, 0\n\
_08135282:\n\
    adds r1, 0x2\n\
    adds r2, 0x1\n\
    cmp r2, r5\n\
    bge _08135290\n\
    ldrh r0, [r1]\n\
    cmp r0, r4\n\
    bne _08135282\n\
_08135290:\n\
    cmp r2, r3\n\
    bne _081352CE\n\
    cmp r6, 0\n\
    beq _081352BA\n\
    movs r2, 0\n\
    cmp r2, r3\n\
    bge _081352B6\n\
    mov r1, r10\n\
    ldrh r0, [r1]\n\
    cmp r0, r6\n\
    beq _081352B6\n\
    adds r5, r3, 0\n\
_081352A8:\n\
    adds r1, 0x2\n\
    adds r2, 0x1\n\
    cmp r2, r5\n\
    bge _081352B6\n\
    ldrh r0, [r1]\n\
    cmp r0, r6\n\
    bne _081352A8\n\
_081352B6:\n\
    cmp r2, r3\n\
    bne _081352CE\n\
_081352BA:\n\
    lsls r0, r3, 1\n\
    add r0, r9\n\
    strh r4, [r0]\n\
    ldrb r0, [r7]\n\
    lsls r0, 1\n\
    add r0, r10\n\
    strh r6, [r0]\n\
    ldrb r0, [r7]\n\
    adds r0, 0x1\n\
    strb r0, [r7]\n\
_081352CE:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_081352DC: .4byte gBattleTowerBanlist\n\
_081352E0: .4byte 0x0000ffff\n\
.syntax divided\n");
}

__attribute__((naked))
void CheckPartyBattleTowerBanlist()
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x2C\n\
    add r1, sp, 0x28\n\
    movs r0, 0\n\
    strb r0, [r1]\n\
    movs r7, 0\n\
    mov r9, r1\n\
    add r0, sp, 0x1C\n\
    mov r10, r0\n\
_081352FE:\n\
    movs r0, 0x64\n\
    adds r5, r7, 0\n\
    muls r5, r0\n\
    ldr r0, _081353C4 @ =gPlayerParty\n\
    adds r5, r0\n\
    adds r0, r5, 0\n\
    movs r1, 0x41\n\
    bl GetMonData\n\
    mov r8, r0\n\
    mov r1, r8\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    mov r8, r1\n\
    adds r0, r5, 0\n\
    movs r1, 0xC\n\
    bl GetMonData\n\
    adds r6, r0, 0\n\
    lsls r6, 16\n\
    lsrs r6, 16\n\
    adds r0, r5, 0\n\
    movs r1, 0x38\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    adds r0, r5, 0\n\
    movs r1, 0x39\n\
    bl GetMonData\n\
    adds r2, r0, 0\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    ldr r5, _081353C8 @ =gScriptResult\n\
    ldrb r3, [r5]\n\
    str r4, [sp]\n\
    add r0, sp, 0x10\n\
    str r0, [sp, 0x4]\n\
    mov r1, r10\n\
    str r1, [sp, 0x8]\n\
    mov r0, r9\n\
    str r0, [sp, 0xC]\n\
    mov r0, r8\n\
    adds r1, r6, 0\n\
    bl CheckMonBattleTowerBanlist\n\
    adds r7, 0x1\n\
    cmp r7, 0x5\n\
    ble _081352FE\n\
    mov r1, r9\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x2\n\
    bhi _08135420\n\
    ldr r1, _081353CC @ =gStringVar1\n\
    movs r0, 0xFF\n\
    strb r0, [r1]\n\
    ldr r1, _081353D0 @ =gSpecialVar_0x8004\n\
    movs r0, 0x1\n\
    strh r0, [r1]\n\
    movs r0, 0\n\
    mov r1, r9\n\
    strb r0, [r1]\n\
    bl CountBattleTowerBanlistCaught\n\
    adds r6, r0, 0\n\
    ldr r2, _081353D4 @ =gBattleTowerBanlist\n\
    ldrh r0, [r2]\n\
    ldr r1, _081353D8 @ =0x0000ffff\n\
    cmp r0, r1\n\
    beq _081353A8\n\
    mov r5, r9\n\
    adds r7, r1, 0\n\
    adds r4, r2, 0\n\
_08135394:\n\
    ldrh r0, [r4]\n\
    ldrb r1, [r5]\n\
    adds r2, r6, 0\n\
    bl AppendBattleTowerBannedSpeciesName\n\
    strb r0, [r5]\n\
    adds r4, 0x2\n\
    ldrh r0, [r4]\n\
    cmp r0, r7\n\
    bne _08135394\n\
_081353A8:\n\
    mov r0, r9\n\
    ldrb r1, [r0]\n\
    cmp r1, 0\n\
    bne _081353E4\n\
    ldr r4, _081353CC @ =gStringVar1\n\
    ldr r1, _081353DC @ =gUnknown_08400E2C\n\
    adds r0, r4, 0\n\
    bl StringAppend\n\
    ldr r1, _081353E0 @ =gUnknown_08400E32\n\
    adds r0, r4, 0\n\
    bl StringAppend\n\
    b _0813543E\n\
    .align 2, 0\n\
_081353C4: .4byte gPlayerParty\n\
_081353C8: .4byte gScriptResult\n\
_081353CC: .4byte gStringVar1\n\
_081353D0: .4byte gSpecialVar_0x8004\n\
_081353D4: .4byte gBattleTowerBanlist\n\
_081353D8: .4byte 0x0000ffff\n\
_081353DC: .4byte gUnknown_08400E2C\n\
_081353E0: .4byte gUnknown_08400E32\n\
_081353E4:\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08135400\n\
    ldr r0, _081353F8 @ =gStringVar1\n\
    ldr r1, _081353FC @ =gUnknown_08400E2E\n\
    bl StringAppend\n\
    b _08135408\n\
    .align 2, 0\n\
_081353F8: .4byte gStringVar1\n\
_081353FC: .4byte gUnknown_08400E2E\n\
_08135400:\n\
    ldr r0, _08135414 @ =gStringVar1\n\
    ldr r1, _08135418 @ =gUnknown_08400E2C\n\
    bl StringAppend\n\
_08135408:\n\
    ldr r0, _08135414 @ =gStringVar1\n\
    ldr r1, _0813541C @ =gUnknown_08400E36\n\
    bl StringAppend\n\
    b _0813543E\n\
    .align 2, 0\n\
_08135414: .4byte gStringVar1\n\
_08135418: .4byte gUnknown_08400E2C\n\
_0813541C: .4byte gUnknown_08400E36\n\
_08135420:\n\
    ldr r1, _08135450 @ =gSpecialVar_0x8004\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    ldr r2, _08135454 @ =gSaveBlock2\n\
    ldrb r0, [r5]\n\
    ldr r1, _08135458 @ =0x00000554\n\
    adds r2, r1\n\
    movs r1, 0x1\n\
    ands r1, r0\n\
    ldrb r3, [r2]\n\
    movs r0, 0x2\n\
    negs r0, r0\n\
    ands r0, r3\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
_0813543E:\n\
    add sp, 0x2C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08135450: .4byte gSpecialVar_0x8004\n\
_08135454: .4byte gSaveBlock2\n\
_08135458: .4byte 0x00000554\n\
.syntax divided\n");
}

void sub_813545C(u16 *easyChat)
{
	sub_80EB544(gStringVar4, easyChat, 2, 3);
}

void sub_8135474(void)
{
	if (gSaveBlock2.filler_A8.battleTowerTrainerId == 200)
	{
		sub_813545C(gSaveBlock2.filler_A8.ereaderTrainer.greeting.easyChat);
	}
	else if (gSaveBlock2.filler_A8.battleTowerTrainerId < 100)
	{
		sub_813545C((u16 *)gBattleTowerTrainers[gSaveBlock2.filler_A8.battleTowerTrainerId].greeting.easyChat);
	}
	else
	{
		sub_813545C(gSaveBlock2.filler_A8.var_14C[gSaveBlock2.filler_A8.battleTowerTrainerId - 100].greeting.easyChat);
	}
}

void sub_81354CC(void)
{
	s32 i;
	u16 heldItem;

	switch (gSpecialVar_0x8004)
	{
	case 0:
		break;
	case 1:
		for (i = 0; i < PARTY_SIZE; i++)
		{
			heldItem = GetMonData(&gSaveBlock1.playerParty[i], MON_DATA_HELD_ITEM);
			SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, (u8 *)&heldItem);
		}
		break;
	case 2:
		sub_81360D0();
		break;
	}

	SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void sub_8135534(u8 taskId)
{
	if (IsBattleTransitionDone() == TRUE)
	{
		gMain.savedCallback = sub_81354CC;
		SetMainCallback2(sub_800E7C4);
		DestroyTask(taskId);
	}
}

void sub_813556C(void)
{
	s32 i;
	u16 heldItem;
	u8 transition;

	switch (gSpecialVar_0x8004)
	{
	case 0:
		gBattleTypeFlags = (BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_TRAINER);
		gTrainerBattleOpponent = 0;

		sub_8134DD4();

		CreateTask(sub_8135534, 1);
		current_map_music_set__default_for_battle(0);
		transition = BattleSetup_GetBattleTowerBattleTransition();
		BattleTransition_StartOnField(transition);
		break;
	case 1:
		for (i = 0; i < PARTY_SIZE; i++)
		{
			heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
			SetMonData(&gSaveBlock1.playerParty[i], MON_DATA_HELD_ITEM, (u8 *)&heldItem);
		}

		CreateTask(sub_8135534, 1);
		current_map_music_set__default_for_battle(0);
		transition = BattleSetup_GetBattleTowerBattleTransition();
		BattleTransition_StartOnField(transition);
		break;
	case 2:
		ZeroEnemyPartyMons();

		for (i = 0; i < 3; i++)
		{
			sub_803ADE8(&gEnemyParty[i], &gSaveBlock2.filler_A8.ereaderTrainer.party[i]);
		}

		gBattleTypeFlags = (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_TRAINER);
		gTrainerBattleOpponent = 0;

		CreateTask(sub_8135534, 1);
		current_map_music_set__default_for_battle(0);
		transition = BattleSetup_GetBattleTowerBattleTransition();
		BattleTransition_StartOnField(transition);
		break;
	}
}

void sub_8135668(void)
{
	s32 i;
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;

	switch (gSpecialVar_0x8004)
	{
	case 0:
		ewram160FB = gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType];
		gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType] = gSpecialVar_0x8005;
		break;
	case 1:
		gSaveBlock2.filler_A8.battleTowerLevelType = gSpecialVar_0x8005;
		break;
	case 2:
		gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType] = gSpecialVar_0x8005;
		break;
	case 3:
		gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType] = gSpecialVar_0x8005;
		break;
	case 4:
		gSaveBlock2.filler_A8.battleTowerTrainerId = gSpecialVar_0x8005;
		break;
	case 5:
		for (i = 0; i < 3; i++)
		{
			gSaveBlock2.filler_A8.var_4BD[i] = gSelectedOrderFromParty[i];
		}
		break;
	case 6:
		if (gSaveBlock2.filler_A8.battleTowerTrainerId == 200)
		{
			sub_81360AC(&gSaveBlock2.filler_A8.ereaderTrainer);
		}

		if (gSaveBlock2.filler_A8.totalBattleTowerWins < 9999)
		{
			gSaveBlock2.filler_A8.totalBattleTowerWins++;
		}

		gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType]++;
		sub_8135A3C();
		gScriptResult = gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType];

		gStringVar1[0] = gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType] + 0xA1;
		gStringVar1[1] = 0xFF;
		break;
	case 7:
		if (gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType] < 1430)
		{
			gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType]++;
		}

		sub_8135A3C();
		gScriptResult = gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType];
		break;
	case 8:
		gSaveBlock2.filler_A8.unk_554 = gSpecialVar_0x8005;
		break;
	case 9:
		break;
	case 10:
		SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2.filler_A8.bestBattleTowerWinStreak);
		break;
	case 11:
		if (gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType] != 3)
		{
			sub_813461C(battleTowerLevelType);
		}
		break;
	case 12:
		gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType] = ewram160FB;
		break;
	case 13:
		gSaveBlock2.filler_A8.currentWinStreaks[battleTowerLevelType] = sub_8135D3C(battleTowerLevelType);
		break;
	case 14:
		gSaveBlock2.filler_A8.lastStreakLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;
		break;
	}
}

void sub_81358A4(void)
{
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;

	switch (gSpecialVar_0x8004)
	{
	case 0:
		gScriptResult = gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType];
		break;
	case 1:
		gScriptResult = gSaveBlock2.filler_A8.battleTowerLevelType;
		break;
	case 2:
		gScriptResult = gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType];
		break;
	case 3:
		gScriptResult = gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType];
		break;
	case 4:
		gScriptResult = gSaveBlock2.filler_A8.battleTowerTrainerId;
		break;
	case 5:
	case 6:
	case 7:
		break;
	case 8:
		gScriptResult = gSaveBlock2.filler_A8.unk_554;
		break;
	case 9:
		gScriptResult = sub_8135D3C(battleTowerLevelType);
		break;
	case 10:
		SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2.filler_A8.bestBattleTowerWinStreak);
		break;
	case 11:
		sub_813461C(battleTowerLevelType);
		break;
	case 12:
		gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType] = ewram160FB;
		break;
	case 13:
		gSaveBlock2.filler_A8.currentWinStreaks[battleTowerLevelType] = sub_8135D3C(battleTowerLevelType);
		break;
	case 14:
		gSaveBlock2.filler_A8.lastStreakLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;
		break;
	}
}

void sub_8135A14(void)
{
	s32 i;

	for (i = 0; i < 3; i++)
	{
		gSelectedOrderFromParty[i] = gSaveBlock2.filler_A8.var_4BD[i];
	}

	ReducePlayerPartyToThree();
}

#ifdef NONMATCHING
void sub_8135A3C(void)
{
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;
	u16 winStreak = sub_8135D3C(battleTowerLevelType);
	if (gSaveBlock2.filler_A8.recordWinStreaks[battleTowerLevelType] < winStreak)
	{
		gSaveBlock2.filler_A8.recordWinStreaks[battleTowerLevelType] = winStreak;
	}

	if (gSaveBlock2.filler_A8.recordWinStreaks[0] > gSaveBlock2.filler_A8.recordWinStreaks[1])
	{
		SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2.filler_A8.recordWinStreaks[0]);
		if (gSaveBlock2.filler_A8.recordWinStreaks[0] > 9999)
		{
			gSaveBlock2.filler_A8.bestBattleTowerWinStreak = 9999;
		}
		else
		{
			gSaveBlock2.filler_A8.bestBattleTowerWinStreak = gSaveBlock2.filler_A8.recordWinStreaks[0];
		}
	}
	else
	{
		SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2.filler_A8.recordWinStreaks[1]);
		if (gSaveBlock2.filler_A8.recordWinStreaks[1] > 9999)
		{
			gSaveBlock2.filler_A8.bestBattleTowerWinStreak = 9999;
		}
		else
		{
			gSaveBlock2.filler_A8.bestBattleTowerWinStreak = gSaveBlock2.filler_A8.recordWinStreaks[1];
		}
	}
}
#else
__attribute__((naked))
void sub_8135A3C(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r6, _08135A84 @ =gSaveBlock2\n\
    ldr r1, _08135A88 @ =0x00000554\n\
    adds r0, r6, r1\n\
    ldrb r4, [r0]\n\
    lsls r4, 31\n\
    lsrs r4, 31\n\
    adds r0, r4, 0\n\
    bl sub_8135D3C\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    lsls r4, 1\n\
    movs r3, 0xAC\n\
    lsls r3, 3\n\
    adds r2, r6, r3\n\
    adds r4, r2\n\
    ldrh r0, [r4]\n\
    cmp r0, r5\n\
    bcs _08135A66\n\
    strh r5, [r4]\n\
_08135A66:\n\
    ldr r0, _08135A8C @ =0x00000562\n\
    adds r1, r6, r0\n\
    ldrh r0, [r2]\n\
    ldrh r3, [r1]\n\
    cmp r0, r3\n\
    bls _08135A94\n\
    adds r5, r0, 0\n\
    movs r0, 0x20\n\
    adds r1, r5, 0\n\
    bl SetGameStat\n\
    ldr r1, _08135A90 @ =0x0000270f\n\
    cmp r5, r1\n\
    bhi _08135AA4\n\
    b _08135AB4\n\
    .align 2, 0\n\
_08135A84: .4byte gSaveBlock2\n\
_08135A88: .4byte 0x00000554\n\
_08135A8C: .4byte 0x00000562\n\
_08135A90: .4byte 0x0000270f\n\
_08135A94:\n\
    ldrh r5, [r1]\n\
    movs r0, 0x20\n\
    adds r1, r5, 0\n\
    bl SetGameStat\n\
    ldr r1, _08135AAC @ =0x0000270f\n\
    cmp r5, r1\n\
    bls _08135AB4\n\
_08135AA4:\n\
    ldr r2, _08135AB0 @ =0x00000572\n\
    adds r0, r6, r2\n\
    strh r1, [r0]\n\
    b _08135ABA\n\
    .align 2, 0\n\
_08135AAC: .4byte 0x0000270f\n\
_08135AB0: .4byte 0x00000572\n\
_08135AB4:\n\
    ldr r3, _08135AC0 @ =0x00000572\n\
    adds r0, r6, r3\n\
    strh r5, [r0]\n\
_08135ABA:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08135AC0: .4byte 0x00000572\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_8135AC4(void)
{
	s32 i;
	u8 trainerClass;
	struct BattleTowerRecord *playerRecord = &gSaveBlock2.filler_A8.var_A8;
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;

	if (gSaveBlock2.playerGender != 0)
	{
		trainerClass = gUnknown_08405E7E[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
								  + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 20u];
	}
	else
	{
		trainerClass = gUnknown_08405E60[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
								  + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 30u];
	}

	playerRecord->var_0 = battleTowerLevelType;
	playerRecord->trainerClass = trainerClass;

	copy_word_to_mem(playerRecord->trainerId, gSaveBlock2.playerTrainerId);
	StringCopy8(playerRecord->name, gSaveBlock2.playerName);

	playerRecord->var_2 = sub_8135D3C(battleTowerLevelType);

	for (i = 0; i < 6; i++)
	{
		playerRecord->greeting.easyChat[i] = gSaveBlock1.easyChats.unk2B28[i];
	}

	for (i = 0; i < 3; i++)
	{
		sub_803AF78(&gUnknown_030042FC[gSaveBlock2.filler_A8.var_4BD[i]], &playerRecord->party[i]);
	}

	SetBattleTowerRecordChecksum(&gSaveBlock2.filler_A8.var_A8);
	sub_8135A3C();
}

void sub_8135BA0(void)
{
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;

	if (gSpecialVar_0x8004 == 3 || gSpecialVar_0x8004 == 0)
	{
		if (gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType] > 1
			|| gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType] > 1)
		{
			sub_8135AC4();
		}
	}

	sub_8135CFC();

	gSaveBlock2.filler_A8.var_4AD = gBattleOutcome;

	if (gSpecialVar_0x8004 != 3)
	{
		gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType] = gSpecialVar_0x8004;
	}

	VarSet(VAR_0x4000, 0);
	gSaveBlock2.filler_A8.unk_554 = 1;
	TrySavingData(EREADER_SAVE);
}

void sub_8135C38(void)
{
	DoSoftReset();
}

void ValidateBattleTowerRecordChecksums(void)
{
	u32 i;
	s32 recordIndex;
	struct BattleTowerRecord *record;
	u32 checksum;

	checksum = 0;
	for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
	{
		checksum += ((u32 *)&gSaveBlock2.filler_A8.var_A8)[i];
	}

	if (gSaveBlock2.filler_A8.var_A8.checksum != checksum)
	{
		ClearBattleTowerRecord(&gSaveBlock2.filler_A8.var_A8);
	}

	for (recordIndex = 0; recordIndex < 5; recordIndex++)
	{
		record = &gSaveBlock2.filler_A8.var_14C[recordIndex];
		checksum = 0;
		for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
		{
			checksum += ((u32 *)record)[i];
		}

		if (gSaveBlock2.filler_A8.var_14C[recordIndex].checksum != checksum)
		{
			ClearBattleTowerRecord(&gSaveBlock2.filler_A8.var_14C[recordIndex]);
		}
	}
}

void SetBattleTowerRecordChecksum(struct BattleTowerRecord *record)
{
	u32 i;

	record->checksum = 0;
	for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
	{
		record->checksum += ((u32 *)record)[i];
	}
}

void ClearBattleTowerRecord(struct BattleTowerRecord *record)
{
	u32 i;

	for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32); i++)
	{
		((u32 *)record)[i] = 0;
	}
}

void sub_8135CFC(void)
{
	s32 i;

	get_trainer_name(gSaveBlock2.filler_A8.defeatedByTrainerName);
	gSaveBlock2.filler_A8.defeatedBySpecies = gBattleMons[1].species;
	gSaveBlock2.filler_A8.firstMonSpecies = gBattleMons[0].species;

	for (i = 0; i < POKEMON_NAME_LENGTH; i++)
	{
		gSaveBlock2.filler_A8.firstMonNickname[i] = gBattleMons[0].nickname[i];
	}
}

u16 sub_8135D3C(u8 battleTowerLevelType)
{
	u16 var2 = ((gSaveBlock2.filler_A8.var_4B4[battleTowerLevelType] - 1) * 7 - 1) + gSaveBlock2.filler_A8.var_4B0[battleTowerLevelType];

	if (var2 > 9999)
	{
		return 9999;
	}

	return var2;
}

#ifdef NONMATCHING
void sub_8135D84(void)
{
    u16 prizeItem;
    struct SaveBlock2 *saveBlock = &gSaveBlock2;
    u8 battleTowerLevelType = saveBlock->filler_A8.battleTowerLevelType;

    if (saveBlock->filler_A8.var_4B4[battleTowerLevelType] - 1 > 5)
    {
        prizeItem = LongStreakPrizes[Random() % 9];
    }
    else
    {
        prizeItem = ShortStreakPrizes[Random() % 6];
    }

    saveBlock->filler_A8.prizeItem = prizeItem;
}
#else
__attribute__((naked))
void sub_8135D84(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    ldr r5, _08135DB0 @ =gSaveBlock2\n\
    ldr r1, _08135DB4 @ =0x00000554\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    lsls r0, 31\n\
    lsrs r0, 31\n\
    lsls r0, 1\n\
    ldr r2, _08135DB8 @ =0x0000055c\n\
    adds r1, r5, r2\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    subs r0, 0x1\n\
    cmp r0, 0x5\n\
    ble _08135DC0\n\
    bl Random\n\
    ldr r4, _08135DBC @ =LongStreakPrizes\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x9\n\
    b _08135DCC\n\
    .align 2, 0\n\
_08135DB0: .4byte gSaveBlock2\n\
_08135DB4: .4byte 0x00000554\n\
_08135DB8: .4byte 0x0000055c\n\
_08135DBC: .4byte LongStreakPrizes\n\
_08135DC0:\n\
    bl Random\n\
    ldr r4, _08135DE8 @ =ShortStreakPrizes\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x6\n\
_08135DCC:\n\
    bl __umodsi3\n\
    lsls r0, 16\n\
    lsrs r0, 15\n\
    adds r0, r4\n\
    ldrh r1, [r0]\n\
    movs r2, 0xAD\n\
    lsls r2, 3\n\
    adds r0, r5, r2\n\
    strh r1, [r0]\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08135DE8: .4byte ShortStreakPrizes\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_8135DEC(void)
{
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;

	if (AddBagItem(gSaveBlock2.filler_A8.prizeItem, 1) == TRUE)
	{
		CopyItemName(gSaveBlock2.filler_A8.prizeItem, gStringVar1);
		gScriptResult = 1;
	}
	else
	{
		gScriptResult = 0;
		gSaveBlock2.filler_A8.var_4AE[battleTowerLevelType] = 6;
	}
}

void sub_8135E50()
{
	s32 i;
	u32 partyIndex;
	struct Pokemon *pokemon;
	u8 ribbonType;
	u8 battleTowerLevelType = gSaveBlock2.filler_A8.battleTowerLevelType;

	ribbonType = MON_DATA_WINNING_RIBBON;
	if (battleTowerLevelType != 0)
	{
		ribbonType = MON_DATA_VICTORY_RIBBON;
	}

	gScriptResult = 0;

	if (sub_8135D3C(battleTowerLevelType) > 55)
	{
		for (i = 0; i < 3; i++)
		{
			partyIndex = gSaveBlock2.filler_A8.var_4BD[i] - 1;
			pokemon = &gPlayerParty[partyIndex];
			if (!GetMonData(pokemon, ribbonType))
			{
				gScriptResult = 1;
				SetMonData(pokemon, ribbonType, (u8 *)&gScriptResult);
			}
		}
	}

	if (gScriptResult != 0)
	{
		IncrementGameStat(GAME_STAT_RECEIVED_RIBBONS);
	}
}
