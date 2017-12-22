#include "global.h"
#include "constants/decorations.h"
#include "secret_base.h"
#include "decoration.h"
#include "constants/species.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "fldeff_decoration.h"
#include "link.h"
#include "main.h"
#include "sound.h"
#include "constants/songs.h"
#include "constants/maps.h"
#include "map_name_popup.h"
#include "menu.h"
#include "menu_helpers.h"
#include "metatile_behavior.h"
#include "palette.h"
#include "pokemon.h"
#include "overworld.h"
#include "script.h"
#include "sound.h"
#include "constants/species.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "constants/vars.h"


static void sub_80BC7D8(u8 taskId);
static void sub_80BC824(u8 taskId);
static u8 sub_80BC948(u8 a);
static void sub_80BC980(u8 taskId);
static void sub_80BC9E4(u8 taskId);
static void sub_80BCA84(u8);
static void sub_80BCAEC(u8 taskId);
static void sub_80BCB90(u8);
static void sub_80BCBC0(u8);
static void sub_80BCBF8(u8 taskId);
static void sub_80BCC54(u8 taskId);
static void Task_SecretBasePC_Registry(u8 taskId);

extern u8 gUnknown_0815F399[];
extern u8 gUnknown_0815F49A[];
extern u8 gUnknown_020387DC;

const struct
{
    u16 unk_083D1358_0;
    u16 unk_083D1358_1;
} gUnknown_083D1358[] = {
    {0x26,  0x36},
    {0x27,  0x37},
    {0x1a0, 0x1a1},
    {0x1a8, 0x1a9},
    {0x1b0, 0x1b1},
    {0x208, 0x210},
    {0x271, 0x278}
};


const u8 gUnknown_083D1374[] = {
    MAP_NUM(SECRET_BASE_RED_CAVE1),     0,  1,  3,
    MAP_NUM(SECRET_BASE_RED_CAVE2),     0,  5,  9,
    MAP_NUM(SECRET_BASE_RED_CAVE3),     0,  1,  3,
    MAP_NUM(SECRET_BASE_RED_CAVE4),     0,  7, 13,
    MAP_NUM(SECRET_BASE_BROWN_CAVE1),   0,  2,  3,
    MAP_NUM(SECRET_BASE_BROWN_CAVE2),   0,  9,  2,
    MAP_NUM(SECRET_BASE_BROWN_CAVE3),   0, 13,  4,
    MAP_NUM(SECRET_BASE_BROWN_CAVE4),   0,  1,  2,
    MAP_NUM(SECRET_BASE_BLUE_CAVE1),    0,  1,  3,
    MAP_NUM(SECRET_BASE_BLUE_CAVE2),    0,  1,  2,
    MAP_NUM(SECRET_BASE_BLUE_CAVE3),    0,  3, 15,
    MAP_NUM(SECRET_BASE_BLUE_CAVE4),    0,  3, 14,
    MAP_NUM(SECRET_BASE_YELLOW_CAVE1),  0,  9,  3,
    MAP_NUM(SECRET_BASE_YELLOW_CAVE2),  0,  8,  7,
    MAP_NUM(SECRET_BASE_YELLOW_CAVE3),  0,  3,  6,
    MAP_NUM(SECRET_BASE_YELLOW_CAVE4),  0,  5,  9,
    MAP_NUM(SECRET_BASE_TREE1),         0,  2,  3,
    MAP_NUM(SECRET_BASE_TREE2),         0,  5,  6,
    MAP_NUM(SECRET_BASE_TREE3),         0, 15,  3,
    MAP_NUM(SECRET_BASE_TREE4),         0,  4, 10,
    MAP_NUM(SECRET_BASE_SHRUB1),        0,  3,  3,
    MAP_NUM(SECRET_BASE_SHRUB2),        0,  1,  2,
    MAP_NUM(SECRET_BASE_SHRUB3),        0,  7,  8,
    MAP_NUM(SECRET_BASE_SHRUB4),        0,  9,  6
};

const struct MenuAction2 gUnknown_083D13D4[] = {
    {SecretBaseText_DelRegist, sub_80BCA84},
    {gUnknownText_Exit, sub_80BCBF8}
};

const struct YesNoFuncTable gUnknown_083D13E4 = {
    sub_80BCB90,
    sub_80BCBC0
};

const u8 gUnknown_083D13EC[] = {
    0x23,0x24,0xF,0x1F,0x21,0x2F,0xE,0x14,0x20,0x22,0x0,0x0
};

extern void *gUnknown_0300485C;
extern u8 gUnknown_081A2E14[];
extern u8 UnknownString_81A1BB2[];
extern u8 UnknownString_81A1F67[];
extern u8 UnknownString_81A2254[];
extern u8 UnknownString_81A25C3[];
extern u8 UnknownString_81A2925[];
extern u8 UnknownString_81A1D74[];
extern u8 UnknownString_81A20C9[];
extern u8 UnknownString_81A2439[];
extern u8 UnknownString_81A2B2A[];
extern u8 UnknownString_81A2754[];


void ClearSecretBase(struct SecretBaseRecord *record)
{
    u16 i;
    u16 j;
    record->secretBaseId = 0;
    for (i=0; i<OT_NAME_LENGTH; i++)
        record->playerName[i] = 0xff;
    for (i=0; i<4; i++)
        record->trainerId[i] = 0x00;
    record->sbr_field_e = 0;
    record->sbr_field_10 = 0;
    record->sbr_field_11 = 0;
    record->sbr_field_1_0 = 0;
    record->gender = 0;
    record->sbr_field_1_5 = 0;
    record->sbr_field_1_6 = 0;
    for (i=0; i<16; i++) {
        record->decorations[i] = 0;
        record->decorationPos[i] = 0;
    }
    for (i=0; i<6; i++) {
        for (j=0; j<4; j++) {
            record->partyMoves[i * 4 + j] = 0;
        }
        record->partyPersonality[i] = 0;
        record->partyEVs[i] = 0;
        record->partySpecies[i] = 0;
        record->partyHeldItems[i] = 0;
        record->partyLevels[i] = 0;
    }
}

void ResetSecretBase(u8 idx)
{
    ClearSecretBase(&gSaveBlock1.secretBases[idx]);
}

void ResetSecretBases(void)
{
    u16 i;
    for (i = 0; i < MAX_SECRET_BASES; i++)
        ResetSecretBase(i);
}

void sub_80BB5D0(void)
{
    gUnknown_020387DC = gSpecialVar_0x8004;
}

void sub_80BB5E4(void)
{
    u16 i;
    gSpecialVar_Result = 0;
    for (i = 0; i < MAX_SECRET_BASES; i++) {
        if (gUnknown_020387DC != gSaveBlock1.secretBases[i].secretBaseId)
            continue;
        gSpecialVar_Result = 1;
        VarSet(VAR_0x4054, i);
        break;
    }
}

