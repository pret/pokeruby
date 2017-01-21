#include "global.h"
#include "pokemon.h"
#include "string_util.h"
#include "asm.h"

extern u8 gUnknown_03005CE0;

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
void sub_8041324(struct BoxPokemon * box_pokemon, void * void_pointer)
{
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

s8 daycare_empty_slot(struct BoxPokemon * daycare_data)
{
	u8 i;

	for(i = 0;i <= 1;i++){
	if(GetBoxMonData(daycare_data + i, MON_DATA_SPECIES) == 0){
	return i;
	}
	}

	return -1;
}

/*void sub_80413C8(struct Pokemon * mon, struct BoxPokemon * daycare_data){ // unfinished
	s8 empty_slot;

	empty_slot = daycare_empty_slot(daycare_data);
	if(sub_80A2B94(mon) != 0){ // if the mon holds a mail?
		u8 empty_slot_times_56 = empty_slot * 56;
		u8 * something2 = ((u8 *) (daycare_data + 2)) + empty_slot_times_56 + 36;
		StringCopy(something2, gSaveBlock2);
		PadNameString(something2, 0xFC);
		something2 += 8;
		pokemon_get_nick(mon, something2);
		u8 pokerus = GetMonData(mon, MON_DATA_64);
		something1 += (u8 * daycare_data)
}*/

__attribute__((naked))
void sub_80413C8()
{
	// strange stack usage - happens because THUMB ARM only allows R0-R7 to be pushed/popped:
	//    all registers in reglist must be Lo registers, except that PUSH can include the LR, and POP can include the PC
	//    the ldm/stm section probably copies some struct, but I'm not sure how the code would look
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	adds r7, r0, 0\n\
	mov r8, r1\n\
	mov r0, r8\n\
	bl daycare_empty_slot\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	mov r9, r4\n\
	adds r0, r7, 0\n\
	bl sub_80A2B94\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _0804144A\n\
	lsls r0, r4, 24\n\
	asrs r0, 24\n\
	lsls r4, r0, 3\n\
	subs r4, r0\n\
	lsls r4, 3\n\
	adds r5, r4, 0\n\
	adds r5, 0xA0\n\
	add r5, r8\n\
	adds r6, r5, 0\n\
	adds r6, 0x24\n\
	ldr r1, _08041490 @ =gSaveBlock2\n\
	adds r0, r6, 0\n\
	bl StringCopy\n\
	adds r0, r6, 0\n\
	movs r1, 0xFC\n\
	bl PadNameString\n\
	adds r6, 0x8\n\
	adds r0, r7, 0\n\
	adds r1, r6, 0\n\
	bl pokemon_get_nick\n\
	adds r0, r7, 0\n\
	movs r1, 0x40\n\
	bl GetMonData\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	add r4, r8\n\
	ldr r2, _08041494 @ =gSaveBlock1\n\
	lsls r1, r0, 3\n\
	adds r1, r0\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	adds r4, 0xA0\n\
	ldr r0, _08041498 @ =0x00002b4c\n\
	adds r1, r0\n\
	ldm r1!, {r0,r2,r3}\n\
	stm r4!, {r0,r2,r3}\n\
	ldm r1!, {r0,r2,r3}\n\
	stm r4!, {r0,r2,r3}\n\
	ldm r1!, {r0,r2,r3}\n\
	stm r4!, {r0,r2,r3}\n\
	adds r0, r7, 0\n\
	bl sub_80A2DF8\n\
_0804144A:\n\
	mov r2, r9\n\
	lsls r4, r2, 24\n\
	asrs r4, 24\n\
	lsls r5, r4, 2\n\
	adds r4, r5, r4\n\
	lsls r4, 4\n\
	add r4, r8\n\
	adds r0, r4, 0\n\
	adds r1, r7, 0\n\
	movs r2, 0x50\n\
	bl memcpy\n\
	adds r0, r4, 0\n\
	bl pokemon_restore_pp\n\
	movs r0, 0x88\n\
	lsls r0, 1\n\
	add r0, r8\n\
	adds r0, r5\n\
	movs r1, 0\n\
	str r1, [r0]\n\
	adds r0, r7, 0\n\
	bl ZeroMonData\n\
	bl party_compaction\n\
	bl CalculatePlayerPartyCount\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08041490: .4byte gSaveBlock2\n\
_08041494: .4byte gSaveBlock1\n\
_08041498: .4byte 0x00002b4c\n\
	.syntax divided\n");
}

void daycare_send()
{
	sub_80413C8(gPlayerParty + gUnknown_03005CE0, gSaveBlock1.filler_2F9C);
}

void sub_80417F4(u8 *);

void sub_80414C0(struct BoxPokemon * daycare_data)
{
	u32 second_species;
	if((GetBoxMonData(daycare_data + 1, MON_DATA_SPECIES) != 0) && ((second_species = GetBoxMonData(daycare_data, MON_DATA_SPECIES)) == 0)){
		memcpy(daycare_data, daycare_data + 1, 80);
		ZeroBoxMonData(daycare_data + 1);
		memcpy(daycare_data + 2, (u8 *) (daycare_data + 1) + 0x88, 0x38);
		*((u32 *)(daycare_data) + 68) = *((u32 *)(daycare_data) + 69);
		*((u32 *)(daycare_data) + 69) = second_species;
		sub_80417F4((u8 *) (daycare_data + 1) + 0x88);
	}
}

u8 TryIncrementMonLevel(struct Pokemon *);
extern u16 word_2024E82;

void sub_804151C(struct Pokemon * mon)
{
	u32 i;
	u8 r6;
	u16 temp;
	u16 minus1;
	i = 0;
	minus1 = 0xffff;

	while(i <= 100){
		if(TryIncrementMonLevel(mon) == 0) goto end;
		r6 = 1;
		i++;
		while((temp = sub_803B7C8(mon, r6)) != 0){
			r6 = 0;
			if(temp == minus1){
				DeleteFirstMoveAndGiveMoveToMon(mon, word_2024E82);
			}
		}
	}
	end:

	CalculateMonStats(mon);
}

#ifdef NEVERDEFINED
sub_804151C: @ 804151C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldr r7, _08041538 @ =0x0000ffff
_08041524:				<-----------------------------------+
	adds r0, r4, 0											|
	bl TryIncrementMonLevel									|
	lsls r0, 24												|
	cmp r0, 0												|
	beq _08041560			break	----------------+		|
	movs r6, 0x1									|		|
	adds r5, 0x1									|		|
	b _0804154C							--------+	|		|
	.align 2, 0									|	|		|
_08041538: .4byte 0x0000ffff					|	|		|
_0804153C:				<-----------------------+---+---+	|
	movs r6, 0									|	|	|	|
	cmp r0, r7									|	|	|	|
	bne _0804154C	--------------------------->|	|	|	|
	ldr r0, _0804156C @ =word_2024E82			|	|	|	|
	ldrh r1, [r0]								|	|	|	|
	adds r0, r4, 0								|	|	|	|
	bl DeleteFirstMoveAndGiveMoveToMon			|	|	|	|
_0804154C:								<-------+	|	|	|
	adds r0, r4, 0									|	|	|
	adds r1, r6, 0									|	|	|
	bl sub_803B7C8									|	|	|
	lsls r0, 16										|	|	|
	lsrs r0, 16										|	|	|
	cmp r0, 0										|	|	|
	bne _0804153C	--------------------------------+---+	|
	cmp r5, 0x63									|		|
	ble _08041524	--------------------------------+-------+
_08041560:								<-----------+
	adds r0, r4, 0
	bl CalculateMonStats
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804156C: .4byte word_2024E82
#endif
