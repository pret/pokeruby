#include "global.h"
#include "asm.h"
#include "sprite.h"

struct UnknownStruct
{
    u8 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

extern u8 ewram[];
#define ewram17850 ((struct UnknownStruct *)(ewram + 0x17850))

extern u8 gUnknown_02024A68;
extern u8 gUnknown_02024A72[];

extern u8 gUnknown_03004340[];

extern const struct SpriteTemplate gSpriteTemplate_820A4EC[];
extern const struct SpriteTemplate gSpriteTemplate_820A51C[];
extern const struct SpriteTemplate gSpriteTemplate_820A54C;
extern const struct SpriteTemplate gSpriteTemplate_820A56C[];
extern const struct SubspriteTable gSubspriteTables_820A684[];

extern u8 gUnknown_08D1216C[][32];

int sub_804373C(void)
{
    return 9;
}

#ifdef NONMATCHING
void sub_8043740(s16 a, u16 *b, u8 c)
{
    u8 sp0[4];
    s8 i;
    s8 j;
    //s8 r9;
    s16 _a;
    
    for (i = 0; i < 4; i++)
        sp0[i] = 0;
    
    //_0804377C
    /*
    i = 3;
    r9 = -1;
    while (a > 0)
    {
        sp0[i] = a % 10;
        a /= 10;
        i--;
    }
    */
    i = 3;
    for (_a = a; _a > 0; _a = _a / 10)
    {
        sp0[i] = _a % 10;
        i--;
    }
    //_080437AA
    while (i > -1)
    {
        sp0[i] = 0xFF;
        i--;
    }
    //_080437CE
    if (sp0[3] == 0xFF)
        sp0[3] = 0;
    
    /*
    //_0804377C
    i = 3;
    r9 = -1;
    while (a > 0)
    {
        sp0[i] = a % 10;
        a /= 10;
        i--;
    }
    //_080437AA
    while (i > r9)
    {
        sp0[i] = 0xFF;
        i--;
    }
    //_080437CE
    if (sp0[3] == 0xFF)
        sp0[3] = 0;
    */
    //_080437DA
    if (c == 0)
    {
        for (i = 0, j = 0; i < 4; i++)
        {
            if (sp0[j] == 0xFF)
            {
                b[j] = (b[j] & 0xFC00) | 0x1E;
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | 0x1E;
            }
            else
            {
                b[j] = (b[j] & 0xFC00) | (sp0[j] + 0x14);
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | (sp0[i] + 0x34);
            }
            j++;
        }
        
    }
    //_0804386A
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (sp0[i] == 0xFF)
            {
                b[i] = (b[i] & 0xFC00) | 0x1E;
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | 0x1E;
            }
            else
            {
                b[i] = (b[i] & 0xFC00) | (sp0[i] + 0x14);
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | (sp0[i] + 0x34);
            }
        }
    }
}
#else
__attribute__((naked))
void sub_8043740(s16 a, u16 *b, u8 c)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x4\n\
	adds r7, r1, 0\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	lsls r2, 24\n\
	lsrs r2, 24\n\
	mov r10, r2\n\
	movs r3, 0\n\
	movs r2, 0\n\
_0804375C:\n\
	lsls r0, r3, 24\n\
	asrs r0, 24\n\
	mov r3, sp\n\
	adds r1, r3, r0\n\
	strb r2, [r1]\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	asrs r0, 24\n\
	cmp r0, 0x3\n\
	ble _0804375C\n\
	movs r3, 0x3\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	mov r9, r0\n\
	mov r8, sp\n\
_0804377C:\n\
	lsls r0, r5, 16\n\
	asrs r6, r0, 16\n\
	cmp r6, 0\n\
	ble _080437AA\n\
	lsls r4, r3, 24\n\
	asrs r4, 24\n\
	mov r1, sp\n\
	adds r5, r1, r4\n\
	adds r0, r6, 0\n\
	movs r1, 0xA\n\
	bl __modsi3\n\
	strb r0, [r5]\n\
	adds r0, r6, 0\n\
	movs r1, 0xA\n\
	bl __divsi3\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	subs r4, 0x1\n\
	lsls r4, 24\n\
	lsrs r3, r4, 24\n\
	b _0804377C\n\
