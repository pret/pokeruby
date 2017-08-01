#include "global.h"
#include "pokemon.h"
#include "items.h"
#include "decompress.h"
#include "data2.h"
#include "task.h"
#include "script.h"
#include "palette.h"
#include "rom4.h"
#include "main.h"
#include "event_data.h"
#include "sound.h"
#include "text.h"
#include "text_window.h"
#include "string_util.h"
#include "strings2.h"
#include "menu.h"
#include "naming_screen.h"
#include "trig.h"

extern u8 gStringVar1[];
extern u8 ewram[];
extern struct SpriteTemplate gUnknown_02024E8C;

bool8 GetNationalPokedexFlag(u16 nationalNum, u8 caseID);
u8* GetMonNick(struct Pokemon* mon, u8* dst);
u8 sav1_map_get_name(void);
const struct CompressedSpritePalette* sub_8040990(struct Pokemon* mon); //gets pokemon palette address
void sub_8080990(void);

void Task_EggHatch(u8 taskID);
void CB2_EggHatch_0(void);

void CreatedHatchedMon(struct Pokemon *egg, struct Pokemon *temp)
{
    u16 species;
    u32 personality, pokerus;
    u8 i, friendship, language, gameMet, markings;
    u16 moves[4];
    u32 ivs[6];


    species = GetMonData(egg, MON_DATA_SPECIES);

    for (i = 0; i < 4; i++)
    {
        moves[i] = GetMonData(egg, MON_DATA_MOVE1 + i);
    }

    personality = GetMonData(egg, MON_DATA_PERSONALITY);

    for (i = 0; i < 6; i++)
    {
        ivs[i] = GetMonData(egg, MON_DATA_HP_IV + i);
    }

    gameMet = GetMonData(egg, MON_DATA_MET_GAME);
    markings = GetMonData(egg, MON_DATA_MARKINGS);
    pokerus = GetMonData(egg, MON_DATA_POKERUS);

    CreateMon(temp, species, 5, 32, TRUE, personality, 0, 0);

    for (i = 0; i < 4; i++)
    {
        SetMonData(temp, MON_DATA_MOVE1 + i, (const u8 *) &moves[i]);
    }

    for (i = 0; i < 6; i++)
    {
        SetMonData(temp, MON_DATA_HP_IV + i, (const u8 *) &ivs[i]);
    }

    language = GAME_LANGUAGE;
    SetMonData(temp, MON_DATA_LANGUAGE, &language);
    SetMonData(temp, MON_DATA_MET_GAME, &gameMet);
    SetMonData(temp, MON_DATA_MARKINGS, &markings);

    friendship = 120;
    SetMonData(temp, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(temp, MON_DATA_POKERUS, (const u8 *) &pokerus);

    *egg = *temp;
}

void AddHatchedMonToParty(u8 id)
{
    u8 isEgg;
    u16 pokeNum;
    u8 name[12];
    u16 ball;
    u16 caughtLvl;
    u8 mapNameID;
    struct Pokemon* mon = &gPlayerParty[id];

    CreatedHatchedMon(mon, &gEnemyParty[0]);
    isEgg = 0;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);

    pokeNum = GetMonData(mon, MON_DATA_SPECIES);
    GetSpeciesName(name, pokeNum);
    SetMonData(mon, MON_DATA_NICKNAME, name);

    pokeNum = SpeciesToNationalPokedexNum(pokeNum);
    GetNationalPokedexFlag(pokeNum, 2);
    GetNationalPokedexFlag(pokeNum, 3);

    GetMonNick(mon, gStringVar1);

    ball = ITEM_POKE_BALL;
    SetMonData(mon, MON_DATA_POKEBALL, &ball);

    caughtLvl = 0;
    SetMonData(mon, MON_DATA_MET_LEVEL, &caughtLvl);

    mapNameID = sav1_map_get_name();
    SetMonData(mon, MON_DATA_MET_LOCATION, &mapNameID);

    MonRestorePP(mon);
    CalculateMonStats(mon);
}

