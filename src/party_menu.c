#include "global.h"
#include "menu.h"
#include "pokemon.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"

#define DATA_COUNT (6)

struct Unk201C000 {
    /* 0x00 */ struct Pokemon *pokemon;
    /* 0x04 */ u8 var04;
    /* 0x05 */ u8 var05;
    /* 0x06 */ u16 var06;
               u8 pad_08[10];
    /* 0x12 */ u16 var12;
};

struct Unk201B260 {
    /* 0x00 */ u8 var00;
    /* 0x01 */ u8 var01;
               u8 pad_02[2];
    /* 0x04 */ s16 var04[DATA_COUNT * 2];
               u8 pad_1C[2];
    /* 0x1E */ u16 var1E;
    /* 0x20 */ u16 var20;
};

extern struct Unk201B260 unk_201B260;
extern struct Unk201C000 unk_201C000;
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F6;

extern u8 gUnknown_083769A8[][12];
extern u8 gUnknown_08376D1C[DATA_COUNT];
extern u8 *gUnknown_08376D04[DATA_COUNT];
extern u8 gOtherText_TallPlusAndRightArrow[];

void task_pc_turn_off(u8 *u8, int i);
static void sub_806E884(u8 taskId);
void sub_806F8AC(u8 taskId);
void PartyMenuUpdateLevelOrStatus(struct Pokemon *, u8);
u8 ExecuteTableBasedItemEffect__(u8 u8, u16 u16, int i);
void sub_80701DC(u8 taskId);

u8 sub_806E834(u8 *message, u8 arg1) {
    u8 taskId;

    gUnknown_0202E8F6 = 1;

    MenuDrawTextWindow(0, 14, 29, 19);
    MenuPrintMessage(message, 1, 15);

    taskId = CreateTask(sub_806E884, 1);
    gTasks[taskId].data[0] = arg1;

    return taskId;
}

static void sub_806E884(u8 taskId) {
    if (MenuUpdateWindowText() == 0) {
        return;
    }

    gUnknown_0202E8F6 = 0;

    if (gTasks[taskId].data[0] == 0) {
        MenuZeroFillWindowRect(0, 14, 29, 19);
    }

    DestroyTask(taskId);
}

asm(".section .text_b");

#ifdef NONMATCHING
void sub_8070088(u8 taskId) {
    u8 dummyTaskId;
    struct Task *task2;

    gTasks[taskId].func = TaskDummy;

    if (GetMonData(&gPlayerParty[unk_201C000.var04], MON_DATA_SPECIES) == 0) {
        gTasks[taskId].func = sub_80701DC;
        return;
    }

    dummyTaskId = CreateTask(TaskDummy, 5);
    task2 = &gTasks[dummyTaskId];

    task2->data[10] = GetMonData(unk_201C000.pokemon, MON_DATA_MAX_HP);
    task2->data[11] = GetMonData(unk_201C000.pokemon, MON_DATA_HP);

    if (ExecuteTableBasedItemEffect__(unk_201C000.var05, unk_201C000.var06, 0)) {
        DestroyTask(dummyTaskId);
        gTasks[taskId].func = sub_80701DC;
        return;
    }

    gUnknown_0202E8F4 = 1;
    MenuZeroFillWindowRect(0, 14, 29, 19);
    PlaySE(SE_KAIFUKU);
    PartyMenuUpdateLevelOrStatus(unk_201C000.pokemon, unk_201C000.var05);

    task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle()][unk_201C000.var05], 9);
    unk_201B260.var01 = 2; // u8

    task2->data[12] = GetMonData(unk_201C000.pokemon, MON_DATA_HP) - task2->data[11];
    task2->data[14]= 1;
    unk_201B260.var1E = 1; // u16
    unk_201B260.var20 = 1; // u16

    unk_201C000.var12 = -0x8000;
    task2->func = sub_806F8AC;
}
#else
__attribute__((naked))
void sub_8070088(void) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x4\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	ldr r1, _08070120 @ =gTasks\n\
	mov r10, r1\n\
	lsls r1, r0, 2\n\
	adds r1, r0\n\
	lsls r1, 3\n\
	mov r2, r10\n\
	adds r7, r1, r2\n\
	ldr r5, _08070124 @ =TaskDummy\n\
	str r5, [r7]\n\
	ldr r4, _08070128 @ =0x0201c000\n\
	ldrb r0, [r4, 0x5]\n\
	movs r1, 0x64\n\
	mov r9, r1\n\
	mov r2, r9\n\
	muls r2, r0\n\
	adds r0, r2, 0\n\
	ldr r1, _0807012C @ =gPlayerParty\n\
	mov r8, r1\n\
	add r0, r8\n\
	movs r1, 0xB\n\
	bl GetMonData\n\
	cmp r0, 0\n\
	beq _08070118\n\
	adds r0, r5, 0\n\
	movs r1, 0x5\n\
	bl CreateTask\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	lsls r0, r5, 2\n\
	adds r0, r5\n\
	lsls r0, 3\n\
	str r0, [sp]\n\
	mov r0, r10\n\
	adds r0, 0x8\n\
	ldr r2, [sp]\n\
	adds r6, r2, r0\n\
	ldrb r0, [r4, 0x5]\n\
	mov r1, r9\n\
	muls r1, r0\n\
	adds r0, r1, 0\n\
	add r0, r8\n\
	str r0, [r4]\n\
	movs r1, 0x3A\n\
	bl GetMonData\n\
	strh r0, [r6, 0x14]\n\
	ldr r0, [r4]\n\
	movs r1, 0x39\n\
	bl GetMonData\n\
	strh r0, [r6, 0x16]\n\
	ldrb r0, [r4, 0x5]\n\
	ldrh r1, [r4, 0x6]\n\
	movs r2, 0\n\
	bl ExecuteTableBasedItemEffect__\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _08070134\n\
	adds r0, r5, 0\n\
	bl DestroyTask\n\
