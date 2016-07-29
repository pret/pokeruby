#include "global.h"
#include "palette.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

//Text Strings
extern const u8 gUnknown_081C6D78[];    //Hi! Sorry to keep you waiting!...
extern const u8 gUnknown_081C6DF8[];
extern const u8 gUnknown_081C6E1A[];
extern const u8 gUnknown_081C6FCB[];
extern const u8 gUnknown_081C6FD8[];
extern const u8 gUnknown_081C6FFA[];
extern u8 gUnknown_081C7017[];

extern const u8 gUnknown_081E764C[];
extern const u8 gUnknown_081E768C[];
extern const u8 gUnknown_081E7834[];
extern const u8 gUnknown_081E796C[];
extern const u8 gUnknown_0840DFF7[];

extern struct Sprite gSprites[];
extern u8 gStringVar4[];

void AddTextPrinterWithCallbackForMessage(const u8 *string, u8 a, u8 b);
void DrawDefaultWindow(u8 a, u8 b, u8 c, u8 d);
s8 GenderMenuProcessInput(void);
s8 NameMenuProcessInput(void);
void task_new_game_prof_birch_speech_2(u8 taskId);
void task_new_game_prof_birch_speech_3(u8 taskId);
void task_new_game_prof_birch_speech_4(u8 taskId);
void task_new_game_prof_birch_speech_5(u8 taskId);
void task_new_game_prof_birch_speech_6(u8 taskId);
void task_new_game_prof_birch_speech_7(u8 taskId);
void task_new_game_prof_birch_speech_8(u8 taskId);
void task_new_game_prof_birch_speech_9(u8 taskId);
void task_new_game_prof_birch_speech_10(u8 taskId);
void task_new_game_prof_birch_speech_11(u8 taskId);
void task_new_game_prof_birch_speech_12(u8 taskId);
void task_new_game_prof_birch_speech_13(u8 taskId);
void task_new_game_prof_birch_speech_14(u8 taskId);
void task_new_game_prof_birch_speech_15(u8 taskId);
void task_new_game_prof_birch_speech_16(u8 taskId);
void task_new_game_prof_birch_speech_17(u8 taskId);
void task_new_game_prof_birch_speech_18(u8 taskId);
void sub_800A974(u8 taskId);
void Task_800A9B4(u8 taskId);
void sub_800A9EC(u8 taskId);
void sub_800AAAC(u8 taskId);
void task_new_game_prof_birch_speech_part2_1(u8 taskId);
void sub_800AB38(u8 taskId);
void task_new_game_prof_birch_speech_part2_4(u8 taskId);
void new_game_prof_birch_speech_part2_start(u8 taskId);

void sub_800B534(u8 taskId, u8 a);
void sub_800B6C0(u8 taskId, u8 a);
u8 sub_8072CF4(u8 a);
void sub_8072DEC(void);
u8 sub_8075374(void);
void sub_807206C(u32);
void cry_related(u16, u8);
void audio_play(u8 a);
void Reset(u8 a, u8 b, u8 c, u8 d);
u8 GetMenuCursorPos(void);
void CreateNameMenu(u8 a, u8 b);
void set_default_player_name(u8 a);
void DoNamingScreen(u8 r0, struct SaveBlock2 *r1, u16 r2, u16 r3, u8 s0, TaskFunc s4);
void sub_8072974(u8 r0, u8 r1, u32 r2);

void Task_Birch1(u8 taskId)
{
	SetUpWindowConfig(&gWindowConfig_81E6C3C);
	sub_8071C4C(&gWindowConfig_81E6CE4);
	REG_WIN0H = 0;
	REG_WIN0V = 0;
	REG_WININ = 0;
	REG_WINOUT = 0;
	REG_BLDCNT = 0;
	REG_BLDALPHA = 0;
	REG_BLDY = 0;
	LZ77UnCompVram(&gUnknown_081E768C, 0xC0 << 19);
	LZ77UnCompVram(&gUnknown_081E7834, 0x06003800);
	LoadPalette(&gUnknown_081E764C, 0, 0x40);
	LoadPalette(&gUnknown_081E796C, 1, 0x10);
	remove_some_task();
	ResetSpriteData();
	FreeAllSpritePalettes();
	AddBirchSpeechObjects(taskId);
	BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
	REG_BG1CNT = 0x00000703;
	REG_DISPCNT = 0x9A << 5;
	gTasks[taskId].data[4] = 0;
	gTasks[taskId].func = task_new_game_prof_birch_speech_2;
	gTasks[taskId].data[2] = 0xFF;
	gTasks[taskId].data[3] = 0xFF;
	gTasks[taskId].data[7] = 0xD8;
	
	sub_8075474(0xBB << 1);
}