void sub_80BB63C(void) // 80bb63c
{
    if (gSaveBlock1.secretBases[0].secretBaseId)
        gSpecialVar_Result = 1;
    else
        gSpecialVar_Result = 0;
}

u8 sub_80BB66C(void) // 80bb66c
{
    s16 x, y;
    s16 v0;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    v0 = MapGridGetMetatileBehaviorAt(x, y) & 0xFFF;
    if (v0 == 0x90 || v0 == 0x91)
        return 1;
    else if (v0 == 0x92 || v0 == 0x93)
        return 2;
    else if (v0 == 0x9a || v0 == 0x9b)
        return 3;
    else if (v0 == 0x94 || v0 == 0x95)
        return 4;
    else if (v0 == 0x96 || v0 == 0x97 || v0 == 0x9c || v0 == 0x9d)
        return 5;
    else if (v0 == 0x98 || v0 == 0x99)
        return 6;
    return 0;
}

void sub_80BB70C(void) // 80bb70c
{
    gSpecialVar_0x8007 = sub_80BB66C();
}

s16 unref_sub_80BB724(u16 *a0, u8 a1)
{
    u16 v2;
    for (v2=0; v2<0x200; v2++) {
        if ((a0[v2] & 0xFFF) == a1)
            return (s16)v2;
    }
    return -1;
}

void sub_80BB764(s16 *arg1, s16 *arg2, u16 arg3)
{
    s16 x, y;
    for (y=0; y<gMapHeader.mapData->height; y++) {
        for (x=0; x<gMapHeader.mapData->width; x++) {
            if ((gMapHeader.mapData->map[y * gMapHeader.mapData->width + x] & 0x3ff) == arg3) {
                *arg1 = x;
                *arg2 = y;
                return;
            }
        }
    }
}

void sub_80BB800(void)
{
    s16 x, y;
    s16 tile_id;
    u16 idx;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    tile_id = MapGridGetMetatileIdAt(x, y);
    for (idx=0; idx<7; idx++) {
        if (gUnknown_083D1358[idx].unk_083D1358_0 == tile_id) {
            MapGridSetMetatileIdAt(x, y, gUnknown_083D1358[idx].unk_083D1358_1 | 0xc00);
            CurrentMapDrawMetatileAt(x, y);
            return;
        }
    }
    for (idx=0; idx<7; idx++) {
        if (gUnknown_083D1358[idx].unk_083D1358_1 == tile_id) {
            MapGridSetMetatileIdAt(x, y, gUnknown_083D1358[idx].unk_083D1358_0 | 0xc00);
            CurrentMapDrawMetatileAt(x, y);
            return;
        }
    }
}

u8 sub_80BB8A8(u8 *arg1)
{
    u8 idx;
    for (idx=0; idx<7; idx++) {
        if (arg1[idx] == EOS)
            return idx;
    }
    return 7;
}

void sub_80BB8CC(void)
{
    u8 nameLength;
    u16 idx;
    gSaveBlock1.secretBases[0].secretBaseId = gUnknown_020387DC;
    for (idx=0; idx<4; idx++) {
        gSaveBlock1.secretBases[0].trainerId[idx] = gSaveBlock2.playerTrainerId[idx];
    }
    VarSet(VAR_0x4054, 0);
    nameLength = sub_80BB8A8(gSaveBlock2.playerName);
    memset(gSaveBlock1.secretBases[0].playerName, 0xFF, OT_NAME_LENGTH);
    StringCopyN(gSaveBlock1.secretBases[0].playerName, gSaveBlock2.playerName, nameLength);
    gSaveBlock1.secretBases[0].gender = gSaveBlock2.playerGender;
    VarSet(VAR_SECRET_BASE_MAP, gMapHeader.regionMapSectionId);
}

void sub_80BB970(struct MapEvents *events)
{
    u16 bgevidx, idx, jdx;
    s16 tile_id;
    for (bgevidx=0; bgevidx<events->bgEventCount; bgevidx++) {
        if (events->bgEvents[bgevidx].kind == 8) {
            for (jdx=0; jdx<MAX_SECRET_BASES; jdx++) {
                if (gSaveBlock1.secretBases[jdx].secretBaseId == events->bgEvents[bgevidx].bgUnion.secretBaseId) {
                    tile_id = MapGridGetMetatileIdAt(events->bgEvents[bgevidx].x + 7, events->bgEvents[bgevidx].y + 7);
                    for (idx=0; idx<7; idx++) {
                        if (gUnknown_083D1358[idx].unk_083D1358_0 == tile_id) {
                            MapGridSetMetatileIdAt(events->bgEvents[bgevidx].x + 7, events->bgEvents[bgevidx].y + 7, gUnknown_083D1358[idx].unk_083D1358_1 | 0xc00);
                            break;
                        }
                    }
                    break;
                }
            }
        }
    }
}

void sub_80BBA14(void)
{
    s8 idx = 4 * (gUnknown_020387DC / 10);
    warp1_set_2(MAP_GROUP(SECRET_BASE_RED_CAVE1), gUnknown_083D1374[idx], gUnknown_083D1374[idx + 1]);
}

void sub_80BBA48(u8 taskid)
{
    u16 curbaseid;
    switch (gTasks[taskid].data[0]) {
    case 0:
        gTasks[taskid].data[0] = 1;
        break;
    case 1:
        if (!gPaletteFade.active) {
            gTasks[taskid].data[0] = 2;
        }
        break;
    case 2:
        curbaseid = VarGet(VAR_0x4054);
        if (gSaveBlock1.secretBases[curbaseid].sbr_field_10 < 0xff)
            gSaveBlock1.secretBases[curbaseid].sbr_field_10++;
        sub_80BBA14();
        warp_in();
        gFieldCallback = sub_8080990;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskid);
        break;
    }
}

void sub_80BBAF0(void)
{
    CreateTask(sub_80BBA48, 0);
    fade_screen(1, 0);
    saved_warp2_set(0, gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, -1);
}

bool8 sub_80BBB24(void)
{
    if (gMapHeader.mapType == MAP_TYPE_SECRET_BASE && VarGet(VAR_0x4097) == 0)
        return FALSE;
    return TRUE;
}

void sub_80BBB50(u8 taskid)
{
    FieldObjectTurn(&(gMapObjects[gPlayerAvatar.mapObjectId]), 2);
    if (sub_807D770() == 1) {
        EnableBothScriptContexts();
        DestroyTask(taskid);
    }
}

void sub_80BBB90(void)
{
    s16 x, y;
    ScriptContext2_Enable();
    HideMapNamePopup();
    sub_80BB764(&x, &y, 0x220);
    MapGridSetMetatileIdAt(x + 7, y + 7, 0xe20);
    CurrentMapDrawMetatileAt(x + 7, y + 7);
    pal_fill_black();
    CreateTask(sub_80BBB50, 0);
}

