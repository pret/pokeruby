#include "global.h"
#include "pokemon.h"
#include "string_util.h"

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
