#include "global.h"
#include "sprite.h"

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

extern void strange_npc_table_clear(void);
extern void ClearPlayerAvatarInfo(void);

void sub_805AAB0(void);

void npc_clear_ids_and_state(struct MapObject *mapObj)
{
	memset(mapObj, 0, sizeof(struct MapObject));
	mapObj->localId = 0xFF;
	mapObj->mapNum = 0xFF;
	mapObj->mapGroup = 0xFF;
	mapObj->mapobj_unk_1C = 0xFF;
}

void npcs_clear_ids_and_state(void)
{
	u8 i;
	
	for(i = 0; i < 16; i++)
		npc_clear_ids_and_state(&gMapObjects[i]);
}

void sub_805AA98(void)
{
	strange_npc_table_clear();
	npcs_clear_ids_and_state();
	ClearPlayerAvatarInfo();
	sub_805AAB0();
}

/*void sub_805AAB0(void)
{
	u8 spriteVar1;
	u8 spriteVar2;
	
	spriteVar1 = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);

	gSprites[spriteVar1].oam.affineMode = 1;
	InitSpriteAffineAnim(&gSprites[spriteVar1]);
	StartSpriteAffineAnim(&gSprites[spriteVar1], 0);

	spriteVar2 = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);

	gSprites[spriteVar2].oam.affineMode = 4;
	InitSpriteAffineAnim(&gSprites[spriteVar2]);
	StartSpriteAffineAnim(&gSprites[spriteVar2], 1);
	gSprites[spriteVar2].coordOffsetEnabled = 1;
}*/