void ScriptHatchMon(void)
{
    AddHatchedMonToParty(gSpecialVar_0x8004);
}

__attribute__((naked))
bool8 sub_8042ABC(void* a, u8 b)
{
    asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	sub sp, 0x20\n\
	adds r5, r0, 0\n\
	lsls r4, r1, 24\n\
	lsrs r4, 24\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 4\n\
	adds r0, r5, r0\n\
	mov r1, sp\n\
	bl GetBoxMonNick\n\
	lsls r0, r4, 3\n\
	subs r0, r4\n\
	lsls r1, r0, 3\n\
	adds r0, r5, r1\n\
	adds r0, 0xC0\n\
	ldrh r0, [r0]\n\
	cmp r0, 0\n\
	beq _08042B40\n\
	adds r0, r1, 0\n\
	adds r0, 0xA0\n\
	adds r5, r0\n\
	adds r6, r5, 0\n\
	adds r6, 0x2C\n\
	mov r0, sp\n\
	adds r1, r6, 0\n\
	bl StringCompareWithoutExtCtrlCodes\n\
	cmp r0, 0\n\
	bne _08042B08\n\
	ldr r0, _08042B30 @ =gSaveBlock2\n\
	adds r1, r5, 0\n\
	adds r1, 0x24\n\
	bl StringCompareWithoutExtCtrlCodes\n\
	cmp r0, 0\n\
	beq _08042B40\n\
_08042B08:\n\
	ldr r0, _08042B34 @ =gStringVar1\n\
	mov r1, sp\n\
	bl StringCopy\n\
	ldr r4, _08042B38 @ =gStringVar2\n\
	adds r1, r5, 0\n\
	adds r1, 0x24\n\
	adds r0, r4, 0\n\
	bl StringCopy\n\
	ldr r0, _08042B3C @ =gStringVar3\n\
	adds r1, r6, 0\n\
	bl StringCopy\n\
	adds r0, r4, 0\n\
	bl SanitizeNameString\n\
	movs r0, 0x1\n\
	b _08042B42\n\
	.align 2, 0\n\
_08042B30: .4byte gSaveBlock2\n\
_08042B34: .4byte gStringVar1\n\
_08042B38: .4byte gStringVar2\n\
_08042B3C: .4byte gStringVar3\n\
_08042B40:\n\
	movs r0, 0\n\
_08042B42:\n\
	add sp, 0x20\n\
	pop {r4-r6}\n\
	pop {r1}\n\
	bx r1\n\
        .syntax divided");
}

bool8 sub_8042B4C(void)
{
    return sub_8042ABC(&gSaveBlock1.daycareData, gSpecialVar_0x8004);
}

u8 EggHatchCreateMonSprite(u8 a0, u8 switchID, u8 pokeID)
{
    u8 r5 = 0;
    u8 spriteID = 0;
    struct Pokemon* mon = NULL;

    if (a0 == 0)
    {
        mon = &gPlayerParty[pokeID];
        r5 = 1;
    }
    if (a0 == 1)
    {
        mon = &gPlayerParty[pokeID];
        r5 = 3;
    }
    switch (switchID)
    {
    case 0:
        {
            u16 species = GetMonData(mon, MON_DATA_SPECIES);
            u32 pid = GetMonData(mon, MON_DATA_PERSONALITY);
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset,(u32)(&ewram[0]), gUnknown_081FAF4C[2 * a0 + 1], species, pid);
            LoadCompressedObjectPalette(sub_8040990(mon));
        }
        break;
    case 1:
        GetMonSpriteTemplate_803C56C(sub_8040990(mon)->tag, r5);
        spriteID = CreateSprite(&gUnknown_02024E8C, 120, 70, 6);
        gSprites[spriteID].invisible = 1;
        gSprites[spriteID].callback = SpriteCallbackDummy;
        break;
    }
    return spriteID;
}