_080437AA:\n\
	lsls r1, r3, 24\n\
	asrs r0, r1, 24\n\
	cmp r0, r9\n\
	ble _080437CE\n\
	movs r4, 0xFF\n\
	movs r3, 0x1\n\
	negs r3, r3\n\
_080437B8:\n\
	asrs r2, r1, 24\n\
	mov r5, sp\n\
	adds r1, r5, r2\n\
	ldrb r0, [r1]\n\
	orrs r0, r4\n\
	strb r0, [r1]\n\
	subs r2, 0x1\n\
	lsls r1, r2, 24\n\
	asrs r0, r1, 24\n\
	cmp r0, r3\n\
	bgt _080437B8\n\
_080437CE:\n\
	mov r1, r8\n\
	ldrb r0, [r1, 0x3]\n\
	cmp r0, 0xFF\n\
	bne _080437DA\n\
	movs r0, 0\n\
	strb r0, [r1, 0x3]\n\
_080437DA:\n\
	mov r2, r10\n\
	cmp r2, 0\n\
	bne _0804386A\n\
	movs r3, 0\n\
	movs r1, 0\n\
	movs r6, 0xFC\n\
	lsls r6, 8\n\
	movs r5, 0x1E\n\
	mov r12, r5\n\
_080437EC:\n\
	lsls r1, 24\n\
	asrs r2, r1, 24\n\
	mov r0, sp\n\
	adds r5, r0, r2\n\
	ldrb r0, [r5]\n\
	mov r8, r1\n\
	cmp r0, 0xFF\n\
	bne _08043822\n\
	lsls r1, r2, 1\n\
	adds r1, r7\n\
	ldrh r2, [r1]\n\
	adds r0, r6, 0\n\
	ands r0, r2\n\
	mov r2, r12\n\
	orrs r0, r2\n\
	strh r0, [r1]\n\
	lsls r3, 24\n\
	asrs r1, r3, 23\n\
	adds r1, r7\n\
	adds r1, 0x40\n\
	ldrh r2, [r1]\n\
	adds r0, r6, 0\n\
	ands r0, r2\n\
	mov r5, r12\n\
	orrs r0, r5\n\
	strh r0, [r1]\n\
	b _08043852\n\
_08043822:\n\
	lsls r2, 1\n\
	adds r2, r7\n\
	ldrh r0, [r2]\n\
	adds r1, r6, 0\n\
	ands r1, r0\n\
	ldrb r0, [r5]\n\
	adds r0, 0x14\n\
	orrs r1, r0\n\
	strh r1, [r2]\n\
	lsls r4, r3, 24\n\
	asrs r3, r4, 24\n\
	lsls r2, r3, 1\n\
	adds r2, r7\n\
	adds r2, 0x40\n\
	ldrh r0, [r2]\n\
	adds r1, r6, 0\n\
	ands r1, r0\n\
	mov r5, sp\n\
	adds r0, r5, r3\n\
	ldrb r0, [r0]\n\
	adds r0, 0x34\n\
	orrs r1, r0\n\
	strh r1, [r2]\n\
	adds r3, r4, 0\n\
_08043852:\n\
	movs r0, 0x80\n\
	lsls r0, 17\n\
	add r0, r8\n\
	lsrs r1, r0, 24\n\
	movs r2, 0x80\n\
	lsls r2, 17\n\
	adds r0, r3, r2\n\
	lsrs r3, r0, 24\n\
	asrs r0, 24\n\
	cmp r0, 0x3\n\
	ble _080437EC\n\
	b _080438CE\n\
_0804386A:\n\
	movs r3, 0\n\
	movs r4, 0xFC\n\
	lsls r4, 8\n\
	movs r6, 0x1E\n\
_08043872:\n\
	lsls r1, r3, 24\n\
	asrs r2, r1, 24\n\
	mov r3, sp\n\
	adds r5, r3, r2\n\
	ldrb r0, [r5]\n\
	adds r3, r1, 0\n\
	cmp r0, 0xFF\n\
	bne _0804389E\n\
	lsls r1, r2, 1\n\
	adds r1, r7\n\
	ldrh r2, [r1]\n\
	adds r0, r4, 0\n\
	ands r0, r2\n\
	orrs r0, r6\n\
	strh r0, [r1]\n\
	adds r1, 0x40\n\
	ldrh r2, [r1]\n\
	adds r0, r4, 0\n\
	ands r0, r2\n\
	orrs r0, r6\n\
	strh r0, [r1]\n\
	b _080438C0\n\