void sub_80BBBEC(u8 taskid)
{
    s8 idx;
    if (!gPaletteFade.active) {
        idx = 4 * (gUnknown_020387DC / 10);
        Overworld_SetWarpDestination(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, -1, gUnknown_083D1374[idx + 2], gUnknown_083D1374[idx + 3]);
        warp_in();
        gFieldCallback = sub_80BBB90;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskid);
    }
}

void sub_80BBC78(void)
{
    u8 taskid = CreateTask(sub_80BBBEC, 0);
    gTasks[taskid].data[0] = 0;
    fade_screen(1, 0);
}

bool8 CurrentMapIsSecretBase(void)
{
    if (gSaveBlock1.location.mapGroup == MAP_GROUP(SECRET_BASE_SHRUB4) && (u8)(gSaveBlock1.location.mapNum) <= MAP_NUM(SECRET_BASE_SHRUB4))
        return TRUE;
    return FALSE;
}

void sub_80BBCCC(u8 flagIn)
{
    u16 curBaseId;
    u16 x, y;
    if (CurrentMapIsSecretBase()) {
        curBaseId = VarGet(VAR_0x4054);
        for (x=0; x<16; x++) {
            if (gSaveBlock1.secretBases[curBaseId].decorations[x] > 0 && gSaveBlock1.secretBases[curBaseId].decorations[x] <= 0x78 && gDecorations[gSaveBlock1.secretBases[curBaseId].decorations[x]].permission != DECORPERM_SOLID_MAT) {
                sub_80FF394((gSaveBlock1.secretBases[curBaseId].decorationPos[x] >> 4) + 7, (gSaveBlock1.secretBases[curBaseId].decorationPos[x] & 0xF) + 7, gSaveBlock1.secretBases[curBaseId].decorations[x]);
            }
        }
        if (curBaseId != 0) {
            sub_80BB764(&x, &y, 0x220);
            MapGridSetMetatileIdAt(x + 7, y + 7, 0xe21);
        } else if (flagIn == 1 && VarGet(VAR_0x4089) == 1) {
            sub_80BB764(&x, &y, 0x220);
            MapGridSetMetatileIdAt(x + 7, y + 7, 0xe0a);
        }
    }
}

