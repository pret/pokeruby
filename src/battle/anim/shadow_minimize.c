#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D04E0(u8 taskId);
void sub_80D0614(struct Task* task, u8 taskId);
void sub_80D0704(struct Sprite* sprite);

// shadow_minimize (the minimizing-like shadow over the Pokemon effect.)
// Used in Minimize.

void sub_80D0488(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(0);
    task->data[0] = spriteId;
    sub_8078E70(spriteId, 0);
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0x100;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = sub_8079E90(gAnimBankAttacker);
    task->func = sub_80D04E0;
}

void sub_80D04E0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
    case 0:
        if (task->data[2] == 0 || task->data[2] == 3 || task->data[2] == 6)
            sub_80D0614(task, taskId);
        task->data[2]++;
        task->data[4] += 0x28;
        obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
        sub_8079A64(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[5]++;
            task->data[1]++;
        }
        break;
    case 1:
        if (task->data[6] == 0)
        {
            if (task->data[5] == 3)
            {
                task->data[2] = 0;
                task->data[1] = 3;
            }
            else
            {
                task->data[2] = 0;
                task->data[3] = 0;
                task->data[4] = 0x100;
                obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
                sub_8079A64(task->data[0]);
                task->data[1] = 2;
            }
        }
        break;
    case 2:
        task->data[1] = 0;
        break;
    case 3:
        if (++task->data[2] > 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 4:
        task->data[2] += 2;
        task->data[4] -= 0x50;
        obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
        sub_8079A64(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 5:
        sub_8078F40(task->data[0]);
        gSprites[task->data[15]].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

#ifdef NONMATCHING
void sub_80D0614(struct Task* task, u8 taskId)
{
    s16 r8 = duplicate_obj_of_side_rel2move_in_transparent_mode(0);
    if (r8 >= 0)
    {
        u8 r6 = AllocOamMatrix();
        if (r6 == 0xFF)
        {
            obj_delete_but_dont_free_vram(&gSprites[r8]);
        }
        else
        {
            gSprites[r8].oam.objMode = ST_OAM_OBJ_BLEND;
            gSprites[r8].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            gSprites[r8].affineAnimPaused = TRUE;
            r6 &= 0x1f;
            gSprites[r8].oam.matrixNum = r6; // need to inhibit optimizing out the mov r0, 0x3f / neg r0, r0
            gSprites[r8].subpriority = task->data[7] - task->data[3];
            task->data[3]++;
            task->data[6]++;
            gSprites[r8].data[0] = 16;
            gSprites[r8].data[1] = taskId;
            gSprites[r8].data[2] = 6;
            gSprites[r8].callback = sub_80D0704;
            obj_id_set_rotscale(r8, task->data[4], task->data[4], 0);
            gSprites[r8].oam.affineMode = 1;
            CalcCenterToCornerVec(&gSprites[r8], gSprites[r8].oam.shape, gSprites[r8].oam.size, gSprites[r8].oam.affineMode);
        }
    }
}
#else
NAKED
void sub_80D0614(struct Task* task, u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	adds r7, r0, 0 @r7 is task\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	mov r9, r1 @r9 is taskId\n\
	movs r0, 0\n\
	bl duplicate_obj_of_side_rel2move_in_transparent_mode\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r8, r0\n\
	lsls r0, 16\n\
	asrs r4, r0, 16\n\
	cmp r4, 0\n\
	blt _080D06EE @jump to bottom\n\
	bl AllocOamMatrix\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0xFF\n\
	bne _080D0658\n\
	lsls r0, r4, 4\n\
	adds r0, r4\n\
	lsls r0, 2\n\
	ldr r1, _080D0654 @ =gSprites\n\
	adds r0, r1\n\
	bl obj_delete_but_dont_free_vram\n\
	b _080D06EE @ jump to bottom\n\
	.align 2, 0\n\
_080D0654: .4byte gSprites\n\
_080D0658:\n\
	ldr r5, _080D06FC @ =gSprites\n\
	lsls r3, r4, 4\n\
	adds r3, r4\n\
	lsls r3, 2\n\
	adds r4, r3, r5\n\
	ldrb r1, [r4, 0x1]\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r1\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	movs r1, 0x3\n\
	orrs r0, r1\n\
	strb r0, [r4, 0x1]\n\
	adds r2, r4, 0\n\
	adds r2, 0x2C\n\
	ldrb r0, [r2]\n\
	movs r1, 0x80\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	movs r0, 0x1F\n\
	ands r6, r0\n\
	lsls r2, r6, 1\n\
	ldrb r1, [r4, 0x3]\n\
	movs r0, 0x3F\n\
	negs r0, r0\n\
	ands r0, r1\n\
	orrs r0, r2\n\
	strb r0, [r4, 0x3]\n\
	ldrb r0, [r7, 0x16]\n\
	ldrb r1, [r7, 0xE]\n\
	subs r0, r1\n\
	adds r1, r4, 0\n\
	adds r1, 0x43\n\
	strb r0, [r1]\n\
	ldrh r0, [r7, 0xE]\n\
	adds r0, 0x1\n\
	strh r0, [r7, 0xE]\n\
	ldrh r0, [r7, 0x14]\n\
	adds r0, 0x1\n\
	strh r0, [r7, 0x14]\n\
	movs r0, 0x10\n\
	strh r0, [r4, 0x2E]\n\
	mov r0, r9\n\
	strh r0, [r4, 0x30]\n\
	movs r0, 0x6\n\
	strh r0, [r4, 0x32]\n\
	adds r5, 0x1C\n\
	adds r3, r5\n\
	ldr r0, _080D0700 @ =sub_80D0704\n\
	str r0, [r3]\n\
	mov r1, r8 @duplicate_obj_of_side_rel2move_in_transparent_mode(0)\n\
	lsls r0, r1, 24\n\
	lsrs r0, 24\n\
	movs r1, 0x10\n\
	ldrsh r2, [r7, r1]\n\
	adds r1, r2, 0\n\
	movs r3, 0\n\
	bl obj_id_set_rotscale\n\
	ldrb r0, [r4, 0x1]\n\
	movs r3, 0x4\n\
	negs r3, r3\n\
	ands r3, r0\n\
	movs r0, 0x1\n\
	orrs r3, r0\n\
	strb r3, [r4, 0x1]\n\
	lsrs r1, r3, 6\n\
	ldrb r2, [r4, 0x3]\n\
	lsrs r2, 6\n\
	lsls r3, 30\n\
	lsrs r3, 30\n\
	adds r0, r4, 0\n\
	bl CalcCenterToCornerVec\n\
_080D06EE:\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080D06FC: .4byte gSprites\n\
_080D0700: .4byte sub_80D0704\n\
.syntax divided\n");
}
#endif

void sub_80D0704(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        obj_delete_but_dont_free_vram(sprite);
    }
}
