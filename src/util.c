#include "global.h"
#include "sprite.h"

extern const struct SpriteTemplate gInvisibleSpriteTemplate;
extern const u8 gSpriteDimensions[3][4][2];
extern const u16 gCrc16Table[];

u8 CreateInvisibleSpriteWithCallback(void (*callback)(struct Sprite *)) {
	u8 sprite = CreateSprite(&gInvisibleSpriteTemplate, 248, 168, 14);
	gSprites[sprite].invisible = TRUE;
	gSprites[sprite].callback = callback;
	return sprite;
}

void StoreWordInTwoHalfwords(u16 *h, u32 w) {
	h[0] = (u16)(w);
	h[1] = (u16)(w >> 16);
}

void LoadWordFromTwoHalfwords(u16 *h, u32 *w) {
	*w = h[0] | (s16)h[1] << 16;
}

void SetBgAffineStruct(struct BgAffineSrcData *src, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha) {
	src->texX = texX;
	src->texY = texY;
	src->scrX = scrX;
	src->scrY = scrY;
	src->sx = sx;
	src->sy = sy;
	src->alpha = alpha;
}

void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha) {
	struct BgAffineSrcData src;
	SetBgAffineStruct(
		&src,
		texX, texY,
		scrX, scrY,
		sx, sy,
		alpha
	);
	BgAffineSet(&src, dest, 1);
}

#ifdef NONMATCHING

// Functionally equivalent.
// Only the two yflip loops don't match.
void CopySpriteTiles(u8 shape, u8 size, u8 *tiles, u16 *tilemap, u8 *output) {
	u8 x, y;
	s8 i, j;
	u8 xflip[32];
	u8 h = gSpriteDimensions[shape][size][1];
	u8 w = gSpriteDimensions[shape][size][0];
	for (y = 0; y < h; y++) {
		int filler = 32 - w;
		for (x = 0; x < w; x++) {
			int tile = (*tilemap & 0x3ff) * 32;
			int attr = *tilemap & 0xc00;
			if (attr == 0) {
				void *src = tiles + tile;
				void *dest = output;
				int length = 32;
				DmaCopy32(3, src, dest, length);
			} else if (attr == 0x800) { // yflip
				for (i = 0; i < 8; i++) {
					void *src = tiles;
					void *dest = output;
					int length = 4;
					// this is likely wrong, but makes it closer to matching
					src += tile + (7 - i) * 4;
					dest += i * 4;
					DmaCopy32(3, src, dest, length);
				}
			} else { // xflip
				for (i = 0; i < 8; i++) {
					for (j = 0; j < 4; j++) {
						u8 i2 = i * 4;
						xflip[i2 + (3-j)] = (tiles[tile + i2 + j] & 0xf) << 4;
						xflip[i2 + (3-j)] |= tiles[tile + i2 + j] >> 4;
					}
				}
				if (*tilemap & 0x800) { // yflip
					for (i = 0; i < 8; i++) {
						void *src = xflip + (7-i) * 4;
						void *dest = output + i*4;
						int length = 4;
						DmaCopy32(3, src, dest, length);
					}
				} else {
					void *src = xflip;
					void *dest = output;
					int length = 32;
					DmaCopy32(3, src, dest, length);
				}
			}
			tilemap++;
			output += 32;
		}
		tilemap += filler;
	}
}

#else

