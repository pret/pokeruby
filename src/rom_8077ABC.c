#include "global.h"
#include "sprite.h"
#include "species.h"
#include "trig.h"
#include "task.h"
#include "blend_palette.h"

extern u16 gUnknown_02024A6A[];

struct Struct_unk_2019348 {
	u16 field_0;
	u16 field_2;
	u8 field_4;
	u32 field_8;
	u32 field_c;
	u32 field_10;
};

struct Struct_unk_2017800 {
	u8 field_0;
	u8 field_1;
	u16 field_2;
};

struct MonCoords {
	u8 coords;
	u8 y_offset;
};

struct Struct_gUnknown_0837F578 {
	u8 field_0;
	u8 field_1;
};

extern struct Struct_unk_2019348 unk_2019348;
extern struct Struct_unk_2017800 unk_2017800[];
extern u16 gBattleTypeFlags;
extern struct MonCoords gMonBackPicCoords[];
extern struct MonCoords gMonFrontPicCoords[];
extern u32 gUnknown_02024E70[4];
extern u8 gUnknown_02024E84[4];

u8 battle_get_per_side_status(u8);
u8 battle_side_get_owner(u8);

const struct Struct_gUnknown_0837F578 gUnknown_0837F578[][4] = {
	{
		{ 72, 80 },
		{ 176, 40 },
		{ 48, 40 },
		{ 112, 80 },
	},
	{
		{ 32, 80 },
		{ 200, 40 },
		{ 90, 88 },
		{ 152, 32 },
	},
};

// One entry for each of the four Castform forms.
// Coords are probably front pic coords or back pic coords, but this data does not seem to be
// used during battle, party summary, or pokedex screens.
const struct MonCoords gUnknownCastformCoords_0837F598[] = {
	{ 0x44, 17 },
	{ 0x66, 9 },
	{ 0x46, 9 },
	{ 0x86, 8 },
};

const u8 gUnknownCastformData_0837F5A8[] = {
	0xd, 0xe, 0xd, 0xd,
};

// Y position of the backsprite for each of the four Castform forms.
const u8 gUnknown_0837F5AC[] = {
	0, 0, 0, 0
};

extern struct OamData gOamData_837DF9C[];
extern const union AnimCmd *const gDummySpriteAnimTable[];
extern const union AffineAnimCmd *const gDummySpriteAffineAnimTable[];

const struct SpriteTemplate gSpriteTemplate_837F5B0[] = {
	{
		.tileTag = 55125,
		.paletteTag = 55125,
		.oam = gOamData_837DF9C,
		.anims = gDummySpriteAnimTable,
		.images = NULL,
		.affineAnims = gDummySpriteAffineAnimTable,
		.callback = SpriteCallbackDummy,
	}, {
		.tileTag = 55126,
		.paletteTag = 55126,
		.oam = gOamData_837DF9C,
		.anims = gDummySpriteAnimTable,
		.images = NULL,
		.affineAnims = gDummySpriteAffineAnimTable,
		.callback = SpriteCallbackDummy,
	}
};

extern u8 gMiscBlank_Gfx[];

const struct SpriteSheet gUnknown_0837F5E0[] = {
	{ gMiscBlank_Gfx, 0x800, 55125, },
	{ gMiscBlank_Gfx, 0x800, 55126, },
};

extern u8 sub_8076BE0();
u8 sub_8077E44(u8, u16 species, u8);

u8 sub_8077ABC(u8 a1, u8 a2) {
	u8 var;
	u16 species;
	struct Struct_unk_2017800 *unk;

	if (sub_8076BE0()) {
		if (a2 == 3 && a1 == 3) {
			a2 = 1;
		}
	}
	switch (a2) {
	case 0:
	case 2:
		var = gUnknown_0837F578[gBattleTypeFlags & 1][battle_get_per_side_status(a1)].field_0;
		break;
	case 1:
		var = gUnknown_0837F578[gBattleTypeFlags & 1][battle_get_per_side_status(a1)].field_1;
		break;
	case 3:
	case 4:
	default:
		if (sub_8076BE0()) {
			if (unk_2019348.field_4 & 1) {
				species = unk_2019348.field_2;
			} else {
				species = unk_2019348.field_0;
			}
		} else {
			if (battle_side_get_owner(a1)) {
				unk = &unk_2017800[a1];
				if (!unk->field_2) {
					species = GetMonData(&gEnemyParty[gUnknown_02024A6A[a1]], MON_DATA_SPECIES);
				} else {
					species = unk->field_2;
				}
			} else {
				unk = &unk_2017800[a1];
				if (!unk->field_2) {
					species = GetMonData(&gPlayerParty[gUnknown_02024A6A[a1]], MON_DATA_SPECIES);
				} else {
					species = unk->field_2;
				}
			}
		}
		if (a2 == 3) {
			var = sub_8077E44(a1, species, 1);
		} else {
			var = sub_8077E44(a1, species, 0);
		}
		break;
	}
	return var;
}

u8 sub_8077BFC(u8 a1, u16 species) {
	u16 letter;
	u32 personality;
	struct Struct_unk_2017800 *unk;
	u8 ret;
	u16 var;

	if (!battle_side_get_owner(a1) || sub_8076BE0()) {
		if (species == SPECIES_UNOWN) {
			if (sub_8076BE0()) {
				if (unk_2019348.field_4 & 1) {
					personality = unk_2019348.field_10;
				} else {
					personality = unk_2019348.field_8;
				}
			} else {
				unk = &unk_2017800[a1];
				if (!unk->field_2) {
					personality = GetMonData(&gPlayerParty[gUnknown_02024A6A[a1]], MON_DATA_PERSONALITY);
				} else {
					personality = gUnknown_02024E70[a1];
				}
			}
			letter = (((personality & 0x03000000) >> 24) << 6
			        | ((personality & 0x00030000) >> 16) << 4
			        | ((personality & 0x00000300) >> 8) << 2
			        | ((personality & 0x00000003) >> 0) << 0
			) % 28;
			if (!letter) {
				var = species;
			} else {
				var = letter + SPECIES_UNOWN_B - 1;
			}
			ret = gMonBackPicCoords[var].y_offset;
		} else if (species == SPECIES_CASTFORM) {
			ret = gUnknown_0837F5AC[gUnknown_02024E84[a1]];
		} else if (species > NUM_SPECIES) {
			ret = gMonBackPicCoords[0].y_offset;
		} else {
			ret = gMonBackPicCoords[species].y_offset;
		}
	} else {
		if (species == SPECIES_UNOWN) {
			unk = &unk_2017800[a1];
			if (!unk->field_2) {
				personality = GetMonData(&gEnemyParty[gUnknown_02024A6A[a1]], MON_DATA_PERSONALITY);
			} else {
				personality = gUnknown_02024E70[a1];
			}
			letter = (((personality & 0x03000000) >> 24) << 6
			        | ((personality & 0x00030000) >> 16) << 4
			        | ((personality & 0x00000300) >> 8) << 2
			        | ((personality & 0x00000003) >> 0) << 0
			) % 28;
			if (!letter) {
				var = species;
			} else {
				var = letter + SPECIES_UNOWN_B - 1;
			}
			ret = gMonFrontPicCoords[var].y_offset;
		} else if (species == SPECIES_CASTFORM) {
			ret = gUnknownCastformCoords_0837F598[gUnknown_02024E84[a1]].y_offset;
		} else if (species > NUM_SPECIES) {
			ret = gMonFrontPicCoords[0].y_offset;
		} else {
			ret = gMonFrontPicCoords[species].y_offset;
		}
	}
	return ret;
}

extern u8 gEnemyMonElevation[];

u8 sub_8077DD8(u8 a1, u16 species) {
	u8 ret = 0;
	if (battle_side_get_owner(a1) == 1) {
		if (!sub_8076BE0()) {
			if (species == SPECIES_CASTFORM) {
				ret = gUnknownCastformData_0837F5A8[gUnknown_02024E84[a1]];
			} else if (species > NUM_SPECIES) {
				ret = gEnemyMonElevation[0];
			} else {
				ret = gEnemyMonElevation[species];
			}
		}
	}
	return ret;
}

u8 sub_8077E44(u8 a1, u16 species, u8 a3) {
	u16 offset;
	u8 y;
	if (battle_side_get_owner(a1) == 0 || sub_8076BE0()) {
		offset = sub_8077BFC(a1, species);
	} else {
		offset = sub_8077BFC(a1, species);
		offset -= sub_8077DD8(a1, species);
	}
	y = offset + gUnknown_0837F578[gBattleTypeFlags & 1][battle_get_per_side_status(a1)].field_1;
	if (a3) {
		if (battle_side_get_owner(a1) == 0) {
			y += 8;
		}
		if (y > 104) y = 104;
	}
	return y;
}

