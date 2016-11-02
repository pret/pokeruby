#include "global.h"

#define FIRST_BERRY 0x85 // ITEM_CHERI_BERRY
#define LAST_BERRY 0xaf // ITEM_ENIGMA_BERRY

extern u8 GetStageByBerryTreeId(u8);
extern u16 GetStageDurationByBerryType(u8);
extern void SetMainCallback2(void*);
extern void sub_80A68CC();
extern u16 Random(void);
extern u8 sub_8060234(u8, u8, u8);
extern u8 AddBagItem(u16, u8);
extern void sub_8060288(u8, u8, u8);
extern u8 IsBagPocketNonEmpty(u8);
extern void GetCameraCoords(s16*, s16*);
extern u8 FieldObjectGetBerryTreeId(u8);
extern u8 *GetFieldObjectScriptPointerForComparison();

extern struct Berry gBerries[];
extern u8 BerryTreeScript;
extern struct BerryTree gUnknown_083CD780;
extern u16 gUnknown_0202E8DE;
extern u16 gUnknown_0202E8CC; 
extern u16 gUnknown_0202E8CE;
extern u16 gUnknown_0202E8D0; 

u8 CalcBerryYield(struct BerryTree *tree);

void unref_sub_80B4884(void)
{
    CpuFill16(0, &gSaveBlock1.enigmaBerry, sizeof(gSaveBlock1.enigmaBerry));
}

// setEnigmaBerry
void sub_80B48A8(u8 *src)
{
    u8 *dest;
    struct SaveBlock1 *saveBlock;
    unsigned int i;
    dest = (u8*)&gSaveBlock1.enigmaBerry;
    saveBlock = &gSaveBlock1;
    for (i = 0; i < sizeof(gSaveBlock1.enigmaBerry); i++)
    {
        dest[i] = src[i];
    }
    gSaveBlock1.enigmaBerry.berry.description1 = gSaveBlock1.enigmaBerry.description1;
    gSaveBlock1.enigmaBerry.berry.description2 = gSaveBlock1.enigmaBerry.description2;
}

// checksum
u32 sub_80B48F8(struct EnigmaBerry *enigmaBerry)
{
    u8 *description1;
    u8 *description2;
    unsigned int i;
    u32 checksum;
    u8 *dest;

    description1 = gSaveBlock1.enigmaBerry.berry.description1;
    description2 = gSaveBlock1.enigmaBerry.berry.description2;
    gSaveBlock1.enigmaBerry.berry.description1 = 0;
    gSaveBlock1.enigmaBerry.berry.description2 = 0;

    dest = (u8*)enigmaBerry;
    checksum = 0;
    for (i = 0; i < ((int)&gSaveBlock1.enigmaBerry.checksum - (int)&gSaveBlock1.enigmaBerry); i++)
    {
        checksum += dest[i];
    }

    gSaveBlock1.enigmaBerry.berry.description1 = description1;
    gSaveBlock1.enigmaBerry.berry.description2 = description2;

    return checksum;
}

int sub_80B4940(void)
{
    if (!gSaveBlock1.enigmaBerry.berry.stageDuration)
        return 0;
    if (!gSaveBlock1.enigmaBerry.berry.maxYield)
        return 0;
    if (sub_80B48F8(&gSaveBlock1.enigmaBerry) != gSaveBlock1.enigmaBerry.checksum)
        return 0;
    return 1;
}

struct Berry *GetBerryInfo(u8 berry)
{
    if ((u8)berry == 0x2b)
    {
        if (sub_80B4940())
            return &gSaveBlock1.enigmaBerry.berry;
    }
    if ((u8)(berry - 1) > 0x2a)
    {
        berry = 1;
    }
    return &gBerries[berry - 1];
}

struct BerryTree *GetBerryTreeInfo(u8 id)
{
    return &gSaveBlock1.berryTrees[id];
}

int FieldObjectInteractionWaterBerryTree(void)
{
    struct BerryTree *tree = GetBerryTreeInfo(FieldObjectGetBerryTreeId(gSelectedMapObject));
    switch (tree->stage)
    {
    case 1:
        tree->watered1 = 1;
        break;
    case 2:
        tree->watered2 = 1;
        break;
    case 3:
        tree->watered3 = 1;
        break;
    case 4:
        tree->watered4 = 1;
        break;
    default:
        return 0;
    }
    return 1;
}