_08070118:\n\
	ldr r0, _08070130 @ =sub_80701DC\n\
	str r0, [r7]\n\
	b _080701B0\n\
	.align 2, 0\n\
_08070120: .4byte gTasks\n\
_08070124: .4byte TaskDummy\n\
_08070128: .4byte 0x0201c000\n\
_0807012C: .4byte gPlayerParty\n\
_08070130: .4byte sub_80701DC\n\
_08070134:\n\
	ldr r1, _080701C0 @ =gUnknown_0202E8F4\n\
	movs r0, 0x1\n\
	strb r0, [r1]\n\
	movs r0, 0x0\n\
	movs r1, 0xE\n\
	movs r2, 0x1D\n\
	movs r3, 0x13\n\
	bl MenuZeroFillWindowRect\n\
	movs r0, 0x1\n\
	bl PlaySE\n\
	ldr r0, [r4]\n\
	ldrb r1, [r4, 0x5]\n\
	bl PartyMenuUpdateLevelOrStatus\n\
	bl IsDoubleBattle\n\
	adds r1, r0, 0\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	lsls r0, r1, 1\n\
	adds r0, r1\n\
	lsls r0, 2\n\
	ldrb r1, [r4, 0x5]\n\
	lsls r1, 1\n\
	adds r0, r1\n\
	ldr r1, _080701C4 @ =gUnknown_083769A8\n\
	adds r0, r1\n\
	movs r1, 0x9\n\
	bl task_pc_turn_off\n\
	ldr r2, _080701C8 @ =0xfffff261\n\
	adds r1, r4, r2\n\
	movs r0, 0x2\n\
	strb r0, [r1]\n\
	ldr r0, [r4]\n\
	movs r1, 0x39\n\
	bl GetMonData\n\
	ldrh r1, [r6, 0x16]\n\
	subs r0, r1\n\
	strh r0, [r6, 0x18]\n\
	movs r0, 0x1\n\
	strh r0, [r6, 0x1C]\n\
	ldr r1, _080701CC @ =0xfffff27e\n\
	adds r0, r4, r1\n\
	movs r1, 0x1\n\
	strh r1, [r0]\n\
	ldr r2, _080701D0 @ =0xfffff280\n\
	adds r0, r4, r2\n\
	strh r1, [r0]\n\
	ldrh r1, [r6, 0x16]\n\
	adds r2, 0x2\n\
	adds r0, r4, r2\n\
	strh r1, [r0]\n\
	ldr r0, _080701D4 @ =0xffff8000\n\
	str r0, [r4, 0xC]\n\
	ldr r1, [sp]\n\
	add r1, r10\n\
	ldr r0, _080701D8 @ =sub_806F8AC\n\
	str r0, [r1]\n\
_080701B0:\n\
	add sp, 0x4\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080701C0: .4byte gUnknown_0202E8F4\n\
_080701C4: .4byte gUnknown_083769A8\n\
_080701C8: .4byte 0xfffff261\n\
_080701CC: .4byte 0xfffff27e\n\
_080701D0: .4byte 0xfffff280\n\
_080701D4: .4byte 0xffff8000\n\
_080701D8: .4byte sub_806F8AC\n\
    .syntax divided\n");
}
#endif


asm(".section .text_c");

