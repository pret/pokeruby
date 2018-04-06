const struct Trainer gTrainers[] = {
    [OPPONENT_NONE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_1,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 0,
        .party = NULL
    },

    [OPPONENT_ARCHIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_ARCHIE,
        .trainerName = _("ADRIAN"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Archie1
    },

    [OPPONENT_GRUNT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt1
    },

    [OPPONENT_GRUNT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Grunt2
    },

    [OPPONENT_GRUNT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt3
    },

    [OPPONENT_GRUNT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt4
    },

    [OPPONENT_GRUNT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt5
    },

    [OPPONENT_GRUNT_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt6
    },

    [OPPONENT_GRUNT_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt7
    },

    [OPPONENT_GRUNT_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt8
    },

    [OPPONENT_GRUNT_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt9
    },

    [OPPONENT_GRUNT_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt10
    },

    [OPPONENT_GRUNT_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt11
    },

    [OPPONENT_GRUNT_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt12
    },

    [OPPONENT_GRUNT_13] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt13
    },

    [OPPONENT_GRUNT_14] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt14
    },

    [OPPONENT_GRUNT_15] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt15
    },

    [OPPONENT_GRUNT_16] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt16
    },

    [OPPONENT_GRUNT_17] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt17
    },

    [OPPONENT_GRUNT_18] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt18
    },

    [OPPONENT_GRUNT_19] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt19
    },

    [OPPONENT_GRUNT_20] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt20
    },

    [OPPONENT_GRUNT_21] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt21
    },

    [OPPONENT_GRUNT_22] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt22
    },

    [OPPONENT_GRUNT_23] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt23
    },

    [OPPONENT_GRUNT_24] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt24
    },

    [OPPONENT_GRUNT_25] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_F,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt25
    },

    [OPPONENT_GRUNT_26] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_F,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt26
    },

    [OPPONENT_GRUNT_27] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_F,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt27
    },

    [OPPONENT_ANONYMOUS_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Anonymous1
    },

    [OPPONENT_MATT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_M,
        .trainerName = _("WOLFGANG"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Matt1
    },

    [OPPONENT_MATT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_M,
        .trainerName = _("WOLFGANG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = gTrainerParty_Matt2
    },

    [OPPONENT_SHELLY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_F,
        .trainerName = _("KORDULA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelly1
    },

    [OPPONENT_SHELLY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_F,
        .trainerName = _("KORDULA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelly2
    },

    [OPPONENT_ARCHIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_ARCHIE,
        .trainerName = _("ADRIAN"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Archie2
    },

    [OPPONENT_ARCHIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_ARCHIE,
        .trainerName = _("ADRIAN"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Archie3
    },

    [OPPONENT_DAISY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("MARGARETE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Daisy
    },

    [OPPONENT_ROSE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSEMARIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Rose1
    },

    [OPPONENT_LILY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("LILLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lily
    },

    [OPPONENT_VIOLET] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ERIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Violet
    },

    [OPPONENT_ROSE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSEMARIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Rose2
    },

    [OPPONENT_ROSE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSEMARIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Rose3
    },

    [OPPONENT_ROSE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSEMARIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Rose4
    },

    [OPPONENT_ROSE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSEMARIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Rose5
    },

    [OPPONENT_DUSTY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RÜDIGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dusty1
    },

    [OPPONENT_CHIP] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RUPRECHT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Chip
    },

    [OPPONENT_FOSTER] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RUBEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Foster
    },

    [OPPONENT_DUSTY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RÜDIGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dusty2
    },

    [OPPONENT_DUSTY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RÜDIGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dusty3
    },

    [OPPONENT_DUSTY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RÜDIGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dusty4
    },

    [OPPONENT_DUSTY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("RÜDIGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dusty5
    },

    [OPPONENT_GABBY_AND_TY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("PIA & UDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GabbyAndTy1
    },

    [OPPONENT_GABBY_AND_TY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("PIA & UDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GabbyAndTy2
    },

    [OPPONENT_GABBY_AND_TY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("PIA & UDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GabbyAndTy3
    },

    [OPPONENT_GABBY_AND_TY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("PIA & UDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GabbyAndTy4
    },

    [OPPONENT_GABBY_AND_TY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("PIA & UDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GabbyAndTy5
    },

    [OPPONENT_GABBY_AND_TY_6] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("PIA & UDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GabbyAndTy6
    },

    [OPPONENT_LOLA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lola1
    },

    [OPPONENT_CARMEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("CARMEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Carmen
    },

    [OPPONENT_GWEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("HILDE "),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Gwen
    },

    [OPPONENT_LOLA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lola2
    },

    [OPPONENT_LOLA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lola3
    },

    [OPPONENT_LOLA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lola4
    },

    [OPPONENT_LOLA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lola5
    },

    [OPPONENT_RICKY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("GÜNTHER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ricky1
    },

    [OPPONENT_SIMON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("SIMON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Simon
    },

    [OPPONENT_CHARLIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("HILMAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Charlie
    },

    [OPPONENT_RICKY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("GÜNTHER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ricky2
    },

    [OPPONENT_RICKY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("GÜNTHER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ricky3
    },

    [OPPONENT_RICKY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("GÜNTHER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ricky4
    },

    [OPPONENT_RICKY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("GÜNTHER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ricky5
    },

    [OPPONENT_RANDALL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("HUBERT"),
        .items = {ITEM_X_SPEED, ITEM_X_SPEED, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Randall
    },

    [OPPONENT_PARKER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PATRICK"),
        .items = {ITEM_GUARD_SPEC, ITEM_GUARD_SPEC, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Parker
    },

    [OPPONENT_GEORGE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("NILS"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_George
    },

    [OPPONENT_BERKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("CHRISTIAN"),
        .items = {ITEM_DIRE_HIT, ITEM_DIRE_HIT, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Berke
    },

    [OPPONENT_CLYDE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("OSKAR"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Clyde
    },

    [OPPONENT_VINCENT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("OTFRIED"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Vincent
    },

    [OPPONENT_LEROY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("OTMAR"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Leroy
    },

    [OPPONENT_WILTON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PASCAL"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Wilton1
    },

    [OPPONENT_EDGAR] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("EDGAR"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Edgar
    },

    [OPPONENT_ALBERT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PABLO"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Albert
    },

    [OPPONENT_SAMUEL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("RICHARD"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Samuel
    },

    [OPPONENT_VITO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PAUL"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_Vito
    },

    [OPPONENT_OWEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("RAIMUND"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Owen
    },

    [OPPONENT_WILTON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PASCAL"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Wilton2
    },

    [OPPONENT_WILTON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PASCAL"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Wilton3
    },

    [OPPONENT_WILTON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PASCAL"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Wilton4
    },

    [OPPONENT_WILTON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PASCAL"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Wilton5
    },

    [OPPONENT_WARREN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("MARKUS"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Warren
    },

    [OPPONENT_MARY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("YVONNE"),
        .items = {ITEM_X_ACCURACY, ITEM_X_ACCURACY, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Mary
    },

    [OPPONENT_LORI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("RAMONA"),
        .items = {ITEM_X_DEFEND, ITEM_X_DEFEND, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Lori
    },

    [OPPONENT_JODY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("ROSWITA"),
        .items = {ITEM_X_ATTACK, ITEM_X_ATTACK, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = gTrainerParty_Jody
    },

    [OPPONENT_WENDY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("VIOLA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = gTrainerParty_Wendy
    },

    [OPPONENT_ELAINE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("FRAUKE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_Elaine
    },

    [OPPONENT_BROOKE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("VERONIKA"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brooke1
    },

    [OPPONENT_JENNIFER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("MARIANNE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Jennifer
    },

    [OPPONENT_HOPE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("TRUDLINDE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Hope
    },

    [OPPONENT_SHANNON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("THERESA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Shannon
    },

    [OPPONENT_MICHELLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("MICHELLE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Michelle
    },

    [OPPONENT_CAROLINE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("KAROLINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Caroline
    },

    [OPPONENT_JULIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("MICHAELA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Julie
    },

    [OPPONENT_BROOKE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("VERONIKA"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brooke2
    },

    [OPPONENT_BROOKE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("VERONIKA"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brooke3
    },

    [OPPONENT_BROOKE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("VERONIKA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brooke4
    },

    [OPPONENT_BROOKE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("VERONIKA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brooke5
    },

    [OPPONENT_PATRICIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("WALBURGA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Patricia
    },

    [OPPONENT_KINDRA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("GUNDULA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Kindra
    },

    [OPPONENT_TAMMY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("BRUNHILDE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tammy
    },

    [OPPONENT_VALERIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TABITHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Valerie1
    },

    [OPPONENT_TASHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("PANDORA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tasha
    },

    [OPPONENT_VALERIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TABITHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Valerie2
    },

    [OPPONENT_VALERIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TABITHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Valerie3
    },

    [OPPONENT_VALERIE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TABITHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Valerie4
    },

    [OPPONENT_VALERIE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TABITHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Valerie5
    },

    [OPPONENT_CINDY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("PATRIZIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cindy1
    },

    [OPPONENT_ANONYMOUS_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _(""),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous2
    },

    [OPPONENT_BRIANNA_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("NATASCHA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Brianna1
    },

    [OPPONENT_CINDY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("PATRIZIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cindy2
    },

    [OPPONENT_BRIANNA_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("NATASCHA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Brianna2
    },

    [OPPONENT_ANETTE] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("ANETTE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anette
    },

    [OPPONENT_CINDY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("PATRIZIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cindy3
    },

    [OPPONENT_CINDY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("PATRIZIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cindy4
    },

    [OPPONENT_CINDY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("PATRIZIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cindy5
    },

    [OPPONENT_CINDY_6] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("PATRIZIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cindy6
    },

    [OPPONENT_MELISSA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("MELISSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Melissa
    },

    [OPPONENT_SHEILA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("SYLVIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Sheila
    },

    [OPPONENT_SHIRLEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("MIRJAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Shirley
    },

    [OPPONENT_JESSICA_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("GERMAINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jessica1
    },

    [OPPONENT_CONNIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("FRANCESCA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Connie
    },

    [OPPONENT_BRIDGET] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("SALMA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Bridget
    },

    [OPPONENT_OLIVIA] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("TIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Olivia
    },

    [OPPONENT_TIFFANY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("DANIELA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Tiffany
    },

    [OPPONENT_JESSICA_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("GERMAINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jessica2
    },

    [OPPONENT_JESSICA_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("GERMAINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jessica3
    },

    [OPPONENT_JESSICA_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("GERMAINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jessica4
    },

    [OPPONENT_JESSICA_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("GERMAINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jessica5
    },

    [OPPONENT_WINSTON_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("RENE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Winston1
    },

    [OPPONENT_ANONYMOUS_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _(""),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous3
    },

    [OPPONENT_GARRET] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("KAI"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Garret
    },

    [OPPONENT_WINSTON_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("RENE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Winston2
    },

    [OPPONENT_WINSTON_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("RENE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Winston3
    },

    [OPPONENT_WINSTON_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("RENE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Winston4
    },

    [OPPONENT_WINSTON_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("RENE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Winston5
    },

    [OPPONENT_STEVE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("HIRO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Steve1
    },

    [OPPONENT_CHRIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("CHRIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Chris
    },

    [OPPONENT_MARK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("MARK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Mark
    },

    [OPPONENT_KENN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("KLAUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Kenn
    },

    [OPPONENT_STEVE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("HIRO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Steve2
    },

    [OPPONENT_STEVE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("HIRO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Steve3
    },

    [OPPONENT_STEVE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("HIRO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Steve4
    },

    [OPPONENT_STEVE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("HIRO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Steve5
    },

    [OPPONENT_LUIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KONSTANTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Luis
    },

    [OPPONENT_AUSTIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("GUIDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Austin
    },

    [OPPONENT_DOUGLAS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("IGNAZ"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Douglas
    },

    [OPPONENT_DARRIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("MANUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Darrin
    },

    [OPPONENT_TONY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Tony1
    },

    [OPPONENT_JEROME] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("OSWALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jerome
    },

    [OPPONENT_MATTHEW] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("UMBERTO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Matthew
    },

    [OPPONENT_DAVID] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("WINFRIED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_David
    },

    [OPPONENT_SPENCER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("LEOPOLD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Spencer
    },

    [OPPONENT_ROLAND] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("THOMAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Roland
    },

    [OPPONENT_CODY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("TIMO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cody
    },

    [OPPONENT_STAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("BALTHASAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Stan
    },

    [OPPONENT_BARRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("BASIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Barry
    },

    [OPPONENT_DEAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DAGOBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dean
    },

    [OPPONENT_RODNEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DIETER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Rodney
    },

    [OPPONENT_RICHARD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("ENNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Richard
    },

    [OPPONENT_HERMAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("BENNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Herman
    },

    [OPPONENT_ANONYMOUS_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous4
    },

    [OPPONENT_GILBERT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("ERICH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Gilbert
    },

    [OPPONENT_FRANKLIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KASPER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Franklin
    },

    [OPPONENT_DANNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("MARCEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Danny
    },

    [OPPONENT_JACK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("PEDRO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jack
    },

    [OPPONENT_DUDLEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("THEODOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dudley
    },

    [OPPONENT_CHAD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("JANNIK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Chad
    },

    [OPPONENT_TONY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Tony2
    },

    [OPPONENT_TONY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Tony3
    },

    [OPPONENT_TONY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tony4
    },

    [OPPONENT_TONY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("KEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tony5
    },

    [OPPONENT_HIDEKI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("SATORU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Hideki
    },

    [OPPONENT_HITOSHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("SHIGERU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Hitoshi
    },

    [OPPONENT_KIYO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("YU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Kiyo
    },

    [OPPONENT_KOICHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("JUNICHI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Koichi
    },

    [OPPONENT_NOB_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("MINORU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Nob1
    },

    [OPPONENT_NOB_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("MINORU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Nob2
    },

    [OPPONENT_NOB_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("MINORU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Nob3
    },

    [OPPONENT_NOB_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("MINORU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Nob4
    },

    [OPPONENT_NOB_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("MINORU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Nob5
    },

    [OPPONENT_YUJI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("HIDEO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Yuji
    },

    [OPPONENT_DAISUKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("KENJI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Daisuke
    },

    [OPPONENT_ATSUSHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("HIROSHI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Atsushi
    },

    [OPPONENT_KIRK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("CHUCK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Kirk
    },

    [OPPONENT_SCOTT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("TREY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Scott
    },

    [OPPONENT_HARVEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Harvey
    },

    [OPPONENT_SHAWN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("REINHARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Shawn
    },

    [OPPONENT_RANDY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("JEFF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Randy
    },

    [OPPONENT_DALTON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KIRK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dalton1
    },

    [OPPONENT_DALTON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KIRK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dalton2
    },

    [OPPONENT_DALTON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KIRK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dalton3
    },

    [OPPONENT_DALTON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KIRK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dalton4
    },

    [OPPONENT_DALTON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KIRK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dalton5
    },

    [OPPONENT_COLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HENDRIK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Cole
    },

    [OPPONENT_FLINT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HEINZ"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Flint
    },

    [OPPONENT_AXLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HAGEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Axle
    },

    [OPPONENT_JAKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HANNES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jake
    },

    [OPPONENT_ANDY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HARTMANN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Andy
    },

    [OPPONENT_BERNIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HASSO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Bernie1
    },

    [OPPONENT_BERNIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HASSO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Bernie2
    },

    [OPPONENT_BERNIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HASSO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Bernie3
    },

    [OPPONENT_BERNIE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HASSO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Bernie4
    },

    [OPPONENT_BERNIE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("HASSO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Bernie5
    },

    [OPPONENT_DREW] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("ISSIDOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Drew
    },

    [OPPONENT_CLIFF] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("IVAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Cliff
    },

    [OPPONENT_LARRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("KAREL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Larry
    },

    [OPPONENT_SHANE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("KUNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Shane
    },

    [OPPONENT_JUSTIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("LAURENZ"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Justin
    },

    [OPPONENT_ETHAN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("EWALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Ethan1
    },

    [OPPONENT_JEFF] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("RAPHAEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jeff
    },

    [OPPONENT_TRAVIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("RONALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Travis
    },

    [OPPONENT_ETHAN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("EWALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Ethan2
    },

    [OPPONENT_ETHAN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("EWALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Ethan3
    },

    [OPPONENT_ETHAN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("EWALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ethan4
    },

    [OPPONENT_ETHAN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("EWALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ethan5
    },

    [OPPONENT_BRENT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("ROMEO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Brent
    },

    [OPPONENT_DONALD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("TILL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Donald
    },

    [OPPONENT_TAYLOR] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("URIEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Taylor
    },

    [OPPONENT_BRANDON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRUNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Brandon1
    },

    [OPPONENT_DEREK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BURKARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Derek
    },

    [OPPONENT_BRANDON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRUNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Brandon2
    },

    [OPPONENT_BRANDON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRUNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Brandon3
    },

    [OPPONENT_BRANDON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRUNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Brandon4
    },

    [OPPONENT_BRANDON_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRUNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 5,
        .party = gTrainerParty_Brandon5
    },

    [OPPONENT_EDWARD] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("WENDELIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Edward
    },

    [OPPONENT_PRESTON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("URBAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Preston
    },

    [OPPONENT_VIRGIL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("ZOLTAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Virgil
    },

    [OPPONENT_FRITZ] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("XAVER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Fritz
    },

    [OPPONENT_WILLIAM] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("WULF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_William
    },

    [OPPONENT_JOSHUA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("JONAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Joshua
    },

    [OPPONENT_CAMERON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("MAXIMILIAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cameron1
    },

    [OPPONENT_CAMERON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("MAXIMILIAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cameron2
    },

    [OPPONENT_CAMERON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("MAXIMILIAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cameron3
    },

    [OPPONENT_CAMERON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("MAXIMILIAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cameron4
    },

    [OPPONENT_CAMERON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("MAXIMILIAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cameron5
    },

    [OPPONENT_JACLYN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("COSIMA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jaclyn
    },

    [OPPONENT_HANNAH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("HANNAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Hannah
    },

    [OPPONENT_SAMANTHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("SAMANTHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Samantha
    },

    [OPPONENT_MAURA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("DOLORES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Maura
    },

    [OPPONENT_KAYLA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("CAMILLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Kayla
    },

    [OPPONENT_ALEXIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("ALEXIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Alexis
    },

    [OPPONENT_JACKI_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("KORNELIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jacki1
    },

    [OPPONENT_JACKI_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("KORNELIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jacki2
    },

    [OPPONENT_JACKI_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("KORNELIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jacki3
    },

    [OPPONENT_JACKI_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("KORNELIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jacki4
    },

    [OPPONENT_JACKI_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("KORNELIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jacki5
    },

    [OPPONENT_WALTER_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("ABRAHAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Walter1
    },

    [OPPONENT_TUCKER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("CLAUDIO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tucker
    },

    [OPPONENT_THOMAS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("NIKOLAI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Thomas
    },

    [OPPONENT_WALTER_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("ABRAHAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Walter2
    },

    [OPPONENT_WALTER_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("ABRAHAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Walter3
    },

    [OPPONENT_WALTER_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("ABRAHAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Walter4
    },

    [OPPONENT_WALTER_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("ABRAHAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Walter5
    },

    [OPPONENT_SIDNEY] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_SIDNEY,
        .trainerName = _("ULRICH"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Sidney
    },

    [OPPONENT_PHOEBE] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_PHOEBE,
        .trainerName = _("ANTONIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Phoebe
    },

    [OPPONENT_GLACIA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_GLACIA,
        .trainerName = _("FROSINA"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Glacia
    },

    [OPPONENT_DRAKE] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_DRAKE,
        .trainerName = _("DRAGAN"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Drake
    },

    [OPPONENT_ROXANNE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_ROXANNE,
        .trainerName = _("FELIZIA"),
        .items = {ITEM_POTION, ITEM_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Roxanne
    },

    [OPPONENT_BRAWLY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRAWLY,
        .trainerName = _("KAMILLO"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Brawly
    },

    [OPPONENT_WATTSON] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WATTSON,
        .trainerName = _("WALTER"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Wattson
    },

    [OPPONENT_FLANNERY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_FLANNERY,
        .trainerName = _("FLAVIA"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Flannery
    },

    [OPPONENT_NORMAN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_NORMAN,
        .trainerName = _("NORMAN"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Norman
    },

    [OPPONENT_WINONA] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_WINONA,
        .trainerName = _("WIBKE"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_Winona
    },

    [OPPONENT_TATE_AND_LIZA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_TATE_AND_LIZA,
        .trainerName = _("BEN&SVENJA"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_HYPER_POTION},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_TateAndLiza
    },

    [OPPONENT_WALLACE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLACE,
        .trainerName = _("WASSILI"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Wallace
    },

    [OPPONENT_JERRY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("ORLANDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jerry1
    },

    [OPPONENT_TED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("RAMON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ted
    },

    [OPPONENT_PAUL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("JÜRGEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Paul
    },

    [OPPONENT_JERRY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("ORLANDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jerry2
    },

    [OPPONENT_JERRY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("ORLANDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jerry3
    },

    [OPPONENT_JERRY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("ORLANDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jerry4
    },

    [OPPONENT_JERRY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("ORLANDO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Jerry5
    },

    [OPPONENT_KAREN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KERSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Karen1
    },

    [OPPONENT_GEORGIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("ARIANE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Georgia
    },

    [OPPONENT_KAREN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KERSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Karen2
    },

    [OPPONENT_KAREN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KERSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Karen3
    },

    [OPPONENT_KAREN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KERSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Karen4
    },

    [OPPONENT_KAREN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KERSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Karen5
    },

    [OPPONENT_KATE_AND_JOY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("EVA & UTE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_KateAndJoy
    },

    [OPPONENT_ANNA_AND_MEG_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("IRM & IDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AnnaAndMeg1
    },

    [OPPONENT_ANNA_AND_MEG_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("IRM & IDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AnnaAndMeg2
    },

    [OPPONENT_ANNA_AND_MEG_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("IRM & IDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AnnaAndMeg3
    },

    [OPPONENT_ANNA_AND_MEG_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("IRM & IDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AnnaAndMeg4
    },

    [OPPONENT_ANNA_AND_MEG_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("IRM & IDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AnnaAndMeg5
    },

    [OPPONENT_VICTOR] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("VIKTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Victor
    },

    [OPPONENT_MIGUEL_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Miguel1
    },

    [OPPONENT_COLTON] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("ATTILA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Colton
    },

    [OPPONENT_MIGUEL_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Miguel2
    },

    [OPPONENT_MIGUEL_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Miguel3
    },

    [OPPONENT_MIGUEL_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Miguel4
    },

    [OPPONENT_MIGUEL_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Miguel5
    },

    [OPPONENT_VICTORIA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("VIKTORIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 1,
        .party = gTrainerParty_Victoria
    },

    [OPPONENT_VANESSA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("VANESSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Vanessa
    },

    [OPPONENT_MARISSA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("EVELYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Marissa
    },

    [OPPONENT_ISABEL_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Isabel1
    },

    [OPPONENT_ISABEL_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Isabel2
    },

    [OPPONENT_ISABEL_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Isabel3
    },

    [OPPONENT_ISABEL_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Isabel4
    },

    [OPPONENT_ISABEL_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Isabel5
    },

    [OPPONENT_TIMOTHY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("THEOBALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Timothy1
    },

    [OPPONENT_TIMOTHY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("THEOBALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Timothy2
    },

    [OPPONENT_TIMOTHY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("THEOBALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Timothy3
    },

    [OPPONENT_TIMOTHY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("THEOBALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Timothy4
    },

    [OPPONENT_TIMOTHY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("THEOBALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Timothy5
    },

    [OPPONENT_VICKY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("VICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Vicky
    },

    [OPPONENT_SHELBY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("WALTRAUD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelby1
    },

    [OPPONENT_SHELBY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("WALTRAUD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelby2
    },

    [OPPONENT_SHELBY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("WALTRAUD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelby3
    },

    [OPPONENT_SHELBY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("WALTRAUD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelby4
    },

    [OPPONENT_SHELBY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("WALTRAUD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Shelby5
    },

    [OPPONENT_CALVIN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ANSGAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Calvin1
    },

    [OPPONENT_BILLY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("FRIDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Billy
    },

    [OPPONENT_JOSH] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("GASTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Josh
    },

    [OPPONENT_TOMMY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("DOMINIK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Tommy
    },

    [OPPONENT_JOEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("LUDGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Joey
    },

    [OPPONENT_BEN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("EGON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ben
    },

    [OPPONENT_ANONYMOUS_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Anonymous5
    },

    [OPPONENT_KEVIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("JULIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Kevin
    },

    [OPPONENT_NEAL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("MORITZ"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Neal
    },

    [OPPONENT_DILLON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("SÖNCKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dillon
    },

    [OPPONENT_CALVIN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ANSGAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Calvin2
    },

    [OPPONENT_CALVIN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ANSGAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Calvin3
    },

    [OPPONENT_CALVIN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ANSGAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Calvin4
    },

    [OPPONENT_CALVIN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ANSGAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Calvin5
    },

    [OPPONENT_EDDIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("HENRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Eddie
    },

    [OPPONENT_ALLEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("HUGO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Allen
    },

    [OPPONENT_TIMMY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("FRIEDER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Timmy
    },

    [OPPONENT_STEVEN] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_CHAMPION,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_STEVEN,
        .trainerName = _("TROY"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_FULL_RESTORE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 6,
        .party = gTrainerParty_Steven
    },

    [OPPONENT_ANDREW] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ANSGAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Andrew
    },

    [OPPONENT_IVAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ANGELO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ivan
    },

    [OPPONENT_CLAUDE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ANSELM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Claude
    },

    [OPPONENT_ELLIOT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALOIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Elliot1
    },

    [OPPONENT_NED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ARTHUR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Ned
    },

    [OPPONENT_DALE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALBIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Dale
    },

    [OPPONENT_NOLAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("AMADEUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Nolan
    },

    [OPPONENT_BARNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALBRECHT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Barny
    },

    [OPPONENT_WADE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALAIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Wade
    },

    [OPPONENT_CARTER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ARMIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Carter
    },

    [OPPONENT_ELLIOT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALOIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Elliot2
    },

    [OPPONENT_ELLIOT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALOIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Elliot3
    },

    [OPPONENT_ELLIOT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALOIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Elliot4
    },

    [OPPONENT_ELLIOT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALOIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 4,
        .party = gTrainerParty_Elliot5
    },

    [OPPONENT_RONALD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ACHMED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Ronald
    },

    [OPPONENT_JACOB] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("ROMAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Jacob
    },

    [OPPONENT_ANTHONY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("EMIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Anthony
    },

    [OPPONENT_BENJAMIN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("EGIDIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Benjamin1
    },

    [OPPONENT_BENJAMIN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("EGIDIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Benjamin2
    },

    [OPPONENT_BENJAMIN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("EGIDIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Benjamin3
    },

    [OPPONENT_BENJAMIN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("EGIDIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Benjamin4
    },

    [OPPONENT_BENJAMIN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("EGIDIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Benjamin5
    },

    [OPPONENT_ABIGAIL_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("IRMGARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Abigail1
    },

    [OPPONENT_JASMINE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("MARTHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Jasmine
    },

    [OPPONENT_ABIGAIL_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("IRMGARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Abigail2
    },

    [OPPONENT_ABIGAIL_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("IRMGARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Abigail3
    },

    [OPPONENT_ABIGAIL_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("IRMGARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Abigail4
    },

    [OPPONENT_ABIGAIL_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("IRMGARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Abigail5
    },

    [OPPONENT_DYLAN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("IGOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dylan1
    },

    [OPPONENT_DYLAN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("IGOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dylan2
    },

    [OPPONENT_DYLAN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("IGOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dylan3
    },

    [OPPONENT_DYLAN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("IGOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dylan4
    },

    [OPPONENT_DYLAN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("IGOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dylan5
    },

    [OPPONENT_MARIA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("JUTTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Maria1
    },

    [OPPONENT_MARIA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("JUTTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Maria2
    },

    [OPPONENT_MARIA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("JUTTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Maria3
    },

    [OPPONENT_MARIA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("JUTTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Maria4
    },

    [OPPONENT_MARIA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("JUTTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Maria5
    },

    [OPPONENT_CALEB] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("OLEG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Caleb
    },

    [OPPONENT_ANONYMOUS_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous6
    },

    [OPPONENT_ISAIAH_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("KASPAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Isaiah1
    },

    [OPPONENT_ANONYMOUS_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous7
    },

    [OPPONENT_CHASE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("FERDINAND"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Chase
    },

    [OPPONENT_ISAIAH_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("KASPAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Isaiah2
    },

    [OPPONENT_ISAIAH_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("KASPAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Isaiah3
    },

    [OPPONENT_ISAIAH_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("KASPAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Isaiah4
    },

    [OPPONENT_ISAIAH_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("KASPAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Isaiah5
    },

    [OPPONENT_ANONYMOUS_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Anonymous8
    },

    [OPPONENT_CONNOR] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("MIRA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Connor
    },

    [OPPONENT_ANONYMOUS_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous9
    },

    [OPPONENT_KATELYN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("MECHTHILD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Katelyn1
    },

    [OPPONENT_ALLISON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("LOTTE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Allison
    },

    [OPPONENT_KATELYN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("MECHTHILD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Katelyn2
    },

    [OPPONENT_KATELYN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("MECHTHILD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Katelyn3
    },

    [OPPONENT_KATELYN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("MECHTHILD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Katelyn4
    },

    [OPPONENT_KATELYN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("MECHTHILD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Katelyn5
    },

    [OPPONENT_NICOLAS_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("ALFONS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Nicolas1
    },

    [OPPONENT_NICOLAS_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("ALFONS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Nicolas2
    },

    [OPPONENT_NICOLAS_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("ALFONS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Nicolas3
    },

    [OPPONENT_NICOLAS_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("ALFONS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Nicolas4
    },

    [OPPONENT_NICOLAS_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("ALFONS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Nicolas5
    },

    [OPPONENT_AARON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("EDMUND"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Aaron
    },

    [OPPONENT_PERRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("JOSCHKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Perry
    },

    [OPPONENT_HUGH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ENRICO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Hugh
    },

    [OPPONENT_PHIL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("HENRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Phil
    },

    [OPPONENT_JARED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("HIOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jared
    },

    [OPPONENT_ANONYMOUS_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Anonymous10
    },

    [OPPONENT_TANNER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ANATOL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Tanner
    },

    [OPPONENT_WILL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("BJÖRN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Will
    },

    [OPPONENT_COLIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("WIM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Colin
    },

    [OPPONENT_ROBERT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("FRITJOF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Robert1
    },

    [OPPONENT_BENNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("GENADI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Benny
    },

    [OPPONENT_CHESTER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("VITALI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Chester
    },

    [OPPONENT_ROBERT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("FRITJOF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Robert2
    },

    [OPPONENT_ROBERT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("FRITJOF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Robert3
    },

    [OPPONENT_ROBERT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("FRITJOF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Robert4
    },

    [OPPONENT_ROBERT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("FRITJOF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Robert5
    },

    [OPPONENT_ALEX] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ARNE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Alex
    },

    [OPPONENT_BECK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("VINCENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Beck
    },

    [OPPONENT_YASU] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("VALENTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 1,
        .party = gTrainerParty_Yasu
    },

    [OPPONENT_TAKASHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("EUGEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 3,
        .party = gTrainerParty_Takashi
    },

    [OPPONENT_MAKOTO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("HERIBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 1,
        .party = gTrainerParty_Makoto
    },

    [OPPONENT_HIDEO_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("SAUL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = gTrainerParty_Hideo1
    },

    [OPPONENT_LAO_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("EDUARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = gTrainerParty_Lao1
    },

    [OPPONENT_LUNG] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("ARND"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 2,
        .party = gTrainerParty_Lung
    },

    [OPPONENT_LAO_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("EDUARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = gTrainerParty_Lao2
    },

    [OPPONENT_LAO_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("EDUARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = gTrainerParty_Lao3
    },

    [OPPONENT_LAO_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("EDUARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = gTrainerParty_Lao4
    },

    [OPPONENT_LAO_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("EDUARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = gTrainerParty_Lao5
    },

    [OPPONENT_TESSA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("TAMARA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Tessa
    },

    [OPPONENT_LAURA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("LAURA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Laura
    },

    [OPPONENT_CYNDY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("ELFI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cyndy1
    },

    [OPPONENT_CORA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("THEA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Cora
    },

    [OPPONENT_JILL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("AGNES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jill
    },

    [OPPONENT_CYNDY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("ELFI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cyndy2
    },

    [OPPONENT_CYNDY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("ELFI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cyndy3
    },

    [OPPONENT_CYNDY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("ELFI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cyndy4
    },

    [OPPONENT_CYNDY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("ELFI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Cyndy5
    },

    [OPPONENT_MADELINE_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("SASKIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Madeline1
    },

    [OPPONENT_CLARISSA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("GERDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Clarissa
    },

    [OPPONENT_ANGELICA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("MARIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Angelica
    },

    [OPPONENT_MADELINE_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("SASKIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Madeline2
    },

    [OPPONENT_MADELINE_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("SASKIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Madeline3
    },

    [OPPONENT_MADELINE_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("SASKIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Madeline4
    },

    [OPPONENT_MADELINE_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("SASKIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Madeline5
    },

    [OPPONENT_BEVERLY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DAGMAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Beverly
    },

    [OPPONENT_DAWN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("HEIDRUN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Dawn
    },

    [OPPONENT_NICOLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("NICOLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Nicole
    },

    [OPPONENT_DENISE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DENISE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Denise
    },

    [OPPONENT_BETH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ALMUT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Beth
    },

    [OPPONENT_TARA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("SIEGLINDE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tara
    },

    [OPPONENT_MISSY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MARION"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Missy
    },

    [OPPONENT_ALICE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ALICE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Alice
    },

    [OPPONENT_JENNY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MONIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jenny1
    },

    [OPPONENT_GRACE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ILONA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grace
    },

    [OPPONENT_TANYA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("EMILIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Tanya
    },

    [OPPONENT_SHARON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("GUDRUN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Sharon
    },

    [OPPONENT_NIKKI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ASTRID"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Nikki
    },

    [OPPONENT_BRENDA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("OTTILIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Brenda
    },

    [OPPONENT_KATIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("SENTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Katie
    },

    [OPPONENT_SUSIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("JANKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Susie
    },

    [OPPONENT_KARA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("RENATE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Kara
    },

    [OPPONENT_DANA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("VICKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dana
    },

    [OPPONENT_ERIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("REBECCA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Erin
    },

    [OPPONENT_DEBRA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ANJA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Debra
    },

    [OPPONENT_LINDA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("GISELA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Linda
    },

    [OPPONENT_KAYLEE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("PAOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Kaylee
    },

    [OPPONENT_LAUREL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("BIRTE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Laurel
    },

    [OPPONENT_DARCY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DOROTHEA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Darcy
    },

    [OPPONENT_JENNY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MONIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jenny2
    },

    [OPPONENT_JENNY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MONIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Jenny3
    },

    [OPPONENT_JENNY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MONIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Jenny4
    },

    [OPPONENT_JENNY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MONIKA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Jenny5
    },

    [OPPONENT_HEIDI] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("JANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Heidi
    },

    [OPPONENT_BECKY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("HEIDI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Becky
    },

    [OPPONENT_CAROL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("NATALIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Carol
    },

    [OPPONENT_NANCY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("NANCY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Nancy
    },

    [OPPONENT_MARTHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("MARTHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Martha
    },

    [OPPONENT_DIANA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("GWENDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Diana1
    },

    [OPPONENT_NINA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("NADJA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Nina
    },

    [OPPONENT_IRENE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("IRENE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Irene
    },

    [OPPONENT_DIANA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("GWENDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Diana2
    },

    [OPPONENT_DIANA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("GWENDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Diana3
    },

    [OPPONENT_DIANA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("GWENDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Diana4
    },

    [OPPONENT_DIANA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("GWENDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Diana5
    },

    [OPPONENT_AMY_AND_LIV_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("NORA & JO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AmyAndLiv1
    },

    [OPPONENT_AMY_AND_LIV_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("NORA & JO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AmyAndLiv2
    },

    [OPPONENT_GINA_AND_MIA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("GINA & MIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GinaAndMia1
    },

    [OPPONENT_MIU_AND_YUKI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("LEA & GRIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_MiuAndYuki
    },

    [OPPONENT_AMY_AND_LIV_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("NORA & JO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AmyAndLiv3
    },

    [OPPONENT_GINA_AND_MIA_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("GINA & MIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_GinaAndMia2
    },

    [OPPONENT_AMY_AND_LIV_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("NORA & JO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AmyAndLiv4
    },

    [OPPONENT_AMY_AND_LIV_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("NORA & JO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AmyAndLiv5
    },

    [OPPONENT_AMY_AND_LIV_6] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("NORA & JO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_AmyAndLiv6
    },

    [OPPONENT_HUEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("TASSILO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Huey
    },

    [OPPONENT_EDMOND] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("MONTY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Edmond
    },

    [OPPONENT_ERNEST_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ELERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ernest1
    },

    [OPPONENT_DWAYNE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("RETO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Dwayne
    },

    [OPPONENT_PHILLIP] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("GUNNAR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Phillip
    },

    [OPPONENT_LEONARD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("LEONARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Leonard
    },

    [OPPONENT_DUNCAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("PIERRE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Duncan
    },

    [OPPONENT_ERNEST_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ELERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ernest2
    },

    [OPPONENT_ERNEST_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ELERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ernest3
    },

    [OPPONENT_ERNEST_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ELERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ernest4
    },

    [OPPONENT_ERNEST_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ELERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Ernest5
    },

    [OPPONENT_ANONYMOUS_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Anonymous11
    },

    [OPPONENT_ANONYMOUS_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Anonymous12
    },

    [OPPONENT_ANONYMOUS_13] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Anonymous13
    },

    [OPPONENT_SONNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("WENZEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Sonny
    },

    [OPPONENT_DONOVAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("STANISLAUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Donovan
    },

    [OPPONENT_GERALD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("GERALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Gerald
    },

    [OPPONENT_KELVIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("AARON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Kelvin
    },

    [OPPONENT_KODY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ALBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Kody
    },

    [OPPONENT_TEVIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ANDRE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Tevin
    },

    [OPPONENT_DAMON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("AMON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Damon
    },

    [OPPONENT_PABLO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("PABLO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Pablo
    },

    [OPPONENT_EDWIN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Edwin1
    },

    [OPPONENT_HECTOR_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("HEKTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Hector1
    },

    [OPPONENT_HECTOR_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("HEKTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Hector2
    },

    [OPPONENT_EDWIN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Edwin2
    },

    [OPPONENT_EDWIN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Edwin3
    },

    [OPPONENT_EDWIN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Edwin4
    },

    [OPPONENT_EDWIN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Edwin5
    },

    [OPPONENT_WALLY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("HEIKO"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Wally1
    },

    [OPPONENT_BRENDAN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Brendan1
    },

    [OPPONENT_BRENDAN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brendan2
    },

    [OPPONENT_BRENDAN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brendan3
    },

    [OPPONENT_BRENDAN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = gTrainerParty_Brendan4
    },

    [OPPONENT_BRENDAN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brendan5
    },

    [OPPONENT_BRENDAN_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brendan6
    },

    [OPPONENT_BRENDAN_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Brendan7
    },

    [OPPONENT_BRENDAN_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brendan8
    },

    [OPPONENT_BRENDAN_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Brendan9
    },

    [OPPONENT_MAY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_May1
    },

    [OPPONENT_MAY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_May2
    },

    [OPPONENT_MAY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_May3
    },

    [OPPONENT_MAY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_May4
    },

    [OPPONENT_MAY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_May5
    },

    [OPPONENT_MAY_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_May6
    },

    [OPPONENT_MAY_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_May7
    },

    [OPPONENT_MAY_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_May8
    },

    [OPPONENT_MAY_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_May9
    },

    [OPPONENT_ISAAC_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("BLASIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Isaac1
    },

    [OPPONENT_RILEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("CLIFF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Riley
    },

    [OPPONENT_AIDAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("DARIO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Aidan
    },

    [OPPONENT_ISAAC_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("BLASIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Isaac2
    },

    [OPPONENT_ISAAC_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("BLASIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Isaac3
    },

    [OPPONENT_ISAAC_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("BLASIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Isaac4
    },

    [OPPONENT_ISAAC_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("BLASIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Isaac5
    },

    [OPPONENT_LYDIA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Lydia1
    },

    [OPPONENT_ALEXIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("DORIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Alexia
    },

    [OPPONENT_DANIELLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("DUNJA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Danielle
    },

    [OPPONENT_LYDIA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Lydia2
    },

    [OPPONENT_LYDIA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Lydia3
    },

    [OPPONENT_LYDIA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Lydia4
    },

    [OPPONENT_LYDIA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Lydia5
    },

    [OPPONENT_JACKSON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("ECKBERT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Jackson1
    },

    [OPPONENT_CARLOS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("EDWARD"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Carlos
    },

    [OPPONENT_SEBASTIAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("EILMAR"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Sebastian
    },

    [OPPONENT_JACKSON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("ECKBERT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = gTrainerParty_Jackson2
    },

    [OPPONENT_JACKSON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("ECKBERT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Jackson3
    },

    [OPPONENT_JACKSON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("ECKBERT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = gTrainerParty_Jackson4
    },

    [OPPONENT_JACKSON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("ECKBERT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Jackson5
    },

    [OPPONENT_CATHERINE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("HANNELORE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_Catherine1
    },

    [OPPONENT_JENNA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("INGEBORG"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = gTrainerParty_Jenna
    },

    [OPPONENT_SOPHIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("SOPHIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Sophia
    },

    [OPPONENT_CATHERINE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("HANNELORE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_Catherine2
    },

    [OPPONENT_CATHERINE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("HANNELORE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Catherine3
    },

    [OPPONENT_CATHERINE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("HANNELORE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_Catherine4
    },

    [OPPONENT_CATHERINE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("HANNELORE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Catherine5
    },

    [OPPONENT_MAXIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAXIE,
        .trainerName = _("MARC"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Maxie1
    },

    [OPPONENT_GRUNT_28] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt28
    },

    [OPPONENT_GRUNT_29] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Grunt29
    },

    [OPPONENT_GRUNT_30] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt30
    },

    [OPPONENT_GRUNT_31] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt31
    },

    [OPPONENT_GRUNT_32] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt32
    },

    [OPPONENT_GRUNT_33] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt33
    },

    [OPPONENT_GRUNT_34] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt34
    },

    [OPPONENT_GRUNT_35] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt35
    },

    [OPPONENT_GRUNT_36] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt36
    },

    [OPPONENT_GRUNT_37] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt37
    },

    [OPPONENT_GRUNT_38] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt38
    },

    [OPPONENT_GRUNT_39] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt39
    },

    [OPPONENT_GRUNT_40] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt40
    },

    [OPPONENT_GRUNT_41] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt41
    },

    [OPPONENT_GRUNT_42] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt42
    },

    [OPPONENT_GRUNT_43] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt43
    },

    [OPPONENT_GRUNT_44] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt44
    },

    [OPPONENT_GRUNT_45] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt45
    },

    [OPPONENT_GRUNT_46] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt46
    },

    [OPPONENT_GRUNT_47] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt47
    },

    [OPPONENT_GRUNT_48] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt48
    },

    [OPPONENT_GRUNT_49] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt49
    },

    [OPPONENT_GRUNT_50] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt50
    },

    [OPPONENT_GRUNT_51] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Grunt51
    },

    [OPPONENT_GRUNT_52] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_F,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt52
    },

    [OPPONENT_GRUNT_53] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_F,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Grunt53
    },

    [OPPONENT_GRUNT_54] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_F,
        .trainerName = _("RÜPEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Grunt54
    },

    [OPPONENT_ANONYMOUS_14] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Anonymous14
    },

    [OPPONENT_ANONYMOUS_15] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Anonymous15
    },

    [OPPONENT_TABITHA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _("KALLE"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = gTrainerParty_Tabitha1
    },

    [OPPONENT_TABITHA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _("KALLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Tabitha2
    },

    [OPPONENT_ANONYMOUS_16] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_Anonymous16
    },

    [OPPONENT_COURTNEY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_F,
        .trainerName = _("JÖRDIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Courtney1
    },

    [OPPONENT_COURTNEY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_F,
        .trainerName = _("JÖRDIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_Courtney2
    },

    [OPPONENT_MAXIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAXIE,
        .trainerName = _("MARC"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Maxie2
    },

    [OPPONENT_MAXIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAXIE,
        .trainerName = _("MARC"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Maxie3
    },

    [OPPONENT_TIANA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("KARIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Tiana
    },

    [OPPONENT_HALEY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ELISA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Haley1
    },

    [OPPONENT_JANICE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("RICARDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Janice
    },

    [OPPONENT_VIVI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("SIEGLINDE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Vivi
    },

    [OPPONENT_HALEY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ELISA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Haley2
    },

    [OPPONENT_HALEY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ELISA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Haley3
    },

    [OPPONENT_HALEY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ELISA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Haley4
    },

    [OPPONENT_HALEY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ELISA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Haley5
    },

    [OPPONENT_SALLY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("FREDERIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Sally
    },

    [OPPONENT_ROBIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ROBIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Robin
    },

    [OPPONENT_ANDREA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("FRIEDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Andrea
    },

    [OPPONENT_CRISSY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ADELHEID"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Crissy
    },

    [OPPONENT_RICK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("BALDUR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Rick
    },

    [OPPONENT_LYLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("DETWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = gTrainerParty_Lyle
    },

    [OPPONENT_JOSE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("EROS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Jose
    },

    [OPPONENT_DOUG] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("EUSEBIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Doug
    },

    [OPPONENT_GREG] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GANGOLF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Greg
    },

    [OPPONENT_KENT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GERIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Kent
    },

    [OPPONENT_JAMES_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GERNOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_James1
    },

    [OPPONENT_JAMES_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GERNOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_James2
    },

    [OPPONENT_JAMES_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GERNOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_James3
    },

    [OPPONENT_JAMES_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GERNOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_James4
    },

    [OPPONENT_JAMES_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GERNOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_James5
    },

    [OPPONENT_BRICE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("GISBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Brice
    },

    [OPPONENT_TRENT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("HEIMKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Trent1
    },

    [OPPONENT_LENNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("JANNO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Lenny
    },

    [OPPONENT_LUCAS_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("KLODWIG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Lucas1
    },

    [OPPONENT_ALAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("LANZELOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Alan
    },

    [OPPONENT_CLARK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("LUZIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Clark
    },

    [OPPONENT_ERIC] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("MAURIZIO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Eric
    },

    [OPPONENT_LUCAS_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("KLODWIG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Lucas2
    },

    [OPPONENT_MIKE_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("MELVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Mike1
    },

    [OPPONENT_MIKE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("MELVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Mike2
    },

    [OPPONENT_TRENT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("HEIMKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Trent2
    },

    [OPPONENT_TRENT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("HEIMKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Trent3
    },

    [OPPONENT_TRENT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("HEIMKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Trent4
    },

    [OPPONENT_TRENT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("HEIMKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Trent5
    },

    [OPPONENT_DEZ_AND_LUKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("INA & LEIF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_DezAndLuke
    },

    [OPPONENT_LEA_AND_JED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LENA & UWE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LeaAndJed
    },

    [OPPONENT_LOIS_AND_HAL_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("GESA & PIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LoisAndHal1
    },

    [OPPONENT_LOIS_AND_HAL_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("GESA & PIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LoisAndHal2
    },

    [OPPONENT_LOIS_AND_HAL_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("GESA & PIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LoisAndHal3
    },

    [OPPONENT_LOIS_AND_HAL_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("GESA & PIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LoisAndHal4
    },

    [OPPONENT_LOIS_AND_HAL_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("GESA & PIT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LoisAndHal5
    },

    [OPPONENT_JOHANNA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("CORDULA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Johanna
    },

    [OPPONENT_ZANE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("OTBERT"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Zane
    },

    [OPPONENT_VIVIAN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("BÄRBEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Vivian
    },

    [OPPONENT_SADIE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CHANTAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Sadie
    },

    [OPPONENT_HIDEO_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("SAUL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 2,
        .party = gTrainerParty_Hideo2
    },

    [OPPONENT_KEIGO] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("NELSON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 2,
        .party = gTrainerParty_Keigo
    },

    [OPPONENT_TSUNAO] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("NIKODEMUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 3,
        .party = gTrainerParty_Tsunao
    },

    [OPPONENT_TERRELL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("NESTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Terrell
    },

    [OPPONENT_KYLEE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("MIREILLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = gTrainerParty_Kylee
    },

    [OPPONENT_WALLY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("HEIKO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = gTrainerParty_Wally2
    },

    [OPPONENT_WALLY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("HEIKO"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Wally3
    },

    [OPPONENT_WALLY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("HEIKO"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Wally4
    },

    [OPPONENT_WALLY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("HEIKO"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Wally5
    },

    [OPPONENT_WALLY_6] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("HEIKO"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = gTrainerParty_Wally6
    },

    [OPPONENT_BRENDAN_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_Brendan10
    },

    [OPPONENT_BRENDAN_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_Brendan11
    },

    [OPPONENT_BRENDAN_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRIX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_Brendan12
    },

    [OPPONENT_MAY_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_May10
    },

    [OPPONENT_MAY_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_May11
    },

    [OPPONENT_MAY_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = gTrainerParty_May12
    },

    [OPPONENT_JONAH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("OLOF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Jonah
    },

    [OPPONENT_HENRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("PIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Henry
    },

    [OPPONENT_ROGER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("AMATUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Roger
    },

    [OPPONENT_ALEXA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("ANNABEL"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_Alexa
    },

    [OPPONENT_RUBEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("TRUTZ"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = gTrainerParty_Ruben
    },

    [OPPONENT_KOJI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("REMIGIUS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Koji
    },

    [OPPONENT_WAYNE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ALVARO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Wayne
    },

    [OPPONENT_BYRON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("AMALRICH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_Byron
    },

    [OPPONENT_REED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("ANDOLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Reed
    },

    [OPPONENT_TISHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("IMKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = gTrainerParty_Tisha
    },

    [OPPONENT_TORI_AND_TIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("LI & FLO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_ToriAndTia
    },

    [OPPONENT_KIM_AND_IRIS] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("ZOE & IRIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_KimAndIris
    },

    [OPPONENT_TYRA_AND_IVY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("TYRA & IVY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_TyraAndIvy
    },

    [OPPONENT_MEL_AND_PAUL] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("GELI & OLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_MelAndPaul
    },

    [OPPONENT_JOHN_AND_JAY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("URS & EVI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_JohnAndJay1
    },

    [OPPONENT_JOHN_AND_JAY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("URS & EVI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_JohnAndJay2
    },

    [OPPONENT_JOHN_AND_JAY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("URS & EVI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_JohnAndJay3
    },

    [OPPONENT_JOHN_AND_JAY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("URS & EVI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = gTrainerParty_JohnAndJay4
    },

    [OPPONENT_JOHN_AND_JAY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("URS & EVI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = gTrainerParty_JohnAndJay5
    },

    [OPPONENT_RELI_AND_IAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("TOBI & UNA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_ReliAndIan
    },

    [OPPONENT_RITA_AND_SAM_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("TOM & UTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_RitaAndSam1
    },

    [OPPONENT_RITA_AND_SAM_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("TOM & UTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_RitaAndSam2
    },

    [OPPONENT_RITA_AND_SAM_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("TOM & UTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_RitaAndSam3
    },

    [OPPONENT_RITA_AND_SAM_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("TOM & UTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_RitaAndSam4
    },

    [OPPONENT_RITA_AND_SAM_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("TOM & UTA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_RitaAndSam5
    },

    [OPPONENT_LISA_AND_RAY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("ERKO & BEA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = gTrainerParty_LisaAndRay
    },

    [OPPONENT_EUGENE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ABELKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = gTrainerParty_Eugene
    }
};