extern u16 gUnknown_0202F7CA[];

u8 sub_8077EE4(u8 a1, u8 a2) {
	u16 species;
	struct Struct_unk_2017800 *unk;
	if (a2 == 3 || a2 == 4) {
		if (sub_8076BE0()) {
			if (unk_2019348.field_4 & 1) {
				species = unk_2019348.field_2;
			} else {
				species = unk_2019348.field_0;
			}
		} else {
			unk = &unk_2017800[a1];
			if (!unk->field_2) {
				species = gUnknown_0202F7CA[a1];
			} else {
				species = unk->field_2;
			}
		}
		if (a2 == 3) {
			return sub_8077E44(a1, species, 1);
		} else {
			return sub_8077E44(a1, species, 0);
		}
	} else {
		return sub_8077ABC(a1, a2);
	}
}

u8 sub_8077F68(u8 a1) {
	return sub_8077ABC(a1, 4);
}

u8 sub_8077F7C(u8 a1) {
	u16 var;
	if (battle_side_get_owner(a1)) {
		var = sub_8077ABC(a1, 1) + 16;
	} else {
		var = sub_8077ABC(a1, 1) + 17;
	}
	return var;
}

u8 sub_8077FC0(u8 a1) {
	u16 var;
	u8 r6;
	struct Struct_unk_2017800 *unk;
	r6 = sub_8077ABC(a1, 1);
	if (!sub_8076BE0()) {
		if (battle_side_get_owner(a1)) {
			unk = &unk_2017800[a1];
			if (!unk->field_2) {
				var = GetMonData(&gEnemyParty[gUnknown_02024A6A[a1]], MON_DATA_SPECIES);
			} else {
				var = unk->field_2;
			}
		} else {
			unk = &unk_2017800[a1];
			if (!unk->field_2) {
				var = GetMonData(&gPlayerParty[gUnknown_02024A6A[a1]], MON_DATA_SPECIES);
			} else {
				var = unk->field_2;
			}
		}
		if (battle_side_get_owner(a1)) {
			r6 -= sub_8077DD8(a1, var);
		}
	}
	return r6;
}

extern bool8 sub_8078874(u8);
extern bool8 b_side_obj__get_some_boolean(u8);
extern u8 gUnknown_02024BE0[4];
extern u8 gUnknown_0202F7C8;
extern u8 gUnknown_0202F7C9;

u8 obj_id_for_side_relative_to_move(u8 a1) {
	u8 *v1;
	if (a1 == 0) {
		if (sub_8078874(gUnknown_0202F7C8)) {
			v1 = gUnknown_02024BE0;
			return v1[gUnknown_0202F7C8];
		} else {
			return 0xff;
		}
	} else if (a1 == 1) {
		if (sub_8078874(gUnknown_0202F7C9)) {
			v1 = gUnknown_02024BE0;
			return v1[gUnknown_0202F7C9];
		} else {
			return 0xff;
		}
	} else if (a1 == 2) {
		if (!b_side_obj__get_some_boolean(gUnknown_0202F7C8 ^ 2)) {
			return 0xff;
		} else {
			return gUnknown_02024BE0[gUnknown_0202F7C8 ^ 2];
		}
	} else {
		if (b_side_obj__get_some_boolean(gUnknown_0202F7C9 ^ 2)) {
			return gUnknown_02024BE0[gUnknown_0202F7C9 ^ 2];
		} else {
			return 0xff;
		}
	}
}

void oamt_set_x3A_32(struct Sprite *sprite, void (*callback)(struct Sprite*)) {
	sprite->data6 = (u32)(callback) & 0xffff;
	sprite->data7 = (u32)(callback) >> 16;
}

void sub_8078104(struct Sprite *sprite) {
	u32 callback = (u16)sprite->data6 | (sprite->data7 << 16);
	sprite->callback = (void (*)(struct Sprite *))callback;
}

void sub_8078114(struct Sprite *sprite) {
	if (sprite->data3) {
		sprite->pos2.x = Sin(sprite->data0, sprite->data1);
		sprite->pos2.y = Cos(sprite->data0, sprite->data1);
		sprite->data0 += sprite->data2;
		if (sprite->data0 >= 0x100) {
			sprite->data0 -= 0x100;
		} else if (sprite->data0 < 0) {
			sprite->data0 += 0x100;
		}
		sprite->data3--;
	} else {
		sub_8078104(sprite);
	}
}

void sub_8078174(struct Sprite *sprite) {
	if (sprite->data3) {
		sprite->pos2.x = Sin(sprite->data0, (sprite->data5 >> 8) + sprite->data1);
		sprite->pos2.y = Cos(sprite->data0, (sprite->data5 >> 8) + sprite->data1);
		sprite->data0 += sprite->data2;
		sprite->data5 += sprite->data4;
		if (sprite->data0 >= 0x100) {
			sprite->data0 -= 0x100;
		} else if (sprite->data0 < 0) {
			sprite->data0 += 0x100;
		}
		sprite->data3--;
	} else {
		sub_8078104(sprite);
	}
}

void unref_sub_80781F0(struct Sprite *sprite) {
	if (sprite->data3) {
		sprite->pos2.x = Sin(sprite->data0, sprite->data1);
		sprite->pos2.y = Cos(sprite->data4, sprite->data1);
		sprite->data0 += sprite->data2;
		sprite->data4 += sprite->data5;
		if (sprite->data0 >= 0x100) {
			sprite->data0 -= 0x100;
		} else if (sprite->data0 < 0) {
			sprite->data0 += 0x100;
		}
		if (sprite->data4 >= 0x100) {
			sprite->data4 -= 0x100;
		} else if (sprite->data4 < 0) {
			sprite->data4 += 0x100;
		}
		sprite->data3--;
	} else {
		sub_8078104(sprite);
	}
}

void sub_8078278(struct Sprite *sprite) {
	if (sprite->data3) {
		sprite->pos2.x = Sin(sprite->data0, sprite->data1);
		sprite->pos2.y = Cos(sprite->data0, sprite->data4);
		sprite->data0 += sprite->data2;
		if (sprite->data0 >= 0x100) {
			sprite->data0 -= 0x100;
		} else if (sprite->data0 < 0) {
			sprite->data0 += 0x100;
		}
		sprite->data3--;
	} else {
		sub_8078104(sprite);
	}
}

void sub_80782D8(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
	} else {
		sub_8078104(sprite);
	}
}

void sub_8078314(struct Sprite *sprite);
void sub_8078364(struct Sprite *sprite);

void sub_80782F8(struct Sprite *sprite) {
	sub_8078314(sprite);
	sprite->callback = sub_8078364;
	sprite->callback(sprite);
}

void sub_8078314(struct Sprite *sprite) {
	s16 old;
	int v1;
	if (sprite->data1 > sprite->data2) {
		sprite->data0 = -sprite->data0;
	}
	v1 = sprite->data2 - sprite->data1;
	old = sprite->data0;
	sprite->data0 = abs(v1 / sprite->data0);
	sprite->data2 = (sprite->data4 - sprite->data3) / sprite->data0;
	sprite->data1 = old;
}

void sub_8078364(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
		sprite->pos2.x += sprite->data1;
		sprite->pos2.y += sprite->data2;
	} else {
		sub_8078104(sprite);
	}
}

void sub_8078394(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
		sprite->data3 += sprite->data1;
		sprite->data4 += sprite->data2;
		sprite->pos2.x = sprite->data3 >> 8;
		sprite->pos2.y = sprite->data4 >> 8;
	} else {
		sub_8078104(sprite);
	}
}

void UpdateMonIconFrame(struct Sprite *sprite);

void sub_80783D0(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
		sprite->data3 += sprite->data1;
		sprite->data4 += sprite->data2;
		sprite->pos2.x = sprite->data3 >> 8;
		sprite->pos2.y = sprite->data4 >> 8;
	} else {
		sub_8078104(sprite);
	}
	UpdateMonIconFrame(sprite);
}

void unref_sub_8078414(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x + sprite->pos2.x;
	sprite->data3 = sprite->pos1.y + sprite->pos2.y;
	sprite->data2 = sub_8077ABC(gUnknown_0202F7C9, 2);
	sprite->data4 = sub_8077ABC(gUnknown_0202F7C9, 3);
	sprite->callback = sub_80782F8;
}

void sub_8078458(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
		gSprites[sprite->data3].pos2.x += sprite->data1;
		gSprites[sprite->data3].pos2.y += sprite->data2;
	} else {
		sub_8078104(sprite);
	}
}

void sub_80784A8(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
		sprite->data3 += sprite->data1;
		sprite->data4 += sprite->data2;
		gSprites[sprite->data5].pos2.x = sprite->data3 >> 8;
		gSprites[sprite->data5].pos2.y = sprite->data4 >> 8;
	} else {
		sub_8078104(sprite);
	}
}