#ifdef NONMATCHING
void sub_8070848(u8 taskId) {
    u8 i;

    MenuDrawTextWindow(11, 0, 29, 7);

    for (i = 0; i < DATA_COUNT; i++) {
        u8 x;
        u8 y;
        u32 stat;
        struct Pokemon **pokemon;
        u8 *ptr;

        pokemon = &unk_201C000.pokemon;
        asm("" ::: "r0");
        stat = GetMonData(*pokemon, gUnknown_08376D1C[i]);

        unk_201B260.var04[i + DATA_COUNT] = stat;
        unk_201B260.var04[i] = stat - unk_201B260.var04[i];

        x = (i / 3) * 9 + 11;
        y = ((i % 3) << 1) + 1;

        ptr = StringCopy(gStringVar1, gUnknown_08376D04[i]);

        // {CLEAR_TO 46}
        *ptr = 0xFC;
        ptr++;
        *ptr = 0x13;
        ptr++;
        *ptr = 46;
        ptr++;

        ptr = StringCopy(ptr, gOtherText_TallPlusAndRightArrow);

        // {CLEAR_TO 52}
        *ptr = 0xFC;
        ptr++;
        *ptr = 0x13;
        ptr++;
        *ptr = 52;
        ptr++;

        ConvertIntToDecimalStringN(ptr, unk_201B260.var04[i], STR_CONV_MODE_RIGHT_ALIGN, 2);

        MenuPrint(gStringVar1, x + 1, y);
    }
}
#else
__attribute__((naked))
void sub_8070848(void) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	movs r0, 0xB\n\
	movs r1, 0\n\
	movs r2, 0x1D\n\
	movs r3, 0x7\n\
	bl MenuDrawTextWindow\n\
	movs r7, 0\n\
	ldr r0, _0807092C @ =gStringVar1\n\
	mov r10, r0\n\
	movs r1, 0xFC\n\
	mov r9, r1\n\
	movs r2, 0x13\n\
	mov r8, r2\n\
_0807086C:\n\
	ldr r1, _08070930 @ =0x0201c000\n\
	ldr r0, [r1]\n\
	ldr r1, _08070934 @ =gUnknown_08376D1C\n\
	adds r1, r7, r1\n\
	ldrb r1, [r1]\n\
	bl GetMonData\n\
	adds r1, r7, 0x6\n\
	lsls r1, 1\n\
	ldr r2, _08070938 @ =0x0201b264\n\
	adds r1, r2, r1\n\
	strh r0, [r1]\n\
	lsls r6, r7, 1\n\
	adds r6, r2, r6\n\
	ldrh r1, [r6]\n\
	subs r0, r1\n\
	strh r0, [r6]\n\
	adds r0, r7, 0\n\
	movs r1, 0x3\n\
	bl __udivsi3\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	lsls r4, r0, 3\n\
	adds r4, r0\n\
	adds r4, 0xB\n\
	lsls r4, 24\n\
	lsrs r4, 24\n\
	adds r0, r7, 0\n\
	movs r1, 0x3\n\
	bl __umodsi3\n\
	adds r5, r0, 0\n\
	lsls r5, 1\n\
	adds r5, 0x1\n\
	lsls r5, 24\n\
	lsrs r5, 24\n\
	ldr r1, _0807093C @ =gUnknown_08376D04\n\
	lsls r0, r7, 2\n\
	adds r0, r1\n\
	ldr r1, [r0]\n\
	mov r0, r10\n\
	bl StringCopy\n\
	adds r2, r0, 0\n\
	mov r0, r9\n\
	strb r0, [r2]\n\
	adds r2, 0x1\n\
	mov r1, r8\n\
	strb r1, [r2]\n\
	adds r2, 0x1\n\
	movs r0, 0x2E\n\
	strb r0, [r2]\n\
	adds r2, 0x1\n\
	adds r0, r2, 0\n\
	ldr r1, _08070940 @ =gOtherText_TallPlusAndRightArrow\n\
	bl StringCopy\n\
	adds r2, r0, 0\n\
	mov r0, r9\n\
	strb r0, [r2]\n\
	adds r2, 0x1\n\
	mov r1, r8\n\
	strb r1, [r2]\n\
	adds r2, 0x1\n\
	movs r0, 0x34\n\
	strb r0, [r2]\n\
	adds r2, 0x1\n\
	movs r0, 0\n\
	ldrsh r1, [r6, r0]\n\
	adds r0, r2, 0\n\
	movs r2, 0x1\n\
	movs r3, 0x2\n\
	bl ConvertIntToDecimalStringN\n\
	adds r4, 0x1\n\
	lsls r4, 24\n\
	lsrs r4, 24\n\
	mov r0, r10\n\
	adds r1, r4, 0\n\
	adds r2, r5, 0\n\
	bl MenuPrint\n\
	adds r0, r7, 0x1\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	cmp r7, 0x5\n\
	bls _0807086C\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_0807092C: .4byte gStringVar1\n\
_08070930: .4byte 0x0201c000\n\
_08070934: .4byte gUnknown_08376D1C\n\
_08070938: .4byte 0x0201b264\n\
_0807093C: .4byte gUnknown_08376D04\n\
_08070940: .4byte gOtherText_TallPlusAndRightArrow\n\
    .syntax divided\n");
}
#endif