void sub_80BBDD0(void)
{
    u8 *roomdecor;
    u8 *roomdecorpos;
    u8 decidx;
    u8 objid = 0;
    u8 metatile;
    u8 permission;
    u8 ndecor;
    u16 curBase = VarGet(VAR_0x4054);
    if (!CurrentMapIsSecretBase()) {
        roomdecor = gSaveBlock1.playerRoomDecor;
        roomdecorpos = gSaveBlock1.playerRoomDecorPos;
        ndecor = 12;
    } else {
        roomdecor = gSaveBlock1.secretBases[curBase].decorations;
        roomdecorpos = gSaveBlock1.secretBases[curBase].decorationPos;
        ndecor = 16;
    }
    for (decidx=0; decidx<ndecor; decidx++) {
        if (roomdecor[decidx] != DECOR_NONE) {
            permission = gDecorations[roomdecor[decidx]].permission;
            if (permission == DECORPERM_SOLID_MAT)
            {
                for (objid=0; objid<gMapHeader.events->mapObjectCount; objid++) {
                    if (gMapHeader.events->mapObjects[objid].flagId == gSpecialVar_0x8004 + 0xAE)
                        break;
                }
                if (objid == gMapHeader.events->mapObjectCount)
                    continue;
                gSpecialVar_0x8006 = roomdecorpos[decidx] >> 4;
                gSpecialVar_0x8007 = roomdecorpos[decidx] & 0xF;
                metatile = MapGridGetMetatileBehaviorAt(gSpecialVar_0x8006 + 7, gSpecialVar_0x8007 + 7);
                if (sub_80572D8(metatile) == TRUE || sub_80572EC(metatile) == TRUE) {
                    gSpecialVar_Result = gMapHeader.events->mapObjects[objid].graphicsId + VAR_0x3F20;
                    VarSet(gSpecialVar_Result, gDecorations[roomdecor[decidx]].tiles[0]);
                    gSpecialVar_Result = gMapHeader.events->mapObjects[objid].localId;
                    FlagClear(gSpecialVar_0x8004 + 0xAE);
                    show_sprite(gSpecialVar_Result, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
                    sub_805C0F8(gSpecialVar_Result, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, gSpecialVar_0x8006, gSpecialVar_0x8007);
                    sub_805C78C(gSpecialVar_Result, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
                    gSpecialVar_0x8004 ++;
                }
            }
        }
    }
}

void sub_80BBFA4(void)
{
    int curBase = VarGet(VAR_0x4054);
    VarSet(VAR_OBJ_GFX_ID_F, gUnknown_083D13EC[sub_80BCCA4(curBase)]);
}

void sub_80BBFD8(struct MapPosition *position, struct MapEvents *events)
{
    s16 bgevtidx;
    for (bgevtidx=0; bgevtidx<events->bgEventCount; bgevtidx++) {
        if (events->bgEvents[bgevtidx].kind == 8 && position->x == events->bgEvents[bgevtidx].x + 7 && position->y == events->bgEvents[bgevtidx].y + 7) {
            gUnknown_020387DC = events->bgEvents[bgevtidx].bgUnion.secretBaseId;
            break;
        }
    }
}

void sub_80BC038(struct MapPosition *position, struct MapEvents *events)
{
    sub_80BBFD8(position, events);
    sub_80BB5E4();
    ScriptContext1_SetupScript(gUnknown_081A2E14);
}

bool8 sub_80BC050(void)
{
    sub_80BB5D0();
    sub_80BB5E4();
    if (gSpecialVar_Result == 1)
        return FALSE;
    return TRUE;
}

void sub_80BC074(u8 taskid)
{
    switch (gTasks[taskid].data[0]) {
    case 0:
        ScriptContext2_Enable();
        gTasks[taskid].data[0] = 1;
        break;
    case 1:
        if (!gPaletteFade.active) {
            gTasks[taskid].data[0] = 2;
        }
        break;
    case 2:
        copy_saved_warp2_bank_and_enter_x_to_warp1(0x7E);
        warp_in();
        gFieldCallback = mapldr_default;
        SetMainCallback2(CB2_LoadMap);
        ScriptContext2_Disable();
        DestroyTask(taskid);
        break;
    }
}

void sub_80BC0F8(void) {
    CreateTask(sub_80BC074, 0);
    fade_screen(1, 0);
}

void sub_80BC114(void) {
    if (gSaveBlock1.secretBases[0].secretBaseId != gUnknown_020387DC)
        gSpecialVar_Result = 1;
    else
        gSpecialVar_Result = 0;
}

u8 sub_80BC14C(u8 sbid)
{
    s16 idx;
    for (idx=0; idx<MAX_SECRET_BASES; idx++) {
        if (gSaveBlock1.secretBases[idx].secretBaseId == sbid)
            return idx;
    }
    return 0;
}

u8 *sub_80BC190(u8 *dest, u8 arg1) { // 80bc190
    u8 local1;
    u8 *str;

    local1 = sub_80BB8A8(gSaveBlock1.secretBases[arg1].playerName);

    str = StringCopyN(dest, gSaveBlock1.secretBases[arg1].playerName, local1);
    str[0] = EOS;

#if ENGLISH
    return StringAppend(dest, gOtherText_PlayersBase);
#elif GERMAN
    return de_sub_8073174(dest, gOtherText_PlayersBase);
#endif
}

u8 *GetSecretBaseMapName(u8 *dest) {
    gUnknown_020387DC = gSaveBlock1.secretBases[VarGet(VAR_0x4054)].secretBaseId;
    return sub_80BC190(dest, VarGet(VAR_0x4054));
}

void sub_80BC224(void) {
    u8 *var0 = gSaveBlock1.secretBases[(u8)VarGet(VAR_0x4054)].playerName;
    u8 *var1 = gStringVar1;
    u8 var2 = sub_80BB8A8(var0);
    u8 *var3 = StringCopyN(var1, var0, var2);
    *var3 = EOS;
}

bool8 sub_80BC268(u8 i) { // 80bc268
    if (gSaveBlock1.secretBases[i].sbr_field_1_6)
        return TRUE;
    return FALSE;
}

u8 sub_80BC298(struct Pokemon *mon) { // 80bc298
    u16 evsum = GetMonData(mon, MON_DATA_HP_EV);
    evsum += GetMonData(mon, MON_DATA_ATK_EV);
    evsum += GetMonData(mon, MON_DATA_DEF_EV);
    evsum += GetMonData(mon, MON_DATA_SPEED_EV);
    evsum += GetMonData(mon, MON_DATA_SPATK_EV);
    evsum += GetMonData(mon, MON_DATA_SPDEF_EV);
    return (u8)(evsum / 6);
}

#ifdef NONMATCHING
// So much is wrong with this function.
// The compiler likes to store pointers in temp variables.  That's not what it's supposed to do.
void sub_80BC300(void)
{
    u16 partyidx;
    u16 moveidx;
    u16 sbpartyidx = 0;
    for (partyidx=0; partyidx<PARTY_SIZE; partyidx++)
    {
        for (moveidx=0; moveidx<4; moveidx++)
            gSaveBlock1.secretBases[0].partyMoves[partyidx * 4 + moveidx] = MOVE_NONE;
        gSaveBlock1.secretBases[0].partySpecies[partyidx] = SPECIES_NONE;
        gSaveBlock1.secretBases[0].partyHeldItems[partyidx] = ITEM_NONE;
        gSaveBlock1.secretBases[0].partyLevels[partyidx] = 0;
        gSaveBlock1.secretBases[0].partyPersonality[partyidx] = 0;
        gSaveBlock1.secretBases[0].partyEVs[partyidx] = 0;
        if (GetMonData(&(gPlayerParty[partyidx]), MON_DATA_SPECIES) != SPECIES_NONE && !GetMonData(&(gPlayerParty[partyidx]), MON_DATA_IS_EGG)) {
            for (moveidx=0; moveidx<4; moveidx++)
                gSaveBlock1.secretBases[0].partyMoves[sbpartyidx * 4 + moveidx] = GetMonData(&(gPlayerParty[partyidx]), MON_DATA_MOVE1 + moveidx);
            gSaveBlock1.secretBases[0].partySpecies[sbpartyidx] = GetMonData(&(gPlayerParty[partyidx]), MON_DATA_SPECIES);
            gSaveBlock1.secretBases[0].partyHeldItems[sbpartyidx] = GetMonData(&(gPlayerParty[partyidx]), MON_DATA_HELD_ITEM);
            gSaveBlock1.secretBases[0].partyLevels[sbpartyidx] = GetMonData(&(gPlayerParty[partyidx]), MON_DATA_LEVEL);
            gSaveBlock1.secretBases[0].partyPersonality[sbpartyidx] = GetMonData(&(gPlayerParty[partyidx]), MON_DATA_PERSONALITY);
            gSaveBlock1.secretBases[0].partyEVs[sbpartyidx] = sub_80BC298(&(gPlayerParty[partyidx]));
            sbpartyidx ++;
        }
    }
}
#else
__attribute__((naked))
void sub_80BC300(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0xC\n\
    movs r0, 0\n\
    mov r10, r0\n\
    movs r6, 0\n\
    mov r9, r6\n\
_080BC314:\n\
    movs r4, 0\n\
    lsls r3, r6, 2\n\
    lsls r2, r6, 1\n\
    ldr r7, _080BC424 @ =gPlayerParty\n\
    adds r1, r6, 0x1\n\
    str r1, [sp]\n\
    adds r1, r3, 0\n\
_080BC322:\n\
    adds r0, r1, r4\n\
    lsls r0, 1\n\
    ldr r5, _080BC428 @ =gSaveBlock1 + 0x1A54\n\
    adds r0, r5, r0\n\
    mov r5, r9\n\
    strh r5, [r0]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    cmp r4, 0x3\n\
    bls _080BC322\n\
    ldr r1, _080BC42C @ =gSaveBlock1 + 0x1A84\n\
    adds r0, r1, r2\n\
    strh r5, [r0]\n\
    ldr r5, _080BC430 @ =gSaveBlock1 + 0x1A90\n\
    adds r0, r5, r2\n\
    mov r1, r9\n\
    strh r1, [r0]\n\
    ldr r2, _080BC434 @ =gSaveBlock1 + 0x1A9C\n\
    adds r0, r2, r6\n\
    mov r5, r9\n\
    strb r5, [r0]\n\
    ldr r1, _080BC438 @ =gSaveBlock1 + 0x1A3C\n\
    adds r0, r1, r3\n\
    mov r2, r9\n\
    str r2, [r0]\n\
    ldr r3, _080BC43C @ =gSaveBlock1 + 0x1AA2\n\
    adds r0, r3, r6\n\
    strb r2, [r0]\n\
    movs r0, 0x64\n\
    adds r5, r6, 0\n\
    muls r5, r0\n\
    adds r4, r5, r7\n\
    adds r0, r4, 0\n\
    movs r1, 0xB\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    beq _080BC408\n\
    adds r0, r4, 0\n\
    movs r1, 0x2D\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    bne _080BC408\n\
    movs r4, 0\n\
    mov r0, r10\n\
    lsls r0, 2\n\
    mov r8, r0\n\
    mov r1, r10\n\
    lsls r7, r1, 1\n\
    adds r1, 0x1\n\
    str r1, [sp, 0x4]\n\
    ldr r2, _080BC424 @ =gPlayerParty\n\
_080BC38E:\n\
    adds r1, r4, 0\n\
    adds r1, 0xD\n\
    adds r0, r5, r2\n\
    str r2, [sp, 0x8]\n\
    bl GetMonData\n\
    mov r3, r8\n\
    adds r1, r3, r4\n\
    lsls r1, 1\n\
    ldr r3, _080BC428 @ =gSaveBlock1 + 0x1A54\n\
    adds r1, r3, r1\n\
    strh r0, [r1]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    ldr r2, [sp, 0x8]\n\
    cmp r4, 0x3\n\
    bls _080BC38E\n\
    movs r0, 0x64\n\
    adds r4, r6, 0\n\
    muls r4, r0\n\
    ldr r0, _080BC424 @ =gPlayerParty\n\
    adds r4, r0\n\
    adds r0, r4, 0\n\
    movs r1, 0xB\n\
    bl GetMonData\n\
    ldr r5, _080BC42C @ =gSaveBlock1 + 0x1A84\n\
    adds r1, r5, r7\n\
    strh r0, [r1]\n\
    adds r0, r4, 0\n\
    movs r1, 0xC\n\
    bl GetMonData\n\
    ldr r2, _080BC430 @ =gSaveBlock1 + 0x1A90\n\
    adds r1, r2, r7\n\
    strh r0, [r1]\n\
    adds r0, r4, 0\n\
    movs r1, 0x38\n\
    bl GetMonData\n\
    ldr r1, _080BC434 @ =gSaveBlock1 + 0x1A9C\n\
    add r1, r10\n\
    strb r0, [r1]\n\
    adds r0, r4, 0\n\
    movs r1, 0\n\
    bl GetMonData\n\
    ldr r1, _080BC438 @ =gSaveBlock1 + 0x1A3C\n\
    add r1, r8\n\
    str r0, [r1]\n\
    adds r0, r4, 0\n\
    bl sub_80BC298\n\
    ldr r1, _080BC43C @ =gSaveBlock1 + 0x1AA2\n\
    add r1, r10\n\
    strb r0, [r1]\n\
    ldr r3, [sp, 0x4]\n\
    lsls r0, r3, 16\n\
    lsrs r0, 16\n\
    mov r10, r0\n\
_080BC408:\n\
    ldr r5, [sp]\n\
    lsls r0, r5, 16\n\
    lsrs r6, r0, 16\n\
    cmp r6, 0x5\n\
    bls _080BC314\n\
    add sp, 0xC\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080BC424: .4byte gPlayerParty\n\
_080BC428: .4byte gSaveBlock1 + 0x1A54\n\
_080BC42C: .4byte gSaveBlock1 + 0x1A84\n\
_080BC430: .4byte gSaveBlock1 + 0x1A90\n\
_080BC434: .4byte gSaveBlock1 + 0x1A9C\n\
_080BC438: .4byte gSaveBlock1 + 0x1A3C\n\
_080BC43C: .4byte gSaveBlock1 + 0x1AA2\n\
.syntax divided\n");
}
#endif

void sub_80BC440(void)
{
    u16 backupValue = gSaveBlock1.secretBases[0].sbr_field_e;
    ResetSecretBase(0);
    gSaveBlock1.secretBases[0].sbr_field_e = backupValue;
    sub_80BC0F8();
}

void SecretBasePC_PackUp(void)
{
    IncrementGameStat(GAME_STAT_MOVED_SECRET_BASE);
    sub_80BC440();
}

void sub_80BC474(void)
{
    u16 eventId;
    struct MapEvents *mapEvents = gMapHeader.events;
    for (eventId = 0; eventId < mapEvents->bgEventCount; eventId++)
    {
        if (mapEvents->bgEvents[eventId].kind == 8
            && gSaveBlock1.secretBases[0].secretBaseId == mapEvents->bgEvents[eventId].bgUnion.secretBaseId)
        {
            u16 i;
            s16 tileId = MapGridGetMetatileIdAt(mapEvents->bgEvents[eventId].x + 7, mapEvents->bgEvents[eventId].y + 7);

            for (i = 0; i < 7; i++)
            {
                if (gUnknown_083D1358[i].unk_083D1358_1 == tileId)
                {
                    MapGridSetMetatileIdAt(
                        mapEvents->bgEvents[eventId].x + 7,
                        mapEvents->bgEvents[eventId].y + 7,
                        gUnknown_083D1358[i].unk_083D1358_0 | 0xc00);
                    break;
                }
            }

            DrawWholeMapView();
            break;
        }
    }
}

void sub_80BC50C(void)
{
    u16 backupValue;
    sub_80BC474();
    IncrementGameStat(GAME_STAT_MOVED_SECRET_BASE);

    backupValue = gSaveBlock1.secretBases[0].sbr_field_e;
    ResetSecretBase(0);
    gSaveBlock1.secretBases[0].sbr_field_e = backupValue;
}

u8 sub_80BC538(void)
{
    s16 secretBaseIndex;
    u8 retVal = 0;
    
    for (secretBaseIndex = 1; secretBaseIndex < MAX_SECRET_BASES; secretBaseIndex++)
    {
        if (sub_80BC268(secretBaseIndex) == TRUE)
        {
            retVal++;
        }
    }

    return retVal;
}

void sub_80BC56C(void)
{
    u8 secretBaseIndex = sub_80BC14C(gUnknown_020387DC);
    if (sub_80BC268(secretBaseIndex) == TRUE)
    {
        gSpecialVar_Result = 1;
    }
    else if (sub_80BC538() > 9)
    {
        gSpecialVar_Result = 2;
    }
    else
    {
        gSpecialVar_Result = 0;
    }
}

void sub_80BC5BC(void)
{
    gSaveBlock1.secretBases[sub_80BC14C(gUnknown_020387DC)].sbr_field_1_6 ^= 1;
    FlagSet(FLAG_DECORATION_16);
}

void SecretBasePC_Decoration(void)
{
    CreateTask(Task_SecretBasePC_Decoration, 0);
}

void SecretBasePC_Registry(void)
{
    CreateTask(Task_SecretBasePC_Registry, 0);
}

void Task_SecretBasePC_Registry(u8 taskId)
{
    s16 *taskData;

    ScriptContext2_Enable();
    sub_80F944C();
    LoadScrollIndicatorPalette();
    
    taskData = gTasks[taskId].data;
    taskData[0] = sub_80BC538();
    if (taskData[0] != 0)
    {
        if (taskData[0] > 7) {
            taskData[3] = 7;
        }
        else
        {
            taskData[3] = taskData[0];
        }

        taskData[1] = 0;
        taskData[2] = 0;

        MenuZeroFillWindowRect(0, 0, 29, 19);
        sub_80BC7D8(taskId);

        gTasks[taskId].func = sub_80BC824;
    }
    else
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoRegistry, sub_80BCC54, 0);
    }
}

