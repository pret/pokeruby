VerdanturfTown_FriendshipRatersHouse_MapScripts:: @ 815402F
	.byte 0

VerdanturfTown_FriendshipRatersHouse_EventScript_154030:: @ 8154030
	lock
	faceplayer
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178A9C, 4
	specialvar RESULT, GetLeadMonFriendshipScore
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
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178C90, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_15409D:: @ 815409D
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178C39, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540A7:: @ 81540A7
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178BFA, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540B1:: @ 81540B1
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178BC4, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540BB:: @ 81540BB
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178B82, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540C5:: @ 81540C5
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178B43, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540CF:: @ 81540CF
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178AF2, 4
	release
	end

VerdanturfTown_FriendshipRatersHouse_EventScript_1540D9:: @ 81540D9
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIKACHU, 0
	msgbox VerdanturfTown_FriendshipRatersHouse_Text_178CFD, 4
	waitmoncry
	release
	end
