#include "global.h"
#include "asm.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "rom4.h"
#include "script.h"
#include "sound.h"
#include "trainer_see.h"

extern u8 gUnknown_0815281E[];
extern u8 gUnknown_08152C39[];
extern u8 gUnknown_0815F36C[];
extern u8 gUnknown_0815F43A[];
extern u8 gUnknown_081A0009[];

__attribute__((naked))
void sub_8067EEC(struct UnkInputStruct *s)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    movs r1, 0x2\n\
    negs r1, r1\n\
    movs r3, 0x3\n\
    negs r3, r3\n\
    movs r4, 0x5\n\
    negs r4, r4\n\
    movs r5, 0x9\n\
    negs r5, r5\n\
    movs r2, 0\n\
    strb r2, [r0]\n\
    ldrb r2, [r0, 0x1]\n\
    ands r1, r2\n\
    ands r1, r3\n\
    ands r1, r4\n\
    ands r1, r5\n\
    strb r1, [r0, 0x1]\n\
    movs r1, 0\n\
    strb r1, [r0, 0x2]\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}

extern u16 cur_mapdata_block_role_at_player_pos(int);

void process_overworld_input(struct UnkInputStruct *pStruct, u16 keys, u16 heldKeys)
{
    u8 r6 = gPlayerAvatar.running1;
    u8 r9 = gPlayerAvatar.running2;
    bool8 r7 = MetatileBehavior_IsMoveTile(cur_mapdata_block_role_at_player_pos(r9));
    
    if ((r6 == 2 && r7 == FALSE) || r6 == 0)
    {
        if (sub_80E6034() != 4)
        {
            if (keys & START_BUTTON)
                pStruct->input_field_0_2 = TRUE;
            if (keys & SELECT_BUTTON)
                pStruct->input_field_0_3 = TRUE;
            if (keys & A_BUTTON)
                pStruct->input_field_0_0 = TRUE;
            if (keys & B_BUTTON)
                pStruct->input_field_0_7 = TRUE;
        }
        if (heldKeys & (DPAD_UP | DPAD_DOWN | DPAD_LEFT | DPAD_RIGHT))
        {
            pStruct->input_field_0_4 = TRUE;
            pStruct->input_field_0_5 = TRUE;
        }
    }
    if (r7 == FALSE)
    {
        if (r6 == 2 && r9 == 2)
            pStruct->input_field_0_6 = TRUE;
        if (r7 == FALSE && r6 == 2)
            pStruct->input_field_0_1 = TRUE;
    }
    if (heldKeys & DPAD_UP)
        pStruct->input_field_2 = 2;
    else if (heldKeys & DPAD_DOWN)
        pStruct->input_field_2 = 1;
    else if (heldKeys & DPAD_LEFT)
        pStruct->input_field_2 = 3;
    else if (heldKeys & DPAD_RIGHT)
        pStruct->input_field_2 = 4;
}

struct MapPosition
{
    s16 x;
    s16 y;
    u8 height;
};

void player_get_pos_to_and_height(struct MapPosition *);
extern u8 mapheader_run_first_tag2_script_list_match(void);
extern int sub_80687A4(void);
extern u8 sub_80687E4();
extern u8 is_it_battle_time_3();
extern u8 mapheader_run_first_tag2_script_list_match_conditionally();
void player_get_next_pos_and_height(struct MapPosition *);
u8 sub_80681F0(struct MapPosition *position, u16 b, u8 c);
extern u8 map_warp_consider_2_to_inside();
extern int sub_8068770(void);
extern void sub_8071310(void);
extern int sub_80A6D1C(void);

int sub_8068024(struct UnkInputStruct *s)
{
    struct MapPosition position;
    u8 r6;
    u16 r4;

    r6 = player_get_direction_lower_nybble();
    player_get_pos_to_and_height(&position);
    r4 = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (CheckTrainers() == TRUE)
        return 1;
    if (mapheader_run_first_tag2_script_list_match() == 1)
        return 1;
    if (s->input_field_0_7 && sub_80687A4() == 1)
        return 1;
    if (s->input_field_0_6)
    {
        IncrementGameStat(5);
        if (sub_80687E4(&position, r4, r6) == 1)
            return 1;
    }
    if (s->input_field_0_1 && is_it_battle_time_3(r4) == 1)
        return 1;
    if (s->input_field_0_4 && s->input_field_2 == r6)
    {
        if (mapheader_run_first_tag2_script_list_match_conditionally(&position, r4, r6) == 1)
            return 1;
    }
    player_get_next_pos_and_height(&position);
    r4 = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (s->input_field_0_0 && sub_80681F0(&position, r4, r6) == 1)
        return 1;
    if (s->input_field_0_5 && s->input_field_2 == r6)
    {
        if (map_warp_consider_2_to_inside(&position, r4, r6) == 1)
            return 1;
    }
    if (s->input_field_0_0 && sub_8068770() == 1)
        return 1;
    if (s->input_field_0_2)
    {
        PlaySE(6);
        sub_8071310();
        return 1;
    }
    //_08068154
    if (s->input_field_0_3 && sub_80A6D1C() == 1)
        return 1;
    return FALSE;
}

void player_get_pos_to_and_height(struct MapPosition *position)
{
    PlayerGetDestCoords(&position->x, &position->y);
    position->height = PlayerGetZCoord();
}

void player_get_next_pos_and_height(struct MapPosition *position)
{
    s16 x, y;
    
    GetXYCoordsOneStepInFrontOfPlayer(&position->x, &position->y);
    PlayerGetDestCoords(&x, &y);
    if (MapGridGetZCoordAt(x, y) != 0)
        position->height = PlayerGetZCoord();
    else
        position->height = 0;
}

u16 cur_mapdata_block_role_at_player_pos(int unused)
{
    s16 x, y;
    
    PlayerGetDestCoords(&x, &y);
    return MapGridGetMetatileBehaviorAt(x, y);
}

u8 *TryGetScriptOnPressingA(struct MapPosition *position, u8 b, u8 c);

u8 sub_80681F0(struct MapPosition *position, u16 b, u8 c)
{
    u8 *script = TryGetScriptOnPressingA(position, b, c);
    
    if (script == NULL)
        return FALSE;
    
    if (script != gUnknown_0815281E
     && script != gUnknown_08152C39
     && script != gUnknown_0815F36C
     && script != gUnknown_0815F43A
     && script != gUnknown_081A0009)
        PlaySE(5);
    
    ScriptContext1_SetupScript(script);
    return TRUE;
}

u8 *sub_8068364();
u8 *TryGetInvisibleMapObjectScript();
u8 *sub_8068500();
u8 *TryGetFieldMoveScript();

u8 *TryGetScriptOnPressingA(struct MapPosition *position, u8 b, u8 c)
{
    u8 *script;
    
    script = sub_8068364(position, b, c);
    if (script != NULL)
        return script;
    script = TryGetInvisibleMapObjectScript(position, b, c);
    if (script != NULL)
        return script;
    script = sub_8068500(position, b, c);
    if (script != NULL)
        return script;
    script = TryGetFieldMoveScript(position, b, c);
    if (script != NULL)
        return script;
    
    return NULL;
}