void sub_8078504(struct Sprite *sprite) {
	if (sprite->data0 > 0) {
		sprite->data0--;
		sprite->pos2.x = sprite->data2 >> 8;
		sprite->data2 += sprite->data1;
		sprite->pos2.y = sprite->data4 >> 8;
		sprite->data4 += sprite->data3;
		if (sprite->data0 % sprite->data5 == 0) {
			if (sprite->data5) {
				sprite->invisible ^= 1;
			}
		}
	} else {
		sub_8078104(sprite);
	}
}

void FreeSpriteOamMatrix(struct Sprite *sprite);
void move_anim_8072740(struct Sprite *sprite);

void move_anim_8074EE0(struct Sprite *sprite) {
	FreeSpriteOamMatrix(sprite);
	move_anim_8072740(sprite);
}

void unref_sub_8078588(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x + sprite->pos2.x;
	sprite->data3 = sprite->pos1.y + sprite->pos2.y;
	sprite->data2 = sub_8077ABC(gUnknown_0202F7C8, 2);
	sprite->data4 = sub_8077ABC(gUnknown_0202F7C8, 3);
	sprite->callback = sub_80782F8;
}

void ResetPaletteStructByUid(u16);

void unref_sub_80785CC(struct Sprite *sprite) {
	ResetPaletteStructByUid(sprite->data5);
	move_anim_8074EE0(sprite);
}

void sub_80785E4(struct Sprite *sprite) {
	if (sprite->affineAnimEnded) {
		sub_8078104(sprite);
	}
}

void sub_8078600(struct Sprite *sprite) {
	if (sprite->animEnded) {
		sub_8078104(sprite);
	}
}

void sub_807861C(struct Sprite *sprite) {
	REG_BLDCNT = 0;
	REG_BLDALPHA = 0;
	move_anim_8072740(sprite);
}

void move_anim_task_del(u8 task);

void sub_8078634(u8 task) {
	REG_BLDCNT = 0;
	REG_BLDALPHA = 0;
	move_anim_task_del(task);
}

void sub_8078650(struct Sprite *sprite) {
	sprite->pos1.x = sub_8077ABC(gUnknown_0202F7C8, 2);
	sprite->pos1.y = sub_8077ABC(gUnknown_0202F7C8, 3);
}

void sub_807867C(struct Sprite *sprite, s16 a2) {
	u16 v1 = sub_8077ABC(gUnknown_0202F7C8, 0);
	u16 v2 = sub_8077ABC(gUnknown_0202F7C9, 0);
	if (v1 > v2) {
		sprite->pos1.x -= a2;
	} else if (v1 < v2) {
		sprite->pos1.x += a2;
	} else {
		if (battle_side_get_owner(gUnknown_0202F7C8)) {
			sprite->pos1.x -= a2;
		} else {
			sprite->pos1.x += a2;
		}
	}
}

void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite);

void sub_80786EC(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x;
	sprite->data3 = sprite->pos1.y;
	obj_translate_based_on_private_1_2_3_4(sprite);
	sprite->data6 = 0x8000 / sprite->data0;
	sprite->data7 = 0;
}

bool8 sub_8078B5C(struct Sprite *sprite);

bool8 sub_8078718(struct Sprite *sprite) {
	if (sub_8078B5C(sprite)) {
		return TRUE;
	}
	sprite->data7 += sprite->data6;
	sprite->pos2.y += Sin((u8)(sprite->data7 >> 8), sprite->data5);
	return FALSE;
}

void oamt_add_pos2_onto_pos1(struct Sprite *sprite) {
	sprite->pos1.x += sprite->pos2.x;
	sprite->pos1.y += sprite->pos2.y;
	sprite->pos2.x = 0;
	sprite->pos2.y = 0;
}

extern s16 gBattleAnimArgs[8];

void sub_8078764(struct Sprite *sprite, u8 a2) {
	if (!a2) {
		sprite->pos1.x = sub_8077EE4(gUnknown_0202F7C9, 0);
		sprite->pos1.y = sub_8077EE4(gUnknown_0202F7C9, 1);
	}
	sub_807867C(sprite, gBattleAnimArgs[0]);
	sprite->pos1.y += gBattleAnimArgs[1];
}

void sub_80787B0(struct Sprite *sprite, u8 a2) {
	if (!a2) {
		sprite->pos1.x = sub_8077EE4(gUnknown_0202F7C8, 0);
		sprite->pos1.y = sub_8077EE4(gUnknown_0202F7C8, 1);
	} else {
		sprite->pos1.x = sub_8077EE4(gUnknown_0202F7C8, 2);
		sprite->pos1.y = sub_8077EE4(gUnknown_0202F7C8, 3);
	}
	sub_807867C(sprite, gBattleAnimArgs[0]);
	sprite->pos1.y += gBattleAnimArgs[1];
}

extern u8 gUnknown_02024A72[4];

u8 battle_side_get_owner(u8 a1) {
	return gUnknown_02024A72[a1] & 1;
}

u8 battle_get_per_side_status(u8 a1) {
	return gUnknown_02024A72[a1];
}

extern u8 gUnknown_02024A68;

u8 battle_get_side_with_given_state(u8 a1) {
	u8 i;
	for (i = 0; i < gUnknown_02024A68; i++) {
		if (gUnknown_02024A72[i] == a1) {
			break;
		}
	}
	return i;
}

bool8 sub_8078874(u8 a1) {
	if (sub_8076BE0()) {
		if (gUnknown_0202F7C8 == a1) {
			return TRUE;
		}
		if (gUnknown_0202F7C9 == a1) {
			return TRUE;
		}
		return FALSE;
	} else {
		if (gUnknown_02024A72[a1] == 0xff) {
			return FALSE;
		}
		if (battle_side_get_owner(a1)) {
			if (GetMonData(&gEnemyParty[gUnknown_02024A6A[a1]], MON_DATA_HP)) {
				return TRUE;
			}
		} else {
			if (GetMonData(&gPlayerParty[gUnknown_02024A6A[a1]], MON_DATA_HP)) {
				return TRUE;
			}
		}
		return FALSE;
	}
}

bool8 IsDoubleBattle() {
	return gBattleTypeFlags & 1;
}

struct Struct_sub_8078914 {
	u8 *field_0;
	u8 *field_4;
	u8 field_8;
};

void sub_8078914(struct Struct_sub_8078914 *unk) {
	if (sub_8076BE0()) {
		unk->field_0 = (u8 *)0x6008000;
		unk->field_4 = (u8 *)0x600f000;
		unk->field_8 = 0xe;
	} else {
		unk->field_0 = (u8 *)0x6004000;
		unk->field_4 = (u8 *)0x600e000;
		unk->field_8 = 0x8;
	}
}

u8 battle_get_per_side_status_permutated(u8);

void sub_8078954(struct Struct_sub_8078914 *unk) {
	if (sub_8076BE0()) {
		unk->field_0 = (u8 *)0x6008000;
		unk->field_4 = (u8 *)0x600f000;
		unk->field_8 = 0xe;
	} else if (battle_get_per_side_status_permutated(gUnknown_0202F7C8) == 1) {
		unk->field_0 = (u8 *)0x6004000;
		unk->field_4 = (u8 *)0x600e000;
		unk->field_8 = 0x8;
	} else {
		unk->field_0 = (u8 *)0x6006000;
		unk->field_4 = (u8 *)0x600f000;
		unk->field_8 = 0x9;
	}
}

u8 sub_80789BC() {
	if (sub_8076BE0()) {
		return 1;
	}
	return 2;
}

struct BG3Cnt {
	u16 field_0:13;
	u16 field_d:1;
	u16 field_e:2;
};

void sub_80789D4(bool8 a1) {
#define BG3CNT (*(volatile struct BG3Cnt*)REG_ADDR_BG3CNT)
	if (!a1) {
		BG3CNT.field_e = 0;
		BG3CNT.field_d = 1;
	} else if (sub_8076BE0()) {
		BG3CNT.field_e = 0;
		BG3CNT.field_d = 1;
	} else {
		BG3CNT.field_e = 1;
		BG3CNT.field_d = 0;
	}
}

void sub_8078A5C(struct Sprite *sprite);

void sub_8078A34(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x;
	sprite->data3 = sprite->pos1.y;
	sub_8078A5C(sprite);
	sprite->callback = sub_80783D0;
	sprite->callback(sprite);
}

void sub_8078A5C(struct Sprite *sprite) {
	s16 x = (sprite->data2 - sprite->data1) << 8;
	s16 y = (sprite->data4 - sprite->data3) << 8;
	sprite->data1 = x / sprite->data0;
	sprite->data2 = y / sprite->data0;
	sprite->data4 = 0;
	sprite->data3 = 0;
}