void task_new_game_prof_birch_speech_2(u8 taskId)
{
	struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
	
	if(task->data[7] != 0)
	{
		task->data[7]--;
	}
	else
	{
		u8 spriteId = task->data[8];
		struct Sprite *sprites = gSprites;
		struct Sprite *sprite = &sprites[spriteId];
		sprite->pos1.x = 0x88;
		sprite->pos1.y = 0x3C;
		sprite->invisible = 0;
		sprite->oam.objMode = 1;
		sub_800B534(taskId, 0xA);
		sub_800B6C0(taskId, 0x14);
		task->data[7] = 0x50;
		task->func = task_new_game_prof_birch_speech_3;
	}
}

void task_new_game_prof_birch_speech_3(u8 taskId)
{
	struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
	
	if(task->data[5] != 0)
	{
		struct Sprite *sprites = gSprites;
		struct Sprite *sprite = &sprites[(s16)task->data[8]];
		
		sprite->oam.objMode = 0;
		if((u16)task->data[7])
		{
			task->data[7]--;
		}
		else
		{
			DrawDefaultWindow(0x2, 0xD, 0x1B, 0x12);
			AddTextPrinterWithCallbackForMessage(gUnknown_081C6D78, 0x3, 0xE);
			task->func = task_new_game_prof_birch_speech_4;
		}
	}
}

void task_new_game_prof_birch_speech_4(u8 taskId)
{
    if(!gPaletteFade.active && sub_8072CF4(0x18))
    {
        struct Task *tasks = gTasks;
        struct Task *task = &tasks[taskId];
        task->func = task_new_game_prof_birch_speech_5;
        AddTextPrinterWithCallbackForMessage(gUnknown_081C6DF8, 0x3, 0xE);
    }
}

void task_new_game_prof_birch_speech_5(u8 taskId)
{
	if(sub_8072CF4(0x18))
		gTasks[taskId].func = task_new_game_prof_birch_speech_6;
}

void task_new_game_prof_birch_speech_6(u8 taskId)
{
	struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
	u8 data = (u8)task->data[9];
	struct Sprite *sprites = gSprites;
	struct Sprite *sprite = &sprites[data];
	
	sprite->pos1.x = 0x68;
	sprite->pos1.y = 0x48;
	sprite->invisible = 0;
	sprite->data0 = 0;
	AddTextPrinterForMessage(data, sprite->oam.paletteNum, 0x70, 0x3A, 0, 0, 0x20, 0x0000FFFF);
	task->func = task_new_game_prof_birch_speech_7;
	task->data[7] = 0;
}

void task_new_game_prof_birch_speech_7(u8 taskId)
{
	struct Task *tasks;
    struct Task *task;
    
    if(sub_8075374())
    {
        struct Task *tasks = gTasks;
        struct Task *task = &tasks[taskId]; //r5
        
        if(task->data[7] > 0x5F)
        {
            sub_807206C((u32)&gUnknown_0840DFF7);
            task->func = task_new_game_prof_birch_speech_8;
        }
    }
    //_0800A4E4
    tasks = gTasks;
    task = &tasks[taskId]; //r2
    if((s16)task->data[7] <= 0x00003fff)
    {
        task->data[7]++;
        if(task->data[7] == 0x20)
        {
            cry_related(0xAF << 1, 0);
        }
    }
}

void task_new_game_prof_birch_speech_8(u8 taskId)
{
	if(sub_8072CF4(0x18))
    {
        AddTextPrinterWithCallbackForMessage(gUnknown_081C6E1A, 0x3, 0xE);
        gTasks[taskId].func = task_new_game_prof_birch_speech_9;
    }
}

