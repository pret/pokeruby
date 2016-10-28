#include "global.h"
#include "task.h"

extern s8 gTruckCamera_HorizontalTable[];

extern void SetCameraPanning(u8 a1, u8 a2);
extern void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
extern void sub_80C7484(u8 taskId);

void Task_Truck1(u8 taskId);

s32 GetTruckCameraBobbingY(int a1)
{
    s32 result;

    if ( !(a1 % 120) )
	    return -1;
    else if ( (a1 % 10) <= 4 )
	    return 1;

    return 0;
}

s32 GetTruckBoxMovement(int a1) // for the box movement?
{
	s32 result;
	
	if ( !((a1 + 120) % 180) )
		return -1;

	return 0;
}

#ifdef NONMATCHING
void Task_Truck1(u8 taskId)
{
	// WIP
	s16 *data = gTasks[taskId].data;
	s16 cameraYpan;
	s16 box1 = 0;
	s16 box2 = 0;
	s16 box3 = 0;

	box1 = GetTruckBoxMovement(data[0] + 30) * 4; // box 1 happens 30 frames earlier than the other 2.
	sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3, box1 | 3);
	box2 = GetTruckBoxMovement(data[0]) * 2;
	sub_805BD90(2, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 0, box2 - 3);
    box3 = GetTruckBoxMovement(data[0]);
    sub_805BD90(3, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -3, ((u16)box3 * 4));
    
	data[0]++;

	if ( data[0] == 0x7530 ) // timer?
		data[0] = 0;

	cameraYpan = GetTruckCameraBobbingY(data[0]);
	SetCameraPanning(0, cameraYpan);
}
#else
__attribute__((naked))
void Task_Truck1(u8 taskId)
{
	asm("push {r4,r5,lr}\n\
	sub sp, #0x4\n\
	lsl r0, #24\n\
	lsr r0, #24\n\
	lsl r1, r0, #2\n\
	add r1, r0\n\
	lsl r1, #3\n\
	ldr r0, _080C7364\n\
	add r5, r1, r0\n\
	mov r1, #0\n\
	ldrsh r0, [r5, r1]\n\
	add r0, #0x1E\n\
	bl GetTruckBoxMovement\n\
	ldr r4, _080C7368\n\
	ldrb r1, [r4, #0x5]\n\
	ldrb r2, [r4, #0x4]\n\
	lsl r0, #18\n\
	movs r3, #0xC0\n\
	lsl r3, #10\n\
	orr r0, r3\n\
	asr r0, #16\n\
	str r0, [sp]\n\
	mov r0, #0x1\n\
	mov r3, #0x3\n\
	bl sub_805BD90\n\
	mov r3, #0\n\
	ldrsh r0, [r5, r3]\n\
	bl GetTruckBoxMovement\n\
	ldrb r1, [r4, #0x5]\n\
	ldrb r2, [r4, #0x4]\n\
	lsl r0, #17\n\
	ldr r3, _080C736C\n\
	add r0, r3\n\
	asr r0, #16\n\
	str r0, [sp]\n\
	mov r0, #0x2\n\
	mov r3, #0\n\
	bl sub_805BD90\n\
	mov r1, #0\n\
	ldrsh r0, [r5, r1]\n\
	bl GetTruckBoxMovement\n\
	ldrb r1, [r4, #0x5]\n\
	ldrb r2, [r4, #0x4]\n\
	mov r4, #0\n\
	mov r3, #0x3\n\
	neg r3, r3\n\
	lsl r0, #18\n\
	asr r0, #16\n\
	str r0, [sp]\n\
	mov r0, #0x3\n\
	bl sub_805BD90\n\
	ldrh r0, [r5]\n\
	add r0, #0x1\n\
	strh r0, [r5]\n\
	lsl r0, #16\n\
	ldr r1, _080C7370\n\
	cmp r0, r1\n\
	bne _080C7346\n\
	strh r4, [r5]\n\
_080C7346:\n\
	mov r3, #0\n\
	ldrsh r0, [r5, r3]\n\
	bl GetTruckCameraBobbingY\n\
	add r1, r0, #0\n\
	lsl r1, #16\n\
	asr r1, #16\n\
	mov r0, #0\n\
	bl SetCameraPanning\n\
	add sp, #0x4\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080C7364: .4byte gTasks + 0x8\n\
_080C7368: .4byte gSaveBlock1\n\
_080C736C: .4byte 0xfffd0000\n\
_080C7370: .4byte 0x75300000\n");
}
#endif