void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite) {
	int x = sprite->data2 - sprite->data1;
	int y = sprite->data4 - sprite->data3;
	bool8 r8 = x < 0;
	bool8 r9 = y < 0;
	u16 x2 = abs(x) << 8;
	u16 y2 = abs(y) << 8;
	x2 = x2 / sprite->data0;
	y2 = y2 / sprite->data0;
	if (r8) {
		x2 |= 1;
	} else {
		x2 &= ~1;
	}
	if (r9) {
		y2 |= 1;
	} else {
		y2 &= ~1;
	}
	sprite->data1 = x2;
	sprite->data2 = y2;
	sprite->data4 = 0;
	sprite->data3 = 0;
}

void sub_8078BB8(struct Sprite *sprite);

void sub_8078B34(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x;
	sprite->data3 = sprite->pos1.y;
	obj_translate_based_on_private_1_2_3_4(sprite);
	sprite->callback = sub_8078BB8;
	sprite->callback(sprite);
}

bool8 sub_8078B5C(struct Sprite *sprite) {
	u16 v1, v2, x, y;
	if (!sprite->data0) {
		return TRUE;
	}
	v1 = sprite->data1;
	v2 = sprite->data2;
	x = sprite->data3;
	y = sprite->data4;
	x += v1;
	y += v2;
	if (v1 & 1) {
		sprite->pos2.x = -(x >> 8);
	} else {
		sprite->pos2.x = x >> 8;
	}
	if (v2 & 1) {
		sprite->pos2.y = -(y >> 8);
	} else {
		sprite->pos2.y = y >> 8;
	}
	sprite->data3 = x;
	sprite->data4 = y;
	sprite->data0--;
	return FALSE;
}

void sub_8078BB8(struct Sprite *sprite) {
	if (sub_8078B5C(sprite)) {
		sub_8078104(sprite);
	}
}

void sub_8078BD4(struct Sprite *sprite) {
	int v1 = abs(sprite->data2 - sprite->data1) << 8;
	sprite->data0 = v1 / sprite->data0;
	obj_translate_based_on_private_1_2_3_4(sprite);
}

void sub_8078C00(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x;
	sprite->data3 = sprite->pos1.y;
	sub_8078BD4(sprite);
	sprite->callback = sub_8078BB8;
	sprite->callback(sprite);
}

void sub_8078C28(struct Sprite *sprite) {
	int x = sprite->data2 - sprite->data1;
	int y = sprite->data4 - sprite->data3;
	bool8 x_sign = x < 0;
	bool8 y_sign = y < 0;
	u16 x2 = abs(x) << 4;
	u16 y2 = abs(y) << 4;
	x2 /= sprite->data0;
	y2 /= sprite->data0;
	if (x_sign) {
		x2 |= 1;
	} else {
		x2 &= ~1;
	}
	if (y_sign) {
		y2 |= 1;
	} else {
		y2 &= ~1;
	}
	sprite->data1 = x2;
	sprite->data2 = y2;
	sprite->data4 = 0;
	sprite->data3 = 0;
}

void sub_8078D44(struct Sprite *sprite);

void sub_8078CC0(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x;
	sprite->data3 = sprite->pos1.y;
	sub_8078C28(sprite);
	sprite->callback = sub_8078D44;
	sprite->callback(sprite);
}

bool8 sub_8078CE8(struct Sprite *sprite) {
	u16 v1, v2, x, y;
	if (!sprite->data0) {
		return TRUE;
	}
	v1 = sprite->data1;
	v2 = sprite->data2;
	x = sprite->data3;
	y = sprite->data4;
	x += v1;
	y += v2;
	if (v1 & 1) {
		sprite->pos2.x = -(x >> 4);
	} else {
		sprite->pos2.x = x >> 4;
	}
	if (v2 & 1) {
		sprite->pos2.y = -(y >> 4);
	} else {
		sprite->pos2.y = y >> 4;
	}
	sprite->data3 = x;
	sprite->data4 = y;
	sprite->data0--;
	return FALSE;
}

void sub_8078D44(struct Sprite *sprite) {
	if (sub_8078CE8(sprite)) {
		sub_8078104(sprite);
	}
}

void sub_8078D60(struct Sprite *sprite) {
	int v1 = abs(sprite->data2 - sprite->data1) << 4;
	sprite->data0 = v1 / sprite->data0;
	sub_8078C28(sprite);
}

void sub_8078D8C(struct Sprite *sprite) {
	sprite->data1 = sprite->pos1.x;
	sprite->data3 = sprite->pos1.y;
	sub_8078D60(sprite);
	sprite->callback = sub_8078D44;
	sprite->callback(sprite);
}

bool8 sub_8078E38();

struct OamMatrix
{
    s16 a;
    s16 b;
    s16 c;
    s16 d;
};

extern struct OamMatrix gOamMatrices[];

void obj_id_set_rotscale(u8 sprite, s16 xScale, s16 yScale, u16 rotation) {
	int i;
	struct ObjAffineSrcData src;
	struct OamMatrix matrix;
	src.xScale = xScale;
	src.yScale = yScale;
	src.rotation = rotation;
	if (sub_8078E38()) {
		src.xScale = -src.xScale;
	}
	i = gSprites[sprite].oam.matrixNum;
	ObjAffineSet(&src, &matrix, 1, 2);
	gOamMatrices[i].a = matrix.a;
	gOamMatrices[i].b = matrix.b;
	gOamMatrices[i].c = matrix.c;
	gOamMatrices[i].d = matrix.d;
}

bool8 sub_8078E38() {
	if (sub_8076BE0()) {
		if (gSprites[obj_id_for_side_relative_to_move(0)].data2 == 0xc9) {
			return FALSE;
		}
		return TRUE;
	}
	return FALSE;
}

struct Struct_2017810 {
	u8 filler_0[3];
	u8 field_3_0:6;
	u8 filler_4[2];
	u8 field_6;
	u8 filler_7[5];
};

extern struct Struct_2017810 unk_2017810[];

void CalcCenterToCornerVec(struct Sprite *sprite, u8 shape, u8 size, u8 affineMode);

void sub_8078E70(u8 sprite, u8 a2) {
	struct Struct_2017810 *unk;
	u8 r7 = gSprites[sprite].data0;
	if (sub_8076BE0() || b_side_obj__get_some_boolean(r7)) {
		gSprites[sprite].invisible = FALSE;
	}
	gSprites[sprite].oam.objMode = a2;
	gSprites[sprite].affineAnimPaused = TRUE;
	if (!sub_8076BE0() && !gSprites[sprite].oam.affineMode) {
		unk = &unk_2017810[r7];
		gSprites[sprite].oam.matrixNum = unk->field_6;
	}
	gSprites[sprite].oam.affineMode = 3;
	CalcCenterToCornerVec(&gSprites[sprite], gSprites[sprite].oam.shape, gSprites[sprite].oam.size, gSprites[sprite].oam.affineMode);
}

void sub_8078F40(u8 sprite) {
	obj_id_set_rotscale(sprite, 0x100, 0x100, 0);
	gSprites[sprite].oam.affineMode = 1;
	gSprites[sprite].oam.objMode = 0;
	gSprites[sprite].affineAnimPaused = FALSE;
	CalcCenterToCornerVec(&gSprites[sprite], gSprites[sprite].oam.shape, gSprites[sprite].oam.size, gSprites[sprite].oam.affineMode);
}

void sub_8078F9C(u8 sprite) {
	u16 matrix = gSprites[sprite].oam.matrixNum;
	s16 c = gOamMatrices[matrix].c;
	if (c < 0) {
		c = -c;
	}
	gSprites[sprite].pos2.y = c >> 3;
}

// related to obj_id_set_rotscale
void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation) {
	int i;
	struct ObjAffineSrcData src;
	struct OamMatrix matrix;
	if (sprite->oam.affineMode & 1) {
		sprite->affineAnimPaused = TRUE;
		if (a2) {
			CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
		}
		src.xScale = xScale;
		src.yScale = yScale;
		src.rotation = rotation;
		if (sub_8078E38()) {
			src.xScale = -src.xScale;
		}
		i = sprite->oam.matrixNum;
		ObjAffineSet(&src, &matrix, 1, 2);
		gOamMatrices[i].a = matrix.a;
		gOamMatrices[i].b = matrix.b;
		gOamMatrices[i].c = matrix.c;
		gOamMatrices[i].d = matrix.d;
	}
}

void sub_8079098(struct Sprite *sprite) {
	sub_8078FDC(sprite, TRUE, 0x100, 0x100, 0);
	sprite->affineAnimPaused = FALSE;
	CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
}

u16 sub_80790D8(s16 a, s16 b) {
	return ArcTan2(a, b);
}

