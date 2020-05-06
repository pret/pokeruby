Common_EventScript_SetGymTrainers:: @ 81A01C0
	switch VAR_0x8008
	case 1, RusboroCity_Gym_SetGymTrainers
	case 2, DewfordTown_Gym_SetGymTrainers
	case 3, MauvilleCity_Gym_SetGymTrainers
	case 4, LavaridgeTown_Gym_SetGymTrainers
	case 5, PetalburgCity_Gym_SetGymTrainers
	case 6, FortreeCity_Gym_SetGymTrainers
	case 7, MossdeepCity_Gym_SetGymTrainers
	case 8, SootopolisCity_Gym_SetGymTrainers
	end

RusboroCity_Gym_SetGymTrainers:: @ 81A021E
	settrainerflag TRAINER_JOSH
	settrainerflag TRAINER_TOMMY
	return

DewfordTown_Gym_SetGymTrainers:: @ 81A0225
	settrainerflag TRAINER_HIDEKI
	settrainerflag TRAINER_TESSA
	settrainerflag TRAINER_LAURA
	return

MauvilleCity_Gym_SetGymTrainers:: @ 81A022F
	settrainerflag TRAINER_KIRK
	settrainerflag TRAINER_SHAWN
	settrainerflag TRAINER_BEN
	settrainerflag TRAINER_VIVIAN
	return

LavaridgeTown_Gym_SetGymTrainers:: @ 81A023C
	settrainerflag TRAINER_COLE
	settrainerflag TRAINER_AXLE
	settrainerflag TRAINER_ANDY
	settrainerflag TRAINER_ZANE
	settrainerflag TRAINER_SADIE
	return

PetalburgCity_Gym_SetGymTrainers:: @ 81A024C
	settrainerflag TRAINER_RANDALL
	settrainerflag TRAINER_PARKER
	settrainerflag TRAINER_GEORGE
	settrainerflag TRAINER_BERKE
	settrainerflag TRAINER_MARY
	settrainerflag TRAINER_LORI
	settrainerflag TRAINER_JODY
	return

FortreeCity_Gym_SetGymTrainers:: @ 81A0262
	settrainerflag TRAINER_JARED
	settrainerflag TRAINER_TERRELL
	settrainerflag TRAINER_KYLEE
	settrainerflag TRAINER_WILL
	return

MossdeepCity_Gym_SetGymTrainers:: @ 81A026F
	settrainerflag TRAINER_PRESTON
	settrainerflag TRAINER_VIRGIL
	settrainerflag TRAINER_FRITZ
	settrainerflag TRAINER_HANNAH
	settrainerflag TRAINER_SAMANTHA
	settrainerflag TRAINER_MAURA
	return

SootopolisCity_Gym_SetGymTrainers:: @ 81A0282
	settrainerflag TRAINER_ANDREA
	settrainerflag TRAINER_CRISSY
	settrainerflag TRAINER_BRIANNA_2
	settrainerflag TRAINER_CONNIE
	settrainerflag TRAINER_BRIDGET
	settrainerflag TRAINER_OLIVIA
	settrainerflag TRAINER_TIFFANY
	settrainerflag TRAINER_MARISSA
	return
