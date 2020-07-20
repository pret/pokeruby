@ Seems this was superseded by the Record Center, and the below scripts are now unused
EventScript_MixRecordsPrompt: @ 819FFD5
	lock
	faceplayer
	msgbox UnusedMixRecordsPromptText, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_MixRecords
	compare VAR_RESULT, NO
	goto_if_eq EventScript_EndMixRecords
	goto EventScript_EndMixRecords
	
EventScript_MixRecords: @ 819FFFA
	special RecordMixingPlayerSpotTriggered
	waitstate
	lock
	faceplayer
EventScript_EndMixRecords: @ 81A0000
	message UnusedMixRecordsSeeYouAgainText
	waitmessage
	waitbuttonpress
	release
	end