u16 sub_80790F0(s16 a, s16 b) {
	u16 var = sub_80790D8(a, b);
	return -var;
}

extern u16 gPlttBufferUnfaded[];
extern u16 gPlttBufferFaded[];

struct Color {
	u16 r:5;
	u16 g:5;
	u16 b:5;
};

void sub_8079108(u16 a1, bool8 a2) {
	int i;
	struct Color *c;
	struct Color *c2;
	u16 average;

	a1 *= 0x10;

	if (!a2) {
		for (i = 0; i < 0x10; i++) {
			c = (struct Color *)&gPlttBufferUnfaded[a1 + i];
			average = c->r + c->g + c->b;
			average /= 3;

			c2 = (struct Color *)&gPlttBufferFaded[a1 + i];
			c2->r = average;
			c2->g = average;
			c2->b = average;
		}
	} else {
		CpuCopy32(&gPlttBufferUnfaded[a1], &gPlttBufferFaded[a1], 0x20);
	}
}

u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7) {
	u32 var = 0;
	u32 shift;
	if (a1) {
		if (!sub_8076BE0()) {
			var = 0xe;
		} else {
			var = 1 << sub_80789BC();
		}
	}
	if (a2) {
		shift = gUnknown_0202F7C8 + 16;
		var |= 1 << shift;
	}
	if (a3) {
		shift = gUnknown_0202F7C9 + 16;
		var |= 1 << shift;
	}
	if (a4) {
		if (b_side_obj__get_some_boolean(gUnknown_0202F7C8 ^ 2)) {
			shift = (gUnknown_0202F7C8 ^ 2) + 16;
			var |= 1 << shift;
		}
	}
	if (a5) {
		if (b_side_obj__get_some_boolean(gUnknown_0202F7C9 ^ 2)) {
			shift = (gUnknown_0202F7C9 ^ 2) + 16;
			var |= 1 << shift;
		}
	}
	if (a6) {
		if (!sub_8076BE0()) {
			var |= 0x100;
		} else {
			var |= 0x4000;
		}
	}
	if (a7) {
		if (!sub_8076BE0()) {
			var |= 0x200;
		}
	}
	return var;
}

u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4) {
	u32 var = 0;
	u32 shift;
	if (sub_8076BE0()) {
		if (a1) {
			var |= 1 << 18;
			return var;
		}
	} else {
		if (a1) {
			if (b_side_obj__get_some_boolean(battle_get_side_with_given_state(0))) {
				var |= 1 << (battle_get_side_with_given_state(0) + 16);
			}
		}
		if (a2) {
			if (b_side_obj__get_some_boolean(battle_get_side_with_given_state(2))) {
				shift = battle_get_side_with_given_state(2) + 16;
				var |= 1 << shift;
			}
		}
		if (a3) {
			if (b_side_obj__get_some_boolean(battle_get_side_with_given_state(1))) {
				shift = battle_get_side_with_given_state(1) + 16;
				var |= 1 << shift;
			}
		}
		if (a4) {
			if (b_side_obj__get_some_boolean(battle_get_side_with_given_state(3))) {
				shift = battle_get_side_with_given_state(3) + 16;
				var |= 1 << shift;
			}
		}
	}
	return var;
}

u8 sub_80793A8(u8 a1) {
	return a1;
}

u8 unref_sub_80793B0(u8 a1) {
	return battle_get_side_with_given_state(a1);
}

void sub_80793C4(struct Sprite *sprite) {
	bool8 var;
	if (!sprite->data0) {
		if (!gBattleAnimArgs[3]) {
			var = TRUE;
		} else {
			var = FALSE;
		}
		if (!gBattleAnimArgs[2]) {
			sub_80787B0(sprite, var);
		} else {
			sub_8078764(sprite, var);
		}
		sprite->data0++;

	} else if (sprite->animEnded || sprite->affineAnimEnded) {
		move_anim_8074EE0(sprite);
	}
}

void sub_807941C(struct Sprite *sprite) {
	bool8 v1;
	u8 v2;
	if (!(gBattleAnimArgs[5] & 0xff00)) {
		v1 = TRUE;
	} else {
		v1 = FALSE;
	}
	if (!(gBattleAnimArgs[5] & 0xff)) {
		v2 = 3;
	} else {
		v2 = 1;
	}
	sub_80787B0(sprite, v1);
	if (battle_side_get_owner(gUnknown_0202F7C8)) {
		gBattleAnimArgs[2] = -gBattleAnimArgs[2];
	}
	sprite->data0 = gBattleAnimArgs[4];
	sprite->data2 = sub_8077ABC(gUnknown_0202F7C9, 2) + gBattleAnimArgs[2];
	sprite->data4 = sub_8077ABC(gUnknown_0202F7C9, v2) + gBattleAnimArgs[3];
	sprite->callback = sub_8078B34;
	oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_8079518(struct Sprite *sprite);

void sub_80794A8(struct Sprite *sprite) {
	sub_80787B0(sprite, 1);
	if (battle_side_get_owner(gUnknown_0202F7C8)) {
		gBattleAnimArgs[2] = -gBattleAnimArgs[2];
	}
	sprite->data0 = gBattleAnimArgs[4];
	sprite->data2 = sub_8077ABC(gUnknown_0202F7C9, 2) + gBattleAnimArgs[2];
	sprite->data4 = sub_8077ABC(gUnknown_0202F7C9, 3) + gBattleAnimArgs[3];
	sprite->data5 = gBattleAnimArgs[5];
	sub_80786EC(sprite);
	sprite->callback = sub_8079518;
}

void sub_8079518(struct Sprite *sprite) {
	if (sub_8078718(sprite)) {
		move_anim_8072740(sprite);
	}
}

void sub_8079534(struct Sprite *sprite) {
	u8 r4, r6, r7;
	if (!gBattleAnimArgs[6]) {
		r4 = 1;
		r7 = 3;
	} else {
		r4 = 0;
		r7 = 1;
	}
	if (!gBattleAnimArgs[5]) {
		sub_80787B0(sprite, r4);
		r6 = gUnknown_0202F7C8;
	} else {
		sub_8078764(sprite, r4);
		r6 = gUnknown_0202F7C9;
	}
	if (battle_side_get_owner(gUnknown_0202F7C8)) {
		gBattleAnimArgs[2] = -gBattleAnimArgs[2];
	}
	sub_8078764(sprite, r4);
	sprite->data0 = gBattleAnimArgs[4];
	sprite->data2 = sub_8077ABC(r6, 2) + gBattleAnimArgs[2];
	sprite->data4 = sub_8077ABC(r6, r7) + gBattleAnimArgs[3];
	sprite->callback = sub_8078B34;
	oamt_set_x3A_32(sprite, move_anim_8072740);
}

s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1) {
	u16 i;
	u8 sprite = obj_id_for_side_relative_to_move(a1);
	if (sprite != 0xff) {
		for (i = 0; i < 0x40; i++) {
			if (gSprites[i].inUse) {
				continue;
			}
			gSprites[i] = gSprites[sprite];
			gSprites[i].oam.objMode = 1;
			gSprites[i].invisible = FALSE;
			return i;
		}
	}
	return -1;
}

void obj_delete_but_dont_free_vram(struct Sprite *sprite) {
	sprite->usingSheet = TRUE;
	DestroySprite(sprite);
}

void sub_80796F8(u8 task);

void sub_8079670(u8 task) {
	s16 r5 = 0;
	s16 r3 = 0;
	if (gBattleAnimArgs[2] > gBattleAnimArgs[0]) {
		r3 = 1;
	}
	if (gBattleAnimArgs[2] < gBattleAnimArgs[0]) {
		r3 = -1;
	}
	if (gBattleAnimArgs[3] > gBattleAnimArgs[1]) {
		r5 = 1;
	}
	if (gBattleAnimArgs[3] < gBattleAnimArgs[1]) {
		r5 = -1;
	}
	gTasks[task].data[0] = 0;
	gTasks[task].data[1] = gBattleAnimArgs[4];
	gTasks[task].data[2] = 0;
	gTasks[task].data[3] = gBattleAnimArgs[0];
	gTasks[task].data[4] = gBattleAnimArgs[1];
	gTasks[task].data[5] = r3;
	gTasks[task].data[6] = r5;
	gTasks[task].data[7] = gBattleAnimArgs[2];
	gTasks[task].data[8] = gBattleAnimArgs[3];
	REG_BLDALPHA = (gBattleAnimArgs[1] << 8) | gBattleAnimArgs[0];
	gTasks[task].func = sub_80796F8;
}