void Task_Truck2(u8 taskId)
{
	s16 *data = gTasks[taskId].data;
	s16 cameraYpan;
	s16 localData;
	s16 cameraXpan;
	s16 box1;
	s16 box2;
	s16 box3;
	
	localData = data[0] + 1;
	
	data[0]++;
	data[2]++;
	
	if ( localData > 5 )
	{
		data[0] = 0;
		data[1]++;
	}
	if ( data[1] == 19 )
	{
		DestroyTask(taskId);
	}
	else
	{
		if ( gTruckCamera_HorizontalTable[data[1]] == 2 )
			gTasks[taskId].func = sub_80C7484;
		
		cameraXpan = gTruckCamera_HorizontalTable[data[1]];
		cameraYpan = GetTruckCameraBobbingY(data[1]);
		SetCameraPanning(cameraXpan, cameraYpan);
		box1 = GetTruckBoxMovement(data[1] + 30) * 4;
		sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3 - cameraXpan, box1 | 3);
		box2 = GetTruckBoxMovement(data[1]) * 2;
		sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -cameraXpan, box2 - 3);
		box3 = GetTruckBoxMovement(data[1]);
		sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -3 - cameraXpan, ((u16)box3 * 4));
	}
}

/*
	thumb_func_start Task_Truck2
Task_Truck2: @ 80C7374
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r3, r0, 3
	ldr r4, _080C73B4 @ =gTasks + 0x8
	adds r7, r3, r4
	ldrh r1, [r7]
	adds r1, 0x1
	strh r1, [r7]
	ldrh r0, [r7, 0x4]
	adds r0, 0x1
	strh r0, [r7, 0x4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	ble _080C73A4
	movs r0, 0
	strh r0, [r7]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_080C73A4:
	ldrh r0, [r7, 0x2]
	cmp r0, 0x13
	bne _080C73B8
	adds r0, r2, 0
	bl DestroyTask
	b _080C746A
	.align 2, 0
_080C73B4: .4byte gTasks + 0x8
_080C73B8:
	ldr r2, _080C7474 @ =gTruckCamera_HorizontalTable
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _080C73D4
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r3, r0
	ldr r1, _080C7478 @ =sub_80C7484
	str r1, [r0]
_080C73D4:
	movs r4, 0x2
	ldrsh r0, [r7, r4]
	adds r0, r2
	movs r5, 0
	ldrsb r5, [r0, r5]
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckCameraBobbingY
	adds r1, r0, 0
	lsls r5, 16
	asrs r5, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl SetCameraPanning
	movs r4, 0x4
	ldrsh r0, [r7, r4]
	adds r0, 0x1E
	bl GetTruckBoxMovement
	ldr r6, _080C747C @ =gSaveBlock1
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r3, 0x3
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	movs r4, 0xC0
	lsls r4, 10
	orrs r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckBoxMovement
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	negs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 17
	ldr r4, _080C7480 @ =0xfffd0000
	adds r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckBoxMovement
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r4, 0x3
	negs r4, r4
	adds r3, r4, 0
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
_080C746A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7474: .4byte gTruckCamera_HorizontalTable
_080C7478: .4byte sub_80C7484
_080C747C: .4byte gSaveBlock1
_080C7480: .4byte 0xfffd0000
	thumb_func_end Task_Truck2
*/



/*
	thumb_func_start Task_Truck1
Task_Truck1: @ 80C72C4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C7364 @ =gTasks + 0x8
	adds r5, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	adds r0, 0x1E
	bl GetTruckBoxMovement
	ldr r4, _080C7368 @ =gSaveBlock1
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 18
	movs r3, 0xC0
	lsls r3, 10
	orrs r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl GetTruckBoxMovement
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 17
	ldr r3, _080C736C @ =0xfffd0000
	adds r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	movs r1, 0
	ldrsh r0, [r5, r1]
	bl GetTruckBoxMovement
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	movs r3, 0x3
	negs r3, r3
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	ldr r1, _080C7370 @ =0x75300000
	cmp r0, r1
	bne _080C7346
	strh r4, [r5]
_080C7346:
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl GetTruckCameraBobbingY
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7364: .4byte gTasks + 0x8
_080C7368: .4byte gSaveBlock1
_080C736C: .4byte 0xfffd0000
_080C7370: .4byte 0x75300000
	thumb_func_end Task_Truck1
	*/