__attribute__((naked)) void CopySpriteTiles(u8 shape, u8 size, u8 *tiles, u16 *tilemap, u8 *output) {
	asm("\n"
	"	.syntax unified\n"
	"	push {r4-r7,lr}\n"
	"	mov r7, r10\n"
	"	mov r6, r9\n"
	"	mov r5, r8\n"
	"	push {r5-r7}\n"
	"	sub sp, 0x3C\n"
	"	str r2, [sp, 0x20]\n"
	"	adds r4, r3, 0\n"
	"	ldr r7, [sp, 0x5C]\n"
	"	lsls r0, 24\n"
	"	lsls r1, 24\n"
	"	ldr r2, _08041008 @ =gSpriteDimensions\n"
	"	lsrs r1, 23\n"
	"	lsrs r0, 21\n"
	"	adds r1, r0\n"
	"	adds r0, r2, 0x1\n"
	"	adds r0, r1, r0\n"
	"	ldrb r0, [r0]\n"
	"	str r0, [sp, 0x24]\n"
	"	adds r1, r2\n"
	"	ldrb r1, [r1]\n"
	"	str r1, [sp, 0x28]\n"
	"	movs r1, 0\n"
	"	cmp r1, r0\n"
	"	bcc _08040FB4\n"
	"	b _08041136\n"
	"_08040FB4:\n"
	"	movs r0, 0x20\n"
	"	ldr r2, [sp, 0x28]\n"
	"	subs r0, r2\n"
	"	lsls r0, 1\n"
	"	str r0, [sp, 0x2C]\n"
	"_08040FBE:\n"
	"	movs r2, 0\n"
	"	adds r1, 0x1\n"
	"	str r1, [sp, 0x34]\n"
	"	ldr r3, [sp, 0x28]\n"
	"	cmp r2, r3\n"
	"	bcc _08040FCC\n"
	"	b _08041124\n"
	"_08040FCC:\n"
	"	ldr r0, _0804100C @ =0x040000d4\n"
	"	mov r8, r0\n"
	"_08040FD0:\n"
	"	ldrh r1, [r4]\n"
	"	ldr r0, _08041010 @ =0x000003ff\n"
	"	ands r0, r1\n"
	"	lsls r0, 5\n"
	"	mov r12, r0\n"
	"	movs r0, 0xC0\n"
	"	lsls r0, 4\n"
	"	ands r0, r1\n"
	"	mov r3, sp\n"
	"	strh r1, [r3, 0x38]\n"
	"	cmp r0, 0\n"
	"	bne _08041018\n"
	"	ldr r0, [sp, 0x20]\n"
	"	add r0, r12\n"
	"	mov r1, r8\n"
	"	str r0, [r1]\n"
	"	str r7, [r1, 0x4]\n"
	"	ldr r3, _08041014 @ =0x84000008\n"
	"	str r3, [r1, 0x8]\n"
	"	ldr r0, [r1, 0x8]\n"
	"	adds r4, 0x2\n"
	"	str r4, [sp, 0x30]\n"
	"	adds r7, 0x20\n"
	"	mov r10, r7\n"
	"	adds r2, 0x1\n"
	"	mov r9, r2\n"
	"	b _08041112\n"
	"	.align 2, 0\n"
	"_08041008: .4byte gSpriteDimensions\n"
	"_0804100C: .4byte 0x040000d4\n"
	"_08041010: .4byte 0x000003ff\n"
	"_08041014: .4byte 0x84000008\n"
	"_08041018:\n"
	"	movs r1, 0x80\n"
	"	lsls r1, 4\n"
	"	cmp r0, r1\n"
	"	bne _08041068\n"
	"	movs r3, 0\n"
	"	adds r4, 0x2\n"
	"	str r4, [sp, 0x30]\n"
	"	movs r0, 0x20\n"
	"	adds r0, r7\n"
	"	mov r10, r0\n"
	"	adds r2, 0x1\n"
	"	mov r9, r2\n"
	"	ldr r4, _08041060 @ =0x040000d4\n"
	"	ldr r6, _08041064 @ =0x84000001\n"
	"	movs r5, 0x7\n"
	"_08041036:\n"
	"	lsls r2, r3, 24\n"
	"	asrs r2, 24\n"
	"	subs r0, r5, r2\n"
	"	lsls r0, 2\n"
	"	add r0, r12\n"
	"	ldr r1, [sp, 0x20]\n"
	"	adds r0, r1, r0\n"
	"	lsls r1, r2, 2\n"
	"	adds r1, r7, r1\n"
	"	str r0, [r4]\n"
	"	str r1, [r4, 0x4]\n"
	"	str r6, [r4, 0x8]\n"
	"	ldr r0, [r4, 0x8]\n"
	"	adds r2, 0x1\n"
	"	lsls r2, 24\n"
	"	lsrs r3, r2, 24\n"
	"	asrs r2, 24\n"
	"	cmp r2, 0x7\n"
	"	ble _08041036\n"
	"	b _08041112\n"
	"	.align 2, 0\n"
	"_08041060: .4byte 0x040000d4\n"
	"_08041064: .4byte 0x84000001\n"
	"_08041068:\n"
	"	movs r3, 0\n"
	"	adds r4, 0x2\n"
	"	str r4, [sp, 0x30]\n"
	"	movs r0, 0x20\n"
	"	adds r0, r7\n"
	"	mov r10, r0\n"
	"	adds r2, 0x1\n"
	"	mov r9, r2\n"
	"_08041078:\n"
	"	movs r2, 0\n"
	"	lsls r4, r3, 24\n"
	"	lsls r0, r4, 2\n"
	"	lsrs r0, 24\n"
	"	adds r6, r0, 0x3\n"
	"	mov r1, r12\n"
	"	adds r5, r1, r0\n"
	"_08041086:\n"
	"	lsls r1, r2, 24\n"
	"	asrs r1, 24\n"
	"	subs r0, r6, r1\n"
	"	mov r2, sp\n"
	"	adds r3, r2, r0\n"
	"	adds r0, r5, r1\n"
	"	ldr r2, [sp, 0x20]\n"
	"	adds r0, r2, r0\n"
	"	ldrb r2, [r0]\n"
	"	movs r0, 0xF\n"
	"	ands r0, r2\n"
	"	lsls r0, 4\n"
	"	lsrs r2, 4\n"
	"	orrs r0, r2\n"
	"	strb r0, [r3]\n"
	"	adds r1, 0x1\n"
	"	lsls r1, 24\n"
	"	lsrs r2, r1, 24\n"
	"	asrs r1, 24\n"
	"	cmp r1, 0x3\n"
	"	ble _08041086\n"
	"	movs r3, 0x80\n"
	"	lsls r3, 17\n"
	"	adds r0, r4, r3\n"
	"	lsrs r3, r0, 24\n"
	"	asrs r0, 24\n"
	"	cmp r0, 0x7\n"
	"	ble _08041078\n"
	"	movs r0, 0x80\n"
	"	lsls r0, 4\n"
	"	mov r1, sp\n"
	"	ldrh r1, [r1, 0x38]\n"
	"	ands r0, r1\n"
	"	cmp r0, 0\n"
	"	beq _08041104\n"
	"	movs r3, 0\n"
	"	ldr r4, _080410FC @ =0x040000d4\n"
	"	ldr r6, _08041100 @ =0x84000001\n"
	"	movs r5, 0x7\n"
	"_080410D4:\n"
	"	lsls r1, r3, 24\n"
	"	asrs r1, 24\n"
	"	subs r0, r5, r1\n"
	"	lsls r0, 2\n"
	"	mov r3, sp\n"
	"	adds r2, r3, r0\n"
	"	lsls r0, r1, 2\n"
	"	adds r0, r7, r0\n"
	"	str r2, [r4]\n"
	"	str r0, [r4, 0x4]\n"
	"	str r6, [r4, 0x8]\n"
	"	ldr r0, [r4, 0x8]\n"
	"	adds r1, 0x1\n"
	"	lsls r1, 24\n"
	"	lsrs r3, r1, 24\n"
	"	asrs r1, 24\n"
	"	cmp r1, 0x7\n"
	"	ble _080410D4\n"
	"	b _08041112\n"
	"	.align 2, 0\n"
	"_080410FC: .4byte 0x040000d4\n"
	"_08041100: .4byte 0x84000001\n"
	"_08041104:\n"
	"	mov r0, sp\n"
	"	mov r1, r8\n"
	"	str r0, [r1]\n"
	"	str r7, [r1, 0x4]\n"
	"	ldr r2, _08041148 @ =0x84000008\n"
	"	str r2, [r1, 0x8]\n"
	"	ldr r0, [r1, 0x8]\n"
	"_08041112:\n"
	"	ldr r4, [sp, 0x30]\n"
	"	mov r7, r10\n"
	"	mov r3, r9\n"
	"	lsls r0, r3, 24\n"
	"	lsrs r2, r0, 24\n"
	"	ldr r0, [sp, 0x28]\n"
	"	cmp r2, r0\n"
	"	bcs _08041124\n"
	"	b _08040FD0\n"
	"_08041124:\n"
	"	ldr r1, [sp, 0x2C]\n"
	"	adds r4, r1\n"
	"	ldr r2, [sp, 0x34]\n"
	"	lsls r0, r2, 24\n"
	"	lsrs r1, r0, 24\n"
	"	ldr r3, [sp, 0x24]\n"
	"	cmp r1, r3\n"
	"	bcs _08041136\n"
	"	b _08040FBE\n"
	"_08041136:\n"
	"	add sp, 0x3C\n"
	"	pop {r3-r5}\n"
	"	mov r8, r3\n"
	"	mov r9, r4\n"
	"	mov r10, r5\n"
	"	pop {r4-r7}\n"
	"	pop {r0}\n"
	"	bx r0\n"
	"	.align 2, 0\n"
	"_08041148: .4byte 0x84000008\n"
	"	.syntax divided\n"
	);
}

#endif

int CountTrailingZeroBits(u32 value) {
	u8 i;
	for (i = 0; i < 32; i++) {
		if ((value & 1) == 0) {
			value >>= 1;
		} else {
			return i;
		}
	}
	return 0;
}

u16 CalcCRC16(u8 *data, int length) {
	u16 i, j;
	u16 crc = 0x1121;
	for (i = 0; i < length; i++) {
		crc ^= data[i];
		for (j = 0; j < 8; j++) {
			if (crc & 1) {
				crc = (crc >> 1) ^ 0x8408;
			} else {
				crc >>= 1;
			}
		}
	}
	return ~crc;
}

u16 CalcCRC16WithTable(u8 *data, int length) {
	u16 i;
	u16 crc = 0x1121;
	u8 byte;
	for (i = 0; i < length; i++) {
		byte = crc >> 8;
		crc ^= data[i];
		crc = byte ^ gCrc16Table[(u8)crc];
	}
	return ~crc;
}