void sub_80796F8(u8 taskId) {
	struct Task *task = &gTasks[taskId];
	if (++task->data[0] > task->data[1]) {
		task->data[0] = 0;
		if (++task->data[2] & 1) {
			if (task->data[3] != task->data[7]) {
				task->data[3] += task->data[5];
			}
		} else {
			if (task->data[4] != task->data[8]) {
				task->data[4] += task->data[6];
			}
		}
		REG_BLDALPHA = (task->data[4] << 8) | task->data[3];
		if (task->data[3] == task->data[7] && task->data[4] == task->data[8]) {
			move_anim_task_del(taskId);
			return;
		}
	}
}

void sub_80797EC(struct Task *task);

void sub_8079790(u8 task) {
	u8 sprite = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
	if (sprite == 0xff) {
		move_anim_task_del(task);
		return;
	}
	gTasks[task].data[0] = (gSprites[sprite].oam.paletteNum << 4) + 0x101;
	sub_80797EC(&gTasks[task]);
}

void sub_8079814(u8 taskId);

void sub_80797EC(struct Task *task) {
	task->data[1] = gBattleAnimArgs[1];
	task->data[2] = 0;
	task->data[3] = gBattleAnimArgs[2];
	task->data[4] = 0;
	task->data[5] = gBattleAnimArgs[3];
	task->data[6] = 0;
	task->data[7] = gBattleAnimArgs[4];
	task->func = sub_8079814;
}

void sub_8079814(u8 taskId) {
	struct Task *task = &gTasks[taskId];
	if (++task->data[4] >= task->data[5]) {
		task->data[4] = 0;
		if (!task->data[6]) {
			task->data[2]++;
			BlendPalette(task->data[0], 0xf, task->data[2], task->data[1]);
			if (task->data[2] == task->data[3]) {
				task->data[6] = 1;
			}
		} else {
			task->data[2]--;
			BlendPalette(task->data[0], 0xf, task->data[2], task->data[1]);
			if (!task->data[2]) {
				if (--task->data[7]) {
					task->data[4] = 0;
					task->data[6] = 0;
				} else {
					move_anim_task_del(taskId);
					return;
				}
			}
		}
	}
}

void sub_80798AC(u8 task) {
	u8 index = IndexOfSpritePaletteTag(gBattleAnimArgs[0]);
	if (index == 0xff) {
		move_anim_task_del(task);
		return;
	}
	gTasks[task].data[0] = (index << 4) + 0x101;
	sub_80797EC(&gTasks[task]);
}

void sub_8079BF4(s16 *, s16 *, void *);

void sub_80798F4(struct Task *task, u8 a2, void *a3) {
	task->data[7] = 0;
	task->data[8] = 0;
	task->data[9] = 0;
	task->data[15] = a2;
	task->data[10] = 0x100;
	task->data[11] = 0x100;
	task->data[12] = 0;
	sub_8079BF4(&task->data[13], &task->data[14], a3);
	sub_8078E70(a2, 0);
}

struct Struct_0202F7D4 {
	s16 field_0;
	s16 field_2;
	u8 field_4;
	u8 field_5;
};

extern struct Struct_0202F7D4 *gUnknown_0202F7D4;

void *sub_8079BFC(s16, s16);

void sub_8079A64(u8);

bool8 sub_807992C(struct Task *task) {
	gUnknown_0202F7D4 = sub_8079BFC(task->data[13], task->data[14]) + (task->data[7] << 3);
	switch (gUnknown_0202F7D4->field_0) {
	default:
		if (!gUnknown_0202F7D4->field_5) {
			task->data[10] = gUnknown_0202F7D4->field_0;
			task->data[11] = gUnknown_0202F7D4->field_2;
			task->data[12] = gUnknown_0202F7D4->field_4;
			task->data[7]++;
			gUnknown_0202F7D4++;
		}
		task->data[10] += gUnknown_0202F7D4->field_0;
		task->data[11] += gUnknown_0202F7D4->field_2;
		task->data[12] += gUnknown_0202F7D4->field_4;
		obj_id_set_rotscale(task->data[15], task->data[10], task->data[11], task->data[12]);
		sub_8079A64(task->data[15]);
		if (++task->data[8] >= gUnknown_0202F7D4->field_5) {
			task->data[8] = 0;
			task->data[7]++;
		}
		break;

	case 0x7ffe:
		task->data[7] = gUnknown_0202F7D4->field_2;
		break;

	case 0x7ffd:
		if (gUnknown_0202F7D4->field_2) {
			if (task->data[9]) {
				if (!--task->data[9]) {
					task->data[7]++;
					break;
				}
			} else {
				task->data[9] = gUnknown_0202F7D4->field_2;
			}
			if (!task->data[7]) {
				break;
			}
			for (;;) {
				task->data[7]--;
				gUnknown_0202F7D4--;
				if (gUnknown_0202F7D4->field_0 == 0x7ffd) {
					task->data[7]++;
					return TRUE;
				}
				if (!task->data[7]) {
					return TRUE;
				}
			}
		}
		task->data[7]++;
		break;

	case 0x7fff:
		gSprites[task->data[15]].pos2.y = 0;
		sub_8078F40(task->data[15]);
		return FALSE;
	}

	return TRUE;
}

u16 sub_8079B10(u8 sprite);

void sub_8079A64(u8 sprite) {
	int var = 0x40 - sub_8079B10(sprite) * 2;
	u16 matrix = gSprites[sprite].oam.matrixNum;
	int var2 = (var << 8) / gOamMatrices[matrix].d;
	if (var2 > 0x80) {
		var2 = 0x80;
	}
	gSprites[sprite].pos2.y = (var - var2) / 2;
}

void sub_8079AB8(u8 a1, u8 a2) {
	int var = 0x40 - sub_8079B10(a2) * 2;
	u16 matrix = gSprites[a1].oam.matrixNum;
	int var2 = (var << 8) / gOamMatrices[matrix].d;
	if (var2 > 0x80) {
		var2 = 0x80;
	}
	gSprites[a1].pos2.y = (var - var2) / 2;
}

u16 sub_8079B10(u8 sprite) {
	struct Struct_unk_2017800 *unk;
	u8 r5 = gSprites[sprite].data0;
	u16 species;
	u16 i;
	for (i = 0; i < sizeof(gUnknown_02024BE0); i++) {
		if (gUnknown_02024BE0[i] == sprite) {
			if (sub_8076BE0()) {
				species = unk_2019348.field_0;
				return gMonBackPicCoords[species].y_offset;
			} else {
				if (!battle_side_get_owner(i)) {
					unk = &unk_2017800[r5];
					if (!unk->field_2) {
						species = GetMonData(&gPlayerParty[gUnknown_02024A6A[i]], MON_DATA_SPECIES);
					} else {
						species = unk->field_2;
					}
					return gMonBackPicCoords[species].y_offset;
				} else {
					unk = &unk_2017800[r5];
					if (!unk->field_2) {
						species = GetMonData(&gEnemyParty[gUnknown_02024A6A[i]], MON_DATA_SPECIES);
					} else {
						species = unk->field_2;
					}
					return gMonFrontPicCoords[species].y_offset;
				}
			}
		}
	}
	return 0x40;
}

void sub_8079BF4(s16 *bottom, s16 *top, void *ptr) {
	*bottom = ((intptr_t) ptr) & 0xffff;
	*top = (((intptr_t) ptr) >> 16) & 0xffff;
}

void *sub_8079BFC(s16 bottom, s16 top) {
	return (void *)((u16)bottom | ((u16)top << 16));
}


// possible new file

void sub_8079C08(struct Task *task, u8 a2, s16 a3, s16 a4, s16 a5, s16 a6, u16 a7) {
	task->data[8] = a7;
	task->data[15] = a2;
	task->data[9] = a3;
	task->data[10] = a4;
	task->data[13] = a5;
	task->data[14] = a6;
	task->data[11] = (a5 - a3) / a7;
	task->data[12] = (a6 - a4) / a7;
}

u8 sub_8079C74(struct Task *task) {
	if (!task->data[8]) {
		return 0;
	}
	if (--task->data[8]) {
		task->data[9] += task->data[11];
		task->data[10] += task->data[12];
	} else {
		task->data[9] = task->data[13];
		task->data[10] = task->data[14];
	}
	obj_id_set_rotscale(task->data[15], task->data[9], task->data[10], 0);
	if (task->data[8]) {
		sub_8079A64(task->data[15]);
	} else {
		gSprites[task->data[15]].pos2.y = 0;
	}
	return task->data[8];
}

extern u8 gUnknown_0202F7BE;

void sub_8079CEC(u8 task) {
	u16 v1;
	if (gUnknown_0202F7BE <= 30) {
		v1 = 0;
	} else if (gUnknown_0202F7BE <= 100) {
		v1 = 1;
	} else if (gUnknown_0202F7BE <= 200) {
		v1 = 2;
	} else {
		v1 = 3;
	}
	gBattleAnimArgs[7] = v1;
	move_anim_task_del(task);
}

