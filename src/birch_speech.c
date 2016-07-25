#include "global.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

extern u32 gUnknown_081E768C;
extern u32 gUnknown_081E7834;
extern u32 gUnknown_081E764C;
extern u32 gUnknown_081E796C;
extern u32 gUnknown_081C6D78;
extern u32 gUnknown_081C6DF8;

extern struct Sprite gSprites[];

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
void sub_800B534(u8 taskId, u8 a);
void sub_800B6C0(u8 taskId, u8 a);
u8 sub_8072CF4(u8 a);

void Task_Birch1(u8 a)
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
	AddBirchSpeechObjects(a);
	BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
	REG_BG1CNT = 0x00000703;
	REG_DISPCNT = 0x9A << 5;
	gTasks[a].data[4] = 0;
	gTasks[a].func = task_new_game_prof_birch_speech_2;
	gTasks[a].data[2] = 0xFF;
	gTasks[a].data[3] = 0xFF;
	gTasks[a].data[7] = 0xD8;
	
	sub_8075474(0xBB << 1);
}

//This produces identical machine code, except for two instructions that are swapped.
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
			AddTextPrinterWithCallbackForMessage(&gUnknown_081C6D78, 0x3, 0xE);
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
        AddTextPrinterWithCallbackForMessage(&gUnknown_081C6DF8, 0x3, 0xE);
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
	
}

void task_new_game_prof_birch_speech_8(u8 taskId)
{
	
}

void task_new_game_prof_birch_speech_9(u8 taskId)
{
	
}

void task_new_game_prof_birch_speech_10(u8 taskId)
{
	
}

void task_new_game_prof_birch_speech_11(u8 taskId)
{
	
}

void task_new_game_prof_birch_speech_12(u8 taskId)
{
	
}

void task_new_game_prof_birch_speech_13(u8 taskId)
{
	
}

void task_new_game_prof_birch_speech_14(u8 taskId)
{
	
}

void sub_800B534(u8 taskId, u8 a)
{
	
}

void sub_800B6C0(u8 taskId, u8 a)
{
	
}