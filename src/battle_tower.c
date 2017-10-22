#include "global.h"
#include "battle_tower.h"
#include "data2.h"
#include "easy_chat.h"
#include "event_data.h"
#include "items.h"
#include "map_object_constants.h"
#include "moves.h"
#include "pokedex.h"
#include "rng.h"
#include "species.h"
#include "string_util.h"
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

extern u8 gUnknown_08400E23[];
extern u8 gUnknown_08400E29[];
extern u8 gUnknown_08400E2E[];
extern u8 gUnknown_08400E30[];

extern u16 gBattleTowerBanlist[];
extern u8 gTrainerClassToPicIndex[];
extern u8 gTrainerClassToNameIndex[];
extern u8 gUnknown_08405EB0[];
extern u8 gUnknown_08405E7E[];
extern u8 gUnknown_08405E92[];
extern u8 gUnknown_08405E60[];

extern void sub_8135C44(void);
extern void sub_813601C(void);
extern void sub_81349FC(u8);


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

	sub_8135C44();
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
