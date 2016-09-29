#include "global.h"
#include "gba/m4a_internal.h"
#include "task.h"

struct Fanfare
{
    u16 songNum;
    u16 duration;
};

extern u32 speciesid_conv(u32);

void sound_sources_off(void);

void map_music_set_to_zero(void);

extern u16 gUnknown_020239F8;
extern struct MusicPlayerInfo *gUnknown_0202F79C;
extern u8 gUnknown_0202F7A0;

extern u16 gUnknown_030006D4;
extern u16 gUnknown_030006D6;
extern u8 gUnknown_030006D8;
extern u8 gUnknown_030006D9;
extern u16 gUnknown_030006DA;

extern u8 gUnknown_03004AEC;
extern struct MusicPlayerInfo gUnknown_03007380;
extern struct MusicPlayerInfo gUnknown_030073C0;
extern struct MusicPlayerInfo gUnknown_03007400;
extern struct MusicPlayerInfo gUnknown_03007450;

extern struct Fanfare gUnknown_0837DEF4[];

extern struct ToneData voicegroup_8452590[];
extern struct ToneData voicegroup_8452B90[];
extern struct ToneData voicegroup_8453190[];
extern struct ToneData voicegroup_8453790[];

extern struct ToneData voicegroup_84537C0[];
extern struct ToneData voicegroup_8453DC0[];
extern struct ToneData voicegroup_84543C0[];
extern struct ToneData voicegroup_84549C0[];

u8 sub_8075028(void);
u8 task_is_not_running_overworld_fanfare(void);
u8 sub_8074E14(void);
void sub_8074F6C(u16, u8);
void task50_overworld_fanfare(u8);
void task_add_50_overworld_fanfare_if_not_running(void);
void play_sound_effect(u8);
void sub_80751C0(u16 species, s8 a2, s8 a3, u8 a4, u8 a5);
void sub_8075408(u8);
void sub_8075450(void);
void sub_8075474(u16);

void sound_sources_off(void)
{
    gUnknown_03004AEC = 0;
    map_music_set_to_zero();
}

void sound_something(void)
{
    switch (gUnknown_030006D8)
    {
    case 0:
        break;
    case 1:
        gUnknown_030006D8 = 2;
        sub_8075474(gUnknown_030006D4);
        break;
    case 2:
    case 3:
    case 4:
        break;
    case 5:
        if (sub_8075028())
        {
            gUnknown_030006D6 = 0;
            gUnknown_030006D8 = 0;
        }
        break;
    case 6:
        if (sub_8075028() && task_is_not_running_overworld_fanfare())
        {
            gUnknown_030006D4 = gUnknown_030006D6;
            gUnknown_030006D6 = 0;
            gUnknown_030006D8 = 2;
            sub_8075474(gUnknown_030006D4);
        }
        break;
    case 7:
        if (sub_8075028() && task_is_not_running_overworld_fanfare())
        {
            sub_8074F6C(gUnknown_030006D6, gUnknown_030006D9);
            gUnknown_030006D4 = gUnknown_030006D6;
            gUnknown_030006D6 = 0;
            gUnknown_030006D8 = 2;
            gUnknown_030006D9 = 0;
        }
        break;
    }
}

void map_music_set_to_zero(void)
{
    gUnknown_030006D4 = 0;
    gUnknown_030006D6 = 0;
    gUnknown_030006D8 = 0;
    gUnknown_030006D9 = 0;
}

u16 current_map_music_get(void)
{
    return gUnknown_030006D4;
}

void current_map_music_set(u16 a1)
{
    gUnknown_030006D4 = a1;
    gUnknown_030006D6 = 0;
    gUnknown_030006D8 = 1;
}

void sub_8074D08(void)
{
    gUnknown_030006D4 = 0;
    gUnknown_030006D6 = 0;
    gUnknown_030006D8 = 1;
}

void sub_8074D28(u8 a1)
{
    if (sub_8074E14())
        play_sound_effect(a1);
    gUnknown_030006D4 = 0;
    gUnknown_030006D6 = 0;
    gUnknown_030006D8 = 5;
}

