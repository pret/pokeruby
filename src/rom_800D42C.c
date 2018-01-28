#include "global.h"
#include "battle.h"
#include "link.h"
#include "text.h"
#include "ewram.h"

extern u16 gBattleTypeFlags;
extern u8 gBattleOutcome;

extern struct Window gUnknown_03004210;

extern u8 BattleText_Win[];
extern u8 BattleText_Loss[];
extern u8 BattleText_Tie[];

#if ENGLISH
#define LEFT_MESSAGE_X 6
#define RIGHT_MESSAGE_X 21
#define TILE_OFFSET_LOSS 168
#elif GERMAN
#define LEFT_MESSAGE_X 5
#define RIGHT_MESSAGE_X 20
#define TILE_OFFSET_LOSS 172
#endif
#define TILE_OFFSET_WIN 160
#define CENTER_MESSAGE_X 13
#define MESSAGE_Y 2

#define PRINT_MESSAGE(text, tileDataStartOffset, x)                             \
{                                                                               \
    Text_InitWindow(&gUnknown_03004210, text, tileDataStartOffset, x, MESSAGE_Y);    \
    Text_PrintWindow8002F44(&gUnknown_03004210);                                            \
}

#define PRINT_MESSAGE_LEFT(text, tileDataStartOffset)       PRINT_MESSAGE(text, tileDataStartOffset, LEFT_MESSAGE_X)
#define PRINT_MESSAGE_RIGHT(text, tileDataStartOffset)      PRINT_MESSAGE(text, tileDataStartOffset, RIGHT_MESSAGE_X)