void sub_80BC6B0(u8 taskId)
{
    u8 i;
    s16 *taskData = gTasks[taskId].data;
    u8 m = 0;
    u8 n = 0;

    for (i = 1; i < MAX_SECRET_BASES; i++)
    {
        if (m == taskData[2])
        {
            m = i;
            break;
        }

        if (sub_80BC268(i) == TRUE)
            m++;
    }

    for (i = m; i < MAX_SECRET_BASES; i++)
    {
        if (sub_80BC268(i) == TRUE)
        {
            sub_80BC190(gStringVar1, i);
            MenuFillWindowRectWithBlankTile(18, 2 * n + 2, 28, 2 * n + 3);
            MenuPrint(gStringVar1, 18, 2 * n + 2);
            if (++n == 8)
                break;
        }
    }

    if (n < 8)
    {
        MenuFillWindowRectWithBlankTile(18, 2 * n + 2, 28, 2 * n + 3);
        MenuPrint(gUnknownText_Exit, 18, 2 * n + 2);
        DestroyVerticalScrollIndicator(1);
        if (n != 7)
            MenuFillWindowRectWithBlankTile(18, ((n << 25) + (1 << 26)) >> 24, 28, 18); // the shifts are needed to match
    }
    else
        CreateVerticalScrollIndicators(1, 0xbc, 0x98);

    if (taskData[2] == 0)
        DestroyVerticalScrollIndicator(0);
    else
        CreateVerticalScrollIndicators(0, 0xbc, 0x08);
}

