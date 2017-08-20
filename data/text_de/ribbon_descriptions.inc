gRibbonDescriptionPart1_Champion:
	.string "BAND für unschlagbare$"

gRibbonDescriptionPart2_Champion:
	.string "RUHMESHALLE-Mitglieder$"

gRibbonDescriptionPart1_CoolContest:
	.string "COOLNESS-WETTBEWERB$"

gRibbonDescriptionPart1_BeautyContest:
	.string "SCHÖNHEITSWETTBEWERB$"

gRibbonDescriptionPart1_CuteContest:
	.string "ANMUT-WETTBEWERB$"

gRibbonDescriptionPart1_SmartContest:
	.string "KLUGHEITSWETTBEWERB$"

gRibbonDescriptionPart1_ToughContest:
	.string "STÄRKE-WETTBEWERB$"

gRibbonDescriptionPart2_NormalRank:
	.string "Sieger in Normal-Klasse!$"

gRibbonDescriptionPart2_SuperRank:
	.string "Sieger in Super-Klasse!$"

gRibbonDescriptionPart2_HyperRank:
	.string "Sieger in Hyper-Klasse!$"

gRibbonDescriptionPart2_MasterRank:
	.string "Sieger in Master-Klasse!$"

gRibbonDescriptionPart1_Winning:
	.string "BAND für Lv. 50-Erfolg$"

gRibbonDescriptionPart2_Winning:
	.string "im DUELLTURM.$"

gRibbonDescriptionPart1_Victory:
	.string "Für Erfolg in Lv. 100$"

gRibbonDescriptionPart2_Victory:
	.string "im DUELLTURM.$"

gRibbonDescriptionPart1_Artist:
	.string "Band für auserwählte$"

gRibbonDescriptionPart2_Artist:
	.string "Porträt-Modelle.$"

gRibbonDescriptionPart1_Effort:
	.string "BAND für$"

gRibbonDescriptionPart2_Effort:
	.string "fleißige Arbeiter.$"

	.align 2
gRibbonDescriptions:: @ 83E113C
	.4byte gRibbonDescriptionPart1_Champion,      gRibbonDescriptionPart2_Champion
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_Winning,       gRibbonDescriptionPart2_Winning
	.4byte gRibbonDescriptionPart1_Victory,       gRibbonDescriptionPart2_Victory
	.4byte gRibbonDescriptionPart1_Artist,        gRibbonDescriptionPart2_Artist
	.4byte gRibbonDescriptionPart1_Effort,        gRibbonDescriptionPart2_Effort