_0804389E:\n\
	lsls r2, 1\n\
	adds r2, r7\n\
	ldrh r0, [r2]\n\
	adds r1, r4, 0\n\
	ands r1, r0\n\
	ldrb r0, [r5]\n\
	adds r0, 0x14\n\
	orrs r1, r0\n\
	strh r1, [r2]\n\
	adds r2, 0x40\n\
	ldrh r0, [r2]\n\
	adds r1, r4, 0\n\
	ands r1, r0\n\
	ldrb r0, [r5]\n\
	adds r0, 0x34\n\
	orrs r1, r0\n\
	strh r1, [r2]\n\
_080438C0:\n\
	movs r5, 0x80\n\
	lsls r5, 17\n\
	adds r0, r3, r5\n\
	lsrs r3, r0, 24\n\
	asrs r0, 24\n\
	cmp r0, 0x3\n\
	ble _08043872\n\
_080438CE:\n\
	add sp, 0x4\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}
#endif

void unref_sub_80438E0(s16 a, s16 b, u16 *c)
{
    c[4] = 0x1E;
    sub_8043740(b, c, 0);
    sub_8043740(a, c + 5, 1);
}

void sub_8043D5C(struct Sprite *);
void *sub_8043CDC(u8);

u8 battle_make_oam_normal_battle(u8 a)
{
    int sp0 = 0;
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;
    struct Sprite *sprite;
    
    if (!IsDoubleBattle())
    {
        if (battle_side_get_owner(a) == 0)
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A4EC[0], 0xF0, 0xA0, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A4EC[0], 0xF0, 0xA0, 1);
            
            gSprites[spriteId1].oam.shape = 0;
            gSprites[spriteId2].oam.shape = 0;
            gSprites[spriteId2].oam.tileNum += 0x40;
        }
        //_080439AC
        else
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A51C[0], 0xF0, 0xA0, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A51C[0], 0xF0, 0xA0, 1);
            
            gSprites[spriteId2].oam.tileNum += 0x20;
            sp0 = 2;
        }
        //_080439F2
        
        gSprites[spriteId1].oam.affineParam = spriteId2;
        gSprites[spriteId2].data5 = spriteId1;
        gSprites[spriteId2].callback = sub_8043D5C;
    }
    //_08043A28
    else
    {
        if (battle_side_get_owner(a) == 0)
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A4EC[battle_get_per_side_status(a) / 2], 0xF0, 0xA0, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A4EC[battle_get_per_side_status(a) / 2], 0xF0, 0xA0, 1);
            
            gSprites[spriteId1].oam.affineParam = spriteId2;
            gSprites[spriteId2].data5 = spriteId1;
            gSprites[spriteId2].oam.tileNum += 0x20;
            gSprites[spriteId2].callback = sub_8043D5C;
            sp0 = 1;
        }
        //_08043ACC
        else
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A51C[battle_get_per_side_status(a) / 2], 0xF0, 0xA0, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A51C[battle_get_per_side_status(a) / 2], 0xF0, 0xA0, 1);
            
            gSprites[spriteId1].oam.affineParam = spriteId2;
            gSprites[spriteId2].data5 = spriteId1;
            gSprites[spriteId2].oam.tileNum += 0x20;
            gSprites[spriteId2].callback = sub_8043D5C;
            sp0 = 2;
        }
        //_08043B4E
    }
    //_08043B50
    
    spriteId3 = CreateSpriteAtEnd(&gSpriteTemplate_820A56C[gUnknown_02024A72[a]], 0x8C, 0x3C, 0);
    sprite = &gSprites[spriteId3];
    SetSubspriteTables(sprite, &gSubspriteTables_820A684[battle_side_get_owner(a)]);
    sprite->subspriteMode = 2;
    sprite->oam.priority = 1;
    CpuCopy32(sub_8043CDC(1), (u16 *)(VRAM + 0x10000) + sprite->oam.tileNum * 16, 0x40);
    
    gSprites[spriteId1].data5 = spriteId3;
    gSprites[spriteId1].data6 = a;
    gSprites[spriteId1].invisible = TRUE;
    gSprites[spriteId2].invisible = TRUE;
    sprite->data5 = spriteId1;
    sprite->data6 = sp0;
    sprite->invisible = TRUE;
    
    return spriteId1;
}