void sub_80BC7D8(u8 taskId)
{
    u16 *taskData = gTasks[taskId].data;
    MenuDrawTextWindow(17, 0, 29, 19);
    InitMenu(0, 18, 2, taskData[3] + 1, taskData[1], 11);

    sub_80BC6B0(taskId);
}

void sub_80BC824(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (taskData[1])
        {
            PlaySE(5);
            taskData[1] = MoveMenuCursor(-1);
        }
        else if (taskData[2])
        {
            PlaySE(5);
            taskData[2]--;
            sub_80BC6B0(taskId);
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (taskData[1] == taskData[3])
        {
            if (taskData[2] + taskData[1] != taskData[0])
            {
                PlaySE(5);
                taskData[2]++;
                sub_80BC6B0(taskId);
            }
        }
        else
        {
            PlaySE(5);
            taskData[1] = MoveMenuCursor(1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(5);
        if (taskData[1] + taskData[2] == taskData[0])
        {
            HandleDestroyMenuCursors();
            MenuZeroFillWindowRect(0, 0, 29, 19);
            sub_80BCC54(taskId);
        }
        else
        {
            HandleDestroyMenuCursors();
            taskData[4] = sub_80BC948(taskData[1] + taskData[2]);
            sub_80BC980(taskId);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(5);
        HandleDestroyMenuCursors();
        MenuZeroFillWindowRect(0, 0, 29, 19);
        sub_80BCC54(taskId);
    }
}

u8 sub_80BC948(u8 a)
{
    u8 secretBaseIndex;
    u8 count = 0;

    for (secretBaseIndex = 1; secretBaseIndex < MAX_SECRET_BASES; secretBaseIndex++)
    {
        if (sub_80BC268(secretBaseIndex) == TRUE)
        {
            if (a == count)
            {
                return secretBaseIndex;
            }
            
            count++;
        }
    }

    return 0;
}

void sub_80BC980(u8 taskId)
{
    PauseVerticalScrollIndicator(0);
    PauseVerticalScrollIndicator(1);
    MenuDrawTextWindow(1, 0, 12, 5);
    PrintMenuItems(2, 1, 2, (const struct MenuAction *)gUnknown_083D13D4);
    InitMenu(0, 2, 1, 2, 0, 10);
    gTasks[taskId].func = sub_80BC9E4;
}

void sub_80BC9E4(u8 taskId)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (GetMenuCursorPos())
        {
            PlaySE(5);
            MoveMenuCursor(-1);
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (GetMenuCursorPos() != 1)
        {
            PlaySE(5);
            MoveMenuCursor(1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(5);
        gUnknown_083D13D4[GetMenuCursorPos()].func(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(5);
        sub_80BCBF8(taskId);
    }
}

void sub_80BCA84(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);

    sub_80BC190(gStringVar1, taskData[4]);
    StringExpandPlaceholders(gStringVar4, gOtherText_OkayToDeleteFromRegistry);
    DisplayItemMessageOnField(taskId, gStringVar4, sub_80BCAEC, 0);
}

void sub_80BCAEC(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083D13E4);
}

void sub_80BCB10(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    MenuZeroFillWindowRect(0, 0, 29, 19);

    gSaveBlock1.secretBases[taskData[4]].sbr_field_1_6 = 0;
    taskData[0]--;

    if (taskData[2] > 0)
    {
        taskData[2]--;
    }

    if (taskData[0] < 8)
    {
        taskData[3]--;
    }

    sub_80BC7D8(taskId);
    gTasks[taskId].func = sub_80BC824;
}

void sub_80BCB90(u8 taskId)
{
    MenuZeroFillWindowRect(20, 8, 26, 13);
    DisplayItemMessageOnField(taskId, gOtherText_RegisteredDataDeleted, sub_80BCB10, 0);
}

void sub_80BCBC0(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);

    sub_80BC7D8(taskId);
    gTasks[taskId].func = sub_80BC824;
}

void sub_80BCBF8(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    InitMenu(0, 18, 2, taskData[3] + 1, taskData[1], 11);
    MenuZeroFillWindowRect(1, 0, 12, 5);
    StartVerticalScrollIndicators(0);
    StartVerticalScrollIndicators(1);

    gTasks[taskId].func = sub_80BC824;
}

void sub_80BCC54(u8 taskId)
{
    u16 curBaseIndex = VarGet(VAR_0x4054);

    BuyMenuFreeMemory();
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);

    if (curBaseIndex == 0)
    {
        ScriptContext1_SetupScript(gUnknown_0815F399);
    }
    else
    {
        ScriptContext1_SetupScript(gUnknown_0815F49A);
    }

    DestroyTask(taskId);
}

u8 sub_80BCCA4(u8 secretBaseIndex)
{
    return (gSaveBlock1.secretBases[secretBaseIndex].playerName[OT_NAME_LENGTH] % 5) 
        + gSaveBlock1.secretBases[secretBaseIndex].gender * 5;
}

const u8 *sub_80BCCE8(void)
{
    u8 param = sub_80BCCA4(VarGet(VAR_0x4054));
    if (param == 0) return UnknownString_81A1BB2;
    if (param == 1) return UnknownString_81A1F67;
    if (param == 2) return UnknownString_81A2254;
    if (param == 3) return UnknownString_81A25C3;
    if (param == 4) return UnknownString_81A2925;
    if (param == 5) return UnknownString_81A1D74;
    if (param == 6) return UnknownString_81A20C9;
    if (param == 7) return UnknownString_81A2439;
    if (param == 8) return UnknownString_81A2754;
    return UnknownString_81A2B2A;
}

// Debugging function to test secret base battles.
void unref_sub_80BCD7C(u8 secretBaseIndex)
{
    u16 i;
    for (i = 0; i == 0; i++)
    {
        gSaveBlock1.secretBases[secretBaseIndex].partyPersonality[i] = i + 1;
        gSaveBlock1.secretBases[secretBaseIndex].partyMoves[i * 4] = i + 1;
        gSaveBlock1.secretBases[secretBaseIndex].partySpecies[i] = SPECIES_TREECKO;
        gSaveBlock1.secretBases[secretBaseIndex].partyHeldItems[i] = i + 1;
        gSaveBlock1.secretBases[secretBaseIndex].partyLevels[i] = i + 5;
        gSaveBlock1.secretBases[secretBaseIndex].partyEVs[i] = i * 5;
    }
}

void sub_80BCE1C(void)
{
    u16 curBaseIndex = VarGet(VAR_0x4054);
    sub_810FB10(1);

    CreateSecretBaseEnemyParty(&gSaveBlock1.secretBases[curBaseIndex]);
}

void sub_80BCE4C()
{
    gSaveBlock1.secretBases[VarGet(VAR_0x4054)].sbr_field_1_5 = gSpecialVar_Result;
}

void sub_80BCE90()
{
    u16 curBaseIndex = VarGet(VAR_0x4054);

    if (!FlagGet(FLAG_DAILY_UNKNOWN_8C2))
    {
        u8 i;

        for (i = 0; i < MAX_SECRET_BASES; i++)
        {
            gSaveBlock1.secretBases[i].sbr_field_1_5 = 0;
        }

        FlagSet(FLAG_DAILY_UNKNOWN_8C2);
    }

    gSpecialVar_0x8004 = sub_80BCCA4(curBaseIndex);
    gSpecialVar_Result = gSaveBlock1.secretBases[curBaseIndex].sbr_field_1_5;
}

void sub_80BCF1C(u8 taskId)
{
    s16 x, y;
    u32 behavior;
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[1])
    {
    case 0:
        PlayerGetDestCoords(&taskData[2], &taskData[3]);
        taskData[1] = 1;
        break;
    case 1:
        PlayerGetDestCoords(&x, &y);
        if (x != taskData[2] || y != taskData[3])
        {
            taskData[2] = x;
            taskData[3] = y;

            behavior = MapGridGetMetatileBehaviorAt(x, y);
            if (sub_8057350(behavior) == TRUE)
            {
                DoYellowCave4Sparkle();
            }
            else if (sub_8057314(behavior) == TRUE)
            {
                sub_80C68A4(MapGridGetMetatileIdAt(x, y), x, y);
            }
            else if (sub_8057328(behavior) == TRUE)
            {
                sub_80C6A54(x, y);
            }
            else if (sub_805733C(behavior) == TRUE)
            {
                DoDecorationSoundEffect(MapGridGetMetatileIdAt(x, y));
            }
        }
        break;
    case 2:
        if (!FieldEffectActiveListContains(taskData[4]))
        {
            taskData[1] = 1;
        }
        break;
    }
}