void PrintLinkBattleWinLossTie(void)
{

    if (gBattleOutcome == 3)
    {
        PRINT_MESSAGE(BattleText_Tie, TILE_OFFSET_WIN, CENTER_MESSAGE_X);
        return;
    }

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        // Double battle?

        if (gBattleOutcome == 1)
        {

            // lp_field_18 = player position?
            switch (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18)
            {
            case 0:
            case 2:
                PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;

            case 1:
            case 3:
                PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN)
                PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS)
                return;
            }
        }
        else
        {

            switch (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18)
            {
            case 1:
            case 3:
                PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;

            case 0:
            case 2:
                PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;
            }
        }

        return;
    }


    if (gBattleOutcome == 1)
    {
        if (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
        else
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
    }
    else
    {
        if (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
        else
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
    }
}


#include "global.h"
#include "decompress.h"
#include "palette.h"
#include "battle.h"
#include "text.h"
#include "trig.h"
#include "sound.h"
#include "constants/songs.h"
#include "task.h"
#include "link.h"


#define gBattle gBattleStruct

extern const u8 gGameVersion;
extern u8 gUnknown_08D00000[];
extern u16 gUnknown_08D00524[];
extern u16 gUnknown_08D004E0[];
extern u16 gBattleTypeFlags;
extern struct Trainer gTrainers[];
extern u16 gTrainerBattleOpponent;

extern void *gBattleTerrainTable[][5];
extern u8 gBattleTerrain;

extern u8 gBattleTerrainTiles_Cave[];
extern u8 gBattleTerrainTiles_Water[];
extern u8 gBattleTerrainTiles_Building[];
extern u8 gBattleTerrainTiles_Stadium[];

extern u16 gBattleTerrainTilemap_Cave[];
extern u16 gBattleTerrainTilemap_Water[];
extern u16 gBattleTerrainTilemap_Building[];
extern u16 gBattleTerrainTilemap_Stadium[];

extern u16 gBattleTerrainPalette_Groudon[];
extern u16 gBattleTerrainPalette_Kyogre[];
extern u16 gBattleTerrainPalette_BuildingLeader[];
extern u16 gBattleTerrainPalette_StadiumSteven[];
extern u16 gBattleTerrainPalette_BuildingGym[];
extern u16 gBattleTerrainPalette_StadiumMagma[];
extern u16 gBattleTerrainPalette_StadiumAqua[];
extern u16 gBattleTerrainPalette_StadiumSidney[];
extern u16 gBattleTerrainPalette_StadiumPhoebe[];
extern u16 gBattleTerrainPalette_StadiumGlacia[];
extern u16 gBattleTerrainPalette_StadiumDrake[];
extern u16 gBattleTerrainPalette_BattleTower[];

extern u8 gBattleTerrainAnimTiles_Building[];
extern u16 gBattleTerrainAnimTilemap_Building[];
extern u8 gBattleTerrainAnimTiles_Cave[];
extern u16 gBattleTerrainAnimTilemap_Cave[];
extern u8 gBattleTerrainAnimTiles_Underwater[];
extern u16 gBattleTerrainAnimTilemap_Underwater[];
extern u8 gVersusFrameGfx[];
extern u16 gVersusFrameTilemap[];
extern u8 gUnknown_08E5DC2C[];
extern u16 gVersusFramePal[];

extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_Y;
extern struct CompressedSpriteSheet gUnknown_081F95A4;

extern u8 sav1_map_get_battletype(void);
extern void sub_800D74C(void);

struct Struct_081F9680 {
	struct Window *window;
	u16 offset;
	u8 left;
	u8 top;
	u8 *field_8;
};

extern struct Struct_081F9680 gUnknown_081F9680[];
extern void PrintLinkBattleWinLossTie(void);
extern void sub_800DAF8(u8, u8, u8 *);

extern struct SpriteTemplate gSpriteTemplate_81F9574;
extern struct SpriteTemplate gSpriteTemplate_81F958C;

extern u16 gBattle_BG1_X;
extern u16 gBattle_BG2_X;




#ifdef NONMATCHING

void sub_800DE30(u8 taskId)
{
	int palette;
	int i;

	switch (gTasks[taskId].data[0]) {

	case 0:
		if (gBattleTypeFlags & BATTLE_TYPE_MULTI) {
			for (i = 0; i < 4; i++) {
				u8 sp8 = (gLinkPlayers[i].lp_field_18 & 3);
				struct Window *window;
				Text_InitWindow8002E4C(
					window = gUnknown_081F9680[sp8].window,
					gLinkPlayers[i].name,
					gUnknown_081F9680[sp8].offset,
					gUnknown_081F9680[sp8].left,
					gUnknown_081F9680[sp8].top,
					1);
				Text_PrintWindow8002F44(window);
				sub_800DAF8(taskId, sp8, gUnknown_081F9680[sp8].field_8);
			}
		} else {
			int r7 = gBattle->linkPlayerIndex;
			int r6 = gBattle->linkPlayerIndex ^ 1;
			int r1 = r6;
			if (gLinkPlayers[r7].lp_field_18) {
				r6 = r7;
				r7 = r1;
			}

			i = 4;
			Text_InitWindow8002E4C(
				gUnknown_081F9680[i].window,
				gLinkPlayers[r7].name,
				gUnknown_081F9680[i].offset,
				gUnknown_081F9680[i].left,
				gUnknown_081F9680[i].top,
				1);
			Text_PrintWindow8002F44(gUnknown_081F9680[i].window);
			sub_800DAF8(taskId, r7, gUnknown_081F9680[i].field_8);

			i = 5;
			Text_InitWindow8002E4C(
				gUnknown_081F9680[i].window,
				gLinkPlayers[r6].name,
				gUnknown_081F9680[i].offset,
				gUnknown_081F9680[i].left,
				gUnknown_081F9680[i].top,
				1);
			Text_PrintWindow8002F44(gUnknown_081F9680[i].window);
			sub_800DAF8(taskId, r6, gUnknown_081F9680[i].field_8);
		}
		gTasks[taskId].data[0]++;
		break;

	case 1:
		palette = AllocSpritePalette(10000);
		gPlttBufferUnfaded[palette * 16 + 0x10f] = gPlttBufferFaded[palette * 16 + 0x10f] = 0x7fff;
		gBattle->unk1608A = CreateSprite(&gSpriteTemplate_81F9574, 108, 80, 0);
		gBattle->unk1608B = CreateSprite(&gSpriteTemplate_81F958C, 132, 80, 0);
		gSprites[gBattle->unk1608A].invisible = TRUE;
		gSprites[gBattle->unk1608B].invisible = TRUE;
		gTasks[taskId].data[0]++;
		break;

	case 2:
		if (gTasks[taskId].data[5]) {
			gBattle_BG1_X = (-20) - (Sin2(gTasks[taskId].data[1]) / 32);
			gBattle_BG2_X = (-140) - (Sin2(gTasks[taskId].data[2]) / 32);
			gBattle_BG1_Y = -36;
			gBattle_BG2_Y = -36;
		} else {
			gBattle_BG1_X = (-20) - (Sin2(gTasks[taskId].data[1]) / 32);
			gBattle_BG1_Y = (-164) + (Cos2(gTasks[taskId].data[1]) / 32);
			gBattle_BG2_X = (-140) - (Sin2(gTasks[taskId].data[2]) / 32);
			gBattle_BG2_Y = (-164) + (Cos2(gTasks[taskId].data[2]) / 32);
		}
		if (gTasks[taskId].data[2]) {
			gTasks[taskId].data[2] -= 2;
			gTasks[taskId].data[1] += 2;
		} else {
			if (gTasks[taskId].data[5]) {
				PrintLinkBattleWinLossTie();
			}
			PlaySE(SE_W231);
			DestroyTask(taskId);
			gSprites[gBattle->unk1608B].invisible = gSprites[gBattle->unk1608A].invisible = FALSE;
			gSprites[gBattle->unk1608B].oam.tileNum += 0x40;
			gSprites[gBattle->unk1608A].data[0] = 0;
			gSprites[gBattle->unk1608B].data[0] = 1;
			gSprites[gBattle->unk1608A].data[1] = gSprites[gBattle->unk1608A].pos1.x;
			gSprites[gBattle->unk1608B].data[1] = gSprites[gBattle->unk1608B].pos1.x;
			gSprites[gBattle->unk1608A].data[2] = 0;
			gSprites[gBattle->unk1608B].data[2] = 0;
		}
		break;
	}
}

#else

asm_unified(
".include \"macros.inc\"\n"
"	thumb_func_start sub_800DE30\n"
"sub_800DE30: @ 800DE30\n"
"	push {r4-r7,lr}\n"
"	mov r7, r10\n"
"	mov r6, r9\n"
"	mov r5, r8\n"
"	push {r5-r7}\n"
"	sub sp, 0x10\n"
"	lsls r0, 24\n"
"	lsrs r0, 24\n"
"	mov r9, r0\n"
"	ldr r1, _0800DE64 @ =gTasks\n"
"	lsls r0, 2\n"
"	mov r10, r0\n"
"	add r0, r9\n"
"	lsls r0, 3\n"
"	adds r6, r0, r1\n"
"	movs r1, 0x8\n"
"	ldrsh r0, [r6, r1]\n"
"	cmp r0, 0x1\n"
"	bne _0800DE58\n"
"	b _0800DF9C\n"
"_0800DE58:\n"
"	cmp r0, 0x1\n"
"	bgt _0800DE68\n"
"	cmp r0, 0\n"
"	beq _0800DE70\n"
"	b _0800E212\n"
"	.align 2, 0\n"
"_0800DE64: .4byte gTasks\n"
"_0800DE68:\n"
"	cmp r0, 0x2\n"
"	bne _0800DE6E\n"
"	b _0800E03C\n"
"_0800DE6E:\n"
"	b _0800E212\n"
"_0800DE70:\n"
"	ldr r0, _0800DED0 @ =gBattleTypeFlags\n"
"	ldrh r1, [r0]\n"
"	movs r0, 0x40\n"
"	ands r0, r1\n"
"	cmp r0, 0\n"
"	beq _0800DEE0\n"
"	ldr r0, _0800DED4 @ =gLinkPlayers\n"
"	ldr r2, _0800DED8 @ =gUnknown_081F9680\n"
"	mov r8, r2\n"
"	adds r7, r0, 0\n"
"	adds r7, 0x8\n"
"	movs r5, 0x3\n"
"_0800DE88:\n"
"	ldrb r0, [r7, 0x10]\n"
"	movs r1, 0x3\n"
"	ands r1, r0\n"
"	str r1, [sp, 0x8]\n"
"	lsls r4, r1, 1\n"
"	adds r4, r1\n"
"	lsls r4, 2\n"
"	mov r2, r8\n"
"	adds r0, r4, r2\n"
"	ldr r1, [r0]\n"
"	str r1, [sp, 0xC]\n"
"	ldrh r2, [r0, 0x4]\n"
"	ldrb r3, [r0, 0x6]\n"
"	ldrb r0, [r0, 0x7]\n"
"	str r0, [sp]\n"
"	movs r0, 0x1\n"
"	str r0, [sp, 0x4]\n"
"	adds r0, r1, 0\n"
"	adds r1, r7, 0\n"
"	bl Text_InitWindow8002E4C\n"
"	ldr r0, [sp, 0xC]\n"
"	bl Text_PrintWindow8002F44\n"
"	ldr r2, _0800DEDC @ =gUnknown_081F9680 + 0x8\n"
"	adds r4, r2\n"
"	ldr r2, [r4]\n"
"	mov r0, r9\n"
"	ldr r1, [sp, 0x8]\n"
"	bl sub_800DAF8\n"
"	adds r7, 0x1C\n"
"	subs r5, 0x1\n"
"	cmp r5, 0\n"
"	bge _0800DE88\n"
"	b _0800DF70\n"
"	.align 2, 0\n"
"_0800DED0: .4byte gBattleTypeFlags\n"
"_0800DED4: .4byte gLinkPlayers\n"
"_0800DED8: .4byte gUnknown_081F9680\n"
"_0800DEDC: .4byte gUnknown_081F9680 + 0x8\n"
"_0800DEE0:\n"
"	ldr r0, _0800DF84 @ =0x02000000\n"
"	ldr r5, _0800DF88 @ =0x000160cb\n"
"	adds r0, r5\n"
"	ldrb r7, [r0]\n"
"	movs r0, 0x1\n"
"	adds r6, r7, 0\n"
"	eors r6, r0\n"
"	adds r1, r6, 0\n"
"	ldr r2, _0800DF8C @ =gLinkPlayers\n"
"	lsls r0, r7, 3\n"
"	subs r0, r7\n"
"	lsls r0, 2\n"
"	adds r0, r2\n"
"	ldrh r0, [r0, 0x18]\n"
"	cmp r0, 0\n"
"	beq _0800DF04\n"
"	adds r6, r7, 0\n"
"	adds r7, r1, 0\n"
"_0800DF04:\n"
"	ldr r0, _0800DF90 @ =gUnknown_081F9680\n"
"	mov r8, r0\n"
"	adds r0, 0x30\n"
"	mov r1, r8\n"
"	ldr r4, [r1, 0x30]\n"
"	lsls r1, r7, 3\n"
"	subs r1, r7\n"
"	lsls r1, 2\n"
"	ldr r2, _0800DF94 @ =gLinkPlayers + 0x8\n"
"	adds r1, r2\n"
"	ldrh r2, [r0, 0x4]\n"
"	ldrb r3, [r0, 0x6]\n"
"	ldrb r0, [r0, 0x7]\n"
"	str r0, [sp]\n"
"	movs r5, 0x1\n"
"	str r5, [sp, 0x4]\n"
"	adds r0, r4, 0\n"
"	bl Text_InitWindow8002E4C\n"
"	adds r0, r4, 0\n"
"	bl Text_PrintWindow8002F44\n"
"	mov r0, r8\n"
"	ldr r2, [r0, 0x38]\n"
"	mov r0, r9\n"
"	adds r1, r7, 0\n"
"	bl sub_800DAF8\n"
"	mov r0, r8\n"
"	adds r0, 0x3C\n"
"	mov r1, r8\n"
"	ldr r4, [r1, 0x3C]\n"
"	lsls r1, r6, 3\n"
"	subs r1, r6\n"
"	lsls r1, 2\n"
"	ldr r2, _0800DF94 @ =gLinkPlayers + 0x8\n"
"	adds r1, r2\n"
"	ldrh r2, [r0, 0x4]\n"
"	ldrb r3, [r0, 0x6]\n"
"	ldrb r0, [r0, 0x7]\n"
"	str r0, [sp]\n"
"	str r5, [sp, 0x4]\n"
"	adds r0, r4, 0\n"
"	bl Text_InitWindow8002E4C\n"
"	adds r0, r4, 0\n"
"	bl Text_PrintWindow8002F44\n"
"	mov r5, r8\n"
"	ldr r2, [r5, 0x44]\n"
"	mov r0, r9\n"
"	adds r1, r6, 0\n"
"	bl sub_800DAF8\n"
"_0800DF70:\n"
"	ldr r0, _0800DF98 @ =gTasks\n"
"	mov r1, r10\n"
"	add r1, r9\n"
"	lsls r1, 3\n"
"	adds r1, r0\n"
"	ldrh r0, [r1, 0x8]\n"
"	adds r0, 0x1\n"
"	strh r0, [r1, 0x8]\n"
"	b _0800E212\n"
"	.align 2, 0\n"
"_0800DF84: .4byte 0x02000000\n"
"_0800DF88: .4byte 0x000160cb\n"
"_0800DF8C: .4byte gLinkPlayers\n"
"_0800DF90: .4byte gUnknown_081F9680\n"
"_0800DF94: .4byte gLinkPlayers + 0x8\n"
"_0800DF98: .4byte gTasks\n"
"_0800DF9C:\n"
"	ldr r0, _0800E010 @ =0x00002710\n"
"	bl AllocSpritePalette\n"
"	lsls r0, 24\n"
"	ldr r2, _0800E014 @ =gPlttBufferUnfaded\n"
"	lsrs r0, 19\n"
"	ldr r1, _0800E018 @ =0x0000021e\n"
"	adds r0, r1\n"
"	adds r2, r0, r2\n"
"	ldr r1, _0800E01C @ =gPlttBufferFaded\n"
"	adds r0, r1\n"
"	ldr r1, _0800E020 @ =0x00007fff\n"
"	strh r1, [r0]\n"
"	strh r1, [r2]\n"
"	ldr r0, _0800E024 @ =gSpriteTemplate_81F9574\n"
"	movs r1, 0x6C\n"
"	movs r2, 0x50\n"
"	movs r3, 0\n"
"	bl CreateSprite\n"
"	ldr r4, _0800E028 @ =0x02000000\n"
"	ldr r2, _0800E02C @ =0x0001608a\n"
"	adds r7, r4, r2\n"
"	strb r0, [r7]\n"
"	ldr r0, _0800E030 @ =gSpriteTemplate_81F958C\n"
"	movs r1, 0x84\n"
"	movs r2, 0x50\n"
"	movs r3, 0\n"
"	bl CreateSprite\n"
"	ldr r5, _0800E034 @ =0x0001608b\n"
"	adds r4, r5\n"
"	strb r0, [r4]\n"
"	ldr r3, _0800E038 @ =gSprites\n"
"	ldrb r1, [r7]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r3\n"
"	adds r0, 0x3E\n"
"	ldrb r1, [r0]\n"
"	movs r2, 0x4\n"
"	orrs r1, r2\n"
"	strb r1, [r0]\n"
"	ldrb r1, [r4]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r3\n"
"	adds r0, 0x3E\n"
"	ldrb r1, [r0]\n"
"	orrs r1, r2\n"
"	strb r1, [r0]\n"
"	ldrh r0, [r6, 0x8]\n"
"	adds r0, 0x1\n"
"	strh r0, [r6, 0x8]\n"
"	b _0800E212\n"
"	.align 2, 0\n"
"_0800E010: .4byte 0x00002710\n"
"_0800E014: .4byte gPlttBufferUnfaded\n"
"_0800E018: .4byte 0x0000021e\n"
"_0800E01C: .4byte gPlttBufferFaded\n"
"_0800E020: .4byte 0x00007fff\n"
"_0800E024: .4byte gSpriteTemplate_81F9574\n"
"_0800E028: .4byte 0x02000000\n"
"_0800E02C: .4byte 0x0001608a\n"
"_0800E030: .4byte gSpriteTemplate_81F958C\n"
"_0800E034: .4byte 0x0001608b\n"
"_0800E038: .4byte gSprites\n"
"_0800E03C:\n"
"	movs r1, 0x12\n"
"	ldrsh r0, [r6, r1]\n"
"	cmp r0, 0\n"
"	beq _0800E0A4\n"
"	ldr r4, _0800E090 @ =gBattle_BG1_X\n"
"	ldrh r0, [r6, 0xA]\n"
"	bl Sin2\n"
"	lsls r0, 16\n"
"	asrs r0, 16\n"
"	cmp r0, 0\n"
"	bge _0800E056\n"
"	adds r0, 0x1F\n"
"_0800E056:\n"
"	asrs r1, r0, 5\n"
"	movs r2, 0x14\n"
"	negs r2, r2\n"
"	adds r0, r2, 0\n"
"	subs r0, r1\n"
"	strh r0, [r4]\n"
"	ldr r4, _0800E094 @ =gBattle_BG2_X\n"
"	ldrh r0, [r6, 0xC]\n"
"	bl Sin2\n"
"	lsls r0, 16\n"
"	asrs r0, 16\n"
"	cmp r0, 0\n"
"	bge _0800E074\n"
"	adds r0, 0x1F\n"
"_0800E074:\n"
"	asrs r1, r0, 5\n"
"	movs r5, 0x8C\n"
"	negs r5, r5\n"
"	adds r0, r5, 0\n"
"	subs r0, r1\n"
"	strh r0, [r4]\n"
"	ldr r0, _0800E098 @ =gBattle_BG1_Y\n"
"	ldr r2, _0800E09C @ =0x0000ffdc\n"
"	adds r1, r2, 0\n"
"	strh r1, [r0]\n"
"	ldr r0, _0800E0A0 @ =gBattle_BG2_Y\n"
"	strh r1, [r0]\n"
"	b _0800E110\n"
"	.align 2, 0\n"
"_0800E090: .4byte gBattle_BG1_X\n"
"_0800E094: .4byte gBattle_BG2_X\n"
"_0800E098: .4byte gBattle_BG1_Y\n"
"_0800E09C: .4byte 0x0000ffdc\n"
"_0800E0A0: .4byte gBattle_BG2_Y\n"
"_0800E0A4:\n"
"	ldr r4, _0800E134 @ =gBattle_BG1_X\n"
"	ldrh r0, [r6, 0xA]\n"
"	bl Sin2\n"
"	lsls r0, 16\n"
"	asrs r0, 16\n"
"	cmp r0, 0\n"
"	bge _0800E0B6\n"
"	adds r0, 0x1F\n"
"_0800E0B6:\n"
"	asrs r1, r0, 5\n"
"	movs r5, 0x14\n"
"	negs r5, r5\n"
"	adds r0, r5, 0\n"
"	subs r0, r1\n"
"	strh r0, [r4]\n"
"	ldr r4, _0800E138 @ =gBattle_BG1_Y\n"
"	ldrh r0, [r6, 0xA]\n"
"	bl Cos2\n"
"	lsls r0, 16\n"
"	asrs r0, 16\n"
"	cmp r0, 0\n"
"	bge _0800E0D4\n"
"	adds r0, 0x1F\n"
"_0800E0D4:\n"
"	asrs r0, 5\n"
"	subs r0, 0xA4\n"
"	strh r0, [r4]\n"
"	ldr r4, _0800E13C @ =gBattle_BG2_X\n"
"	ldrh r0, [r6, 0xC]\n"
"	bl Sin2\n"
"	lsls r0, 16\n"
"	asrs r0, 16\n"
"	cmp r0, 0\n"
"	bge _0800E0EC\n"
"	adds r0, 0x1F\n"
"_0800E0EC:\n"
"	asrs r1, r0, 5\n"
"	movs r2, 0x8C\n"
"	negs r2, r2\n"
"	adds r0, r2, 0\n"
"	subs r0, r1\n"
"	strh r0, [r4]\n"
"	ldr r4, _0800E140 @ =gBattle_BG2_Y\n"
"	ldrh r0, [r6, 0xC]\n"
"	bl Cos2\n"
"	lsls r0, 16\n"
"	asrs r0, 16\n"
"	cmp r0, 0\n"
"	bge _0800E10A\n"
"	adds r0, 0x1F\n"
"_0800E10A:\n"
"	asrs r0, 5\n"
"	subs r0, 0xA4\n"
"	strh r0, [r4]\n"
"_0800E110:\n"
"	ldr r1, _0800E144 @ =gTasks\n"
"	mov r5, r9\n"
"	lsls r0, r5, 2\n"
"	add r0, r9\n"
"	lsls r0, 3\n"
"	adds r1, r0, r1\n"
"	ldrh r0, [r1, 0xC]\n"
"	movs r2, 0xC\n"
"	ldrsh r7, [r1, r2]\n"
"	cmp r7, 0\n"
"	beq _0800E148\n"
"	subs r0, 0x2\n"
"	strh r0, [r1, 0xC]\n"
"	ldrh r0, [r1, 0xA]\n"
"	adds r0, 0x2\n"
"	strh r0, [r1, 0xA]\n"
"	b _0800E212\n"
"	.align 2, 0\n"
"_0800E134: .4byte gBattle_BG1_X\n"
"_0800E138: .4byte gBattle_BG1_Y\n"
"_0800E13C: .4byte gBattle_BG2_X\n"
"_0800E140: .4byte gBattle_BG2_Y\n"
"_0800E144: .4byte gTasks\n"
"_0800E148:\n"
"	movs r5, 0x12\n"
"	ldrsh r0, [r1, r5]\n"
"	cmp r0, 0\n"
"	beq _0800E154\n"
"	bl PrintLinkBattleWinLossTie\n"
"_0800E154:\n"
"	movs r0, 0x78\n"
"	bl PlaySE\n"
"	mov r0, r9\n"
"	bl DestroyTask\n"
"	ldr r4, _0800E224 @ =gSprites\n"
"	ldr r0, _0800E228 @ =0x02000000\n"
"	mov r8, r0\n"
"	ldr r1, _0800E22C @ =0x0001608a\n"
"	add r1, r8\n"
"	mov r9, r1\n"
"	ldrb r0, [r1]\n"
"	lsls r1, r0, 4\n"
"	adds r1, r0\n"
"	lsls r1, 2\n"
"	adds r1, r4\n"
"	adds r1, 0x3E\n"
"	ldrb r3, [r1]\n"
"	movs r2, 0x5\n"
"	negs r2, r2\n"
"	adds r0, r2, 0\n"
"	ands r0, r3\n"
"	strb r0, [r1]\n"
"	ldr r5, _0800E230 @ =0x0001608b\n"
"	add r8, r5\n"
"	mov r0, r8\n"
"	ldrb r1, [r0]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	adds r0, 0x3E\n"
"	ldrb r1, [r0]\n"
"	ands r2, r1\n"
"	strb r2, [r0]\n"
"	mov r1, r8\n"
"	ldrb r0, [r1]\n"
"	lsls r2, r0, 4\n"
"	adds r2, r0\n"
"	lsls r2, 2\n"
"	adds r2, r4\n"
"	ldrh r3, [r2, 0x4]\n"
"	lsls r1, r3, 22\n"
"	lsrs r1, 22\n"
"	adds r1, 0x40\n"
"	ldr r5, _0800E234 @ =0x000003ff\n"
"	adds r0, r5, 0\n"
"	ands r1, r0\n"
"	ldr r0, _0800E238 @ =0xfffffc00\n"
"	ands r0, r3\n"
"	orrs r0, r1\n"
"	strh r0, [r2, 0x4]\n"
"	mov r0, r9\n"
"	ldrb r1, [r0]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	strh r7, [r0, 0x2E]\n"
"	mov r2, r8\n"
"	ldrb r1, [r2]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	movs r1, 0x1\n"
"	strh r1, [r0, 0x2E]\n"
"	mov r5, r9\n"
"	ldrb r1, [r5]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	ldrh r1, [r0, 0x20]\n"
"	strh r1, [r0, 0x30]\n"
"	ldrb r1, [r2]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	ldrh r1, [r0, 0x20]\n"
"	strh r1, [r0, 0x30]\n"
"	ldrb r1, [r5]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	strh r7, [r0, 0x32]\n"
"	ldrb r1, [r2]\n"
"	lsls r0, r1, 4\n"
"	adds r0, r1\n"
"	lsls r0, 2\n"
"	adds r0, r4\n"
"	strh r7, [r0, 0x32]\n"
"_0800E212:\n"
"	add sp, 0x10\n"
"	pop {r3-r5}\n"
"	mov r8, r3\n"
"	mov r9, r4\n"
"	mov r10, r5\n"
"	pop {r4-r7}\n"
"	pop {r0}\n"
"	bx r0\n"
"	.align 2, 0\n"
"_0800E224: .4byte gSprites\n"
"_0800E228: .4byte 0x02000000\n"
"_0800E22C: .4byte 0x0001608a\n"
"_0800E230: .4byte 0x0001608b\n"
"_0800E234: .4byte 0x000003ff\n"
"_0800E238: .4byte 0xfffffc00\n"
"	thumb_func_end sub_800DE30\n"
);

#endif // NONMATCHING


void sub_800E23C(void) {
	if (gBattleTypeFlags & BATTLE_TYPE_LINK) {
		LZDecompressVram(gVersusFrameGfx, (void *)0x6004000);
		LZDecompressVram(gVersusFrameTilemap, (void *)0x600e000);
		LZDecompressVram(gVersusFrameTilemap, (void *)0x600f000);
		LZDecompressVram(gUnknown_08E5DC2C, (void *)0x6010000);
		LoadCompressedPalette(gVersusFramePal, 0x60, 0x20);
		REG_BG1CNT = 0x5c04;
		REG_WININ = 0x36;
		REG_WINOUT = 0x36;
		gBattle_BG1_Y = 0xff5c;
		gBattle_BG2_Y = 0xff5c;
		LoadCompressedObjectPic(&gUnknown_081F95A4);
		return;
	} else if (gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)) {
		LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
		LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
		return;
	} else if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
		if (gGameVersion == VERSION_RUBY) {
			LZDecompressVram(gBattleTerrainAnimTiles_Cave, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Cave, (void *)0x600e000);
			return;
		} else {
			LZDecompressVram(gBattleTerrainAnimTiles_Underwater, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Underwater, (void *)0x600e000);
			return;
		}
	} else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
		if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
			LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
			return;
		} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
			LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
			return;
		}
	}
	if (sav1_map_get_battletype() == 0) {
		LZDecompressVram(gBattleTerrainTable[gBattleTerrain][2], (void *)0x6004000);
		LZDecompressVram(gBattleTerrainTable[gBattleTerrain][3], (void *)0x600e000);
		return;
	}
	LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
	LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
}