void sub_8074D60(u16 a1, u8 a2)
{
    sub_8074D28(a2);
    gUnknown_030006D4 = 0;
    gUnknown_030006D6 = a1;
    gUnknown_030006D8 = 6;
}

void sub_8074D94(u16 a1, u8 a2, u8 a3)
{
    sub_8074D28(a2);
    gUnknown_030006D4 = 0;
    gUnknown_030006D6 = a1;
    gUnknown_030006D8 = 7;
    gUnknown_030006D9 = a3;
}

void unref_sub_8074DD8(u16 a1, u8 a2)
{
    sub_8074F6C(a1, a2);
    gUnknown_030006D4 = a1;
    gUnknown_030006D6 = 0;
    gUnknown_030006D8 = 2;
    gUnknown_030006D9 = 0;
}

bool8 sub_8074E14(void)
{
    if (gUnknown_030006D8 == 6)
        return FALSE;
    if (gUnknown_030006D8 == 5)
        return FALSE;
    if (gUnknown_030006D8 == 7)
        return FALSE;
    return TRUE;
}

void pause_music_for_sound_maybe(u8 a1)
{
    struct Fanfare *fanfares;
    struct Fanfare *fanfare;
    u16 songNum;
    m4aMPlayStop(&gUnknown_03007380);
    fanfares = gUnknown_0837DEF4;
    fanfare = &fanfares[a1];
    songNum = fanfare->songNum;
    gUnknown_030006DA = fanfare->duration;
    m4aSongNumStart(songNum);
}

bool8 ducking_tick(u8 a1)
{
    if (gUnknown_030006DA)
    {
        gUnknown_030006DA--;
        return FALSE;
    }
    else
    {
        if (!a1)
            m4aMPlayContinue(&gUnknown_03007380);
        else
            m4aSongNumStart(0);
            
        return TRUE;
    }
}

void unref_sub_8074EA4(u8 a1)
{
    m4aSongNumStop(gUnknown_0837DEF4[a1].songNum);
}

void fanfare_play(u16 a1)
{
    s32 i;
    for (i = 0; (u32)i < 12; i++)
    {
        struct Fanfare *fanfare = &gUnknown_0837DEF4[i];
        if (fanfare->songNum == a1)
        {
            pause_music_for_sound_maybe(i);
            task_add_50_overworld_fanfare_if_not_running();
            return;
        }
    }

    pause_music_for_sound_maybe(0);
    task_add_50_overworld_fanfare_if_not_running();
}

bool8 task_is_not_running_overworld_fanfare(void)
{
    if (FuncIsActiveTask(task50_overworld_fanfare) == TRUE)
        return FALSE;
    return TRUE;
}

void task50_overworld_fanfare(u8 taskId)
{
    if (gUnknown_030006DA)
    {
        gUnknown_030006DA--;
    }
    else
    {
        m4aMPlayContinue(&gUnknown_03007380);
        DestroyTask(taskId);
    }
}

void task_add_50_overworld_fanfare_if_not_running(void)
{
    if (FuncIsActiveTask(task50_overworld_fanfare) != TRUE)
        CreateTask(task50_overworld_fanfare, 80);
}

void sub_8074F6C(u16 a1, u8 a2)
{
    if (gUnknown_03004AEC)
        a1 = 0;
    m4aSongNumStart(a1);
    m4aMPlayImmInit(&gUnknown_03007380);
    m4aMPlayVolumeControl(&gUnknown_03007380, 0xFFFF, 0);
    m4aSongNumStop(a1);
    sub_81DE0F0(&gUnknown_03007380, a2);
}

void sub_8074FB8(u8 a1)
{
    sub_81DE0D0(&gUnknown_03007380, a1);
}

bool8 sub_8074FD0(void)
{
    if (gUnknown_03007380.status & MUSICPLAYER_STATUS_PAUSE)
        return TRUE;
    if (!(gUnknown_03007380.status & MUSICPLAYER_STATUS_TRACK))
        return TRUE;
    return FALSE;
}

void sub_8074FF8(u8 a1)
{
    sub_81DE0F0(&gUnknown_03007380, a1);
}