void sub_80BD034(u8 i, struct SecretBaseRecord *secretBase)
{
    gSaveBlock1.secretBases[i] = *secretBase;
    gSaveBlock1.secretBases[i].sbr_field_1_6 = 2;
}

bool8 sub_80BD070(struct SecretBaseRecord *baseA, struct SecretBaseRecord *baseB)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (baseA->trainerId[i] != baseB->trainerId[i])
        {
            return FALSE;
        }
    }

    return TRUE;
}

bool8 sub_80BD0A0(struct SecretBaseRecord *baseA, struct SecretBaseRecord *baseB)
{
    u8 i;

    for (i = 0; i < OT_NAME_LENGTH && (baseA->playerName[i] != 0xFF || baseB->playerName[i] != 0xFF); i++)
    {
        if (baseA->playerName[i] != baseB->playerName[i])
        {
            return FALSE;
        }
    }

    return TRUE;
}

bool8 sub_80BD0EC(struct SecretBaseRecord *baseA, struct SecretBaseRecord *baseB)
{
    if (baseA->gender == baseB->gender && sub_80BD070(baseA, baseB) && sub_80BD0A0(baseA, baseB))
    {
        return TRUE;
    }


    return FALSE;
}

s16 sub_80BD12C(u8 secretBaseId)
{
    s16 i;

    for (i = 0; i < MAX_SECRET_BASES; i++)
    {
        if (gSaveBlock1.secretBases[i].secretBaseId == secretBaseId)
        {
            return i;
        }
    }

    return -1;
}

u8 sub_80BD170(void)
{
    s16 i;

    for (i = 1; i < MAX_SECRET_BASES; i++)
    {
        if (gSaveBlock1.secretBases[i].secretBaseId == 0)
        {
            return i;
        }
    }

    return 0;
}

u8 sub_80BD1B0(void)
{
    s16 i;

    for (i = 1; i < MAX_SECRET_BASES; i++)
    {
        if (gSaveBlock1.secretBases[i].sbr_field_1_6 == 0 && gSaveBlock1.secretBases[i].sbr_field_1_0 == 0)
        {
            return i;
        }
    }

    return 0;
}

u8 sub_80BD1FC(struct SecretBaseRecord *secretBase)
{
    s16 secretBaseIndex;

    if (secretBase->secretBaseId == 0)
    {
        return 0;
    }

    secretBaseIndex = sub_80BD12C(secretBase->secretBaseId);
    if (secretBaseIndex != 0)
    {
        if (secretBaseIndex != -1)
        {
            if (gSaveBlock1.secretBases[secretBaseIndex].sbr_field_1_0 == 1)
            {
                return 0;
            }
            if (gSaveBlock1.secretBases[secretBaseIndex].sbr_field_1_6 != 2
                    || secretBase->sbr_field_1_0 == 1)
            {
                sub_80BD034(secretBaseIndex, secretBase);
                return secretBaseIndex;
            }
        }
        else
        {
            secretBaseIndex = sub_80BD170();
            if (secretBaseIndex != 0)
            {
                sub_80BD034(secretBaseIndex, secretBase);
                return secretBaseIndex;
            }
            secretBaseIndex = sub_80BD1B0();
            if (secretBaseIndex)
            {
                sub_80BD034(secretBaseIndex, secretBase);
                return secretBaseIndex;
            }
        }
    }

    return 0;
}

void sub_80BD280(void)
{
    u8 i;
    u8 j;
    struct SecretBaseRecord temp;
    struct SecretBaseRecord *secretBases = gSaveBlock1.secretBases;

    for (i = 1; i < MAX_SECRET_BASES - 1; i++)
    {
        for (j = i + 1; j < MAX_SECRET_BASES; j++)
        {
            if ((!secretBases[i].sbr_field_1_6 && secretBases[j].sbr_field_1_6 == 1)
                || (secretBases[i].sbr_field_1_6 == 2 && secretBases[j].sbr_field_1_6 != 2))
            {
                temp = secretBases[i];
                secretBases[i] = secretBases[j];
                secretBases[j] = temp;
            }
        }
    }
}