void unref_sub_8079D20(u8 a1) {
	if (b_side_obj__get_some_boolean(gUnknown_0202F7C9)) {
		gSprites[gUnknown_02024BE0[gUnknown_0202F7C9]].oam.priority = a1;
	}
	if (b_side_obj__get_some_boolean(gUnknown_0202F7C8)) {
		gSprites[gUnknown_02024BE0[gUnknown_0202F7C8]].oam.priority = a1;
	}
	if (b_side_obj__get_some_boolean(gUnknown_0202F7C9 ^ 2)) {
		gSprites[gUnknown_02024BE0[gUnknown_0202F7C9 ^ 2]].oam.priority = a1;
	}
	if (b_side_obj__get_some_boolean(gUnknown_0202F7C8 ^ 2)) {
		gSprites[gUnknown_02024BE0[gUnknown_0202F7C8 ^ 2]].oam.priority = a1;
	}
}

u8 sub_8079E90(u8);

void sub_8079E24() {
	int i;
	for (i = 0; i < gUnknown_02024A68; i++) {
		if (b_side_obj__get_some_boolean(i)) {
			gSprites[gUnknown_02024BE0[i]].subpriority = sub_8079E90(i);
			gSprites[gUnknown_02024BE0[i]].oam.priority = 2;
		}
	}
}

u8 sub_8079E90(u8 a1) {
	u8 status;
	u8 ret;
	if (sub_8076BE0()) {
		if (a1 == 2) {
			return 30;
		} else {
			return 40;
		}
	} else {
		status = battle_get_per_side_status(a1);
		if (status == 0) {
			ret = 30;
		} else if (status == 2) {
			ret = 20;
		} else if (status == 1) {
			ret = 40;
		} else {
			ret = 50;
		}
	}
	return ret;
}

struct BGCnt {
	u16 field_0:2;
};

u8 sub_8079ED4(u8 a1) {
#define BG1CNT (*(volatile struct BGCnt*)REG_ADDR_BG1CNT)
#define BG2CNT (*(volatile struct BGCnt*)REG_ADDR_BG2CNT)
	u8 status = battle_get_per_side_status(a1);
	if (sub_8076BE0()) {
		return 2;
	}
	if (status == 0 || status == 3) {
		return BG2CNT.field_0;
	} else {
		return BG1CNT.field_0;
	}
}

u8 battle_get_per_side_status_permutated(u8 a1) {
	u8 status;
	if (!sub_8076BE0()) {
		status = battle_get_per_side_status(a1);
		if (status == 0 || status == 3) {
			return 2;
		} else {
			return 1;
		}
	}
	return 1;
}

extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7C18;

extern struct SpriteSheet gMonFrontPicTable[];
extern struct SpriteSheet gMonBackPicTable[];

extern void *species_and_otid_get_pal(u32, u32, u32);

#include "decompress.h"
#include "palette.h"

u8 sub_8079F44(u16 a1, u8 a2, u8 a3, s16 a4, s16 a5, u8 a6, u32 a7, u32 a8) {
	void *src;
	void *dest;
	int size;

	u8 sprite;
	u16 sheet = LoadSpriteSheet(&gUnknown_0837F5E0[a3]);
	u16 palette = AllocSpritePalette(gSpriteTemplate_837F5B0[a3].paletteTag);
	if (!a2) {
		LoadCompressedPalette(species_and_otid_get_pal(a1, a8, a7), (palette << 4) + 0x100, 0x20);
		LoadSpecialPokePic(
			&gMonFrontPicTable[a1],
			gMonFrontPicCoords[a1].coords,
			gMonFrontPicCoords[a1].y_offset,
			0x2000000,
			(void *)0x2000000,
			a1,
			a7,
			1
		);
	} else {
		LoadCompressedPalette(
			species_and_otid_get_pal(a1, a8, a7), (palette << 4) + 0x100, 0x20);
		LoadSpecialPokePic(
			&gMonBackPicTable[a1],
			gMonBackPicCoords[a1].coords,
			gMonBackPicCoords[a1].y_offset,
			0x2000000,
			(void *)0x2000000,
			a1,
			a7,
			0
		);
	}

	src = (void *)0x2000000;
	dest = (void *)(0x6010000 + (sheet << 5));
	size = 0x800;
	DmaCopy32(3, src, dest, size);

	if (!a2) {
		sprite = CreateSprite(&gSpriteTemplate_837F5B0[a3], a4, a5 + gMonFrontPicCoords[a1].y_offset, a6);
	} else {
		sprite = CreateSprite(&gSpriteTemplate_837F5B0[a3], a4, a5 + gMonBackPicCoords[a1].y_offset, a6);
	}
	if (sub_8076BE0()) {
		gSprites[sprite].affineAnims = &gSpriteAffineAnimTable_81E7C18;
		StartSpriteAffineAnim(&gSprites[sprite], 0);
	}
	return sprite;
}

void sub_807A0F4(struct Sprite *sprite) {
	DestroySpriteAndFreeResources(sprite);
}

int sub_807A100(u8 a1, u8 a2) {
	u16 species;
	u32 personality;
	u16 letter;
	u16 var;
	int ret;
	const struct MonCoords *coords;
	struct Struct_unk_2017800 *unk;
	if (sub_8076BE0()) {
		if (unk_2019348.field_4 & 1) {
			species = unk_2019348.field_2;
			personality = unk_2019348.field_10;
		} else {
			species = unk_2019348.field_0;
			personality = unk_2019348.field_8;
		}
		if (species == SPECIES_UNOWN) {
			letter = (((personality & 0x03000000) >> 24) << 6
			        | ((personality & 0x00030000) >> 16) << 4
			        | ((personality & 0x00000300) >> 8) << 2
			        | ((personality & 0x00000003) >> 0) << 0
			) % 28;
			if (!letter) {
				var = SPECIES_UNOWN;
			} else {
				var = letter + SPECIES_UNOWN_B - 1;
			}
			coords = &gMonBackPicCoords[var];
		} else if (species == SPECIES_CASTFORM) {
			coords = &gUnknownCastformCoords_0837F598[gUnknown_02024E84[a1]];
		} else if (species <= SPECIES_EGG) {
			coords = &gMonBackPicCoords[species];
		} else {
			coords = &gMonBackPicCoords[0];
		}
	} else {
		if (!battle_side_get_owner(a1)) {
			unk = &unk_2017800[a1];
			if (!unk->field_2) {
				species = GetMonData(&gPlayerParty[gUnknown_02024A6A[a1]], MON_DATA_SPECIES);
				personality = GetMonData(&gPlayerParty[gUnknown_02024A6A[a1]], MON_DATA_PERSONALITY);
			} else {
				species = unk->field_2;
				personality = gUnknown_02024E70[a1];
			}
			if (species == SPECIES_UNOWN) {
				letter = (((personality & 0x03000000) >> 24) << 6
					| ((personality & 0x00030000) >> 16) << 4
					| ((personality & 0x00000300) >> 8) << 2
					| ((personality & 0x00000003) >> 0) << 0
				) % 28;
				if (!letter) {
					var = SPECIES_UNOWN;
				} else {
					var = letter + SPECIES_UNOWN_B - 1;
				}
				coords = &gMonBackPicCoords[var];
			} else if (species > SPECIES_EGG) {
				coords = &gMonBackPicCoords[0];
			} else {
				coords = &gMonBackPicCoords[species];
			}
		} else {
			unk = &unk_2017800[a1];
			if (!unk->field_2) {
				species = GetMonData(&gEnemyParty[gUnknown_02024A6A[a1]], MON_DATA_SPECIES);
				personality = GetMonData(&gEnemyParty[gUnknown_02024A6A[a1]], MON_DATA_PERSONALITY);
			} else {
				species = unk->field_2;
				personality = gUnknown_02024E70[a1];
			}
			if (species == SPECIES_UNOWN) {
				letter = (((personality & 0x03000000) >> 24) << 6
					| ((personality & 0x00030000) >> 16) << 4
					| ((personality & 0x00000300) >> 8) << 2
					| ((personality & 0x00000003) >> 0) << 0
				) % 28;
				if (!letter) {
					var = SPECIES_UNOWN;
				} else {
					var = letter + SPECIES_UNOWN_B - 1;
				}
				coords = &gMonFrontPicCoords[var];
			} else if (species == SPECIES_CASTFORM) {
				coords = &gUnknownCastformCoords_0837F598[gUnknown_02024E84[a1]];
			} else if (species > SPECIES_EGG) {
				coords = &gMonFrontPicCoords[0];
			} else {
				coords = &gMonFrontPicCoords[species];
			}
		}
	}

	switch (a2) {
	case 0:
		return (coords->coords & 0xf) * 8;
	case 1:
		return (coords->coords >> 4) * 8;
	case 4:
		return sub_8077ABC(a1, 2) - ((coords->coords >> 4) * 4);
	case 5:
		return sub_8077ABC(a1, 2) + ((coords->coords >> 4) * 4);
	case 2:
		return sub_8077ABC(a1, 3) - ((coords->coords & 0xf) * 4);
	case 3:
		return sub_8077ABC(a1, 3) + ((coords->coords & 0xf) * 4);
	case 6:
		ret = sub_8077ABC(a1, 1) + 0x1f;
		return ret - coords->y_offset;
	default:
		return 0;
	}
}