u8 battle_make_oam_safari_battle(void)
{
    u8 spriteId1 = CreateSprite(&gSpriteTemplate_820A54C, 0xF0, 0xA0, 1);
    u8 spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A54C, 0xF0, 0xA0, 1);
    
    gSprites[spriteId1].oam.shape = 0;
    gSprites[spriteId2].oam.shape = 0;
    gSprites[spriteId2].oam.tileNum += 0x40;
    gSprites[spriteId1].oam.affineParam = spriteId2;
    gSprites[spriteId2].data5 = spriteId1;
    gSprites[spriteId2].callback = sub_8043D5C;
    return spriteId1;
}

void *sub_8043CDC(u8 a)
{
    return gUnknown_08D1216C[a];
}

void sub_8043CEC(struct Sprite *sprite)
{
    u8 r5 = sprite->data5;
    
    switch (sprite->data6)
    {
    case 0:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    case 1:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    default:
    case 2:
        sprite->pos1.x = gSprites[r5].pos1.x + 8;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    }
    sprite->pos2.x = gSprites[r5].pos2.x;
    sprite->pos2.y = gSprites[r5].pos2.y;
}

void sub_8043D5C(struct Sprite *sprite)
{
    u8 data5 = sprite->data5;

    sprite->pos1.x = gSprites[data5].pos1.x + 64;
    sprite->pos1.y = gSprites[data5].pos1.y;
    sprite->pos2.x = gSprites[data5].pos2.x;
    sprite->pos2.y = gSprites[data5].pos2.y;
}

void sub_8043D84(u8 a, u8 b, u32 c, u32 d, u32 e)
{
    ewram17850[a].unk0 = b;
    ewram17850[a].unk4 = c;
    ewram17850[a].unk8 = d;
    ewram17850[a].unkC = e;
    ewram17850[a].unk10 = 0xFFFF8000;
}

void sub_8043DB0(u8 a)
{
    gSprites[a].invisible = TRUE;
    gSprites[gSprites[a].data5].invisible = TRUE;
    gSprites[gSprites[a].oam.affineParam].invisible = TRUE;
}

void sub_8043DFC(u8 a)
{
    gSprites[a].invisible = FALSE;
    gSprites[gSprites[a].data5].invisible = FALSE;
    gSprites[gSprites[a].oam.affineParam].invisible = FALSE;
}

void sub_8043E50(u8 spriteId, s16 x, s16 y)
{
    gSprites[spriteId].pos1.x = x;
    gSprites[spriteId].pos1.y = y;
}

void unref_sub_8043E70(u8 a)
{
    DestroySprite(&gSprites[gSprites[a].oam.affineParam]);
    DestroySprite(&gSprites[gSprites[a].data5]);
    DestroySprite(&gSprites[a]);
}

void nullsub_11()
{
}

void sub_8043EB4(u8 priority)
{
    s32 i;
    
    for (i = 0; i < gUnknown_02024A68; i++)
    {
        u8 spriteId1;
        u8 spriteId2;
        u8 spriteId3;
        
        spriteId1 = gUnknown_03004340[i];
        spriteId2 = gSprites[spriteId1].oam.affineParam;
        spriteId3 = gSprites[spriteId1].data5;
        gSprites[spriteId1].oam.priority = priority;
        gSprites[spriteId2].oam.priority = priority;
        gSprites[spriteId3].oam.priority = priority;
    }
}

void sub_8043F44(u8 a)
{
    s16 x = 0;
    s16 y = 0;
    
    if (!IsDoubleBattle())
    {
        if (battle_side_get_owner(a) != 0)
        {
            x = 44;
            y = 30;
        }
        else
        {
            x = 158;
            y = 88;
        }
    }
    else
    {
        switch (battle_get_per_side_status(a))
        {
            case 0:
                x = 159;
                y = 77;
                break;
            case 2:
                x = 171;
                y = 102;
                break;
            case 1:
                x = 44;
                y = 19;
                break;
            case 3:
                x = 32;
                y = 44;
                break;
        }
    }
    sub_8043E50(gUnknown_03004340[a], x, y);
}
