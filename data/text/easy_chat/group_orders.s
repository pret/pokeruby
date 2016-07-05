	.include "data/text/easy_chat/groups/pokemon/order.s"
	.include "data/text/easy_chat/groups/trainer/order.s"
	.include "data/text/easy_chat/groups/status/order.s"
	.include "data/text/easy_chat/groups/battle/order.s"
	.include "data/text/easy_chat/groups/greetings/order.s"
	.include "data/text/easy_chat/groups/people/order.s"
	.include "data/text/easy_chat/groups/voices/order.s"
	.include "data/text/easy_chat/groups/speech/order.s"
	.include "data/text/easy_chat/groups/endings/order.s"
	.include "data/text/easy_chat/groups/feelings/order.s"
	.include "data/text/easy_chat/groups/conditions/order.s"
	.include "data/text/easy_chat/groups/actions/order.s"
	.include "data/text/easy_chat/groups/lifestyle/order.s"
	.include "data/text/easy_chat/groups/hobbies/order.s"
	.include "data/text/easy_chat/groups/time/order.s"
	.include "data/text/easy_chat/groups/misc/order.s"
	.include "data/text/easy_chat/groups/adjectives/order.s"
	.include "data/text/easy_chat/groups/events/order.s"
	.include "data/text/easy_chat/groups/move_1/order.s"
	.include "data/text/easy_chat/groups/move_2/order.s"
	.include "data/text/easy_chat/groups/trendy_saying/order.s"
	.include "data/text/easy_chat/groups/pokemon_2/order.s"

@ This table is used to find the alphabetical order of each group of words
@ when listing them. The words must be reordered because they are stored in
@ Japanese order so that their meaning is preserved when they are transferred
@ between different language editions of the games.
	.align 2
gEasyChatGroupOrders:: @ 83DFE14
	.4byte gEasyChatGroupOrder_Pokemon
	.4byte gEasyChatGroupOrder_Trainer
	.4byte gEasyChatGroupOrder_Status
	.4byte gEasyChatGroupOrder_Battle
	.4byte gEasyChatGroupOrder_Greetings
	.4byte gEasyChatGroupOrder_People
	.4byte gEasyChatGroupOrder_Voices
	.4byte gEasyChatGroupOrder_Speech
	.4byte gEasyChatGroupOrder_Endings
	.4byte gEasyChatGroupOrder_Feelings
	.4byte gEasyChatGroupOrder_Conditions
	.4byte gEasyChatGroupOrder_Actions
	.4byte gEasyChatGroupOrder_Lifestyle
	.4byte gEasyChatGroupOrder_Hobbies
	.4byte gEasyChatGroupOrder_Time
	.4byte gEasyChatGroupOrder_Misc
	.4byte gEasyChatGroupOrder_Adjectives
	.4byte gEasyChatGroupOrder_Events
	.4byte gEasyChatGroupOrder_Move1
	.4byte gEasyChatGroupOrder_Move2
	.4byte gEasyChatGroupOrder_TrendySaying
	.4byte gEasyChatGroupOrder_Pokemon2