void VBlankCB_EggHatch(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void EggHatch(void)
{
    ScriptContext2_Enable();
    CreateTask(Task_EggHatch, 10);
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
}

void Task_EggHatch(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_EggHatch_0);
        gFieldCallback = sub_8080990;
        DestroyTask(taskID);
    }
}

void CB2_EggHatch_1(void);

struct Struct_2018000
{
    u8 eggSpriteID;
    u8 pokeSpriteID;
    u8 field_2;
    u8 field_3;
    u8 eggPartyID;
    u8 field_5;
    u8 field_6;
    u8 field_7;
    struct Window window;
    u8 field_38;
    u8 field_39;
    u8 field_3A;
};

extern struct Struct_2018000* gUnknown_0300481C;
extern const u32 gUnknown_08D00000[];
extern const u32 gUnknown_08D00524[];
extern const u32 gUnknown_0820CA98[];
extern const u32 gUnknown_0820F798[];
extern const u16 gUnknown_08D004E0[]; //palette

extern const u16 gUnknown_0820C9F8[]; //palette

extern const struct SpriteSheet gUnknown_0820A3B0;
extern const struct SpriteSheet gUnknown_0820A3B8;
extern const struct SpritePalette gUnknown_0820A3C0;

extern const struct SpriteTemplate gSpriteTemplate_820A3C8;

void CB2_EggHatch_0(void)
{
    switch (gMain.state)
    {
    case 0:
        REG_DISPCNT = 0;
        gUnknown_0300481C = (struct Struct_2018000*)(&ewram[0x18000]);
        gUnknown_0300481C->eggPartyID = gSpecialVar_0x8004;
        gUnknown_0300481C->field_3A = 0;
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_EggHatch);
        gMain.state++;
        gSpecialVar_0x8005 = GetCurrentMapMusic();
        break;
    case 1:
        SetUpWindowConfig(&gWindowConfig_81E6F84);
        InitWindowFromConfig(&gUnknown_0300481C->window, &gWindowConfig_81E6F84);
        gUnknown_0300481C->field_38 = SetTextWindowBaseTileNum(20);
        LoadTextWindowGraphics(&gUnknown_0300481C->window);
        gMain.state++;
        break;
    case 2:
        LZDecompressVram(&gUnknown_08D00000, (void*)(VRAM));
        CpuSet(&gUnknown_08D00524, &ewram[0], 0x800);
        DmaCopy16(3, &ewram[0], (void*)(VRAM + 0x2800), 0x500);
        LoadCompressedPalette(&gUnknown_08D004E0, 0, 0x20);
        gMain.state++;
        break;
    case 3:
        LoadSpriteSheet(&gUnknown_0820A3B0);
        LoadSpriteSheet(&gUnknown_0820A3B8);
        LoadSpritePalette(&gUnknown_0820A3C0);
        gMain.state++;
        break;
    case 4:
        gUnknown_0300481C->eggSpriteID = CreateSprite(&gSpriteTemplate_820A3C8, 0x78, 0x4B, 5);
        AddHatchedMonToParty(gUnknown_0300481C->eggPartyID);
        gMain.state++;
        break;
    case 5:
        EggHatchCreateMonSprite(0, 0, gUnknown_0300481C->eggPartyID);
        gMain.state++;
        break;
    case 6:
        gUnknown_0300481C->pokeSpriteID = EggHatchCreateMonSprite(0, 1, gUnknown_0300481C->eggPartyID);
        gMain.state++;
        break;
    case 7:
        {
            u32 offsetRead, offsetWrite;
            u32 offsetRead2, offsetWrite2;
            u32 size;

            REG_BG2CNT = 0x4C06;
            LoadPalette(&gUnknown_0820C9F8, 0x10, 0xA0);

            offsetRead = (u32)(&gUnknown_0820CA98);
            offsetWrite = (VRAM + 0x4000);
            size = 0x1300;
            while (TRUE)
            {
                DmaCopy16(3, offsetRead, (void *) (offsetWrite), 0x1000);
                offsetRead += 0x1000;
                offsetWrite += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaCopy16(3, offsetRead, (void *) (offsetWrite), size);
                    break;
                }
            }

            offsetRead2 = (u32)(&gUnknown_0820F798);
            offsetWrite2 = (u32)(VRAM + 0x6000);
            DmaCopy16(3, offsetRead2, (void*)(offsetWrite2), 0x1000);
            gMain.state++;
        }
        break;
    case 8:
        REG_BG1CNT = 0x501;

        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;

        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;

        REG_BG2HOFS = 0;
        REG_BG2VOFS = 0;

        SetMainCallback2(CB2_EggHatch_1);
        gUnknown_0300481C->field_2 = 0;
        break;
    }
}