int IsPlayerFacingPlantedBerryTree(void)
{
    if (GetFieldObjectScriptPointerForComparison() == &BerryTreeScript)
        if (GetStageByBerryTreeId(FieldObjectGetBerryTreeId(gSelectedMapObject)) == 0)
            return 1;
    return 0;
}

u8 WaterBerryTree(void)
{
    if (GetFieldObjectScriptPointerForComparison() != &BerryTreeScript)
        return 0;
    return FieldObjectInteractionWaterBerryTree();
}

void sub_80B4A90(void)
{
    int i;
    struct SaveBlock1 *saveBlock1 = &gSaveBlock1;
    struct BerryTree berryTree = gUnknown_083CD780;
    for (i = 127; i >= 0; i--)
    {
        saveBlock1->berryTrees[i] = berryTree;
    }
}

int BerryTreeGrow(struct BerryTree *tree)
{
    if (tree->growthSparkle)
        return 0;
    switch (tree->stage)
    {
    case 0:
        return 0;
    case 4:
        tree->berryYield = CalcBerryYield(tree);
    case 1:
    case 2:
    case 3:
        tree->stage++;
        break;
    case 5:
        tree->watered1 = 0;
        tree->watered2 = 0;
        tree->watered3 = 0;
        tree->watered4 = 0;
        tree->berryYield = 0;
        tree->stage = 2;
        if (++tree->regrowthCount == 10)
            *tree = gUnknown_083CD780;
        break;
    }
    return 1;
}

void BerryTreeTimeUpdate(int time)
{
    int i;
    struct BerryTree *tree;
    int time2;
    for (i = 0; i <= 0x7f; i++)
    {
        tree = &gSaveBlock1.berryTrees[i];

        if (tree->berry == 0)
            continue;
        if (tree->stage == 0)
            continue;
        if (tree->growthSparkle)
            continue;

        if (time >= GetStageDurationByBerryType(tree->berry) * 71)
        {
            *tree = gUnknown_083CD780;
            continue;
        }

        time2 = time;
        if (!time2)
            continue;

        if (tree->secondsUntilNextStage > time2)
        {
            tree->secondsUntilNextStage -= time2;
            time2 = tree->secondsUntilNextStage;
            continue;
        }

        while (1)
        {
            time2 -= tree->secondsUntilNextStage;
            tree->secondsUntilNextStage = GetStageDurationByBerryType(tree->berry);
            if (BerryTreeGrow(tree))
            {
                if (tree->stage == 5)
                {
                    tree->secondsUntilNextStage *= 4;
                }
                if (!time2)
                {
                    break;
                }
            }
            else
            {
                break;
            }
            if (tree->secondsUntilNextStage > time2)
            {
                tree->secondsUntilNextStage -= time2;
                time2 = tree->secondsUntilNextStage;
                break;
            }
        }
    }
}

void PlantBerryTree(u8 id, u8 berry, u8 stage, u8 sparkle)
{
    struct BerryTree *tree;
    tree = GetBerryTreeInfo(id);
    *tree = gUnknown_083CD780;
    tree->berry = berry;
    tree->secondsUntilNextStage = GetStageDurationByBerryType(berry);
    tree->stage = stage;
    if (stage == 5)
    {
        tree->berryYield = CalcBerryYield(tree);
        tree->secondsUntilNextStage *= 4;
    }
    if (sparkle == 0)
    {
        tree->growthSparkle = 1;
    }
}

void RemoveBerryTree(u8 id)
{
    gSaveBlock1.berryTrees[id] = gUnknown_083CD780;
}

u8 GetBerryTypeByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].berry;
}

u8 GetStageByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].stage;
}

u8 ItemIdToBerryType(u16 item)
{
    u16 berry = item - FIRST_BERRY;
    if (berry > LAST_BERRY - FIRST_BERRY)
        return 1;
    return item - FIRST_BERRY + 1;
}

u16 BerryTypeToItemId(u16 berry)
{
    u16 item = berry;
    item -= 1;
    if (item > LAST_BERRY - FIRST_BERRY)
        return FIRST_BERRY;
    item = berry;
    return item + FIRST_BERRY - 1;
}

void GetBerryNameByBerryType(u8 berry, u8 *string)
{
    struct Berry *info;
    info = GetBerryInfo(berry);
    memcpy(string, info->name, 6);
    string[6] = 0xff;
}

void ResetBerryTreeSparkleFlag(u8 id)
{
    struct BerryTree *tree;
    tree = GetBerryTreeInfo(id);
    tree->growthSparkle = 0;
}