void task_new_game_prof_birch_speech_9(u8 taskId)
{
	if(sub_8072CF4(0x18))
    {
        DrawDefaultWindow(0x2, 0xD, 0x1B, 0x12);
        AddTextPrinterWithCallbackForMessage(gUnknown_081C6FCB, 0x3, 0xE);
        gTasks[taskId].func = task_new_game_prof_birch_speech_10;
    }
}

void task_new_game_prof_birch_speech_10(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        struct Sprite *sprites = gSprites;
        struct Task *tasks = gTasks;
        struct Task *task = &tasks[taskId];
        struct Sprite *sprite = &sprites[task->data[8]];
        struct Sprite *sprite2;
        
        sprite->oam.objMode = 1;
        sprite2 = &sprites[task->data[9]];
        sprite2->oam.objMode = 1;
        sub_800B458(taskId, 0x2);
        sub_800B614(taskId, 0x1);
        task->data[7] = 0x40;
        task->func = task_new_game_prof_birch_speech_11;
    }
}

void task_new_game_prof_birch_speech_11(u8 taskId)
{
    struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
    
    if((s16)task->data[4] != -0x3C)
    {
        task->data[4] -= 2;
        REG_BG1HOFS = task->data[4];
    }
    else
    {
        task->data[4] = 0x0000ffc4;
        task->func = task_new_game_prof_birch_speech_12;
    }
}

//Fix Me: Uses a few different registers, and I can't figure out why.
void task_new_game_prof_birch_speech_12(u8 taskId)
{
    if(gTasks[taskId].data[5])
    {
        s16 data7;
        
        gSprites[gTasks[taskId].data[8]].invisible = 1;
        gSprites[gTasks[taskId].data[9]].invisible = 1;
        data7 = gTasks[taskId].data[7];
        if((u16)data7)
        {
            gTasks[taskId].data[7]--;
        }
        else
        {
            u8 data10 = gTasks[taskId].data[10];
            
            gSprites[data10].pos1.x = 0xB4;
            gSprites[data10].pos1.y = 0x3C;
            gSprites[data10].invisible = 0;
            gSprites[data10].oam.objMode = 1;
            gTasks[taskId].data[2] = data10;
            gTasks[taskId].data[6] = data7;
            sub_800B534(taskId, 2);
            sub_800B6C0(taskId, 1);
            gTasks[taskId].func = task_new_game_prof_birch_speech_13;
        }
    }
}

void task_new_game_prof_birch_speech_13(u8 taskId)
{
    struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
    
    if(task->data[5])
    {
        struct Sprite *sprites = gSprites;
        struct Sprite *sprite = &sprites[task->data[2]];
        
        sprite->oam.objMode = 0;
        task->func = task_new_game_prof_birch_speech_14;
    }
}

void task_new_game_prof_birch_speech_14(u8 taskId)
{
	DrawDefaultWindow(2, 0xD, 0x1B, 0x12);
    AddTextPrinterWithCallbackForMessage(gUnknown_081C6FD8, 3, 14);
    gTasks[taskId].func = task_new_game_prof_birch_speech_15;
}

void task_new_game_prof_birch_speech_15(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        CreateGenderMenu(2, 4);
        gTasks[taskId].func = task_new_game_prof_birch_speech_16;
    }
}

//Fix Me
void task_new_game_prof_birch_speech_16(u8 taskId)
{
    s8 gender = GenderMenuProcessInput();
    u8 cursorPos;
    
    if(gender == MALE || gender == FEMALE)
    {
        //_0800A7EE
        sub_8072DEC();
        audio_play(5);
        gSaveBlock2.playerGender = gender;
        Reset(2, 4, 8, 9);
        //task = &tasks[taskId];
        gTasks[taskId].func = sub_800A974;
    }
    
    cursorPos = GetMenuCursorPos();
    //task = &tasks[taskId];
    if(cursorPos != (s16)gTasks[taskId].data[6])
    {
        //struct Sprite *sprites = gSprites;
        //struct Sprite *sprite;
        s16 data2;
        
        gTasks[taskId].data[6] = cursorPos;
        data2 = gTasks[taskId].data[2];
        //sprite = &sprites[gTasks[taskId].data[2]];
        gSprites[data2].oam.objMode = 1;
        sub_800B458(taskId, 0);
        gTasks[taskId].func = task_new_game_prof_birch_speech_17;
    }
}


