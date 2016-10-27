#include "global.h"

s32 GetTruckCameraBobbingY(int a1)
{
    s32 result;

    if ( !(a1 % 120) )
	    return -1;
    else if ( (a1 % 10) <= 4 )
	    return 1;

    return 0;
}

/*
	thumb_func_start GetTruckCameraBobbingY
GetTruckCameraBobbingY: @ 80C727C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x78
	bl __modsi3
	cmp r0, 0
	bne _080C7290     L3
	movs r0, 0x1            // assign -1 to result.
	negs r0, r0
	b _080C72A2
_080C7290:
	adds r0, r4, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C72A0
	movs r0, 0
	b _080C72A2
_080C72A0:
	movs r0, 0x1
_080C72A2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetTruckCameraBobbingY
	*/