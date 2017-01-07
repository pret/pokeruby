#include "global.h"
#include "pokemon.h"
#include "string_util.h"

u8 *pokemon_get_nick(struct Pokemon *mon, u8 *dest){
	s8 nickname[POKEMON_NAME_LENGTH * 2];

	GetMonData(mon, MON_DATA_NICKNAME, nickname);
	return StringCopy10(dest, nickname);
}

u8 *pokemon_get_nick_(struct BoxPokemon *mon, u8 *dest){
	s8 nickname[POKEMON_NAME_LENGTH * 2];

	GetBoxMonData(mon, MON_DATA_NICKNAME, nickname);
	return StringCopy10(dest, nickname);
}

u8 daycare_count_pokemon(void *mon){
	u32 loop_counter;
	u32 r5;

	r5 = 0;
	loop_counter = 0;

	while(loop_counter <= 1){
		if(GetBoxMonData(mon + loop_counter * 80, MON_DATA_SPECIES) != 0){
			r5 = ((r5 + 1) << 24) >> 24;
		}

		loop_counter = ((loop_counter + 1) << 24) >> 24;
	}

	return r5;
}

/*__attribute__((naked))
void daycare_count_pokemon(){
	asm(".syntax unified\n\
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_080412F8:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r6, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08041310
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08041310:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _080412F8
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.syntax divided\n");
}*/