void sub_807A3FC(u8 a1, u8 a2, s16 *a3, s16 *a4) {
	u8 v1, v2;
	s16 v3, v4;
	s16 v5, v6;
	if (!a2) {
		v1 = 0;
		v2 = 1;
	} else {
		v1 = 2;
		v2 = 3;
	}
	v3 = sub_8077ABC(a1, v1);
	v4 = sub_8077ABC(a1, v2);
	if (IsDoubleBattle() && !sub_8076BE0()) {
		v5 = sub_8077ABC(a1 ^ 2, v1);
		v6 = sub_8077ABC(a1 ^ 2, v2);
	} else {
		v5 = v3;
		v6 = v4;
	}
	*a3 = (v3 + v5) / 2;
	*a4 = (v4 + v6) / 2;
}

extern u8 CreateInvisibleSpriteWithCallback(void (*callback)(struct Sprite *));

u8 sub_807A4A0(int a1, u8 sprite, int a3) {
	u8 new_sprite = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
	gSprites[new_sprite] = gSprites[sprite];
	gSprites[new_sprite].usingSheet = TRUE;
	gSprites[new_sprite].oam.priority = 0;
	gSprites[new_sprite].oam.objMode = 2;
	gSprites[new_sprite].oam.tileNum = gSprites[sprite].oam.tileNum;
	gSprites[new_sprite].callback = SpriteCallbackDummy;
	return new_sprite;
}

void sub_807A544(struct Sprite *sprite) {
	sub_8078650(sprite);
	if (battle_side_get_owner(gUnknown_0202F7C8)) {
		sprite->pos1.x -= gBattleAnimArgs[0];
		gBattleAnimArgs[3] = -gBattleAnimArgs[3];
		sprite->hFlip = TRUE;
	} else {
		sprite->pos1.x += gBattleAnimArgs[0];
	}
	sprite->pos1.y += gBattleAnimArgs[1];
	sprite->data0 = gBattleAnimArgs[2];
	sprite->data1 = gBattleAnimArgs[3];
	sprite->data3 = gBattleAnimArgs[4];
	sprite->data5 = gBattleAnimArgs[5];
	oamt_set_x3A_32(sprite, move_anim_8074EE0);
	sprite->callback = sub_8078504;
}

void sub_807A5C4(struct Sprite *sprite) {
	if (battle_side_get_owner(gUnknown_0202F7C8)) {
		sprite->pos1.x -= gBattleAnimArgs[0];
		gBattleAnimArgs[3] *= -1;
	} else {
		sprite->pos1.x += gBattleAnimArgs[0];
	}
	sprite->pos1.y += gBattleAnimArgs[1];
	sprite->data0 = gBattleAnimArgs[2];
	sprite->data1 = gBattleAnimArgs[3];
	sprite->data3 = gBattleAnimArgs[4];
	sprite->data5 = gBattleAnimArgs[5];
	StartSpriteAnim(sprite, gBattleAnimArgs[6]);
	oamt_set_x3A_32(sprite, move_anim_8074EE0);
	sprite->callback = sub_8078504;
}

void sub_807A63C(struct Sprite *sprite) {
	sub_8078650(sprite);
	if (battle_side_get_owner(gUnknown_0202F7C8)) {
		sprite->pos1.x -= gBattleAnimArgs[0];
	} else {
		sprite->pos1.x += gBattleAnimArgs[0];
	}
	sprite->pos1.y += gBattleAnimArgs[1];
	sprite->callback = sub_8078600;
	oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_807A784(u8 taskId);

void sub_807A69C(u8 taskId) {
	u16 src;
	u16 dest;
	struct Task *task = &gTasks[taskId];
	task->data[0] = obj_id_for_side_relative_to_move(0);
	task->data[1] = (battle_side_get_owner(gUnknown_0202F7C8)) ? -8 : 8;
	task->data[2] = 0;
	task->data[3] = 0;
	gSprites[task->data[0]].pos2.x -= task->data[0];
	task->data[4] = AllocSpritePalette(10097);
	task->data[5] = 0;

	dest = ((task->data[4] + 0x10) << 20) >> 16;
	src = (gSprites[task->data[0]].oam.paletteNum + 0x10) << 4;
	task->data[6] = sub_8079E90(gUnknown_0202F7C8);
	if (task->data[6] == 20 || task->data[6] == 40) {
		task->data[6] = 2;
	} else {
		task->data[6] = 3;
	}
	CpuCopy32(&gPlttBufferUnfaded[src], &gPlttBufferFaded[dest], 0x20);
	BlendPalette(dest, 0x10, gBattleAnimArgs[1], gBattleAnimArgs[0]);
	task->func = sub_807A784;
}

void sub_807A850(struct Task *task, u8 taskId);

void sub_807A784(u8 taskId) {
	struct Task *task = &gTasks[taskId];
	switch (task->data[2]) {
	case 0:
		sub_807A850(task, taskId);
		gSprites[task->data[0]].pos2.x += task->data[1];
		if (++task->data[3] == 5) {
			task->data[3]--;
			task->data[2]++;
		}
		break;
	case 1:
		sub_807A850(task, taskId);
		gSprites[task->data[0]].pos2.x -= task->data[1];
		if (--task->data[3] == 0) {
			gSprites[task->data[0]].pos2.x = 0;
			task->data[2]++;
		}
		break;
	case 2:
		if (!task->data[5]) {
			FreeSpritePaletteByTag(10097);
			move_anim_task_del(taskId);
		}
		break;
	}
}

void sub_807A8D4(struct Sprite *sprite);

void sub_807A850(struct Task *task, u8 taskId) {
	s16 sprite = duplicate_obj_of_side_rel2move_in_transparent_mode(0);
	if (sprite >= 0) {
		gSprites[sprite].oam.priority = task->data[6];
		gSprites[sprite].oam.paletteNum = task->data[4];
		gSprites[sprite].data0 = 8;
		gSprites[sprite].data1 = taskId;
		gSprites[sprite].data2 = sprite;
		gSprites[sprite].pos2.x = gSprites[task->data[0]].pos2.x;
		gSprites[sprite].callback = sub_807A8D4;
		task->data[5]++;
	}
}

void sub_807A8D4(struct Sprite *sprite) {
	if (--sprite->data0 == 0) {
		gTasks[sprite->data1].data[5]--;
		obj_delete_but_dont_free_vram(sprite);
	}
}

void sub_807A960(struct Sprite *sprite);

void sub_807A908(struct Sprite *sprite) {
	sprite->pos1.x = sub_8077ABC(gUnknown_0202F7C8, 2);
	sprite->pos1.y = sub_8077ABC(gUnknown_0202F7C8, 3);
	if (!battle_side_get_owner(gUnknown_0202F7C8)) {
		sprite->data0 = 5;
	} else {
		sprite->data0 = -10;
	}
	sprite->data1 = -40;
	sprite->callback = sub_807A960;
}

void sub_807A960(struct Sprite *sprite) {
	sprite->data2 += sprite->data0;
	sprite->data3 += sprite->data1;
	sprite->pos2.x = sprite->data2 / 10;
	sprite->pos2.y = sprite->data3 / 10;
	if (sprite->data1 < -20) {
		sprite->data1++;
	}
	if ((sprite->pos1.y + sprite->pos2.y) < -32) {
		move_anim_8072740(sprite);
	}
}

void sub_807A9BC(struct Sprite *sprite) {
	int x;
	sprite->data0 = gBattleAnimArgs[2];
	sprite->data2 = sprite->pos1.x + gBattleAnimArgs[4];
	sprite->data4 = sprite->pos1.y + gBattleAnimArgs[5];
	if (!battle_side_get_owner(gUnknown_0202F7C9)) {
		x = (u16)gBattleAnimArgs[4] + 30;
		sprite->pos1.x += x;
		sprite->pos1.y = gBattleAnimArgs[5] - 20;
	} else {
		x = (u16)gBattleAnimArgs[4] - 30;
		sprite->pos1.x += x;
		sprite->pos1.y = gBattleAnimArgs[5] - 80;
	}
	sprite->callback = sub_8078B34;
	oamt_set_x3A_32(sprite, move_anim_8072740);
}