void play_sound_effect(u8 a1)
{
    m4aMPlayFadeOut(&gUnknown_03007380, a1);
}

bool8 sub_8075028(void)
{
    if (!(gUnknown_03007380.status & MUSICPLAYER_STATUS_TRACK))
        return TRUE;
    return FALSE;
}

void cry_related(u16 a1, u8 a2)
{
    m4aMPlayVolumeControl(&gUnknown_03007380, 0xFFFF, 85);
    sub_80751C0(a1, a2, 0x7D, 0xA, 0);
    gUnknown_0202F7A0 = 2;
    sub_8075450();
}

void sub_8075090(u16 a1, s8 a2, s8 a3, u8 a4)
{
    sub_80751C0(a1, a2, a3, a4, 0);
}

void sub_80750B4(u16 a1, s8 a2, u8 a3)
{
    if (a3 == 1)
    {
        sub_80751C0(a1, a2, 0x7D, 0xA, 1);
    }
    else
    {
        m4aMPlayVolumeControl(&gUnknown_03007380, 0xFFFF, 85);
        sub_80751C0(a1, a2, 0x7D, 0xA, a3);
        gUnknown_0202F7A0 = 2;
        sub_8075450();
    }
}

void sub_8075114(u16 a1, s8 a2, u8 a3)
{
    if (a3 == 1)
    {
        sub_80751C0(a1, a2, 0x7D, 0xA, 1);
    }
    else
    {
        if (!(gUnknown_020239F8 & 0x40))
            m4aMPlayVolumeControl(&gUnknown_03007380, 0xFFFF, 85);
        sub_80751C0(a1, a2, 0x7D, 0xA, a3);
    }
}

void sub_8075178(u16 a1, u8 a2)
{
    m4aMPlayVolumeControl(&gUnknown_03007380, 0xFFFF, 85);
    sub_80751C0(a1, 0, 0x7D, 0xA, a2);
    gUnknown_0202F7A0 = 2;
    sub_8075450();
}

#define GET_CRY_PTR(a, b)\
{\
    u32 ptr1;\
    struct MusicPlayerInfo *ptr2;\
    if (v0)\
        ptr1 = (u32)&a[index];\
    else\
        ptr1 = (u32)&b[index];\
    ptr2 = sub_81DF43C(ptr1);\
    gUnknown_0202F79C = ptr2;\
    break;\
}

void sub_80751C0(u16 species, s8 a2, s8 a3, u8 a4, u8 a5)
{
    u32 cryId;
    u32 v0;
    u32 v1;
    u32 v2;
    u32 v3;
    u32 v4;
    u32 index;
    u8 table;

    species--;

    cryId = species;

    v0 = 0;
    v1 = 0;
    v2 = 140;
    v3 = 15360;
    v4 = 0;

    switch (a5)
    {
    case 0:
        break;
    case 1:
        v2 = 20;
        v1 = 225;
        break;
    case 2:
        v2 = 30;
        v1 = 225;
        v3 = 15600;
        v4 = 20;
        a3 = 80;
        break;
    case 3:
        v2 = 50;
        v1 = 200;
        v3 = 14800;
        break;
    case 4:
        v2 = 20;
        v1 = 220;
        v3 = 15800;
        break;
    case 5:
        v1 = 200;
        v3 = 14500;
        break;
    }

    sub_81DF50C(a3);
    sub_81DF520(a2);
    sub_81DF538(v3);
    sub_81DF570(v2);
    sub_81DF588(0);
    sub_81DF57C(v1);
    sub_81DF5AC(v4);
    sub_81DF618(a4);

    asm("");
    asm("");
    asm("");
    asm("");
    asm("");
    asm("");
    asm("");

    cryId = speciesid_conv(cryId);
    index = 0x7F;
    asm("" ::: "r0");
    index &= cryId;
    table = cryId >> 7;

    switch (table)
    {
    case 0: GET_CRY_PTR(voicegroup_84537C0, voicegroup_8452590);
    case 1: GET_CRY_PTR(voicegroup_8453DC0, voicegroup_8452B90);
    case 2: GET_CRY_PTR(voicegroup_84543C0, voicegroup_8453190);
    case 3: GET_CRY_PTR(voicegroup_84549C0, voicegroup_8453790);
    }
}