void task_new_game_prof_birch_speech_17(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[2];
    
    if(gTasks[taskId].data[5] == 0)
    {
        gSprites[spriteId].pos1.x += 4;
    }
    else
    {
        gSprites[spriteId].invisible = 1;
        if(gTasks[taskId].data[6])
        {
            spriteId = gTasks[taskId].data[11];
        }
        else
        {
            spriteId = gTasks[taskId].data[10];
        }
        
        gSprites[spriteId].pos1.x = 0xF0;
        gSprites[spriteId].pos1.y = 0x3C;
        gSprites[spriteId].invisible = 0;
        gTasks[taskId].data[2] = spriteId;
        gSprites[spriteId].oam.objMode = 1;
        sub_800B534(taskId, 0);
        gTasks[taskId].func = task_new_game_prof_birch_speech_18;
    }
}

void task_new_game_prof_birch_speech_18(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[2];
    
    if(gSprites[spriteId].pos1.x > 0xB4)
    {
        gSprites[spriteId].pos1.x -= 4;
    }
    else
    {
        gSprites[spriteId].pos1.x = 0xB4;
        if(gTasks[taskId].data[5])
        {
            gSprites[spriteId].oam.objMode = 0;
            gTasks[taskId].func = task_new_game_prof_birch_speech_16;
        }
    }
}

void sub_800A974(u8 taskId)
{
    DrawDefaultWindow(2, 13, 27, 18);
    AddTextPrinterWithCallbackForMessage(gUnknown_081C6FFA, 3, 14);
    gTasks[taskId].func = Task_800A9B4;
}

void Task_800A9B4(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        CreateNameMenu(2, 1);
        gTasks[taskId].func = sub_800A9EC;
    }
}

//Fix Me
void sub_800A9EC(u8 taskId)
{
    s8 n = NameMenuProcessInput();
    
    if(n == 0)
    {
        //_0800AA48
        audio_play(5);
        BeginNormalPaletteFade(-1, 0, 0, 16, n);
        gTasks[taskId].func = sub_800AAAC;
    }
    else if(n > 0)
    {
        //_0800AA0E
        if(n > 4)
            return;
        sub_8072DEC();
        audio_play(5);
        Reset(2, 1, 18, 12);
        set_default_player_name(n);
        gTasks[taskId].func = task_new_game_prof_birch_speech_part2_1;
    }
    else if(n == -1)
    {
        //_0800AA78
        sub_8072DEC();
        audio_play(5);
        Reset(2, 1, 18, 12);
        gTasks[taskId].func = task_new_game_prof_birch_speech_14;
    }
}

//Fix Me
void sub_800AAAC(u8 taskId)
{
    u8 active = gPaletteFade.active;
    
    if(!active)
    {
        set_default_player_name(1);
        DoNamingScreen(0, &gSaveBlock2, gSaveBlock2.playerGender, 0, active, new_game_prof_birch_speech_part2_start);
    }
}

void task_new_game_prof_birch_speech_part2_1(u8 taskId)
{
    DrawDefaultWindow(2, 13, 27, 18);
    StringExpandPlaceholders(gUnknown_081C7017, gStringVar4);
    AddTextPrinterWithCallbackForMessage(gUnknown_081C7017, 3, 14);
    gTasks[taskId].func = sub_800AB38;
}

void sub_800AB38(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        sub_8072974(2, 1, 1);
        gTasks[taskId].func = task_new_game_prof_birch_speech_part2_4;
    }
}

void task_new_game_prof_birch_speech_part2_4(u8 taskId)
{
    
}

void new_game_prof_birch_speech_part2_start(u8 taskId)
{
    
}

void sub_800B534(u8 taskId, u8 a)
{
	
}

void sub_800B6C0(u8 taskId, u8 a)
{
	
}
