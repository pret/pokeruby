#include "global.h"
#include "pokemon.h"
#include "string_util.h"
#include "asm.h"

u8 *pokemon_get_nick(struct Pokemon *mon, u8 *dest)
{
	s8 nickname[POKEMON_NAME_LENGTH * 2];

	GetMonData(mon, MON_DATA_NICKNAME, nickname);
	return StringCopy10(dest, nickname);
}

u8 *pokemon_get_nick_(struct BoxPokemon *mon, u8 *dest)
{
	s8 nickname[POKEMON_NAME_LENGTH * 2];

	GetBoxMonData(mon, MON_DATA_NICKNAME, nickname);
	return StringCopy10(dest, nickname);
}

u8 daycare_count_pokemon(struct BoxPokemon *daycare_data)
{
	u8 i, count;
	count = 0;

	for(i = 0;i <= 1;i++) {
		if(GetBoxMonData(daycare_data + i, MON_DATA_SPECIES) != 0) {
			count++;
		}
	}

	return count;
}

__attribute__((naked))
void sub_8041324(struct BoxPokemon * box_pokemon, void * void_pointer){
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	mov r9, r0\n\
	mov r10, r1\n\
	movs r7, 0\n\
	movs r5, 0\n\
	mov r6, r10\n\
	adds r6, 0x74\n\
	movs r0, 0x1\n\
	mov r8, r0\n\
_0804133E:\n\
	lsls r0, r5, 2\n\
	adds r0, r5\n\
	lsls r0, 4\n\
	mov r1, r9\n\
	adds r4, r1, r0\n\
	adds r0, r4, 0\n\
	movs r1, 0xB\n\
	bl GetBoxMonData\n\
	cmp r0, 0\n\
	beq _0804136E\n\
	adds r0, r7, 0x1\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	adds r0, r4, 0\n\
	movs r1, 0xC\n\
	bl GetBoxMonData\n\
	adds r1, r0, 0\n\
	cmp r1, 0\n\
	bne _0804136E\n\
	lsls r0, r5, 1\n\
	adds r0, r6, r0\n\
	b _08041374\n\
_0804136E:\n\
	lsls r0, r5, 1\n\
	adds r0, r6, r0\n\
	mov r1, r8\n\
_08041374:\n\
	strh r1, [r0]\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0x1\n\
	bls _0804133E\n\
	mov r0, r10\n\
	str r7, [r0, 0x70]\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided\n");
}

s8 daycare_empty_slot(struct BoxPokemon * daycare_data){
	u8 i;

	for(i = 0;i <= 1;i++){
		if(GetBoxMonData(daycare_data + i, MON_DATA_SPECIES) == 0){
			return i;
		}
	}

	return -1;
}