bool8 sub_8075374(void)
{
    if (FuncIsActiveTask(sub_8075408) == TRUE)
    {
        return FALSE;
    }
    else
    {
        ClearPokemonCrySongs();
        return TRUE;
    }
}

void sub_8075398(void)
{
    m4aMPlayStop(gUnknown_0202F79C);
    ClearPokemonCrySongs();
}

void sub_80753B0(void)
{
    m4aMPlayStop(gUnknown_0202F79C);
}

bool8 sub_80753C4(void)
{
    if (sub_81DF594(gUnknown_0202F79C))
    {
        return TRUE;
    }
    else
    {
        ClearPokemonCrySongs();
        return FALSE;
    }
}

bool8 sub_80753E8(void)
{
    if (sub_81DF594(gUnknown_0202F79C))
        return TRUE;
    else
        return FALSE;
}

void sub_8075408(u8 taskId)
{
    if (gUnknown_0202F7A0)
    {
        gUnknown_0202F7A0--;
    }
    else if (!sub_81DF594(gUnknown_0202F79C))
    {
        m4aMPlayVolumeControl(&gUnknown_03007380, 0xFFFF, 256);
        DestroyTask(taskId);
    }
}

void sub_8075450(void)
{
    if (FuncIsActiveTask(sub_8075408) != TRUE)
        CreateTask(sub_8075408, 80);
}

void sub_8075474(u16 a1)
{
    if (gUnknown_03004AEC)
        a1 = 0;
    m4aSongNumStart(a1);
}

void audio_play(u16 songNum)
{
    m4aSongNumStart(songNum);
}

void audio_play_and_stuff(u16 a1, u8 a2)
{
    m4aSongNumStart(a1);
    m4aMPlayImmInit(&gUnknown_030073C0);
    m4aMPlayImmInit(&gUnknown_03007400);
    m4aMPlayPanpotControl(&gUnknown_030073C0, 0xFFFF, a2);
    m4aMPlayPanpotControl(&gUnknown_03007400, 0xFFFF, a2);
}

void sub_80754F8(u16 a1, u8 a2)
{
    m4aSongNumStart(a1);
    m4aMPlayImmInit(&gUnknown_030073C0);
    m4aMPlayPanpotControl(&gUnknown_030073C0, 0xFFFF, a2);
}

void sub_807552C(u16 a1, u8 a2)
{
    m4aSongNumStart(a1);
    m4aMPlayImmInit(&gUnknown_03007400);
    m4aMPlayPanpotControl(&gUnknown_03007400, 0xFFFF, a2);
}

void sub_8075560(u8 a1)
{
    m4aMPlayPanpotControl(&gUnknown_030073C0, 0xFFFF, a1);
    m4aMPlayPanpotControl(&gUnknown_03007400, 0xFFFF, a1);
}

bool8 mplay_has_finished_maybe(void)
{
    if ((gUnknown_030073C0.status & MUSICPLAYER_STATUS_PAUSE) && (gUnknown_03007400.status & MUSICPLAYER_STATUS_PAUSE))
        return FALSE;
    if (!(gUnknown_030073C0.status & MUSICPLAYER_STATUS_TRACK) && !(gUnknown_03007400.status & MUSICPLAYER_STATUS_TRACK))
        return FALSE;
    return TRUE;
}

bool8 sub_80755D4(void)
{
    if (gUnknown_03007380.status & MUSICPLAYER_STATUS_PAUSE)
        return FALSE;
    if (!(gUnknown_03007380.status & MUSICPLAYER_STATUS_TRACK))
        return FALSE;
    return TRUE;
}

bool8 sub_80755FC(void)
{
    if (gUnknown_03007450.status & MUSICPLAYER_STATUS_PAUSE)
        return FALSE;
    if (!(gUnknown_03007450.status & MUSICPLAYER_STATUS_TRACK))
        return FALSE;
    return TRUE;
}