void EggHatchSetMonNickname(void)
{
    SetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar3);
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

void Task_EggHatchPlayBGM(u8 taskID)
{
    if (gTasks[taskID].data[0] == 0)
        StopMapMusic();
    if (gTasks[taskID].data[0] == 1)
        PlayBGM(376);
    if (gTasks[taskID].data[0] > 60)
    {
        PlayBGM(377);
        DestroyTask(taskID);
        //return; task is destroyed, yet you increment the value?
    }
    gTasks[taskID].data[0]++;
}

void SpriteCB_Egg_0(struct Sprite* sprite);
void SpriteCB_Egg_1(struct Sprite* sprite);
void SpriteCB_Egg_2(struct Sprite* sprite);
void SpriteCB_Egg_3(struct Sprite* sprite);
void SpriteCB_Egg_4(struct Sprite* sprite);
void SpriteCB_Egg_5(struct Sprite* sprite);

void EggHatchPrintMessage2(u8* src);
void EggHatchPrintMessage1(u8* src);
bool8 EggHatchUpdateWindowText(void);
void CreateRandomEggShardSprite(void);

void CB2_EggHatch_1(void)
{
    switch (gUnknown_0300481C->field_2)
    {
    case 0:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        REG_DISPCNT = 0x1740;
        gUnknown_0300481C->field_2++;
        CreateTask(Task_EggHatchPlayBGM, 5);
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gUnknown_0300481C->field_3 = 0;
            gUnknown_0300481C->field_2++;
        }
        break;
    case 2:
        if (++gUnknown_0300481C->field_3 > 30)
        {
            gUnknown_0300481C->field_2++;
            gSprites[gUnknown_0300481C->eggSpriteID].callback = SpriteCB_Egg_0;
        }
        break;
    case 3:
        if (gSprites[gUnknown_0300481C->eggSpriteID].callback == SpriteCallbackDummy)
            gUnknown_0300481C->field_2++;
        break;
    case 4:
        GetMonNick(&gPlayerParty[gUnknown_0300481C->eggPartyID], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_HatchedFromEgg);
        EggHatchPrintMessage2(gStringVar4);
        PlayFanfare(371);
        gUnknown_0300481C->field_2++;
        break;
    case 5:
        if (IsFanfareTaskInactive())
            gUnknown_0300481C->field_2++;
        break;
    case 6:
        if (IsFanfareTaskInactive())
            gUnknown_0300481C->field_2++;
        break;
    case 7:
        GetMonNick(&gPlayerParty[gUnknown_0300481C->eggPartyID], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_NickHatchPrompt);
        EggHatchPrintMessage1(gStringVar4);
        gUnknown_0300481C->field_2++;
        break;
    case 8:
        if (EggHatchUpdateWindowText())
        {
            MenuDrawTextWindow(22, 8, 27, 13);
            InitYesNoMenu(22, 8, 4);
            gUnknown_0300481C->field_2++;
        }
        break;
    case 9:
        {
            s8 menuInput;
            if ((menuInput = ProcessMenuInputNoWrap_()) != -2)
            {
                if (menuInput != -1 && menuInput != 1)
                {
                    u16 species;
                    u8 gender;
                    u32 personality;

                    GetMonNick(&gPlayerParty[gUnknown_0300481C->eggPartyID], gStringVar3);
                    species = GetMonData(&gPlayerParty[gUnknown_0300481C->eggPartyID], MON_DATA_SPECIES);
                    gender = GetMonGender(&gPlayerParty[gUnknown_0300481C->eggPartyID]);
                    personality = GetMonData(&gPlayerParty[gUnknown_0300481C->eggPartyID], MON_DATA_PERSONALITY, 0);
                    DoNamingScreen(3, gStringVar3, species, gender, personality, EggHatchSetMonNickname);
                }
                else
                    gUnknown_0300481C->field_2++;
            }
        }
        break;
    case 10:
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gUnknown_0300481C->field_2++;
        break;
    case 11:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_2_switch);
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void SpriteCB_Egg_0(struct Sprite* sprite)
{
    if (++sprite->data0 > 20)
    {
        sprite->callback = SpriteCB_Egg_1;
        sprite->data0 = 0;
    }
    else
    {
        sprite->data1 = (sprite->data1 + 20) & 0xFF;
        sprite->pos2.x = Sin(sprite->data1, 1);
        if (sprite->data0 == 15)
        {
            PlaySE(23);
            StartSpriteAnim(sprite, 1);
            CreateRandomEggShardSprite();
        }
    }
}

