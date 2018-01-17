#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "scanline_effect.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u16 gBattle_BG2_X;
extern u16 gBattle_BG1_X;

static void sub_80D0D68(u8 taskId);
static void sub_80D0E8C(struct Sprite* sprite);

// draw (draws the Pokemon into the world using a pencil.)
// Used in Sketch.

void sub_80D0C88(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct ScanlineEffectParams params;

    s16 i;
    task->data[0] = sub_8077FC0(gAnimBankTarget) + 32;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[15] = sub_807A100(gAnimBankTarget, 0);

    if (GetBankIdentity_permutated(gAnimBankTarget) == 1)
    {
        task->data[6] = gBattle_BG1_X;
        params.dmaDest = (u16 *)REG_ADDR_BG1HOFS;
    }
    else
    {
        task->data[6] = gBattle_BG2_X;
        params.dmaDest = (u16 *)REG_ADDR_BG2HOFS;
    }

    for (i = task->data[0] - 0x40; i <= task->data[0];i++)
    {
        if (i >= 0)
        {
            gScanlineEffectRegBuffers[0][i] = task->data[6] + 0xF0;
            gScanlineEffectRegBuffers[1][i] = task->data[6] + 0xF0;
        }
    }

    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.initState = 1;
    params.unused9 = 0;
    ScanlineEffect_SetParams(params);
    task->func = sub_80D0D68;
}

#ifdef NONMATCHING
void sub_80D0D68(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[4])
    {
    case 0:
        if (++task->data[5] > 20)
            task->data[4]++;
        break;
    case 1:
        if (++task->data[1] > 3)
        {
            task->data[1] = 0;
            task->data[2] = task->data[3] & 3;
            task->data[5] = task->data[0] - task->data[3];
            switch (task->data[2])
            {
            case 0:
                break;
            case 1:
                task->data[5] -= 2;
                break;
            case 2:
                task->data[5] += 1;
                break;
            case 3:
                task->data[5] += 1;
                break;
            }

            if (task->data[5] >= 0)
            {
                gScanlineEffectRegBuffers[0][task->data[5]] = task->data[6];
                gScanlineEffectRegBuffers[1][task->data[5]] = task->data[6];
            }

            if (++task->data[3] >= task->data[15])
            {
                gScanlineEffect.unk15 = 3;
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}
#else
__attribute__((naked))
void sub_80D0D68(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 3\n\
	ldr r1, _080D0D88 @ =gTasks\n\
	adds r3, r0, r1\n\
	movs r1, 0x10\n\
	ldrsh r0, [r3, r1]\n\
	cmp r0, 0\n\
	beq _080D0D8C\n\
	cmp r0, 0x1\n\
	beq _080D0DA2\n\
	b _080D0E22\n\
	.align 2, 0\n\
_080D0D88: .4byte gTasks\n\
_080D0D8C:\n\
	ldrh r0, [r3, 0x12]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x12]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x14\n\
	ble _080D0E22\n\
	ldrh r0, [r3, 0x10]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x10]\n\
	b _080D0E22\n\
_080D0DA2:\n\
	ldrh r0, [r3, 0xA]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0xA]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x3\n\
	ble _080D0E22\n\
	movs r0, 0\n\
	strh r0, [r3, 0xA]\n\
	ldrh r1, [r3, 0xE]\n\
	movs r0, 0x3\n\
	ands r0, r1\n\
	strh r0, [r3, 0xC]\n\
	ldrh r0, [r3, 0x8]\n\
	subs r0, r1\n\
	strh r0, [r3, 0x12]\n\
	movs r2, 0xC\n\
	ldrsh r1, [r3, r2]\n\
	cmp r1, 0x1\n\
	beq _080D0DD8\n\
	cmp r1, 0x1\n\
	ble _080D0DE0\n\
	cmp r1, 0x2\n\
	beq _080D0DDC\n\
	cmp r1, 0x3\n\
	beq _080D0DDC\n\
	b _080D0DE0\n\
_080D0DD8:\n\
	subs r0, 0x2\n\
	b _080D0DDE\n\
_080D0DDC:\n\
	adds r0, 0x1\n\
_080D0DDE:\n\
	strh r0, [r3, 0x12]\n\
_080D0DE0:\n\
	movs r1, 0x12\n\
	ldrsh r0, [r3, r1]\n\
	cmp r0, 0\n\
	blt _080D0E04\n\
	ldr r2, _080D0E28 @ =gScanlineEffectRegBuffers\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	ldrh r1, [r3, 0x14]\n\
	strh r1, [r0]\n\
	movs r1, 0x12\n\
	ldrsh r0, [r3, r1]\n\
	lsls r0, 1\n\
	movs r1, 0xF0\n\
	lsls r1, 3\n\
	adds r2, r1\n\
	adds r0, r2\n\
	ldrh r1, [r3, 0x14]\n\
	strh r1, [r0]\n\
_080D0E04:\n\
	ldrh r0, [r3, 0xE]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0xE]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	movs r2, 0x26\n\
	ldrsh r1, [r3, r2]\n\
	cmp r0, r1\n\
	blt _080D0E22\n\
	ldr r1, _080D0E2C @ =gScanlineEffect\n\
	movs r0, 0x3\n\
	strb r0, [r1, 0x15]\n\
	adds r0, r4, 0\n\
	bl DestroyAnimVisualTask\n\
_080D0E22:\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080D0E28: .4byte gScanlineEffectRegBuffers\n\
_080D0E2C: .4byte gScanlineEffect\n\
.syntax divided\n");
}
#endif

void sub_80D0E30(struct Sprite* sprite)
{
    sprite->pos1.x = GetBankPosition(gAnimBankTarget, 0) - 16;
    sprite->pos1.y = sub_8077FC0(gAnimBankTarget) + 16;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 16;
    sprite->data[4] = 0;
    sprite->data[5] = sub_807A100(gAnimBankTarget, 0) + 2;
    sprite->data[6] = BattleAnimAdjustPanning(0x3F);
    sprite->callback = sub_80D0E8C;
}

void sub_80D0E8C(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 3 && sprite->data[2] < sprite->data[5])
        {
            sprite->data[1] = 0;
            sprite->pos1.y -= 1;
            sprite->data[2]++;
            if (sprite->data[2] % 10 == 0)
                PlaySE12WithPanning(0xCD, sprite->data[6]);
        }
        sprite->data[4] += sprite->data[3];
        if (sprite->data[4] > 31)
        {
            sprite->data[4] = 0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        else if (sprite->data[4] <= -32)
        {
            sprite->data[4] = -0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        sprite->pos2.x = sprite->data[4];
        if (sprite->data[5] == sprite->data[2])
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = 0;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}