int sub_800E414(u8 a1) {
	int ret = 0;
	switch (a1) {
	case 0:
		LZDecompressVram(&gUnknown_08D00000, (void *)0x6000000);
		break;
	case 1:
		CpuCopy16(gUnknown_08D00524, (void *)0x600c000, 0x1000);
		break;
	case 2:
		LoadCompressedPalette(gUnknown_08D004E0, 0, 0x40);
		break;
	case 3: // tiles
		if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK))) {
			if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
				if (gGameVersion == VERSION_RUBY) {
					LZDecompressVram(gBattleTerrainTiles_Cave, (void *)0x6008000);
					break;
				} else {
					LZDecompressVram(gBattleTerrainTiles_Water, (void *)0x6008000);
					break;
				}
			} else {
				if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
					if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
						LZDecompressVram(gBattleTerrainTiles_Building, (void *)0x6008000);
						break;
					} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
						LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
						break;
					}
				}
				switch (sav1_map_get_battletype()) {
				case 0:
					LZDecompressVram(gBattleTerrainTable[gBattleTerrain][0], (void *)0x6008000);
					break;
				case 2:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 3:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 4:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 5:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 6:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 7:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 1:
				case 8:
					LZDecompressVram(gBattleTerrainTiles_Building, (void *)0x6008000);
					break;
				}
				break;
			}
		} else {
			LZDecompressVram(gBattleTerrainTiles_Building, (void *)0x6008000);
			break;
		}
	case 4: // tilemap
		if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK))) {
			if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
				if (gGameVersion == 2) {
					LZDecompressVram(gBattleTerrainTilemap_Cave, (void *)0x600d000);
					break;
				} else {
					LZDecompressVram(gBattleTerrainTilemap_Water, (void *)0x600d000);
					break;
				}
			} else {
				if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
					if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
						LZDecompressVram(gBattleTerrainTilemap_Building, (void *)0x600d000);
						break;
					} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
						LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
						break;
					}
				}
				switch (sav1_map_get_battletype()) {
				case 0:
					LZDecompressVram(gBattleTerrainTable[gBattleTerrain][1], (void *)0x600d000);
					break;
				case 2:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 3:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 4:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 5:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 6:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 7:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 1:
				case 8:
					LZDecompressVram(gBattleTerrainTilemap_Building, (void *)0x600d000);
					break;
				}
				break;
			}
		} else {
			LZDecompressVram(gBattleTerrainTilemap_Building, (void *)0x600d000);
			break;
		}
	case 5: // palette
		if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK))) {
			if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
				if (gGameVersion == 2) {
					LoadCompressedPalette(gBattleTerrainPalette_Groudon, 0x20, 0x60);
					break;
				} else {
					LoadCompressedPalette(gBattleTerrainPalette_Kyogre, 0x20, 0x60);
					break;
				}
			} else {
				if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
					if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
						LoadCompressedPalette(gBattleTerrainPalette_BuildingLeader, 0x20, 0x60);
						break;
					} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
						LoadCompressedPalette(gBattleTerrainPalette_StadiumSteven, 0x20, 0x60);
						break;
					}
				}
				switch (sav1_map_get_battletype()) {
				case 0:
					LoadCompressedPalette(gBattleTerrainTable[gBattleTerrain][4], 0x20, 0x60);
					break;
				case 1:
					LoadCompressedPalette(gBattleTerrainPalette_BuildingGym, 0x20, 0x60);
					break;
				case 2:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumMagma, 0x20, 0x60);
					break;
				case 3:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumAqua, 0x20, 0x60);
					break;
				case 4:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumSidney, 0x20, 0x60);
					break;
				case 5:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumPhoebe, 0x20, 0x60);
					break;
				case 6:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumGlacia, 0x20, 0x60);
					break;
				case 7:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumDrake, 0x20, 0x60);
					break;
				case 8:
					LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
					break;
				}
				break;
			}
		} else {
			LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
			break;
		}
	case 6:
		sub_800D74C();
		break;
	default:
		ret = 1;
	}
	return ret;
}