void SpriteCB_Egg_1(struct Sprite* sprite)
{
    if (++sprite->data2 > 30)
    {
        if (++sprite->data0 > 20)
        {
            sprite->callback = SpriteCB_Egg_2;
            sprite->data0 = 0;
            sprite->data2 = 0;
        }
        else
        {
            sprite->data1 = (sprite->data1 + 20) & 0xFF;
            sprite->pos2.x = Sin(sprite->data1, 2);
            if (sprite->data0 == 15)
            {
                PlaySE(23);
                StartSpriteAnim(sprite, 2);
            }
        }
    }
}

void SpriteCB_Egg_2(struct Sprite* sprite)
{
    if (++sprite->data2 > 30)
    {
        if (++sprite->data0 > 38)
        {
            u16 species;

            sprite->callback = SpriteCB_Egg_3;
            sprite->data0 = 0;
            species = GetMonData(&gPlayerParty[gUnknown_0300481C->eggPartyID], MON_DATA_SPECIES);
            gSprites[gUnknown_0300481C->pokeSpriteID].pos2.x = 0;
            gSprites[gUnknown_0300481C->pokeSpriteID].pos2.y = gMonFrontPicCoords[species].y_offset;
        }
        else
        {
            sprite->data1 = (sprite->data1 + 20) & 0xFF;
            sprite->pos2.x = Sin(sprite->data1, 2);
            if (sprite->data0 == 15)
            {
                PlaySE(23);
                StartSpriteAnim(sprite, 2);
                CreateRandomEggShardSprite();
                CreateRandomEggShardSprite();
            }
            if (sprite->data0 == 30)
                PlaySE(23);
        }
    }
}

void SpriteCB_Egg_3(struct Sprite* sprite)
{
    if (++sprite->data0 > 50)
    {
        sprite->callback = SpriteCB_Egg_4;
        sprite->data0 = 0;
    }
}

void SpriteCB_Egg_4(struct Sprite* sprite)
{
    s16 i;
    if (sprite->data0 == 0)
        BeginNormalPaletteFade(-1, -1, 0, 0x10, 0xFFFF);
    if (sprite->data0 < 4u)
    {
        for (i = 0; i <= 3; i++)
            CreateRandomEggShardSprite();
    }
    sprite->data0++;
    if (!gPaletteFade.active)
    {
        PlaySE(113);
        sprite->invisible = 1;
        sprite->callback = SpriteCB_Egg_5;
        sprite->data0 = 0;
    }
}
