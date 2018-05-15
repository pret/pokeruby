#include "global.h"
#include "pokemon.h"
#include "strings2.h"
#include "constants/species.h"
#include "orre_met_location_strings.h"

u8* DetermineOrreMetLocation(struct Pokemon *);
u8* GetOrreMetLocationString(struct Pokemon *);
u8* ResolveOrreMetLocationCollision(struct Pokemon *);


u8* DetermineOrreMetLocation(struct Pokemon *mon)
{
	u8 *stringToUse;
	u8 locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);
	if(locationMet == 76 || locationMet == 109 || locationMet == 110 || locationMet == 111 || locationMet == 67 || locationMet == 69 || locationMet == 0 || locationMet == 254)
	{
		stringToUse = ResolveOrreMetLocationCollision(mon);
	}
	else
	{
		stringToUse = GetOrreMetLocationString(mon);
	}
	return (u8 *)stringToUse;
}

u8* GetOrreMetLocationString(struct Pokemon *mon)
{
	u8 locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);
	const u8 *locationString;
	switch (locationMet)
	{
			//valid Colosseum locations
			case 39: //only valid Agate Village location
				locationString = Agate_Village;
				break;
			case 125: //only valid Deep Colosseum location
				locationString = Deep_Colosseum;
				break;
			case 68: //only valid Laboratory location
				locationString = Laboratory;
				break;
			case 5: //only valid Mayor's House location
				locationString = Mayors_House;
				break;
			case 30: //only valid Miror's Hideout location, Remoraid and Mantine 2nd chance here or Pyrite Cave?
				locationString = Mirors_Hideout;
				break;
			case 1: //only valid Outskirt Stand location
				locationString = Outskirt_Stand;
				break;
			case 3: //only normally valid Phenac City location
			case 128: //eReader Pokemon are from here in Phenac City
				locationString = Phenac_City;
				break;
			case 25:
			case 28: //only valid Pyrite Building locations
				locationString = Pyrite_Bldg;
				break;
			case 29:
			case 31:
			case 32: //only valid Pyrite Cave locations
				locationString = Pyrite_Cave;
				break;
			case 15: //only valid Pyrite Town location
				locationString = Pyrite_Town;
				break;
			case 115:
			case 117: //valid Realgam Tower locations; see below comment
				locationString = Realgam_Tower;
				break;
			case 104:
			case 106: //Do these three display as Realgam Tower instead in game?
			case 113: //only valid RealgamTwr Dome locations
				locationString = RealgamTwr_Dome;
				break;
			case 132:
			case 133:
			case 134: //only valid Snagem Hideout locations
				locationString = Snagem_Hideout;
				break;
			case 47:
			case 55: //only valid The Under locations
				locationString = The_Under;
				break;
			case 58: //only valid The Under Subway location
				locationString = The_Under_Subway;
				break;
			case 118: //only valid Tower Colosseum location
				locationString = Tower_Colosseum;
				break;
			//valid XD locations
			case 92: //only valid Cave Poke Spot location
				locationString = Cave;
				break;
			case 64:
			case 65:
			case 66:
			case 70:
			case 71: //only valid Cipher Key Lair locations
				locationString = Cipher_Key_Lair;
				break;
			case 8:
			case 9:
			case 10:
			case 11: //only valid Cipher Lab locations
				locationString = Cipher_Lab;
				break;
			case 73:
			case 74:
			case 75:
			case 77:
			case 80:
			case 81:
			case 84:
			case 85:
			case 87:
			case 88: //only valid Citadark Isle locations
				locationString = Citadark_Isle;
				break;
			case 153:
			case 162: //only valid Gateon Port locations
				locationString = Gateon_Port;
				break;
			case 16: //only valid Mt. Battle location; gift Johto Starters
				locationString = Mt_Battle;
				break;
			case 91: //only valid Oasis Poke Spot location
				locationString = Oasis;
				break;
			case 164: //only valid Outskirt Stand location
				locationString = Outskirt_Stand;
				break;
			case 94:
			case 96:
			case 97:
			case 100:
			case 107: //only valid Phenac City locations
				locationString = Phenac_City;
				break;
			case 143: //only valid Pokemon HQ Lab location
				locationString = Pokemon_HQ_Lab;
				break;
			case 116:
			case 119: //only valid Pyrite Town locations
				locationString = Pyrite_Town;
				break;
			case 59: //only valid Realgam Tower location
				locationString = Realgam_Tower;
				break;
			case 90: //only valid Rock Poke Spot location
				locationString = Rock;
				break;
			default: //if any other location index is present, use generic distant land text.
				locationString = gOtherText_MetDistantLand;
				break;
	}
	return (u8 *)locationString;
}

u8* ResolveOrreMetLocationCollision(struct Pokemon *mon)
{
	u16 species;
	u8 locationMet;
	const u8 *locationString;
	locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);
	species = GetMonData(mon, MON_DATA_SPECIES);
	switch (locationMet)
	{
		case 67:
		case 69: //Colosseum: Laboratory; XD: Cipher Key Lair
			if(species == SPECIES_PRIMEAPE || species == SPECIES_HYPNO || species == SPECIES_TANGELA || species == SPECIES_BUTTERFREE || species == SPECIES_MAGNETON)
				locationString = Cipher_Key_Lair;
			else
				locationString = Laboratory;
			break;
		case 76: //Colosseum: Mt. Battle; XD: Citadark Isle
			if(species == SPECIES_ENTEI)
				locationString = Mt_Battle;
			else
				locationString = Citadark_Isle;
			break;
		case 109:
		case 110:
		case 111: //Colosseum: RealgamTwr Dome; XD: Pyrite Town
			if(species == SPECIES_SUNFLORA || species == SPECIES_DELIBIRD || species == SPECIES_SUICUNE || species == SPECIES_HERACROSS)
				locationString = RealgamTwr_Dome;
			else
				locationString = Pyrite_Town;
			break;
		case 0: //XD Starter Eevee
			if((species >= SPECIES_EEVEE && species <= SPECIES_FLAREON) || species == SPECIES_ESPEON || species == SPECIES_UMBREON)
				locationString = XD_Eevee_Met_Location;
			break;
		case 254: //Colosseum Starter Espeon and Umbreon and Duking's Plusle
			if(species == SPECIES_ESPEON || species == SPECIES_UMBREON)
				locationString = Colosseum_Starter_Met_Location;
			else
				locationString = Dukings_Plusle;
			break;
		default: //error handler; default to generic distant land text
			locationString = gOtherText_MetDistantLand;
			break;
	}
	return (u8 *)locationString;
}
