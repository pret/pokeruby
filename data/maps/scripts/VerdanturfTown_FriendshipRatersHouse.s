VerdanturfTown_FriendshipRatersHouse_MapScripts:: @ 815402F
	.byte 0

VerdanturfTown_FriendshipRatersHouse_EventScript_154030:: @ 8154030
	lock
	faceplayer
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178A9C
	callstd 4
	specialval RESULT, 230
	switch RESULT
	case 0, VerdanturfTown_FriendshipRatersHouse_EventScript_154093
	case 1, VerdanturfTown_FriendshipRatersHouse_EventScript_15409D
	case 2, VerdanturfTown_FriendshipRatersHouse_EventScript_1540A7
	case 3, VerdanturfTown_FriendshipRatersHouse_EventScript_1540B1
	case 4, VerdanturfTown_FriendshipRatersHouse_EventScript_1540BB
	case 5, VerdanturfTown_FriendshipRatersHouse_EventScript_1540C5
	case 6, VerdanturfTown_FriendshipRatersHouse_EventScript_1540CF
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_154093:: @ 8154093
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178C90
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_15409D:: @ 815409D
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178C39
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540A7:: @ 81540A7
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178BFA
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540B1:: @ 81540B1
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178BC4
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540BB:: @ 81540BB
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178B82
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540C5:: @ 81540C5
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178B43
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540CF:: @ 81540CF
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178AF2
	callstd 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540D9:: @ 81540D9
	lock
	faceplayer
	checksound
	pokecry SPECIES_PIKACHU, 0
	loadptr 0, VerdanturfTown_FriendshipRatersHouse_Text_178CFD
	callstd 4
	waitpokecry
	release
	end