void sub_80BD328(struct SecretBaseRecord *secretBases, u8 b)
{
    u16 i;

    for (i = 1; i < MAX_SECRET_BASES; i++)
    {
        if (secretBases[i].sbr_field_1_6 == b)
        {
            sub_80BD1FC(&secretBases[i]);
        }
    }
}

bool8 sub_80BD358(struct SecretBaseRecord *secretBase)
{
    u8 i;

    if (!secretBase->secretBaseId)
        return FALSE;

    if (secretBase->secretBaseId && secretBase->gender != gSaveBlock2.playerGender)
        return FALSE;

    // Check if the player's trainer Id matches the secret base's id.
    for (i = 0; i < 4; i++)
    {
        if (secretBase->trainerId[i] != gSaveBlock2.playerTrainerId[i])
            return FALSE;
    }

    for (i = 0; i < OT_NAME_LENGTH && (secretBase->playerName[i] != 0xFF || gSaveBlock2.playerName[i] != 0xFF); i++)
    {
        if (secretBase->playerName[i] != gSaveBlock2.playerName[i])
            return FALSE;
    }

    return TRUE;
}

void sub_80BD3DC(struct SecretBaseRecord *basesA, struct SecretBaseRecord *basesB, struct SecretBaseRecord *basesC)
{
    u8 i;
    u8 var1 = 0;

    for (i = 0; i < MAX_SECRET_BASES; i++)
    {
        if ((var1 & 1) == 0)
        {
            if (sub_80BD358(&basesA[i]) == TRUE)
            {
                ClearSecretBase(&basesA[i]);
                var1 |= 1;
            }
        }

        if ((var1 & 2) == 0)
        {
            if (sub_80BD358(&basesB[i]) == TRUE)
            {
                ClearSecretBase(&basesB[i]);
                var1 |= 2;
            }
        }

        if ((var1 & 4) == 0)
        {
            if (sub_80BD358(&basesC[i]) == TRUE)
            {
                ClearSecretBase(&basesC[i]);
                var1 |= 4;
            }
        }

        if (var1 == 7)
        {
            break;
        }
    }
}

bool8 sub_80BD494(struct SecretBaseRecord *base, struct SecretBaseRecord *secretBases, u8 c)
{
    u8 i;

    for (i = 0; i < MAX_SECRET_BASES; i++)
    {
        if (secretBases[i].secretBaseId)
        {
            if (sub_80BD0EC(base, &secretBases[i]) == TRUE)
            {
                if (c == 0)
                {
                    ClearSecretBase(&secretBases[i]);
                    return FALSE;
                }

                if (base->sbr_field_e > secretBases[i].sbr_field_e)
                {
                    ClearSecretBase(&secretBases[i]);
                    return FALSE;
                }

                secretBases[i].sbr_field_1_0 = base->sbr_field_1_0;

                ClearSecretBase(base);
                return TRUE;
            }
        }
    }

    return FALSE;
}

void sub_80BD514(struct SecretBaseRecord *basesA, struct SecretBaseRecord *basesB, struct SecretBaseRecord *basesC, struct SecretBaseRecord *basesD)
{
    u8 i;

    for (i = 1; i < MAX_SECRET_BASES; i++)
    {
        if (basesA[i].secretBaseId)
        {
            if (basesA[i].sbr_field_1_6 == 1)
            {
                basesA[i].sbr_field_1_0 = 1;
            }

            if (!sub_80BD494(&basesA[i], basesB, i))
            {
                if (!sub_80BD494(&basesA[i], basesC, i))
                {
                    sub_80BD494(&basesA[i], basesD, i);
                }
            }
        }
    }

    for (i = 0; i < MAX_SECRET_BASES; i++)
    {
        if (basesB[i].secretBaseId)
        {
            basesB[i].sbr_field_1_5 = 0;

            if (!sub_80BD494(&basesB[i], basesC, i))
            {
                sub_80BD494(&basesB[i], basesD, i);
            }
        }
    }

    for (i = 0; i < MAX_SECRET_BASES; i++)
    {
        if (basesC[i].secretBaseId)
        {
            basesC[i].sbr_field_1_5 = 0;
            sub_80BD494(&basesC[i], basesD, i);
        }

        if (basesD[i].secretBaseId)
        {
            basesD[i].sbr_field_1_5 = 0;
        }
    }
}

void sub_80BD610(struct SecretBaseRecord *basesA, struct SecretBaseRecord *basesB, struct SecretBaseRecord *basesC)
{
    sub_80BD3DC(basesA, basesB, basesC);
    sub_80BD514(gSaveBlock1.secretBases, basesA, basesB, basesC);

    sub_80BD1FC(basesA);
    sub_80BD1FC(basesB);
    sub_80BD1FC(basesC);

    sub_80BD328(basesA, 1);
    sub_80BD328(basesB, 1);
    sub_80BD328(basesC, 1);

    sub_80BD328(basesA, 0);
    sub_80BD328(basesB, 0);
    sub_80BD328(basesC, 0);
} 

void sub_80BD674(void *playerRecords, u32 size, u8 c)
{
    if (FlagGet(FLAG_RECEIVED_SECRET_POWER))
    {
        u16 i;
        u8 numLinkedPlayers = GetLinkPlayerCount();
        switch (numLinkedPlayers)
        {
        case 2:
            memset(playerRecords + size * 2, 0, size);
            memset(playerRecords + size * 3, 0, size);
            break;
        case 3:
            memset(playerRecords + size * 3, 0, size);
            break;
        }

        switch (c)
        {
        case 0:
            sub_80BD610(playerRecords + size, playerRecords + size * 2, playerRecords + size * 3);
            break;
        case 1:
            sub_80BD610(playerRecords + size * 2, playerRecords + size * 3, playerRecords);
            break;
        case 2:
            sub_80BD610(playerRecords + size * 3, playerRecords, playerRecords + size);
            break;
        case 3:
            sub_80BD610(playerRecords, playerRecords + size, playerRecords + size * 2);
            break;
        }

        for (i = 1; i < MAX_SECRET_BASES; i++)
        {
            if (gSaveBlock1.secretBases[i].sbr_field_1_0 == 1)
            {
                gSaveBlock1.secretBases[i].sbr_field_1_6 = 1;
                gSaveBlock1.secretBases[i].sbr_field_1_0 = 0;
            }
        }

        sub_80BD280();

        for (i = 1; i < MAX_SECRET_BASES; i++)
        {
            if (gSaveBlock1.secretBases[i].sbr_field_1_6 == 2)
            {
                gSaveBlock1.secretBases[i].sbr_field_1_6 = 0;
            }
        }

        if (gSaveBlock1.secretBases[0].sbr_field_e != 0xFFFF)
        {
            gSaveBlock1.secretBases[0].sbr_field_e++;
        }
    }
}