u8 BerryTreeGetNumStagesWatered(struct BerryTree *tree)
{
    u8 count = 0;
    if (tree->watered1)
        count++;
    if (tree->watered2)
        count++;
    if (tree->watered3)
        count++;
    if (tree->watered4)
        count++;
    return count;
}

u8 GetNumStagesWateredByBerryTreeId(u8 id)
{
    return BerryTreeGetNumStagesWatered(GetBerryTreeInfo(id));
}

u8 CalcBerryYieldInternal(u16 a1, u16 a2, u8 a3)
{
    u32 v6;
    u32 v1;
    u32 v5;
    u32 v4;
    u16 random;
    u32 ret;
    v6 = a2;
    if (a3 == 0)
        return v6;
    v1 = a1 - v6;
    v5 = v1 * (a3 - 1);
    v4 = v1 * a3;
    random = Random();
    v4 -= v5;
    v4 += 1;
    v5 += random % v4;
    if ((v5 & 3) <= 1)
    {
        ret = v5 / 4;
        return ret + v6;
    }
    else
    {
        ret = v5 / 4 + 1;
        return ret + v6;
    }
}

u8 CalcBerryYield(struct BerryTree *tree)
{
    struct Berry *berry = GetBerryInfo(tree->berry);
    u8 min = berry->minYield;
    u8 max = berry->maxYield;
    return CalcBerryYieldInternal(max, min, BerryTreeGetNumStagesWatered(tree));
}

u8 GetBerryCountByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].berryYield;
}

u16 GetStageDurationByBerryType(u8 berry)
{
    return GetBerryInfo(berry)->stageDuration * 60;
}

void FieldObjectInteractionGetBerryTreeData(void)
{
    u8 id;
    u8 berry;
    u8 unk;
    u8 group;
    u8 num;
    id = FieldObjectGetBerryTreeId(gSelectedMapObject);
    berry = GetBerryTypeByBerryTreeId(id);
    ResetBerryTreeSparkleFlag(id);
    unk = gUnknown_0202E8DE;
    num = gSaveBlock1.location.mapNum;
    group = gSaveBlock1.location.mapGroup;

    if (sub_8060234(unk, num, group))
        gUnknown_0202E8CC = 0xff;
    else
        gUnknown_0202E8CC = (u8)GetStageByBerryTreeId(id);

    gUnknown_0202E8CE = (u8)GetNumStagesWateredByBerryTreeId(id);
    gUnknown_0202E8D0 = (u8)GetBerryCountByBerryTreeId(id);
    GetBerryNameByBerryType(berry, gStringVar1);
}

void sub_80B4EE4(void)
{
    SetMainCallback2(sub_80A68CC);
}

void FieldObjectInteractionPlantBerryTree(void)
{
    extern u16 word_203855E;
    u8 berry = ItemIdToBerryType(word_203855E);
    PlantBerryTree(FieldObjectGetBerryTreeId(gSelectedMapObject), berry, 1, 1);
    FieldObjectInteractionGetBerryTreeData();
}

void FieldObjectInteractionPickBerryTree(void)
{
    u8 id;
    u8 berry;
    id = FieldObjectGetBerryTreeId(gSelectedMapObject);
    berry = GetBerryTypeByBerryTreeId(id);
    gUnknown_0202E8CC = AddBagItem(BerryTypeToItemId(berry), GetBerryCountByBerryTreeId(id));
}

void FieldObjectInteractionRemoveBerryTree(void)
{
    u8 id;
    u8 unk;
    u8 group, num;
    id = FieldObjectGetBerryTreeId(gSelectedMapObject);
    RemoveBerryTree(id);
    unk = gUnknown_0202E8DE;
    num = gSaveBlock1.location.mapNum;
    group = gSaveBlock1.location.mapGroup;
    sub_8060288(unk, num, group);
}

u8 PlayerHasBerries(void)
{
    return IsBagPocketNonEmpty(4);
}

void ResetBerryTreeSparkleFlags(void)
{
    s16 cam_left;
    s16 cam_top;
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
    int i;

    GetCameraCoords(&cam_left, &cam_top);
    left = cam_left;
    top = cam_top + 3;
    right = cam_left + 14;
    bottom = top + 8;

    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].animPattern == 12)
        {
            cam_left = gMapObjects[i].coords2.x;
            cam_top = gMapObjects[i].coords2.y;
            if (left <= cam_left && cam_left <= right && top <= cam_top && cam_top <= bottom)
                ResetBerryTreeSparkleFlag(gMapObjects[i].trainerRange_berryTreeId);
        }
    }
}
