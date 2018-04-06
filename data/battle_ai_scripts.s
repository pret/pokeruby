#include "constants/abilities.h"
#include "constants/battle_move_effects.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "include/macros.inc"
	.include "constants/constants.inc"
	.include "include/macros/battle_ai_script.inc"

	.section script_data, "aw", %progbits

	.align 2
BattleAIs:: @ 81DA01C
	.4byte AI_CheckBadMove
	.4byte AI_CheckViability
	.4byte AI_TryToFaint
	.4byte AI_SetupFirstTurn
	.4byte AI_Risky
	.4byte AI_PreferStrongestMove
	.4byte AI_PreferBatonPass
	.4byte AI_Nothing
	.4byte AI_HPAware
	.4byte AI_Unknown
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Unused
	.4byte AI_Roaming
	.4byte AI_Safari
	.4byte AI_GoEasy

AI_CheckBadMove: @ 81DA09C
	is_most_powerful_move
	if_equal 0, AI_CheckBadMove_CheckSoundproof
	if_damage_bonus 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_VOLT_ABSORB, CheckIfVoltAbsorbCancelsElectric
	if_equal ABILITY_WATER_ABSORB, CheckIfWaterAbsorbCancelsWater
	if_equal ABILITY_FLASH_FIRE, CheckIfFlashFireCancelsFire
	if_equal ABILITY_WONDER_GUARD, CheckIfWonderGuardCancelsMove
	if_equal ABILITY_LEVITATE, CheckIfLevitateCancelsGroundMove
	jump AI_CheckBadMove_CheckSoundproof

CheckIfVoltAbsorbCancelsElectric: @ 81DA0CE
	get_type CURRENT_MOVE
	if_arg_equal TYPE_ELECTRIC, Score_Minus12
	jump AI_CheckBadMove_CheckSoundproof

CheckIfWaterAbsorbCancelsWater: @ 81DA0DB
	get_type CURRENT_MOVE
	if_arg_equal TYPE_WATER, Score_Minus12
	jump AI_CheckBadMove_CheckSoundproof

CheckIfFlashFireCancelsFire: @ 81DA0E8
	get_type CURRENT_MOVE
	if_arg_equal TYPE_FIRE, Score_Minus12
	jump AI_CheckBadMove_CheckSoundproof

CheckIfWonderGuardCancelsMove: @ 81DA0F5
	if_damage_bonus 80, AI_CheckBadMove_CheckSoundproof
	jump Score_Minus10

CheckIfLevitateCancelsGroundMove: @ 81DA100
	get_type CURRENT_MOVE
	if_arg_equal TYPE_GROUND, Score_Minus10

AI_CheckBadMove_CheckSoundproof: @ 81DA108
	get_ability TARGET
	if_not_equal ABILITY_SOUNDPROOF, AI_CheckBadMove_CheckEffect
	if_move MOVE_GROWL, Score_Minus10
	if_move MOVE_ROAR, Score_Minus10
	if_move MOVE_SING, Score_Minus10
	if_move MOVE_SUPERSONIC, Score_Minus10
	if_move MOVE_SCREECH, Score_Minus10
	if_move MOVE_SNORE, Score_Minus10
	if_move MOVE_UPROAR, Score_Minus10
	if_move MOVE_METAL_SOUND, Score_Minus10
	if_move MOVE_GRASS_WHISTLE, Score_Minus10

AI_CheckBadMove_CheckEffect: @ 81DA14F
	if_effect EFFECT_SLEEP, AI_CBM_Sleep
	if_effect EFFECT_EXPLOSION, AI_CBM_Explosion
	if_effect EFFECT_DREAM_EATER, AI_CBM_DreamEater
	if_effect EFFECT_ATTACK_UP, AI_CBM_AttackUp
	if_effect EFFECT_DEFENSE_UP, AI_CBM_DefenseUp
	if_effect EFFECT_SPEED_UP, AI_CBM_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP, AI_CBM_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP, AI_CBM_SpDefUp
	if_effect EFFECT_ACCURACY_UP, AI_CBM_AccUp
	if_effect EFFECT_EVASION_UP, AI_CBM_EvasionUp
	if_effect EFFECT_ATTACK_DOWN, AI_CBM_AttackDown
	if_effect EFFECT_DEFENSE_DOWN, AI_CBM_DefenseDown
	if_effect EFFECT_SPEED_DOWN, AI_CBM_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN, AI_CBM_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN, AI_CBM_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN, AI_CBM_AccDown
	if_effect EFFECT_EVASION_DOWN, AI_CBM_EvasionDown
	if_effect EFFECT_HAZE, AI_CBM_Haze
	if_effect EFFECT_BIDE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_ROAR, AI_CBM_Roar
	if_effect EFFECT_TOXIC, AI_CBM_Toxic
	if_effect EFFECT_LIGHT_SCREEN, AI_CBM_LightScreen
	if_effect EFFECT_OHKO, AI_CBM_OneHitKO
	if_effect EFFECT_RAZOR_WIND, AI_CBM_HighRiskForDamage
	if_effect EFFECT_SUPER_FANG, AI_CBM_HighRiskForDamage
	if_effect EFFECT_MIST, AI_CBM_Mist
	if_effect EFFECT_FOCUS_ENERGY, AI_CBM_FocusEnergy
	if_effect EFFECT_CONFUSE, AI_CBM_Confuse
	if_effect EFFECT_ATTACK_UP_2, AI_CBM_AttackUp
	if_effect EFFECT_DEFENSE_UP_2, AI_CBM_DefenseUp
	if_effect EFFECT_SPEED_UP_2, AI_CBM_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP_2, AI_CBM_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP_2, AI_CBM_SpDefUp
	if_effect EFFECT_ACCURACY_UP_2, AI_CBM_AccUp
	if_effect EFFECT_EVASION_UP_2, AI_CBM_EvasionUp
	if_effect EFFECT_ATTACK_DOWN_2, AI_CBM_AttackDown
	if_effect EFFECT_DEFENSE_DOWN_2, AI_CBM_DefenseDown
	if_effect EFFECT_SPEED_DOWN_2, AI_CBM_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN_2, AI_CBM_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN_2, AI_CBM_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN_2, AI_CBM_AccDown
	if_effect EFFECT_EVASION_DOWN_2, AI_CBM_EvasionDown
	if_effect EFFECT_REFLECT, AI_CBM_Reflect
	if_effect EFFECT_POISON, AI_CBM_Toxic
	if_effect EFFECT_PARALYZE, AI_CBM_Paralyze
	if_effect EFFECT_SUBSTITUTE, AI_CBM_Substitute
	if_effect EFFECT_RECHARGE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_LEECH_SEED, AI_CBM_LeechSeed
	if_effect EFFECT_DISABLE, AI_CBM_Disable
	if_effect EFFECT_LEVEL_DAMAGE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_PSYWAVE, AI_CBM_HighRiskForDamage
	if_effect EFFECT_COUNTER, AI_CBM_HighRiskForDamage
	if_effect EFFECT_ENCORE, AI_CBM_Encore
	if_effect EFFECT_SNORE, AI_CBM_DamageDuringSleep
	if_effect EFFECT_SLEEP_TALK, AI_CBM_DamageDuringSleep
	if_effect EFFECT_FLAIL, AI_CBM_HighRiskForDamage
	if_effect EFFECT_MEAN_LOOK, AI_CBM_CantEscape
	if_effect EFFECT_NIGHTMARE, AI_CBM_Nightmare
	if_effect EFFECT_MINIMIZE, AI_CBM_EvasionUp
	if_effect EFFECT_CURSE, AI_CBM_Curse
	if_effect EFFECT_SPIKES, AI_CBM_Spikes
	if_effect EFFECT_FORESIGHT, AI_CBM_Foresight
	if_effect EFFECT_PERISH_SONG, AI_CBM_PerishSong
	if_effect EFFECT_SANDSTORM, AI_CBM_Sandstorm
	if_effect EFFECT_SWAGGER, AI_CBM_Confuse
	if_effect EFFECT_ATTRACT, AI_CBM_Attract
	if_effect EFFECT_RETURN, AI_CBM_HighRiskForDamage
	if_effect EFFECT_PRESENT, AI_CBM_HighRiskForDamage
	if_effect EFFECT_FRUSTRATION, AI_CBM_HighRiskForDamage
	if_effect EFFECT_SAFEGUARD, AI_CBM_Safeguard
	if_effect EFFECT_MAGNITUDE, AI_CBM_Magnitude
	if_effect EFFECT_BATON_PASS, AI_CBM_BatonPass
	if_effect EFFECT_SONICBOOM, AI_CBM_HighRiskForDamage
	if_effect EFFECT_RAIN_DANCE, AI_CBM_RainDance
	if_effect EFFECT_SUNNY_DAY, AI_CBM_SunnyDay
	if_effect EFFECT_BELLY_DRUM, AI_CBM_BellyDrum
	if_effect EFFECT_PSYCH_UP, AI_CBM_Haze
	if_effect EFFECT_MIRROR_COAT, AI_CBM_HighRiskForDamage
	if_effect EFFECT_SKULL_BASH, AI_CBM_HighRiskForDamage
	if_effect EFFECT_FUTURE_SIGHT, AI_CBM_FutureSight
	if_effect EFFECT_TELEPORT, Score_Minus10
	if_effect EFFECT_DEFENSE_CURL, AI_CBM_DefenseUp
	if_effect EFFECT_FAKE_OUT, AI_CBM_FakeOut
	if_effect EFFECT_STOCKPILE, AI_CBM_Stockpile
	if_effect EFFECT_SPIT_UP, AI_CBM_SpitUpAndSwallow
	if_effect EFFECT_SWALLOW, AI_CBM_SpitUpAndSwallow
	if_effect EFFECT_HAIL, AI_CBM_Hail
	if_effect EFFECT_TORMENT, AI_CBM_Torment
	if_effect EFFECT_FLATTER, AI_CBM_Confuse
	if_effect EFFECT_WILL_O_WISP, AI_CBM_WillOWisp
	if_effect EFFECT_MEMENTO, AI_CBM_Memento
	if_effect EFFECT_FOCUS_PUNCH, AI_CBM_HighRiskForDamage
	if_effect EFFECT_HELPING_HAND, AI_CBM_HelpingHand
	if_effect EFFECT_TRICK, AI_CBM_TrickAndKnockOff
	if_effect EFFECT_INGRAIN, AI_CBM_Ingrain
	if_effect EFFECT_SUPERPOWER, AI_CBM_HighRiskForDamage
	if_effect EFFECT_RECYCLE, AI_CBM_Recycle
	if_effect EFFECT_KNOCK_OFF, AI_CBM_TrickAndKnockOff
	if_effect EFFECT_ENDEAVOR, AI_CBM_HighRiskForDamage
	if_effect EFFECT_IMPRISON, AI_CBM_Imprison
	if_effect EFFECT_REFRESH, AI_CBM_Refresh
	if_effect EFFECT_LOW_KICK, AI_CBM_HighRiskForDamage
	if_effect EFFECT_MUD_SPORT, AI_CBM_MudSport
	if_effect EFFECT_TICKLE, AI_CBM_Tickle
	if_effect EFFECT_COSMIC_POWER, AI_CBM_CosmicPower
	if_effect EFFECT_BULK_UP, AI_CBM_BulkUp
	if_effect EFFECT_WATER_SPORT, AI_CBM_WaterSport
	if_effect EFFECT_CALM_MIND, AI_CBM_CalmMind
	if_effect EFFECT_DRAGON_DANCE, AI_CBM_DragonDance
	end

AI_CBM_Sleep: @ 81DA3DE
	get_ability TARGET
	if_equal ABILITY_INSOMNIA, Score_Minus10
	if_equal ABILITY_VITAL_SPIRIT, Score_Minus10
	if_status TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, Score_Minus10
	end

AI_CBM_Explosion: @ 81DA3F7
	if_damage_bonus 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_DAMP, Score_Minus10
	count_alive_pokemon USER
	if_not_equal 0, AI_CBM_Explosion_End
	count_alive_pokemon TARGET
	if_not_equal 0, Score_Minus10
	jump Score_Minus1

AI_CBM_Explosion_End: @ 81DA41A
	end

AI_CBM_Nightmare: @ 81DA41B
	if_status2 TARGET, S_NIGHTMARE, Score_Minus10
	if_not_status TARGET, SLP, Score_Minus8
	end

AI_CBM_DreamEater: @ 81DA430
	if_not_status TARGET, SLP, Score_Minus8
	if_damage_bonus 0, Score_Minus10
	end

AI_CBM_BellyDrum: @ 81DA441
	if_hp_less_than USER, 51, Score_Minus10

AI_CBM_AttackUp: @ 81DA448
	if_stat_level_equal USER, ATTACK, 12, Score_Minus10
	end

AI_CBM_DefenseUp: @ 81DA451
	if_stat_level_equal USER, DEFENSE, 12, Score_Minus10
	end

AI_CBM_SpeedUp: @ 81DA45A
	if_stat_level_equal USER, SPEED, 12, Score_Minus10
	end

AI_CBM_SpAtkUp: @ 81DA463
	if_stat_level_equal USER, SP_ATTACK, 12, Score_Minus10
	end

AI_CBM_SpDefUp: @ 81DA46C
	if_stat_level_equal USER, SP_DEFENSE, 12, Score_Minus10
	end

AI_CBM_AccUp: @ 81DA475
	if_stat_level_equal USER, ACCURACY, 12, Score_Minus10
	end

AI_CBM_EvasionUp: @ 81DA47E
	if_stat_level_equal USER, EVASION, 12, Score_Minus10
	end

AI_CBM_AttackDown: @ 81DA487
	if_stat_level_equal TARGET, ATTACK, 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_HYPER_CUTTER, Score_Minus10
	jump CheckIfAbilityBlocksStatChange

AI_CBM_DefenseDown: @ 81DA49C
	if_stat_level_equal TARGET, DEFENSE, 0, Score_Minus10
	jump CheckIfAbilityBlocksStatChange

AI_CBM_SpeedDown: @ 81DA4A9
	if_stat_level_equal TARGET, SPEED, 0, Score_Minus10
	jump CheckIfAbilityBlocksStatChange

AI_CBM_SpAtkDown: @ 81DA4B6
	if_stat_level_equal TARGET, SP_ATTACK, 0, Score_Minus10
	jump CheckIfAbilityBlocksStatChange

AI_CBM_SpDefDown: @ 81DA4C3
	if_stat_level_equal TARGET, SP_DEFENSE, 0, Score_Minus10
	jump CheckIfAbilityBlocksStatChange

AI_CBM_AccDown: @ 81DA4D0
	if_stat_level_equal TARGET, ACCURACY, 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_KEEN_EYE, Score_Minus10
	jump CheckIfAbilityBlocksStatChange

AI_CBM_EvasionDown: @ 81DA4E5
	if_stat_level_equal TARGET, EVASION, 0, Score_Minus10

CheckIfAbilityBlocksStatChange: @ 81DA4ED
	get_ability TARGET
	if_equal ABILITY_CLEAR_BODY, Score_Minus10
	if_equal ABILITY_WHITE_SMOKE, Score_Minus10
	end

AI_CBM_Haze: @ 81DA4FC
	if_stat_level_less_than USER, ATTACK, 6, AI_CBM_Haze_End
	if_stat_level_less_than USER, DEFENSE, 6, AI_CBM_Haze_End
	if_stat_level_less_than USER, SPEED, 6, AI_CBM_Haze_End
	if_stat_level_less_than USER, SP_ATTACK, 6, AI_CBM_Haze_End
	if_stat_level_less_than USER, SP_DEFENSE, 6, AI_CBM_Haze_End
	if_stat_level_less_than USER, ACCURACY, 6, AI_CBM_Haze_End
	if_stat_level_less_than USER, EVASION, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, ATTACK, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, DEFENSE, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, SPEED, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, SP_ATTACK, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, SP_DEFENSE, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, ACCURACY, 6, AI_CBM_Haze_End
	if_stat_level_more_than TARGET, EVASION, 6, AI_CBM_Haze_End
	jump Score_Minus10

AI_CBM_Haze_End: @ 81DA571
	end

AI_CBM_Roar: @ 81DA572
	count_alive_pokemon TARGET
	if_equal 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_SUCTION_CUPS, Score_Minus10
	end

AI_CBM_Toxic: @ 81DA583
	get_type ENEMY_TYPE1
	if_equal TYPE_STEEL, Score_Minus10
	if_equal TYPE_POISON, Score_Minus10
	get_type PLAYER_TYPE1
	if_equal TYPE_STEEL, Score_Minus10
	if_equal TYPE_POISON, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_IMMUNITY, Score_Minus10
	if_status TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, Score_Minus10
	end

AI_CBM_LightScreen: @ 81DA5B2
	if_status4 USER, S_LIGHT_SCREEN, Score_Minus8
	end

AI_CBM_OneHitKO: @ 81DA5BD
	if_damage_bonus 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_STURDY, Score_Minus10
	if_target_higher_level Score_Minus10
	end

AI_CBM_Magnitude: @ 81DA5D2
	get_ability TARGET
	if_equal ABILITY_LEVITATE, Score_Minus10

AI_CBM_HighRiskForDamage: @ 81DA5DA
	if_damage_bonus 0, Score_Minus10
	get_ability TARGET
	if_not_equal ABILITY_WONDER_GUARD, AI_CBM_HighRiskForDamage_End
	if_damage_bonus 80, AI_CBM_HighRiskForDamage_End
	jump Score_Minus10

AI_CBM_HighRiskForDamage_End: @ 81DA5F3
	end

AI_CBM_Mist: @ 81DA5F4
	if_status4 USER, S_MIST, Score_Minus8
	end

AI_CBM_FocusEnergy: @ 81DA5FF
	if_status2 USER, S_FOCUS_ENERGY, Score_Minus10
	end

AI_CBM_Confuse: @ 81DA60A
	if_status2 TARGET, S_CONFUSED, Score_Minus5
	get_ability TARGET
	if_equal ABILITY_OWN_TEMPO, Score_Minus10
	end

AI_CBM_Reflect: @ 81DA61D
	if_status4 USER, S_REFLECT, Score_Minus8
	end

AI_CBM_Paralyze: @ 81DA628
	if_damage_bonus 0, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_LIMBER, Score_Minus10
	if_status TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, Score_Minus10
	end

AI_CBM_Substitute: @ 81DA641
	if_status2 USER, S_SUBSTITUTE, Score_Minus8
	if_hp_less_than USER, 26, Score_Minus10
	end

AI_CBM_LeechSeed: @ 81DA653
	if_status3 TARGET, S_LEECH_SEED, Score_Minus10
	get_type ENEMY_TYPE1
	if_equal TYPE_GRASS, Score_Minus10
	get_type PLAYER_TYPE1
	if_equal TYPE_GRASS, Score_Minus10
	end

AI_CBM_Disable: @ 81DA66E
	if_last_move_did_damage TARGET, 0, Score_Minus8
	end

AI_CBM_Encore: @ 81DA676
	if_last_move_did_damage TARGET, 1, Score_Minus8
	end

AI_CBM_DamageDuringSleep: @ 81DA67E
	if_not_status USER, SLP, Score_Minus8
	end

AI_CBM_CantEscape: @ 81DA689
	if_status2 TARGET, S_MEAN_LOOK, Score_Minus10
	end

AI_CBM_Curse: @ 81DA694
	if_stat_level_equal USER, ATTACK, 12, Score_Minus10
	if_stat_level_equal USER, DEFENSE, 12, Score_Minus8
	end

AI_CBM_Spikes: @ 81DA6A5
	if_status4 TARGET, S_SPIKES, Score_Minus10
	end

AI_CBM_Foresight: @ 81DA6B0
	if_status2 TARGET, S_FORESIGHT, Score_Minus10
	end

AI_CBM_PerishSong: @ 81DA6BB
	if_status3 TARGET, S_PERISH_SONG, Score_Minus10
	end

AI_CBM_Sandstorm: @ 81DA6C6
	get_weather
	if_equal BATTLE_WEATHER_SANDSTORM, Score_Minus8
	end

AI_CBM_Attract: @ 81DA6CE
	if_status2 TARGET, S_INFATUATED, Score_Minus10
	get_ability TARGET
	if_equal ABILITY_OBLIVIOUS, Score_Minus10
	get_gender USER
	if_equal 0, AI_CBM_Attract_CheckIfTargetIsFemale
	if_equal 254, AI_CBM_Attract_CheckIfTargetIsMale
	jump Score_Minus10

AI_CBM_Attract_CheckIfTargetIsFemale: @ 81DA6F3
	get_gender TARGET
	if_equal 254, AI_CBM_Attract_End
	jump Score_Minus10

AI_CBM_Attract_CheckIfTargetIsMale: @ 81DA700
	get_gender TARGET
	if_equal 0, AI_CBM_Attract_End
	jump Score_Minus10

AI_CBM_Attract_End: @ 81DA70D
	end

AI_CBM_Safeguard: @ 81DA70E
	if_status4 USER, S_SAFEGUARD, Score_Minus8
	end

AI_CBM_Memento: @ 81DA719
	if_stat_level_equal TARGET, ATTACK, 0, Score_Minus10
	if_stat_level_equal TARGET, SP_ATTACK, 0, Score_Minus8

AI_CBM_BatonPass: @ 81DA729
	count_alive_pokemon USER
	if_equal 0, Score_Minus10
	end

AI_CBM_RainDance: @ 81DA732
	get_weather
	if_equal BATTLE_WEATHER_RAIN, Score_Minus8
	end

AI_CBM_SunnyDay: @ 81DA73A
	get_weather
	if_equal BATTLE_WEATHER_SUN, Score_Minus8
	end

AI_CBM_FutureSight: @ 81DA742
	if_status4 TARGET, S_FUTURE_SIGHT, Score_Minus10
	end

AI_CBM_FakeOut: @ 81DA74D
	is_first_turn USER
	if_equal 0, Score_Minus10
	end

AI_CBM_Stockpile: @ 81DA756
	get_stockpile_count USER
	if_equal 3, Score_Minus10
	end

AI_CBM_SpitUpAndSwallow: @ 81DA75F
	if_damage_bonus 0, Score_Minus10
	get_stockpile_count USER
	if_equal 0, Score_Minus10
	end

AI_CBM_Hail: @ 81DA76E
	get_weather
	if_equal BATTLE_WEATHER_HAIL, Score_Minus8
	end

AI_CBM_Torment: @ 81DA776
	if_status2 TARGET, S_TORMENT, Score_Minus10
	end

AI_CBM_WillOWisp: @ 81DA781
	get_ability TARGET
	if_equal ABILITY_WATER_VEIL, Score_Minus10
	if_status TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, Score_Minus10
	if_damage_bonus 0, Score_Minus10
	if_damage_bonus 20, Score_Minus10
	if_damage_bonus 10, Score_Minus10
	end

AI_CBM_HelpingHand: @ 81DA7A6
	is_double_battle
	if_equal 0, Score_Minus10
	end

AI_CBM_TrickAndKnockOff: @ 81DA7AE
	get_ability TARGET
	if_equal ABILITY_STICKY_HOLD, Score_Minus10
	end

AI_CBM_Ingrain: @ 81DA7B7
	if_status3 USER, S_ROOTED, Score_Minus10
	end

AI_CBM_Recycle: @ 81DA7C2
	get_item USER
	if_equal ITEM_NONE, Score_Minus10
	end

AI_CBM_Imprison: @ 81DA7CB
	if_status3 USER, S_IMPRISONED, Score_Minus10
	end

AI_CBM_Refresh: @ 81DA7D6
	if_not_status USER, PSN | BRN | PAR | TOX, Score_Minus10
	end

AI_CBM_MudSport: @ 81DA7E1
	if_status3 USER, S_MUD_SPORT, Score_Minus10
	end

AI_CBM_Tickle: @ 81DA7EC
	if_stat_level_equal TARGET, ATTACK, 0, Score_Minus10
	if_stat_level_equal TARGET, DEFENSE, 0, Score_Minus8
	end

AI_CBM_CosmicPower: @ 81DA7FD
	if_stat_level_equal USER, DEFENSE, 12, Score_Minus10
	if_stat_level_equal USER, SP_DEFENSE, 12, Score_Minus8
	end

AI_CBM_BulkUp: @ 81DA80E
	if_stat_level_equal USER, ATTACK, 12, Score_Minus10
	if_stat_level_equal USER, DEFENSE, 12, Score_Minus8
	end

AI_CBM_WaterSport: @ 81DA81F
	if_status3 USER, S_WATER_SPORT, Score_Minus10
	end

AI_CBM_CalmMind: @ 81DA82A
	if_stat_level_equal USER, SP_ATTACK, 12, Score_Minus10
	if_stat_level_equal USER, SP_DEFENSE, 12, Score_Minus8
	end

AI_CBM_DragonDance: @ 81DA83B
	if_stat_level_equal USER, ATTACK, 12, Score_Minus10
	if_stat_level_equal USER, SPEED, 12, Score_Minus8
	end

Score_Minus1: @ 81DA84C
	score -1
	end

Score_Minus2: @ 81DA84F
	score -2
	end

Score_Minus3: @ 81DA852
	score -3
	end

Score_Minus5: @ 81DA855
	score -5
	end

Score_Minus8: @ 81DA858
	score -8
	end

Score_Minus10: @ 81DA85B
	score -10
	end

Score_Minus12: @ 81DA85E
	score -12
	end

@ unreferenced
	score +1
	end

@ unreferenced
	score +2
	end

@ unreferenced
	score +3
	end

@ unreferenced
	score +5
	end

AI_CheckViability: @ 81DA86D
	if_effect EFFECT_SLEEP, AI_CV_Sleep
	if_effect EFFECT_ABSORB, AI_CV_Absorb
	if_effect EFFECT_EXPLOSION, AI_CV_SelfKO
	if_effect EFFECT_DREAM_EATER, AI_CV_DreamEater
	if_effect EFFECT_MIRROR_MOVE, AI_CV_MirrorMove
	if_effect EFFECT_ATTACK_UP, AI_CV_AttackUp
	if_effect EFFECT_DEFENSE_UP, AI_CV_DefenseUp
	if_effect EFFECT_SPEED_UP, AI_CV_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP, AI_CV_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP, AI_CV_SpDefUp
	if_effect EFFECT_ACCURACY_UP, AI_CV_AccuracyUp
	if_effect EFFECT_EVASION_UP, AI_CV_EvasionUp
	if_effect EFFECT_ALWAYS_HIT, AI_CV_AlwaysHit
	if_effect EFFECT_ATTACK_DOWN, AI_CV_AttackDown
	if_effect EFFECT_DEFENSE_DOWN, AI_CV_DefenseDown
	if_effect EFFECT_SPEED_DOWN, AI_CV_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN, AI_CV_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN, AI_CV_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN, AI_CV_AccuracyDown
	if_effect EFFECT_EVASION_DOWN, AI_CV_EvasionDown
	if_effect EFFECT_HAZE, AI_CV_Haze
	if_effect EFFECT_BIDE, AI_CV_Bide
	if_effect EFFECT_ROAR, AI_CV_Roar
	if_effect EFFECT_CONVERSION, AI_CV_Conversion
	if_effect EFFECT_RESTORE_HP, AI_CV_Heal
	if_effect EFFECT_TOXIC, AI_CV_Toxic
	if_effect EFFECT_LIGHT_SCREEN, AI_CV_LightScreen
	if_effect EFFECT_REST, AI_CV_Rest
	if_effect EFFECT_OHKO, AI_CV_OneHitKO
	if_effect EFFECT_RAZOR_WIND, AI_CV_ChargeUpMove
	if_effect EFFECT_SUPER_FANG, AI_CV_SuperFang
	if_effect EFFECT_TRAP, AI_CV_Trap
	if_effect EFFECT_HIGH_CRITICAL, AI_CV_HighCrit
	if_effect EFFECT_CONFUSE, AI_CV_Confuse
	if_effect EFFECT_ATTACK_UP_2, AI_CV_AttackUp
	if_effect EFFECT_DEFENSE_UP_2, AI_CV_DefenseUp
	if_effect EFFECT_SPEED_UP_2, AI_CV_SpeedUp
	if_effect EFFECT_SPECIAL_ATTACK_UP_2, AI_CV_SpAtkUp
	if_effect EFFECT_SPECIAL_DEFENSE_UP_2, AI_CV_SpDefUp
	if_effect EFFECT_ACCURACY_UP_2, AI_CV_AccuracyUp
	if_effect EFFECT_EVASION_UP_2, AI_CV_EvasionUp
	if_effect EFFECT_ATTACK_DOWN_2, AI_CV_AttackDown
	if_effect EFFECT_DEFENSE_DOWN_2, AI_CV_DefenseDown
	if_effect EFFECT_SPEED_DOWN_2, AI_CV_SpeedDown
	if_effect EFFECT_SPECIAL_ATTACK_DOWN_2, AI_CV_SpAtkDown
	if_effect EFFECT_SPECIAL_DEFENSE_DOWN_2, AI_CV_SpDefDown
	if_effect EFFECT_ACCURACY_DOWN_2, AI_CV_AccuracyDown
	if_effect EFFECT_EVASION_DOWN_2, AI_CV_EvasionDown
	if_effect EFFECT_REFLECT, AI_CV_Reflect
	if_effect EFFECT_POISON, AI_CV_Poison
	if_effect EFFECT_PARALYZE, AI_CV_Paralyze
	if_effect EFFECT_SPEED_DOWN_HIT, AI_CV_SpeedDownFromChance
	if_effect EFFECT_SKY_ATTACK, AI_CV_ChargeUpMove
	if_effect EFFECT_VITAL_THROW, AI_CV_VitalThrow
	if_effect EFFECT_SUBSTITUTE, AI_CV_Substitute
	if_effect EFFECT_RECHARGE, AI_CV_Recharge
	if_effect EFFECT_LEECH_SEED, AI_CV_Toxic
	if_effect EFFECT_DISABLE, AI_CV_Disable
	if_effect EFFECT_COUNTER, AI_CV_Counter
	if_effect EFFECT_ENCORE, AI_CV_Encore
	if_effect EFFECT_PAIN_SPLIT, AI_CV_PainSplit
	if_effect EFFECT_SNORE, AI_CV_Snore
	if_effect EFFECT_LOCK_ON, AI_CV_LockOn
	if_effect EFFECT_SLEEP_TALK, AI_CV_SleepTalk
	if_effect EFFECT_DESTINY_BOND, AI_CV_DestinyBond
	if_effect EFFECT_FLAIL, AI_CV_Flail
	if_effect EFFECT_HEAL_BELL, AI_CV_HealBell
	if_effect EFFECT_THIEF, AI_CV_Thief
	if_effect EFFECT_MEAN_LOOK, AI_CV_Trap
	if_effect EFFECT_MINIMIZE, AI_CV_EvasionUp
	if_effect EFFECT_CURSE, AI_CV_Curse
	if_effect EFFECT_PROTECT, AI_CV_Protect
	if_effect EFFECT_FORESIGHT, AI_CV_Foresight
	if_effect EFFECT_ENDURE, AI_CV_Endure
	if_effect EFFECT_BATON_PASS, AI_CV_BatonPass
	if_effect EFFECT_PURSUIT, AI_CV_Pursuit
	if_effect EFFECT_MORNING_SUN, AI_CV_HealWeather
	if_effect EFFECT_SYNTHESIS, AI_CV_HealWeather
	if_effect EFFECT_MOONLIGHT, AI_CV_HealWeather
	if_effect EFFECT_RAIN_DANCE, AI_CV_RainDance
	if_effect EFFECT_SUNNY_DAY, AI_CV_SunnyDay
	if_effect EFFECT_BELLY_DRUM, AI_CV_BellyDrum
	if_effect EFFECT_PSYCH_UP, AI_CV_PsychUp
	if_effect EFFECT_MIRROR_COAT, AI_CV_MirrorCoat
	if_effect EFFECT_SKULL_BASH, AI_CV_ChargeUpMove
	if_effect EFFECT_SOLARBEAM, AI_CV_ChargeUpMove
	if_effect EFFECT_FLY, AI_CV_Fly
	if_effect EFFECT_SOFTBOILED, AI_CV_Heal
	if_effect EFFECT_FAKE_OUT, AI_CV_FakeOut
	if_effect EFFECT_SPIT_UP, AI_CV_SpitUp
	if_effect EFFECT_SWALLOW, AI_CV_Heal
	if_effect EFFECT_HAIL, AI_CV_Hail
	if_effect EFFECT_FLATTER, AI_CV_Flatter
	if_effect EFFECT_MEMENTO, AI_CV_SelfKO
	if_effect EFFECT_FACADE, AI_CV_Facade
	if_effect EFFECT_FOCUS_PUNCH, AI_CV_FocusPunch
	if_effect EFFECT_SMELLINGSALT, AI_CV_SmellingSalt
	if_effect EFFECT_TRICK, AI_CV_Trick
	if_effect EFFECT_ROLE_PLAY, AI_CV_ChangeSelfAbility
	if_effect EFFECT_SUPERPOWER, AI_CV_Superpower
	if_effect EFFECT_MAGIC_COAT, AI_CV_MagicCoat
	if_effect EFFECT_RECYCLE, AI_CV_Recycle
	if_effect EFFECT_REVENGE, AI_CV_Revenge
	if_effect EFFECT_BRICK_BREAK, AI_CV_BrickBreak
	if_effect EFFECT_KNOCK_OFF, AI_CV_KnockOff
	if_effect EFFECT_ENDEAVOR, AI_CV_Endeavor
	if_effect EFFECT_ERUPTION, AI_CV_Eruption
	if_effect EFFECT_SKILL_SWAP, AI_CV_ChangeSelfAbility
	if_effect EFFECT_IMPRISON, AI_CV_Imprison
	if_effect EFFECT_REFRESH, AI_CV_Refresh
	if_effect EFFECT_SNATCH, AI_CV_Snatch
	if_effect EFFECT_BLAZE_KICK, AI_CV_HighCrit
	if_effect EFFECT_MUD_SPORT, AI_CV_MudSport
	if_effect EFFECT_OVERHEAT, AI_CV_Overheat
	if_effect EFFECT_TICKLE, AI_CV_DefenseDown
	if_effect EFFECT_COSMIC_POWER, AI_CV_SpDefUp
	if_effect EFFECT_BULK_UP, AI_CV_DefenseUp
	if_effect EFFECT_POISON_TAIL, AI_CV_HighCrit
	if_effect EFFECT_WATER_SPORT, AI_CV_WaterSport
	if_effect EFFECT_CALM_MIND, AI_CV_SpDefUp
	if_effect EFFECT_DRAGON_DANCE, AI_CV_DragonDance
	end

AI_CV_Sleep: @ 81DAB44
	if_move_effect TARGET, EFFECT_DREAM_EATER, AI_CV_SleepEncourageSlpDamage
	if_move_effect TARGET, EFFECT_NIGHTMARE, AI_CV_SleepEncourageSlpDamage
	jump AI_CV_Sleep_End

AI_CV_SleepEncourageSlpDamage: @ 81DAB57
	if_random_less_than 128, AI_CV_Sleep_End
	score +1

AI_CV_Sleep_End: @ 81DAB5F
	end

AI_CV_Absorb: @ 81DAB60
	if_damage_bonus 20, AI_CV_AbsorbEncourageMaybe
	if_damage_bonus 10, AI_CV_AbsorbEncourageMaybe
	jump AI_CV_Absorb_End

AI_CV_AbsorbEncourageMaybe: @ 81DAB71
	if_random_less_than 50, AI_CV_Absorb_End
	score -3

AI_CV_Absorb_End: @ 81DAB79
	end

AI_CV_SelfKO: @ 81DAB7A
	if_stat_level_less_than TARGET, EVASION, 7, AI_CV_SelfKO_Encourage1
	score -1
	if_stat_level_less_than TARGET, EVASION, 10, AI_CV_SelfKO_Encourage1
	if_random_less_than 128, AI_CV_SelfKO_Encourage1
	score -1

AI_CV_SelfKO_Encourage1: @ 81DAB94
	if_hp_less_than USER, 80, AI_CV_SelfKO_Encourage2
	if_would_go_first USER, AI_CV_SelfKO_Encourage2
	if_random_less_than 50, AI_CV_SelfKO_End
	jump Score_Minus3

AI_CV_SelfKO_Encourage2: @ 81DABAC
	if_hp_more_than USER, 50, AI_CV_SelfKO_Encourage4
	if_random_less_than 128, AI_CV_SelfKO_Encourage3
	score +1

AI_CV_SelfKO_Encourage3: @ 81DABBB
	if_hp_more_than USER, 30, AI_CV_SelfKO_End
	if_random_less_than 50, AI_CV_SelfKO_End
	score +1
	jump AI_CV_SelfKO_End

AI_CV_SelfKO_Encourage4: @ 81DABCF
	if_random_less_than 50, AI_CV_SelfKO_End
	score -1

AI_CV_SelfKO_End: @ 81DABD7
	end

AI_CV_DreamEater: @ 81DABD8
	if_damage_bonus 10, AI_CV_DreamEater_ScoreDown1
	if_damage_bonus 20, AI_CV_DreamEater_ScoreDown1
	jump AI_CV_DreamEater_End

AI_CV_DreamEater_ScoreDown1: @ 81DABE9
	score -1

AI_CV_DreamEater_End: @ 81DABEB
	end

AI_CV_MirrorMove: @ 81DABEC
	if_would_go_first USER, AI_CV_MirrorMove2
	get_move TARGET
	if_not_in_words AI_CV_MirrorMove_EncouragedMovesToMirror, AI_CV_MirrorMove2
	if_random_less_than 128, AI_CV_MirrorMove_End
	score +2
	jump AI_CV_MirrorMove_End

AI_CV_MirrorMove2: @ 81DAC0A
	get_move TARGET
	if_in_words AI_CV_MirrorMove_EncouragedMovesToMirror, AI_CV_MirrorMove_End
	if_random_less_than 80, AI_CV_MirrorMove_End
	score -1

AI_CV_MirrorMove_End: @ 81DAC1D
	end

	.align 2
AI_CV_MirrorMove_EncouragedMovesToMirror: @ 81DAC20
	.2byte MOVE_SLEEP_POWDER
	.2byte MOVE_LOVELY_KISS
	.2byte MOVE_SPORE
	.2byte MOVE_HYPNOSIS
	.2byte MOVE_SING
	.2byte MOVE_GRASS_WHISTLE
	.2byte MOVE_SHADOW_PUNCH
	.2byte MOVE_SAND_ATTACK
	.2byte MOVE_SMOKESCREEN
	.2byte MOVE_TOXIC
	.2byte MOVE_GUILLOTINE
	.2byte MOVE_HORN_DRILL
	.2byte MOVE_FISSURE
	.2byte MOVE_SHEER_COLD
	.2byte MOVE_CROSS_CHOP
	.2byte MOVE_AEROBLAST
	.2byte MOVE_CONFUSE_RAY
	.2byte MOVE_SWEET_KISS
	.2byte MOVE_SCREECH
	.2byte MOVE_COTTON_SPORE
	.2byte MOVE_SCARY_FACE
	.2byte MOVE_FAKE_TEARS
	.2byte MOVE_METAL_SOUND
	.2byte MOVE_THUNDER_WAVE
	.2byte MOVE_GLARE
	.2byte MOVE_POISON_POWDER
	.2byte MOVE_SHADOW_BALL
	.2byte MOVE_DYNAMIC_PUNCH
	.2byte MOVE_HYPER_BEAM
	.2byte MOVE_EXTREME_SPEED
	.2byte MOVE_THIEF
	.2byte MOVE_COVET
	.2byte MOVE_ATTRACT
	.2byte MOVE_SWAGGER
	.2byte MOVE_TORMENT
	.2byte MOVE_FLATTER
	.2byte MOVE_TRICK
	.2byte MOVE_SUPERPOWER
	.2byte MOVE_SKILL_SWAP
	.2byte -1

AI_CV_AttackUp: @ 81DAC70
	if_stat_level_less_than USER, ATTACK, 9, AI_CV_AttackUp2
	if_random_less_than 100, AI_CV_AttackUp3
	score -1
	jump AI_CV_AttackUp3

AI_CV_AttackUp2: @ 81DAC85
	if_hp_not_equal USER, 100, AI_CV_AttackUp3
	if_random_less_than 128, AI_CV_AttackUp3
	score +2

AI_CV_AttackUp3: @ 81DAC94
	if_hp_more_than USER, 70, AI_CV_AttackUp_End
	if_hp_less_than USER, 40, AI_CV_AttackUp_ScoreDown2
	if_random_less_than 40, AI_CV_AttackUp_End

AI_CV_AttackUp_ScoreDown2: @ 81DACA8
	score -2

AI_CV_AttackUp_End: @ 81DACAA
	end

AI_CV_DefenseUp: @ 81DACAB
	if_stat_level_less_than USER, DEFENSE, 9, AI_CV_DefenseUp2
	if_random_less_than 100, AI_CV_DefenseUp3
	score -1
	jump AI_CV_DefenseUp3

AI_CV_DefenseUp2: @ 81DACC0
	if_hp_not_equal USER, 100, AI_CV_DefenseUp3
	if_random_less_than 128, AI_CV_DefenseUp3
	score +2

AI_CV_DefenseUp3: @ 81DACCF
	if_hp_less_than USER, 70, AI_CV_DefenseUp4
	if_random_less_than 200, AI_CV_DefenseUp_End

AI_CV_DefenseUp4: @ 81DACDC
	if_hp_less_than USER, 40, AI_CV_DefenseUp_ScoreDown2
	get_move TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_DefenseUp5
	get_move TARGET
	get_move_type_from_result
	if_not_in_bytes AI_CV_DefenseUp_PhysicalTypes, AI_CV_DefenseUp_ScoreDown2
	if_random_less_than 60, AI_CV_DefenseUp_End

AI_CV_DefenseUp5: @ 81DACFE
	if_random_less_than 60, AI_CV_DefenseUp_End

AI_CV_DefenseUp_ScoreDown2: @ 81DAD04
	score -2

AI_CV_DefenseUp_End: @ 81DAD06
	end

AI_CV_DefenseUp_PhysicalTypes: @ 81DAD07
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_FLYING
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_SpeedUp: @ 81DAD11
	if_would_go_first USER, AI_CV_SpeedUp2
	score -3
	jump AI_CV_SpeedUp_End

AI_CV_SpeedUp2: @ 81DAD1E
	if_random_less_than 70, AI_CV_SpeedUp_End
	score +3

AI_CV_SpeedUp_End: @ 81DAD26
	end

AI_CV_SpAtkUp: @ 81DAD27
	if_stat_level_less_than USER, SP_ATTACK, 9, AI_CV_SpAtkUp2
	if_random_less_than 100, AI_CV_SpAtkUp3
	score -1
	jump AI_CV_SpAtkUp3

AI_CV_SpAtkUp2: @ 81DAD3C
	if_hp_not_equal USER, 100, AI_CV_SpAtkUp3
	if_random_less_than 128, AI_CV_SpAtkUp3
	score +2

AI_CV_SpAtkUp3: @ 81DAD4B
	if_hp_more_than USER, 70, AI_CV_SpAtkUp_End
	if_hp_less_than USER, 40, AI_CV_SpAtkUp_ScoreDown2
	if_random_less_than 70, AI_CV_SpAtkUp_End

AI_CV_SpAtkUp_ScoreDown2: @ 81DAD5F
	score -2

AI_CV_SpAtkUp_End: @ 81DAD61
	end

AI_CV_SpDefUp: @ 81DAD62
	if_stat_level_less_than USER, SP_DEFENSE, 9, AI_CV_SpDefUp2
	if_random_less_than 100, AI_CV_SpDefUp3
	score -1
	jump AI_CV_SpDefUp3

AI_CV_SpDefUp2: @ 81DAD77
	if_hp_not_equal USER, 100, AI_CV_SpDefUp3
	if_random_less_than 128, AI_CV_SpDefUp3
	score +2

AI_CV_SpDefUp3: @ 81DAD86
	if_hp_less_than USER, 70, AI_CV_SpDefUp4
	if_random_less_than 200, AI_CV_SpDefUp_End

AI_CV_SpDefUp4: @ 81DAD93
	if_hp_less_than USER, 40, AI_CV_SpDefUp_ScoreDown2
	get_move TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_SpDefUp5
	get_move TARGET
	get_move_type_from_result
	if_in_bytes AI_CV_SpDefUp_PhysicalTypes, AI_CV_SpDefUp_ScoreDown2
	if_random_less_than 60, AI_CV_SpDefUp_End

AI_CV_SpDefUp5: @ 81DADB5
	if_random_less_than 60, AI_CV_SpDefUp_End

AI_CV_SpDefUp_ScoreDown2: @ 81DADBB
	score -2

AI_CV_SpDefUp_End: @ 81DADBD
	end

AI_CV_SpDefUp_PhysicalTypes: @ 81DADBE
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_FLYING
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_AccuracyUp: @ 81DADC8
	if_stat_level_less_than USER, ACCURACY, 9, AI_CV_AccuracyUp2
	if_random_less_than 50, AI_CV_AccuracyUp2
	score -2

AI_CV_AccuracyUp2: @ 81DADD8
	if_hp_more_than USER, 70, AI_CV_AccuracyUp_End
	score -2

AI_CV_AccuracyUp_End: @ 81DADE1
	end

AI_CV_EvasionUp: @ 81DADE2
	if_hp_less_than USER, 90, AI_CV_EvasionUp2
	if_random_less_than 100, AI_CV_EvasionUp2
	score +3

AI_CV_EvasionUp2: @ 81DADF1
	if_stat_level_less_than USER, EVASION, 9, AI_CV_EvasionUp3
	if_random_less_than 128, AI_CV_EvasionUp3
	score -1

AI_CV_EvasionUp3: @ 81DAE01
	if_not_status TARGET, TOX, AI_CV_EvasionUp5
	if_hp_more_than USER, 50, AI_CV_EvasionUp4
	if_random_less_than 80, AI_CV_EvasionUp5

AI_CV_EvasionUp4: @ 81DAE18
	if_random_less_than 50, AI_CV_EvasionUp5
	score +3

AI_CV_EvasionUp5: @ 81DAE20
	if_not_status3 TARGET, S_LEECH_SEED, AI_CV_EvasionUp6
	if_random_less_than 70, AI_CV_EvasionUp6
	score +3

AI_CV_EvasionUp6: @ 81DAE32
	if_not_status3 USER, S_ROOTED, AI_CV_EvasionUp7
	if_random_less_than 128, AI_CV_EvasionUp7
	score +2

AI_CV_EvasionUp7: @ 81DAE44
	if_not_status2 TARGET, S_CURSED, AI_CV_EvasionUp8
	if_random_less_than 70, AI_CV_EvasionUp8
	score +3

AI_CV_EvasionUp8: @ 81DAE56
	if_hp_more_than USER, 70, AI_CV_EvasionUp_End
	if_stat_level_equal USER, EVASION, 6, AI_CV_EvasionUp_End
	if_hp_less_than USER, 40, AI_CV_EvasionUp_ScoreDown2
	if_hp_less_than TARGET, 40, AI_CV_EvasionUp_ScoreDown2
	if_random_less_than 70, AI_CV_EvasionUp_End

AI_CV_EvasionUp_ScoreDown2: @ 81DAE79
	score -2

AI_CV_EvasionUp_End: @ 81DAE7B
	end

AI_CV_AlwaysHit: @ 81DAE7C
	if_stat_level_more_than TARGET, EVASION, 10, AI_CV_AlwaysHit_ScoreUp1
	if_stat_level_less_than USER, ACCURACY, 2, AI_CV_AlwaysHit_ScoreUp1
	if_stat_level_more_than TARGET, EVASION, 8, AI_CV_AlwaysHit2
	if_stat_level_less_than USER, ACCURACY, 4, AI_CV_AlwaysHit2
	jump AI_CV_AlwaysHit_End

AI_CV_AlwaysHit_ScoreUp1: @ 81DAEA1
	score +1

AI_CV_AlwaysHit2: @ 81DAEA3
	if_random_less_than 100, AI_CV_AlwaysHit_End
	score +1

AI_CV_AlwaysHit_End: @ 81DAEAB
	end

AI_CV_AttackDown: @ 81DAEAC
	if_stat_level_equal TARGET, ATTACK, 6, AI_CV_AttackDown3
	score -1
	if_hp_more_than USER, 90, AI_CV_AttackDown2
	score -1

AI_CV_AttackDown2: @ 81DAEBF
	if_stat_level_more_than TARGET, ATTACK, 3, AI_CV_AttackDown3
	if_random_less_than 50, AI_CV_AttackDown3
	score -2

AI_CV_AttackDown3: @ 81DAECF
	if_hp_more_than TARGET, 70, AI_CV_AttackDown4
	score -2

AI_CV_AttackDown4: @ 81DAED8
	get_type ENEMY_TYPE1
	if_in_bytes AI_CV_AttackDown_UnknownTypeList, AI_CV_AttackDown_End
	get_type PLAYER_TYPE1
	if_in_bytes AI_CV_AttackDown_UnknownTypeList, AI_CV_AttackDown_End
	if_random_less_than 50, AI_CV_AttackDown_End
	score -2

AI_CV_AttackDown_End: @ 81DAEF6
	end

AI_CV_AttackDown_UnknownTypeList: @ 81DAEF7
@ why these types specifically?
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_STEEL
	.byte -1

AI_CV_DefenseDown: @ 81DAEFE
	if_hp_less_than USER, 70, AI_CV_DefenseDown2
	if_stat_level_more_than TARGET, DEFENSE, 3, AI_CV_DefenseDown3

AI_CV_DefenseDown2: @ 81DAF0D
	if_random_less_than 50, AI_CV_DefenseDown3
	score -2

AI_CV_DefenseDown3: @ 81DAF15
	if_hp_more_than TARGET, 70, AI_CV_DefenseDown_End
	score -2

AI_CV_DefenseDown_End: @ 81DAF1E
	end

AI_CV_SpeedDownFromChance: @ 81DAF1F
	if_move MOVE_ICY_WIND, AI_CV_SpeedDown
	if_move MOVE_ROCK_TOMB, AI_CV_SpeedDown
	if_move MOVE_MUD_SHOT, AI_CV_SpeedDown
	end

AI_CV_SpeedDown: @ 81DAF35
	if_would_go_first USER, AI_CV_SpeedDown2
	score -3
	jump AI_CV_SpeedDown_End

AI_CV_SpeedDown2: @ 81DAF42
	if_random_less_than 70, AI_CV_SpeedDown_End
	score +2

AI_CV_SpeedDown_End: @ 81DAF4A
	end

AI_CV_SpAtkDown: @ 81DAF4B
	if_stat_level_equal TARGET, ATTACK, 6, AI_CV_SpAtkDown3
	score -1
	if_hp_more_than USER, 90, AI_CV_SpAtkDown2
	score -1

AI_CV_SpAtkDown2: @ 81DAF5E
	if_stat_level_more_than TARGET, SP_ATTACK, 3, AI_CV_SpAtkDown3
	if_random_less_than 50, AI_CV_SpAtkDown3
	score -2

AI_CV_SpAtkDown3: @ 81DAF6E
	if_hp_more_than TARGET, 70, AI_CV_SpAtkDown4
	score -2

AI_CV_SpAtkDown4: @ 81DAF77
	get_type ENEMY_TYPE1
	if_in_bytes AI_CV_SpAtkDown_SpecialTypeList, AI_CV_SpAtkDown_End
	get_type PLAYER_TYPE1
	if_in_bytes AI_CV_SpAtkDown_SpecialTypeList, AI_CV_SpAtkDown_End
	if_random_less_than 50, AI_CV_SpAtkDown_End
	score -2

AI_CV_SpAtkDown_End: @ 81DAF95
	end

AI_CV_SpAtkDown_SpecialTypeList: @ 81DAF96
	.byte TYPE_FIRE
	.byte TYPE_WATER
	.byte TYPE_GRASS
	.byte TYPE_ELECTRIC
	.byte TYPE_PSYCHIC
	.byte TYPE_ICE
	.byte TYPE_DRAGON
	.byte TYPE_DARK
	.byte -1

AI_CV_SpDefDown: @ 81DAF9F
	if_hp_less_than USER, 70, AI_CV_SpDefDown2
	if_stat_level_more_than TARGET, SP_DEFENSE, 3, AI_CV_SpDefDown3

AI_CV_SpDefDown2: @ 81DAFAE
	if_random_less_than 50, AI_CV_SpDefDown3
	score -2

AI_CV_SpDefDown3: @ 81DAFB6
	if_hp_more_than TARGET, 70, AI_CV_SpDefDown_End
	score -2

AI_CV_SpDefDown_End: @ 81DAFBF
	end

AI_CV_AccuracyDown: @ 81DAFC0
	if_hp_less_than USER, 70, AI_CV_AccuracyDown2
	if_hp_more_than TARGET, 70, AI_CV_AccuracyDown3

AI_CV_AccuracyDown2: @ 81DAFCE
	if_random_less_than 100, AI_CV_AccuracyDown3
	score -1

AI_CV_AccuracyDown3: @ 81DAFD6
	if_stat_level_more_than USER, ACCURACY, 4, AI_CV_AccuracyDown4
	if_random_less_than 80, AI_CV_AccuracyDown4
	score -2

AI_CV_AccuracyDown4: @ 81DAFE6
	if_not_status TARGET, TOX, AI_CV_AccuracyDown5
	if_random_less_than 70, AI_CV_AccuracyDown5
	score +2

AI_CV_AccuracyDown5: @ 81DAFF8
	if_not_status3 TARGET, S_LEECH_SEED, AI_CV_AccuracyDown6
	if_random_less_than 70, AI_CV_AccuracyDown6
	score +2

AI_CV_AccuracyDown6: @ 81DB00A
	if_not_status3 USER, S_ROOTED, AI_CV_AccuracyDown7
	if_random_less_than 128, AI_CV_AccuracyDown7
	score +1

AI_CV_AccuracyDown7: @ 81DB01C
	if_not_status2 TARGET, S_CURSED, AI_CV_AccuracyDown8
	if_random_less_than 70, AI_CV_AccuracyDown8
	score +2

AI_CV_AccuracyDown8: @ 81DB02E
	if_hp_more_than USER, 70, AI_CV_AccuracyDown_End
	if_stat_level_equal TARGET, ACCURACY, 6, AI_CV_AccuracyDown_End
	if_hp_less_than USER, 40, AI_CV_AccuracyDown_ScoreDown2
	if_hp_less_than TARGET, 40, AI_CV_AccuracyDown_ScoreDown2
	if_random_less_than 70, AI_CV_AccuracyDown_End

AI_CV_AccuracyDown_ScoreDown2: @ 81DB051
	score -2

AI_CV_AccuracyDown_End: @ 81DB053
	end

AI_CV_EvasionDown: @ 81DB054
	if_hp_less_than USER, 70, AI_CV_EvasionDown2
	if_stat_level_more_than TARGET, EVASION, 3, AI_CV_EvasionDown3

AI_CV_EvasionDown2: @ 81DB063
	if_random_less_than 50, AI_CV_EvasionDown3
	score -2

AI_CV_EvasionDown3: @ 81DB06B
	if_hp_more_than TARGET, 70, AI_CV_EvasionDown_End
	score -2

AI_CV_EvasionDown_End: @ 81DB074
	end

AI_CV_Haze: @ 81DB075
	if_stat_level_more_than USER, ATTACK, 8, AI_CV_Haze2
	if_stat_level_more_than USER, DEFENSE, 8, AI_CV_Haze2
	if_stat_level_more_than USER, SP_ATTACK, 8, AI_CV_Haze2
	if_stat_level_more_than USER, SP_DEFENSE, 8, AI_CV_Haze2
	if_stat_level_more_than USER, EVASION, 8, AI_CV_Haze2
	if_stat_level_less_than TARGET, ATTACK, 4, AI_CV_Haze2
	if_stat_level_less_than TARGET, DEFENSE, 4, AI_CV_Haze2
	if_stat_level_less_than TARGET, SP_ATTACK, 4, AI_CV_Haze2
	if_stat_level_less_than TARGET, SP_DEFENSE, 4, AI_CV_Haze2
	if_stat_level_less_than TARGET, ACCURACY, 4, AI_CV_Haze2
	jump AI_CV_Haze3

AI_CV_Haze2: @ 81DB0CA
	if_random_less_than 50, AI_CV_Haze3
	score -3

AI_CV_Haze3: @ 81DB0D2
	if_stat_level_more_than TARGET, ATTACK, 8, AI_CV_Haze4
	if_stat_level_more_than TARGET, DEFENSE, 8, AI_CV_Haze4
	if_stat_level_more_than TARGET, SP_ATTACK, 8, AI_CV_Haze4
	if_stat_level_more_than TARGET, SP_DEFENSE, 8, AI_CV_Haze4
	if_stat_level_more_than TARGET, EVASION, 8, AI_CV_Haze4
	if_stat_level_less_than USER, ATTACK, 4, AI_CV_Haze4
	if_stat_level_less_than USER, DEFENSE, 4, AI_CV_Haze4
	if_stat_level_less_than USER, SP_ATTACK, 4, AI_CV_Haze4
	if_stat_level_less_than USER, SP_DEFENSE, 4, AI_CV_Haze4
	if_stat_level_less_than USER, ACCURACY, 4, AI_CV_Haze4
	if_random_less_than 50, AI_CV_Haze_End
	score -1
	jump AI_CV_Haze_End

AI_CV_Haze4: @ 81DB12F
	if_random_less_than 50, AI_CV_Haze_End
	score +3

AI_CV_Haze_End: @ 81DB137
	end

AI_CV_Bide: @ 81DB138
	if_hp_more_than USER, 90, AI_CV_Bide_End
	score -2

AI_CV_Bide_End: @ 81DB141
	end

AI_CV_Roar: @ 81DB142
	if_stat_level_more_than TARGET, ATTACK, 8, AI_CV_Roar2
	if_stat_level_more_than TARGET, DEFENSE, 8, AI_CV_Roar2
	if_stat_level_more_than TARGET, SP_ATTACK, 8, AI_CV_Roar2
	if_stat_level_more_than TARGET, SP_DEFENSE, 8, AI_CV_Roar2
	if_stat_level_more_than TARGET, EVASION, 8, AI_CV_Roar2
	score -3
	jump AI_CV_Roar_End

AI_CV_Roar2: @ 81DB171
	if_random_less_than 128, AI_CV_Roar_End
	score +2

AI_CV_Roar_End: @ 81DB179
	end

AI_CV_Conversion: @ 81DB17A
	if_hp_more_than USER, 90, AI_CV_Conversion2
	score -2

AI_CV_Conversion2: @ 81DB183
	get_turn_count
	if_equal 0, AI_CV_Conversion_End
	if_random_less_than 200, Score_Minus2

AI_CV_Conversion_End: @ 81DB190
	end

AI_CV_HealWeather: @ 81DB191
	get_weather
	if_equal BATTLE_WEATHER_HAIL, AI_CV_HealWeather_ScoreDown2
	if_equal BATTLE_WEATHER_RAIN, AI_CV_HealWeather_ScoreDown2
	if_equal BATTLE_WEATHER_SANDSTORM, AI_CV_HealWeather_ScoreDown2
	jump AI_CV_Heal

AI_CV_HealWeather_ScoreDown2: @ 81DB1A9
	score -2

AI_CV_Heal: @ 81DB1AB
	if_hp_equal USER, 100, AI_CV_Heal3
	if_would_go_first USER, AI_CV_Heal4
	score -8
	jump AI_CV_Heal_End

AI_CV_Heal2: @ unreferenced
	if_hp_less_than USER, 50, AI_CV_Heal5
	if_hp_more_than USER, 80, AI_CV_Heal3
	if_random_less_than 70, AI_CV_Heal5

AI_CV_Heal3: @ 81DB1D3
	score -3
	jump AI_CV_Heal_End

AI_CV_Heal4: @ 81DB1DA
	if_hp_less_than USER, 70, AI_CV_Heal5
	if_random_less_than 30, AI_CV_Heal5
	score -3
	jump AI_CV_Heal_End

AI_CV_Heal5: @ 81DB1EE
	if_not_move_effect TARGET, EFFECT_SNATCH, AI_CV_Heal6
	if_random_less_than 100, AI_CV_Heal_End

AI_CV_Heal6: @ 81DB1FB
	if_random_less_than 20, AI_CV_Heal_End
	score +2

AI_CV_Heal_End: @ 81DB203
	end

AI_CV_Toxic: @ 81DB204
	if_user_cant_damage AI_CV_Toxic3
	if_hp_more_than USER, 50, AI_CV_Toxic2
	if_random_less_than 50, AI_CV_Toxic2
	score -3

AI_CV_Toxic2: @ 81DB218
	if_hp_more_than TARGET, 50, AI_CV_Toxic3
	if_random_less_than 50, AI_CV_Toxic3
	score -3

AI_CV_Toxic3: @ 81DB227
	if_move_effect USER, EFFECT_SPECIAL_DEFENSE_UP, AI_CV_Toxic4
	if_move_effect USER, EFFECT_PROTECT, AI_CV_Toxic4
	jump AI_CV_Toxic_End

AI_CV_Toxic4: @ 81DB23A
	if_random_less_than 60, AI_CV_Toxic_End
	score +2

AI_CV_Toxic_End: @ 81DB242
	end

AI_CV_LightScreen: @ 81DB243
	if_hp_less_than USER, 50, AI_CV_LightScreen_ScoreDown2
	get_type ENEMY_TYPE1
	if_in_bytes AI_CV_LightScreen_SpecialTypeList, AI_CV_LightScreen_End
	get_type PLAYER_TYPE1
	if_in_bytes AI_CV_LightScreen_SpecialTypeList, AI_CV_LightScreen_End
	if_random_less_than 50, AI_CV_LightScreen_End

AI_CV_LightScreen_ScoreDown2: @ 81DB266
	score -2

AI_CV_LightScreen_End: @ 81DB268
	end

AI_CV_LightScreen_SpecialTypeList: @ 81DB269
	.byte TYPE_FIRE
	.byte TYPE_WATER
	.byte TYPE_GRASS
	.byte TYPE_ELECTRIC
	.byte TYPE_PSYCHIC
	.byte TYPE_ICE
	.byte TYPE_DRAGON
	.byte TYPE_DARK
	.byte -1

AI_CV_Rest: @ 81DB272
	if_would_go_first USER, AI_CV_Rest4
	if_hp_not_equal USER, 100, AI_CV_Rest2
	score -8
	jump AI_CV_Rest_End

AI_CV_Rest2: @ 81DB286
	if_hp_less_than USER, 40, AI_CV_Rest6
	if_hp_more_than USER, 50, AI_CV_Rest3
	if_random_less_than 70, AI_CV_Rest6

AI_CV_Rest3: @ 81DB29A
	score -3
	jump AI_CV_Rest_End

AI_CV_Rest4: @ 81DB2A1
	if_hp_less_than USER, 60, AI_CV_Rest6
	if_hp_more_than USER, 70, AI_CV_Rest5
	if_random_less_than 50, AI_CV_Rest6

AI_CV_Rest5: @ 81DB2B5
	score -3
	jump AI_CV_Rest_End

AI_CV_Rest6: @ 81DB2BC
	if_not_move_effect TARGET, EFFECT_SNATCH, AI_CV_Rest7
	if_random_less_than 50, AI_CV_Rest_End

AI_CV_Rest7: @ 81DB2C9
	if_random_less_than 10, AI_CV_Rest_End
	score +3

AI_CV_Rest_End: @ 81DB2D1
	end

AI_CV_OneHitKO: @ 81DB2D2
	end

AI_CV_SuperFang: @ 81DB2D3
	if_hp_more_than TARGET, 50, AI_CV_SuperFang_End
	score -1

AI_CV_SuperFang_End: @ 81DB2DC
	end

AI_CV_Trap: @ 81DB2DD
	if_status TARGET, TOX, AI_CV_Trap2
	if_status2 TARGET, S_CURSED, AI_CV_Trap2
	if_status3 TARGET, S_PERISH_SONG, AI_CV_Trap2
	if_status2 TARGET, S_INFATUATED, AI_CV_Trap2
	jump AI_CV_Trap_End

AI_CV_Trap2: @ 81DB30A
	if_random_less_than 128, AI_CV_Trap_End
	score +1

AI_CV_Trap_End: @ 81DB312
	end

AI_CV_HighCrit: @ 81DB313
	if_damage_bonus 10, AI_CV_HighCrit_End
	if_damage_bonus 20, AI_CV_HighCrit_End
	if_damage_bonus 80, AI_CV_HighCrit2
	if_damage_bonus 160, AI_CV_HighCrit2
	if_random_less_than 128, AI_CV_HighCrit_End

AI_CV_HighCrit2: @ 81DB331
	if_random_less_than 128, AI_CV_HighCrit_End
	score +1

AI_CV_HighCrit_End: @ 81DB339
	end

AI_CV_Flatter: @ 81DB33A
	if_random_less_than 128, AI_CV_Confuse
	score +1

AI_CV_Confuse: @ 81DB342
	if_hp_more_than TARGET, 70, AI_CV_Confuse_End
	if_random_less_than 128, AI_CV_Confuse2
	score -1

AI_CV_Confuse2: @ 81DB351
	if_hp_more_than TARGET, 50, AI_CV_Confuse_End
	score -1
	if_hp_more_than TARGET, 30, AI_CV_Confuse_End
	score -1

AI_CV_Confuse_End: @ 81DB363
	end

AI_CV_Reflect: @ 81DB364
	if_hp_less_than USER, 50, AI_CV_Reflect_ScoreDown2
	get_type ENEMY_TYPE1
	if_in_bytes AI_CV_Reflect_PhysicalTypeList, AI_CV_Reflect_End
	get_type PLAYER_TYPE1
	if_in_bytes AI_CV_Reflect_PhysicalTypeList, AI_CV_Reflect_End
	if_random_less_than 50, AI_CV_Reflect_End

AI_CV_Reflect_ScoreDown2: @ 81DB387
	score -2

AI_CV_Reflect_End: @ 81DB389
	end

AI_CV_Reflect_PhysicalTypeList: @ 81DB38A
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_FLYING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_Poison: @ 81DB394
	if_hp_less_than USER, 50, AI_CV_Poison_ScoreDown1
	if_hp_more_than TARGET, 50, AI_CV_Poison_End

AI_CV_Poison_ScoreDown1: @ 81DB3A2
	score -1

AI_CV_Poison_End: @ 81DB3A4
	end

AI_CV_Paralyze: @ 81DB3A5
	if_would_go_first USER, AI_CV_Paralyze2
	if_hp_more_than USER, 70, AI_CV_Paralyze_End
	score -1
	jump AI_CV_Paralyze_End

AI_CV_Paralyze2: @ 81DB3B9
	if_random_less_than 20, AI_CV_Paralyze_End
	score +3

AI_CV_Paralyze_End: @ 81DB3C1
	end

AI_CV_VitalThrow: @ 81DB3C2
	if_would_go_first USER, AI_CV_VitalThrow_End
	if_hp_more_than USER, 60, AI_CV_VitalThrow_End
	if_hp_less_than USER, 40, AI_CV_VitalThrow2
	if_random_less_than 180, AI_CV_VitalThrow_End

AI_CV_VitalThrow2: @ 81DB3DC
	if_random_less_than 50, AI_CV_VitalThrow_End
	score -1

AI_CV_VitalThrow_End: @ 81DB3E4
	end

AI_CV_Substitute: @ 81DB3E5
	if_hp_more_than USER, 90, AI_CV_Substitute4
	if_hp_more_than USER, 70, AI_CV_Substitute3
	if_hp_more_than USER, 50, AI_CV_Substitute2
	if_random_less_than 100, AI_CV_Substitute2
	score -1

AI_CV_Substitute2: @ 81DB402
	if_random_less_than 100, AI_CV_Substitute3
	score -1

AI_CV_Substitute3: @ 81DB40A
	if_random_less_than 100, AI_CV_Substitute4
	score -1

AI_CV_Substitute4: @ 81DB412
	if_would_go_first USER, AI_CV_Substitute_End
	get_move TARGET
	get_move_effect_from_result
	if_equal EFFECT_SLEEP, AI_CV_Substitute5
	if_equal EFFECT_TOXIC, AI_CV_Substitute5
	if_equal EFFECT_POISON, AI_CV_Substitute5
	if_equal EFFECT_PARALYZE, AI_CV_Substitute5
	if_equal EFFECT_WILL_O_WISP, AI_CV_Substitute5
	if_equal EFFECT_CONFUSE, AI_CV_Substitute6
	if_equal EFFECT_LEECH_SEED, AI_CV_Substitute7
	jump AI_CV_Substitute_End

AI_CV_Substitute5: @ 81DB44A
	if_not_status TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, AI_CV_Substitute8
	jump AI_CV_Substitute_End

AI_CV_Substitute6: @ 81DB459
	if_not_status2 TARGET, S_CONFUSED, AI_CV_Substitute8
	jump AI_CV_Substitute_End

AI_CV_Substitute7: @ 81DB468
	if_status3 TARGET, S_LEECH_SEED, AI_CV_Substitute_End

AI_CV_Substitute8: @ 81DB472
	if_random_less_than 100, AI_CV_Substitute_End
	score +1

AI_CV_Substitute_End: @ 81DB47A
	end

AI_CV_Recharge: @ 81DB47B
	if_damage_bonus 10, AI_CV_Recharge_ScoreDown1
	if_damage_bonus 20, AI_CV_Recharge_ScoreDown1
	if_would_go_first USER, AI_CV_Recharge2
	if_hp_more_than USER, 40, AI_CV_Recharge_ScoreDown1
	jump AI_CV_Recharge_End

AI_CV_Recharge2: @ 81DB499
	if_hp_less_than USER, 60, AI_CV_Recharge_End

AI_CV_Recharge_ScoreDown1: @ 81DB4A0
	score -1

AI_CV_Recharge_End: @ 81DB4A2
	end

AI_CV_Disable: @ 81DB4A3
	if_would_go_first USER, AI_CV_Disable_End
	get_move TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_Disable2
	score +1
	jump AI_CV_Disable_End

AI_CV_Disable2: @ 81DB4B9
	if_random_less_than 100, AI_CV_Disable_End
	score -1

AI_CV_Disable_End: @ 81DB4C1
	end

AI_CV_Counter: @ 81DB4C2
	if_status TARGET, SLP, AI_CV_Counter_ScoreDown1
	if_status2 TARGET, S_INFATUATED, AI_CV_Counter_ScoreDown1
	if_status2 TARGET, S_CONFUSED, AI_CV_Counter_ScoreDown1
	if_hp_more_than USER, 30, AI_CV_Counter2
	if_random_less_than 10, AI_CV_Counter2
	score -1

AI_CV_Counter2: @ 81DB4EF
	if_hp_more_than USER, 50, AI_CV_Counter3
	if_random_less_than 100, AI_CV_Counter3
	score -1

AI_CV_Counter3: @ 81DB4FE
	get_move TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_Counter5
	if_not_taunted AI_CV_Counter4
	if_random_less_than 100, AI_CV_Counter4
	score +1

AI_CV_Counter4: @ 81DB514
	get_move TARGET
	get_move_type_from_result
	if_not_in_bytes AI_CV_Counter_PhysicalTypeList, AI_CV_Counter_ScoreDown1
	if_random_less_than 100, AI_CV_Counter_End
	score +1
	jump AI_CV_Counter_End

AI_CV_Counter5: @ 81DB52D
	if_not_taunted AI_CV_Counter6
	if_random_less_than 100, AI_CV_Counter6
	score +1

AI_CV_Counter6: @ 81DB53A
	get_type ENEMY_TYPE1
	if_in_bytes AI_CV_Counter_PhysicalTypeList, AI_CV_Counter_End
	get_type PLAYER_TYPE1
	if_in_bytes AI_CV_Counter_PhysicalTypeList, AI_CV_Counter_End
	if_random_less_than 50, AI_CV_Counter_End

AI_CV_Counter_ScoreDown1: @ 81DB556
	score -1

AI_CV_Counter_End: @ 81DB558
	end

AI_CV_Counter_PhysicalTypeList: @ 81DB559
	.byte TYPE_NORMAL
	.byte TYPE_FIGHTING
	.byte TYPE_FLYING
	.byte TYPE_POISON
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_BUG
	.byte TYPE_GHOST
	.byte TYPE_STEEL
	.byte -1

AI_CV_Encore: @ 81DB563
	if_last_move_did_damage TARGET, 0, AI_CV_Encore2
	if_would_go_first USER, AI_CV_Encore_ScoreDown2
	get_move TARGET
	get_move_effect_from_result
	if_not_in_bytes AI_CV_Encore_EncouragedMovesToEncore, AI_CV_Encore_ScoreDown2

AI_CV_Encore2: @ 81DB57C
	if_random_less_than 30, AI_CV_Encore_End
	score +3
	jump AI_CV_Encore_End

AI_CV_Encore_ScoreDown2: @ 81DB589
	score -2

AI_CV_Encore_End: @ 81DB58B
	end

AI_CV_Encore_EncouragedMovesToEncore: @ 81DB58C
	.byte EFFECT_DREAM_EATER
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_HAZE
	.byte EFFECT_ROAR
	.byte EFFECT_CONVERSION
	.byte EFFECT_TOXIC
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_REST
	.byte EFFECT_SUPER_FANG
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_CONFUSE
	.byte EFFECT_POISON
	.byte EFFECT_PARALYZE
	.byte EFFECT_LEECH_SEED
	.byte EFFECT_SPLASH
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_ENCORE
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_LOCK_ON
	.byte EFFECT_HEAL_BELL
	.byte EFFECT_MEAN_LOOK
	.byte EFFECT_NIGHTMARE
	.byte EFFECT_PROTECT
	.byte EFFECT_SKILL_SWAP
	.byte EFFECT_FORESIGHT
	.byte EFFECT_PERISH_SONG
	.byte EFFECT_SANDSTORM
	.byte EFFECT_ENDURE
	.byte EFFECT_SWAGGER
	.byte EFFECT_ATTRACT
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_RAIN_DANCE
	.byte EFFECT_SUNNY_DAY
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_PSYCH_UP
	.byte EFFECT_FUTURE_SIGHT
	.byte EFFECT_FAKE_OUT
	.byte EFFECT_STOCKPILE
	.byte EFFECT_SPIT_UP
	.byte EFFECT_SWALLOW
	.byte EFFECT_HAIL
	.byte EFFECT_TORMENT
	.byte EFFECT_WILL_O_WISP
	.byte EFFECT_FOLLOW_ME
	.byte EFFECT_CHARGE
	.byte EFFECT_TRICK
	.byte EFFECT_ROLE_PLAY
	.byte EFFECT_INGRAIN
	.byte EFFECT_RECYCLE
	.byte EFFECT_KNOCK_OFF
	.byte EFFECT_SKILL_SWAP
	.byte EFFECT_IMPRISON
	.byte EFFECT_REFRESH
	.byte EFFECT_GRUDGE
	.byte EFFECT_TEETER_DANCE
	.byte EFFECT_MUD_SPORT
	.byte EFFECT_WATER_SPORT
	.byte EFFECT_DRAGON_DANCE
	.byte EFFECT_CAMOUFLAGE
	.byte -1

AI_CV_PainSplit: @ 81DB5CB
	if_hp_less_than TARGET, 80, AI_CV_PainSplit_ScoreDown1
	if_would_go_first USER, AI_CV_PainSplit2
	if_hp_more_than USER, 40, AI_CV_PainSplit_ScoreDown1
	score +1
	jump AI_CV_PainSplit_End

AI_CV_PainSplit2: @ 81DB5E6
	if_hp_more_than USER, 60, AI_CV_PainSplit_ScoreDown1
	score +1
	jump AI_CV_PainSplit_End

AI_CV_PainSplit_ScoreDown1: @ 81DB5F4
	score -1

AI_CV_PainSplit_End: @ 81DB5F6
	end

AI_CV_Snore: @ 81DB5F7
	score +2
	end

AI_CV_LockOn: @ 81DB5FA
	if_random_less_than 128, AI_CV_LockOn_End
	score +2

AI_CV_LockOn_End: @ 81DB602
	end

AI_CV_SleepTalk: @ 81DB603
	score +2
	end

AI_CV_DestinyBond: @ 81DB606
	score -1
	if_would_go_first USER, AI_CV_DestinyBond_End
	if_hp_more_than USER, 70, AI_CV_DestinyBond_End
	if_random_less_than 128, AI_CV_DestinyBond2
	score +1

AI_CV_DestinyBond2: @ 81DB61D
	if_hp_more_than USER, 50, AI_CV_DestinyBond_End
	if_random_less_than 128, AI_CV_DestinyBond3
	score +1

AI_CV_DestinyBond3: @ 81DB62C
	if_hp_more_than USER, 30, AI_CV_DestinyBond_End
	if_random_less_than 100, AI_CV_DestinyBond_End
	score +2

AI_CV_DestinyBond_End: @ 81DB63B
	end

AI_CV_Flail: @ 81DB63C
	if_would_go_first USER, AI_CV_Flail2
	if_hp_more_than USER, 33, AI_CV_Flail_ScoreDown1
	if_hp_more_than USER, 20, AI_CV_Flail_End
	if_hp_less_than USER, 8, AI_CV_Flail_ScoreUp1
	jump AI_CV_Flail3

AI_CV_Flail2: @ 81DB65C
	if_hp_more_than USER, 60, AI_CV_Flail_ScoreDown1
	if_hp_more_than USER, 40, AI_CV_Flail_End
	jump AI_CV_Flail3

AI_CV_Flail_ScoreUp1: @ 81DB66F
	score +1

AI_CV_Flail3: @ 81DB671
	if_random_less_than 100, AI_CV_Flail_End
	score +1
	jump AI_CV_Flail_End

AI_CV_Flail_ScoreDown1: @ 81DB67E
	score -1

AI_CV_Flail_End: @ 81DB680
	end

AI_CV_HealBell: @ 81DB681
	if_status TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, AI_CV_HealBell_End
	if_status_in_party TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, AI_CV_HealBell_End
	score -5

AI_CV_HealBell_End: @ 81DB697
	end

AI_CV_Thief: @ 81DB698
	get_hold_effect TARGET
	if_not_in_bytes AI_CV_Thief_EncourageItemsToSteal, AI_CV_Thief_ScoreDown2
	if_random_less_than 50, AI_CV_Thief_End
	score +1
	jump AI_CV_Thief_End

AI_CV_Thief_ScoreDown2: @ 81DB6B0
	score -2

AI_CV_Thief_End: @ 81DB6B2
	end

AI_CV_Thief_EncourageItemsToSteal: @ 81DB6B3
	.byte HOLD_EFFECT_CURE_SLP
	.byte HOLD_EFFECT_CURE_STATUS
	.byte HOLD_EFFECT_RESTORE_HP
	.byte HOLD_EFFECT_EVASION_UP
	.byte HOLD_EFFECT_LEFTOVERS
	.byte HOLD_EFFECT_LIGHT_BALL
	.byte HOLD_EFFECT_THICK_CLUB
	.byte -1

AI_CV_Curse: @ 81DB6BB
	get_type ENEMY_TYPE2
	if_equal TYPE_GHOST, AI_CV_Curse4
	get_type PLAYER_TYPE2
	if_equal TYPE_GHOST, AI_CV_Curse4
	if_stat_level_more_than USER, DEFENSE, 9, AI_CV_Curse_End
	if_random_less_than 128, AI_CV_Curse2
	score +1

AI_CV_Curse2: @ 81DB6DB
	if_stat_level_more_than USER, DEFENSE, 7, AI_CV_Curse_End
	if_random_less_than 128, AI_CV_Curse3
	score +1

AI_CV_Curse3: @ 81DB6EB
	if_stat_level_more_than USER, DEFENSE, 6, AI_CV_Curse_End
	if_random_less_than 128, AI_CV_Curse_End
	score +1
	jump AI_CV_Curse_End

AI_CV_Curse4: @ 81DB700
	if_hp_more_than USER, 80, AI_CV_Curse_End
	score -1

AI_CV_Curse_End: @ 81DB709
	end

AI_CV_Protect: @ 81DB70A
	get_protect_count USER
	if_more_than 1, AI_CV_Protect_ScoreDown2
	if_status USER, TOX, AI_CV_Protect3
	if_status2 USER, S_CURSED, AI_CV_Protect3
	if_status3 USER, S_PERISH_SONG, AI_CV_Protect3
	if_status2 USER, S_INFATUATED, AI_CV_Protect3
	if_status3 USER, S_LEECH_SEED, AI_CV_Protect3
	if_status3 USER, S_YAWN, AI_CV_Protect3
	if_move_effect TARGET, EFFECT_RESTORE_HP, AI_CV_Protect3
	if_move_effect TARGET, EFFECT_DEFENSE_CURL, AI_CV_Protect3
	if_status TARGET, TOX, AI_CV_Protect_ScoreUp2
	if_status2 TARGET, S_CURSED, AI_CV_Protect_ScoreUp2
	if_status3 TARGET, S_PERISH_SONG, AI_CV_Protect_ScoreUp2
	if_status2 TARGET, S_INFATUATED, AI_CV_Protect_ScoreUp2
	if_status3 TARGET, S_LEECH_SEED, AI_CV_Protect_ScoreUp2
	if_status3 TARGET, S_YAWN, AI_CV_Protect_ScoreUp2
	get_move TARGET
	get_move_effect_from_result
	if_not_equal EFFECT_LOCK_ON, AI_CV_Protect_ScoreUp2
	jump AI_CV_Protect2

AI_CV_Protect_ScoreUp2: @ 81DB7A6
	score +2

AI_CV_Protect2: @ 81DB7A8
	get_protect_count USER
	if_equal 0, AI_CV_Protect_End
	score -1
	if_random_less_than 128, AI_CV_Protect_End
	score -1
	jump AI_CV_Protect_End

AI_CV_Protect3: @ 81DB7BF
	get_move TARGET
	get_move_effect_from_result
	if_not_equal EFFECT_LOCK_ON, AI_CV_Protect_End

AI_CV_Protect_ScoreDown2: @ 81DB7C8
	score -2

AI_CV_Protect_End: @ 81DB7CA
	end

AI_CV_Foresight: @ 81DB7CB
	get_type ENEMY_TYPE2
	if_equal TYPE_GHOST, AI_CV_Foresight2
	get_type PLAYER_TYPE2
	if_equal TYPE_GHOST, AI_CV_Foresight2
	if_stat_level_more_than USER, EVASION, 8, AI_CV_Foresight3
	score -2
	jump AI_CV_Foresight_End

AI_CV_Foresight2: @ 81DB7EA
	if_random_less_than 80, AI_CV_Foresight_End

AI_CV_Foresight3: @ 81DB7F0
	if_random_less_than 80, AI_CV_Foresight_End
	score +2

AI_CV_Foresight_End: @ 81DB7F8
	end

AI_CV_Endure: @ 81DB7F9
	if_hp_less_than USER, 4, AI_CV_Endure2
	if_hp_less_than USER, 35, AI_CV_Endure3

AI_CV_Endure2: @ 81DB807
	score -1
	jump AI_CV_Endure_End

AI_CV_Endure3: @ 81DB80E
	if_random_less_than 70, AI_CV_Endure_End
	score +1

AI_CV_Endure_End: @ 81DB816
	end

AI_CV_BatonPass: @ 81DB817
	if_stat_level_more_than USER, ATTACK, 8, AI_CV_BatonPass2
	if_stat_level_more_than USER, DEFENSE, 8, AI_CV_BatonPass2
	if_stat_level_more_than USER, SP_ATTACK, 8, AI_CV_BatonPass2
	if_stat_level_more_than USER, SP_DEFENSE, 8, AI_CV_BatonPass2
	if_stat_level_more_than USER, EVASION, 8, AI_CV_BatonPass2
	jump AI_CV_BatonPass5

AI_CV_BatonPass2: @ 81DB844
	if_would_go_first USER, AI_CV_BatonPass3
	if_hp_more_than USER, 60, AI_CV_BatonPass_End
	jump AI_CV_BatonPass4

AI_CV_BatonPass3: @ 81DB856
	if_hp_more_than USER, 70, AI_CV_BatonPass_End

AI_CV_BatonPass4: @ 81DB85D
	if_random_less_than 80, AI_CV_BatonPass_End
	score +2
	jump AI_CV_BatonPass_End

AI_CV_BatonPass5: @ 81DB86A
	if_stat_level_more_than USER, ATTACK, 7, AI_CV_BatonPass6
	if_stat_level_more_than USER, DEFENSE, 7, AI_CV_BatonPass6
	if_stat_level_more_than USER, SP_ATTACK, 7, AI_CV_BatonPass6
	if_stat_level_more_than USER, SP_DEFENSE, 7, AI_CV_BatonPass6
	if_stat_level_more_than USER, EVASION, 7, AI_CV_BatonPass6
	jump AI_CV_BatonPass_ScoreDown2

AI_CV_BatonPass6: @ 81DB897
	if_would_go_first USER, AI_CV_BatonPass7
	if_hp_more_than USER, 60, AI_CV_BatonPass_ScoreDown2
	jump AI_CV_BatonPass_End

AI_CV_BatonPass7: @ 81DB8A9
	if_hp_less_than USER, 70, AI_CV_BatonPass_End

AI_CV_BatonPass_ScoreDown2: @ 81DB8B0
	score -2

AI_CV_BatonPass_End: @ 81DB8B2
	end

AI_CV_Pursuit: @ 81DB8B3
	is_first_turn USER
	if_not_equal 0, AI_CV_Pursuit_End
	get_type ENEMY_TYPE1
	if_equal TYPE_GHOST, AI_CV_Pursuit2
	get_type ENEMY_TYPE1
	if_equal TYPE_PSYCHIC, AI_CV_Pursuit2
	get_type PLAYER_TYPE1
	if_equal TYPE_GHOST, AI_CV_Pursuit2
	get_type PLAYER_TYPE1
	if_equal TYPE_PSYCHIC, AI_CV_Pursuit2
	jump AI_CV_Pursuit_End

AI_CV_Pursuit2: @ 81DB8E0
	if_random_less_than 128, AI_CV_Pursuit_End
	score +1

AI_CV_Pursuit_End: @ 81DB8E8
	end

AI_CV_RainDance: @ 81DB8E9
	if_would_go_first TARGET, AI_CV_RainDance2
	get_ability USER
	if_equal ABILITY_SWIFT_SWIM, AI_CV_RainDance3

AI_CV_RainDance2: @ 81DB8F7
	if_hp_less_than USER, 40, AI_CV_RainDance_ScoreDown1
	get_weather
	if_equal BATTLE_WEATHER_HAIL, AI_CV_RainDance3
	if_equal BATTLE_WEATHER_SUN, AI_CV_RainDance3
	if_equal BATTLE_WEATHER_SANDSTORM, AI_CV_RainDance3
	get_ability USER
	if_equal ABILITY_RAIN_DISH, AI_CV_RainDance3
	jump AI_CV_RainDance_End

AI_CV_RainDance3: @ 81DB91E
	score +1
	jump AI_CV_RainDance_End

AI_CV_RainDance_ScoreDown1: @ 81DB925
	score -1

AI_CV_RainDance_End: @ 81DB927
	end

AI_CV_SunnyDay: @ 81DB928
	if_hp_less_than USER, 40, AI_CV_SunnyDay_ScoreDown1
	get_weather
	if_equal BATTLE_WEATHER_HAIL, AI_CV_SunnyDay2
	if_equal BATTLE_WEATHER_RAIN, AI_CV_SunnyDay2
	if_equal BATTLE_WEATHER_SANDSTORM, AI_CV_SunnyDay2
	jump AI_CV_SunnyDay_End

AI_CV_SunnyDay2: @ 81DB947
	score +1
	jump AI_CV_SunnyDay_End

AI_CV_SunnyDay_ScoreDown1: @ 81DB94E
	score -1

AI_CV_SunnyDay_End: @ 81DB950
	end

AI_CV_BellyDrum: @ 81DB951
	if_hp_less_than USER, 90, AI_CV_BellyDrum_ScoreDown2
	jump AI_CV_BellyDrum_End

AI_CV_BellyDrum_ScoreDown2: @ 81DB95D
	score -2

AI_CV_BellyDrum_End: @ 81DB95F
	end

AI_CV_PsychUp: @ 81DB960
	if_stat_level_more_than TARGET, ATTACK, 8, AI_CV_PsychUp2
	if_stat_level_more_than TARGET, DEFENSE, 8, AI_CV_PsychUp2
	if_stat_level_more_than TARGET, SP_ATTACK, 8, AI_CV_PsychUp2
	if_stat_level_more_than TARGET, SP_DEFENSE, 8, AI_CV_PsychUp2
	if_stat_level_more_than TARGET, EVASION, 8, AI_CV_PsychUp2
	jump AI_CV_PsychUp_ScoreDown2

AI_CV_PsychUp2: @ 81DB98D
	if_stat_level_less_than USER, ATTACK, 7, AI_CV_PsychUp3
	if_stat_level_less_than USER, DEFENSE, 7, AI_CV_PsychUp3
	if_stat_level_less_than USER, SP_ATTACK, 7, AI_CV_PsychUp3
	if_stat_level_less_than USER, SP_DEFENSE, 7, AI_CV_PsychUp3
	if_stat_level_less_than USER, EVASION, 7, AI_CV_PsychUp_ScoreUp1
	if_random_less_than 50, AI_CV_PsychUp_End
	jump AI_CV_PsychUp_ScoreDown2

AI_CV_PsychUp_ScoreUp1: @ 81DB9C0
	score +1

AI_CV_PsychUp3: @ 81DB9C2
	if_random_less_than 128, AI_CV_PsychUp_End
	score +1

AI_CV_PsychUp_ScoreDown2: @ 81DB9CA
	score -2

AI_CV_PsychUp_End: @ 81DB9CC
	end

AI_CV_MirrorCoat: @ 81DB9CD
	if_status TARGET, SLP, AI_CV_MirrorCoat_ScoreDown1
	if_status2 TARGET, S_INFATUATED, AI_CV_MirrorCoat_ScoreDown1
	if_status2 TARGET, S_CONFUSED, AI_CV_MirrorCoat_ScoreDown1
	if_hp_more_than USER, 30, AI_CV_MirrorCoat2
	if_random_less_than 10, AI_CV_MirrorCoat2
	score -1

AI_CV_MirrorCoat2: @ 81DB9FA
	if_hp_more_than USER, 50, AI_CV_MirrorCoat3
	if_random_less_than 100, AI_CV_MirrorCoat3
	score -1

AI_CV_MirrorCoat3: @ 81DBA09
	get_move TARGET
	get_move_power_from_result
	if_equal 0, AI_CV_MirrorCoat5
	if_not_taunted AI_CV_MirrorCoat4
	if_random_less_than 100, AI_CV_MirrorCoat4
	score +1

AI_CV_MirrorCoat4: @ 81DBA1F
	get_move TARGET
	get_move_type_from_result
	if_not_in_bytes AI_CV_MirrorCoat_SpecialTypeList, AI_CV_MirrorCoat_ScoreDown1
	if_random_less_than 100, AI_CV_MirrorCoat_End
	score +1
	jump AI_CV_MirrorCoat_End

AI_CV_MirrorCoat5: @ 81DBA38
	if_not_taunted AI_CV_MirrorCoat6
	if_random_less_than 100, AI_CV_MirrorCoat6
	score +1

AI_CV_MirrorCoat6: @ 81DBA45
	get_type ENEMY_TYPE1
	if_in_bytes AI_CV_MirrorCoat_SpecialTypeList, AI_CV_MirrorCoat_End
	get_type PLAYER_TYPE1
	if_in_bytes AI_CV_MirrorCoat_SpecialTypeList, AI_CV_MirrorCoat_End
	if_random_less_than 50, AI_CV_MirrorCoat_End

AI_CV_MirrorCoat_ScoreDown1: @ 81DBA61
	score -1

AI_CV_MirrorCoat_End: @ 81DBA63
	end

AI_CV_MirrorCoat_SpecialTypeList: @ 81DBA64
	.byte TYPE_FIRE
	.byte TYPE_WATER
	.byte TYPE_GRASS
	.byte TYPE_ELECTRIC
	.byte TYPE_PSYCHIC
	.byte TYPE_ICE
	.byte TYPE_DRAGON
	.byte TYPE_DARK
	.byte -1

AI_CV_ChargeUpMove: @ 81DBA6D
	if_damage_bonus 10, AI_CV_ChargeUpMove_ScoreDown2
	if_damage_bonus 20, AI_CV_ChargeUpMove_ScoreDown2
	if_move_effect TARGET, EFFECT_PROTECT, AI_CV_ChargeUpMove_ScoreDown2
	if_hp_more_than USER, 38, AI_CV_ChargeUpMove_End
	score -1
	jump AI_CV_ChargeUpMove_End

AI_CV_ChargeUpMove_ScoreDown2: @ 81DBA8E
	score -2

AI_CV_ChargeUpMove_End: @ 81DBA90
	end

AI_CV_Fly: @ 81DBA91
	if_not_move_effect TARGET, EFFECT_PROTECT, AI_CV_Fly2
	score -1
	jump AI_CV_Fly_End

AI_CV_Fly2: @ 81DBA9F
	if_status TARGET, TOX, AI_CV_Fly6
	if_status2 TARGET, S_CURSED, AI_CV_Fly6
	if_status3 TARGET, S_LEECH_SEED, AI_CV_Fly6
	get_weather
	if_equal BATTLE_WEATHER_HAIL, AI_CV_Fly3
	if_equal BATTLE_WEATHER_SANDSTORM, AI_CV_Fly4
	jump AI_CV_Fly5

AI_CV_Fly3: @ 81DBACF
	get_type ENEMY_TYPE2
	if_in_bytes AI_CV_Fly_TypesToEncourage, AI_CV_Fly6
	get_type PLAYER_TYPE2
	if_in_bytes AI_CV_Fly_TypesToEncourage, AI_CV_Fly6
	jump AI_CV_Fly5

AI_CV_Fly4: @ 81DBAEA
	get_type ENEMY_TYPE2
	if_equal TYPE_ICE, AI_CV_Fly6
	get_type PLAYER_TYPE2
	if_equal TYPE_ICE, AI_CV_Fly6

AI_CV_Fly5: @ 81DBAFA
	if_would_go_first USER, AI_CV_Fly_End
	get_move TARGET
	get_move_effect_from_result
	if_not_equal EFFECT_LOCK_ON, AI_CV_Fly6
	jump AI_CV_Fly_End

AI_CV_Fly6: @ 81DBB0E
	if_random_less_than 80, AI_CV_Fly_End
	score +1

AI_CV_Fly_End: @ 81DBB16
	end

AI_CV_Fly_TypesToEncourage: @ 81DBB17
	.byte TYPE_GROUND
	.byte TYPE_ROCK
	.byte TYPE_STEEL
	.byte -1

AI_CV_FakeOut: @ 81DBB1B
	score +2
	end

AI_CV_SpitUp: @ 81DBB1E
	get_stockpile_count USER
	if_less_than 2, AI_CV_SpitUp_End
	if_random_less_than 80, AI_CV_SpitUp_End
	score +2

AI_CV_SpitUp_End: @ 81DBB2E
	end

AI_CV_Hail: @ 81DBB2F
	if_hp_less_than USER, 40, AI_CV_Hail_ScoreDown1
	get_weather
	if_equal BATTLE_WEATHER_SUN, AI_CV_Hail2
	if_equal BATTLE_WEATHER_RAIN, AI_CV_Hail2
	if_equal BATTLE_WEATHER_SANDSTORM, AI_CV_Hail2
	jump AI_CV_Hail_End

AI_CV_Hail2: @ 81DBB4E
	score +1
	jump AI_CV_Hail_End

AI_CV_Hail_ScoreDown1: @ 81DBB55
	score -1

AI_CV_Hail_End: @ 81DBB57
	end

AI_CV_Facade: @ 81DBB58
	if_not_status TARGET, PSN | BRN | PAR | TOX, AI_CV_Facade_End
	score +1

AI_CV_Facade_End: @ 81DBB64
	end

AI_CV_FocusPunch: @ 81DBB65
	if_damage_bonus 10, AI_CV_FocusPunch2
	if_damage_bonus 20, AI_CV_FocusPunch2
	if_status TARGET, SLP, AI_CV_FocusPunch_ScoreUp1
	if_status2 TARGET, S_INFATUATED, AI_CV_FocusPunch3
	if_status2 TARGET, S_CONFUSED, AI_CV_FocusPunch3
	is_first_turn USER
	if_not_equal 0, AI_CV_FocusPunch_End
	if_random_less_than 100, AI_CV_FocusPunch_End
	score +1
	jump AI_CV_FocusPunch_End

AI_CV_FocusPunch2: @ 81DBBA4
	score -1
	jump AI_CV_FocusPunch_End

AI_CV_FocusPunch3: @ 81DBBAB
	if_random_less_than 100, AI_CV_FocusPunch_End

AI_CV_FocusPunch_ScoreUp1: @ 81DBBB1
	score +1

AI_CV_FocusPunch_End: @ 81DBBB3
	end

AI_CV_SmellingSalt: @ 81DBBB4
	if_status TARGET, PAR, AI_CV_SmellingSalt_ScoreUp1
	jump AI_CV_SmellingSalt_End

AI_CV_SmellingSalt_ScoreUp1: @ 81DBBC3
	score +1

AI_CV_SmellingSalt_End: @ 81DBBC5
	end

AI_CV_Trick: @ 81DBBC6
	get_hold_effect USER
	if_in_bytes AI_CV_Trick_EffectsToEncourage2, AI_CV_Trick3
	if_in_bytes AI_CV_Trick_EffectsToEncourage, AI_CV_Trick4

AI_CV_Trick2: @ 81DBBDA
	score -3
	jump AI_CV_Trick_End

AI_CV_Trick3: @ 81DBBE1
	get_hold_effect TARGET
	if_in_bytes AI_CV_Trick_EffectsToEncourage2, AI_CV_Trick2
	score +5
	jump AI_CV_Trick_End

AI_CV_Trick4: @ 81DBBF3
	get_hold_effect TARGET
	if_in_bytes AI_CV_Trick_EffectsToEncourage, AI_CV_Trick2
	if_random_less_than 50, AI_CV_Trick_End
	score +2

AI_CV_Trick_End: @ 81DBC06
	end

AI_CV_Trick_EffectsToEncourage: @ 81DBC07
	.byte HOLD_EFFECT_CONFUSE_SPICY
	.byte HOLD_EFFECT_CONFUSE_DRY
	.byte HOLD_EFFECT_CONFUSE_SWEET
	.byte HOLD_EFFECT_CONFUSE_BITTER
	.byte HOLD_EFFECT_CONFUSE_SOUR
	.byte HOLD_EFFECT_MACHO_BRACE
	.byte HOLD_EFFECT_CHOICE_BAND
	.byte -1

AI_CV_Trick_EffectsToEncourage2: @ 81DBC0F
	.byte HOLD_EFFECT_CHOICE_BAND
	.byte -1

AI_CV_ChangeSelfAbility: @ 81DBC11
	get_ability USER
	if_in_bytes AI_CV_ChangeSelfAbility_AbilitiesToEncourage, AI_CV_ChangeSelfAbility2
	get_ability TARGET
	if_in_bytes AI_CV_ChangeSelfAbility_AbilitiesToEncourage, AI_CV_ChangeSelfAbility3

AI_CV_ChangeSelfAbility2: @ 81DBC27
	score -1
	jump AI_CV_ChangeSelfAbility_End

AI_CV_ChangeSelfAbility3: @ 81DBC2E
	if_random_less_than 50, AI_CV_ChangeSelfAbility_End
	score +2

AI_CV_ChangeSelfAbility_End: @ 81DBC36
	end

AI_CV_ChangeSelfAbility_AbilitiesToEncourage: @ 81DBC37
	.byte ABILITY_SPEED_BOOST
	.byte ABILITY_BATTLE_ARMOR
	.byte ABILITY_SAND_VEIL
	.byte ABILITY_STATIC
	.byte ABILITY_FLASH_FIRE
	.byte ABILITY_WONDER_GUARD
	.byte ABILITY_EFFECT_SPORE
	.byte ABILITY_SWIFT_SWIM
	.byte ABILITY_HUGE_POWER
	.byte ABILITY_RAIN_DISH
	.byte ABILITY_CUTE_CHARM
	.byte ABILITY_SHED_SKIN
	.byte ABILITY_MARVEL_SCALE
	.byte ABILITY_PURE_POWER
	.byte ABILITY_CHLOROPHYLL
	.byte ABILITY_SHIELD_DUST
	.byte -1

AI_CV_Superpower: @ 81DBC48
	if_damage_bonus 10, AI_CV_Superpower_ScoreDown1
	if_damage_bonus 20, AI_CV_Superpower_ScoreDown1
	if_stat_level_less_than USER, ATTACK, 6, AI_CV_Superpower_ScoreDown1
	if_would_go_first USER, AI_CV_Superpower2
	if_hp_more_than USER, 40, AI_CV_Superpower_ScoreDown1
	jump AI_CV_Superpower_End

AI_CV_Superpower2: @ 81DBC6E
	if_hp_less_than USER, 60, AI_CV_Superpower_End

AI_CV_Superpower_ScoreDown1: @ 81DBC75
	score -1

AI_CV_Superpower_End: @ 81DBC77
	end

AI_CV_MagicCoat: @ 81DBC78
	if_hp_more_than TARGET, 30, AI_CV_MagicCoat2
	if_random_less_than 100, AI_CV_MagicCoat2
	score -1

AI_CV_MagicCoat2: @ 81DBC87
	is_first_turn USER
	if_equal 0, AI_CV_MagicCoat4
	if_random_less_than 150, AI_CV_MagicCoat_End
	score +1
	jump AI_CV_MagicCoat_End

AI_CV_MagicCoat3: @ unreferenced
	if_random_less_than 50, AI_CV_MagicCoat_End

AI_CV_MagicCoat4: @ 81DBCA2
	if_random_less_than 30, AI_CV_MagicCoat_End
	score -1

AI_CV_MagicCoat_End: @ 81DBCAA
	end

AI_CV_Recycle: @ 81DBCAB
	get_item USER
	if_not_in_bytes AI_CV_Recycle_ItemsToEncourage, AI_CV_Recycle_ScoreDown2
	if_random_less_than 50, AI_CV_Recycle_End
	score +1
	jump AI_CV_Recycle_End

AI_CV_Recycle_ScoreDown2: @ 81DBCC3
	score -2

AI_CV_Recycle_End: @ 81DBCC5
	end

AI_CV_Recycle_ItemsToEncourage: @ 81DBCC6
	.byte ITEM_CHESTO_BERRY
	.byte ITEM_LUM_BERRY
	.byte ITEM_STARF_BERRY
	.byte -1

AI_CV_Revenge: @ 81DBCCA
	if_status TARGET, SLP, AI_CV_Revenge_ScoreDown2
	if_status2 TARGET, S_INFATUATED, AI_CV_Revenge_ScoreDown2
	if_status2 TARGET, S_CONFUSED, AI_CV_Revenge_ScoreDown2
	if_random_less_than 180, AI_CV_Revenge_ScoreDown2
	score +2
	jump AI_CV_Revenge_End

AI_CV_Revenge_ScoreDown2: @ 81DBCF5
	score -2

AI_CV_Revenge_End: @ 81DBCF7
	end

AI_CV_BrickBreak: @ 81DBCF8
	if_status4 TARGET, S_REFLECT, AI_CV_BrickBreak_ScoreUp1
	jump AI_CV_BrickBreak_End

AI_CV_BrickBreak_ScoreUp1: @ 81DBD07
	score +1

AI_CV_BrickBreak_End: @ 81DBD09
	end

AI_CV_KnockOff: @ 81DBD0A
	if_hp_less_than TARGET, 30, AI_CV_KnockOff_End
	is_first_turn USER
	if_more_than 0, AI_CV_KnockOff_End
	if_random_less_than 180, AI_CV_KnockOff_End
	score +1

AI_CV_KnockOff_End: @ 81DBD21
	end

AI_CV_Endeavor: @ 81DBD22
	if_hp_less_than TARGET, 70, AI_CV_Endeavor_ScoreDown1
	if_would_go_first USER, AI_CV_Endeavor2
	if_hp_more_than USER, 40, AI_CV_Endeavor_ScoreDown1
	score +1
	jump AI_CV_Endeavor_End

AI_CV_Endeavor2: @ 81DBD3D
	if_hp_more_than USER, 50, AI_CV_Endeavor_ScoreDown1
	score +1
	jump AI_CV_Endeavor_End

AI_CV_Endeavor_ScoreDown1: @ 81DBD4B
	score -1

AI_CV_Endeavor_End: @ 81DBD4D
	end

AI_CV_Eruption: @ 81DBD4E
	if_damage_bonus 10, AI_CV_Eruption_ScoreDown1
	if_damage_bonus 20, AI_CV_Eruption_ScoreDown1
	if_would_go_first USER, AI_CV_Eruption2
	if_hp_more_than TARGET, 50, AI_CV_Eruption_End
	jump AI_CV_Eruption_ScoreDown1

AI_CV_Eruption2: @ 81DBD6C
	if_hp_more_than TARGET, 70, AI_CV_Eruption_End

AI_CV_Eruption_ScoreDown1: @ 81DBD73
	score -1

AI_CV_Eruption_End: @ 81DBD75
	end

AI_CV_Imprison: @ 81DBD76
	is_first_turn USER
	if_more_than 0, AI_CV_Imprison_End
	if_random_less_than 100, AI_CV_Imprison_End
	score +2

AI_CV_Imprison_End: @ 81DBD86
	end

AI_CV_Refresh: @ 81DBD87
	if_hp_less_than TARGET, 50, AI_CV_Refresh_ScoreDown1
	jump AI_CV_Refresh_End

AI_CV_Refresh_ScoreDown1: @ 81DBD93
	score -1

AI_CV_Refresh_End: @ 81DBD95
	end

AI_CV_Snatch: @ 81DBD96
	is_first_turn USER
	if_equal 1, AI_CV_Snatch3
	if_random_less_than 30, AI_CV_Snatch_End
	if_would_go_first USER, AI_CV_Snatch2
	if_hp_not_equal USER, 100, AI_CV_Snatch5
	if_hp_less_than TARGET, 70, AI_CV_Snatch5
	if_random_less_than 60, AI_CV_Snatch_End
	jump AI_CV_Snatch5

AI_CV_Snatch2: @ 81DBDC3
	if_hp_more_than TARGET, 25, AI_CV_Snatch5
	if_move_effect TARGET, EFFECT_RESTORE_HP, AI_CV_Snatch3
	if_move_effect TARGET, EFFECT_DEFENSE_CURL, AI_CV_Snatch3
	jump AI_CV_Snatch4

AI_CV_Snatch3: @ 81DBDDD
	if_random_less_than 150, AI_CV_Snatch_End
	score +2
	jump AI_CV_Snatch_End

AI_CV_Snatch4: @ 81DBDEA
	if_random_less_than 230, AI_CV_Snatch5
	score +1
	jump AI_CV_Snatch_End

AI_CV_Snatch5: @ 81DBDF7
	if_random_less_than 30, AI_CV_Snatch_End
	score -2

AI_CV_Snatch_End: @ 81DBDFF
	end

AI_CV_MudSport: @ 81DBE00
	if_hp_less_than USER, 50, AI_CV_MudSport_ScoreDown1
	get_type ENEMY_TYPE1
	if_equal TYPE_ELECTRIC, AI_CV_MudSport2
	get_type PLAYER_TYPE1
	if_equal TYPE_ELECTRIC, AI_CV_MudSport2
	jump AI_CV_MudSport_ScoreDown1

AI_CV_MudSport2: @ 81DBE1C
	score +1
	jump AI_CV_MudSport_End

AI_CV_MudSport_ScoreDown1: @ 81DBE23
	score -1

AI_CV_MudSport_End: @ 81DBE25
	end

AI_CV_Overheat: @ 81DBE26
	if_damage_bonus 10, AI_CV_Overheat_ScoreDown1
	if_damage_bonus 20, AI_CV_Overheat_ScoreDown1
	if_would_go_first USER, AI_CV_Overheat2
	if_hp_more_than USER, 60, AI_CV_Overheat_End
	jump AI_CV_Overheat_ScoreDown1

AI_CV_Overheat2: @ 81DBE44
	if_hp_more_than USER, 80, AI_CV_Overheat_End

AI_CV_Overheat_ScoreDown1: @ 81DBE4B
	score -1

AI_CV_Overheat_End: @ 81DBE4D
	end

AI_CV_WaterSport: @ 81DBE4E
	if_hp_less_than USER, 50, AI_CV_WaterSport_ScoreDown1
	get_type ENEMY_TYPE1
	if_equal TYPE_FIRE, AI_CV_WaterSport2
	get_type PLAYER_TYPE1
	if_equal TYPE_FIRE, AI_CV_WaterSport2
	jump AI_CV_WaterSport_ScoreDown1

AI_CV_WaterSport2: @ 81DBE6A
	score +1
	jump AI_CV_WaterSport_End

AI_CV_WaterSport_ScoreDown1: @ 81DBE71
	score -1

AI_CV_WaterSport_End: @ 81DBE73
	end

AI_CV_DragonDance: @ 81DBE74
	if_would_go_first USER, AI_CV_DragonDance2
	if_hp_more_than USER, 50, AI_CV_DragonDance_End
	if_random_less_than 70, AI_CV_DragonDance_End
	score -1
	jump AI_CV_DragonDance_End

AI_CV_DragonDance2: @ 81DBE8E
	if_random_less_than 128, AI_CV_DragonDance_End
	score +1

AI_CV_DragonDance_End: @ 81DBE96
	end

AI_TryToFaint: @ 81DBE97
	if_can_faint AI_TryToFaint_TryToEncourageQuickAttack
	is_most_powerful_move
	if_equal 1, Score_Minus1
	end

AI_TryToFaint_TryToEncourageQuickAttack: @ 81DBEA4
	if_effect EFFECT_EXPLOSION, AI_TryToFaint_End
	if_not_effect EFFECT_QUICK_ATTACK, AI_TryToFaint_ScoreUp4
	score +2

AI_TryToFaint_ScoreUp4: @ 81DBEB2
	score +4

AI_TryToFaint_End: @ 81DBEB4
	end

AI_SetupFirstTurn: @ 81DBEB5
	get_turn_count
	if_not_equal 0, AI_SetupFirstTurn_End
	get_effect
	if_not_in_bytes AI_SetupFirstTurn_SetupEffectsToEncourage, AI_SetupFirstTurn_End
	if_random_less_than 80, AI_SetupFirstTurn_End
	score +2

AI_SetupFirstTurn_End: @ 81DBECE
	end

AI_SetupFirstTurn_SetupEffectsToEncourage: @ 81DBECF
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_CONVERSION
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_CONFUSE
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_REFLECT
	.byte EFFECT_POISON
	.byte EFFECT_PARALYZE
	.byte EFFECT_SUBSTITUTE
	.byte EFFECT_LEECH_SEED
	.byte EFFECT_MINIMIZE
	.byte EFFECT_CURSE
	.byte EFFECT_SWAGGER
	.byte EFFECT_CAMOUFLAGE
	.byte EFFECT_YAWN
	.byte EFFECT_DEFENSE_CURL
	.byte EFFECT_TORMENT
	.byte EFFECT_FLATTER
	.byte EFFECT_WILL_O_WISP
	.byte EFFECT_INGRAIN
	.byte EFFECT_IMPRISON
	.byte EFFECT_TEETER_DANCE
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_CAMOUFLAGE
	.byte -1

AI_PreferStrongestMove: @ 81DBF07
	is_most_powerful_move
	if_not_equal 0, AI_PreferStrongestMove_End
	if_random_less_than 100, AI_PreferStrongestMove_End
	score +2

AI_PreferStrongestMove_End: @ 81DBF16
	end

AI_Risky: @ 81DBF17
	get_effect
	if_not_in_bytes AI_Risky_EffectsToEncourage, AI_Risky_End
	if_random_less_than 128, AI_Risky_End
	score +2

AI_Risky_End: @ 81DBF29
	end

AI_Risky_EffectsToEncourage: @ 81DBF2A
	.byte EFFECT_SLEEP
	.byte EFFECT_EXPLOSION
	.byte EFFECT_MIRROR_MOVE
	.byte EFFECT_OHKO
	.byte EFFECT_HIGH_CRITICAL
	.byte EFFECT_CONFUSE
	.byte EFFECT_METRONOME
	.byte EFFECT_PSYWAVE
	.byte EFFECT_COUNTER
	.byte EFFECT_DESTINY_BOND
	.byte EFFECT_SWAGGER
	.byte EFFECT_ATTRACT
	.byte EFFECT_PRESENT
	.byte EFFECT_ALL_STATS_UP_HIT
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_MIRROR_COAT
	.byte EFFECT_FOCUS_PUNCH
	.byte EFFECT_REVENGE
	.byte EFFECT_TEETER_DANCE
	.byte -1

AI_PreferBatonPass: @ 81DBF3E
	count_alive_pokemon USER
	if_equal 0, AI_PreferBatonPass_End
	is_most_powerful_move
	if_not_equal 0, AI_PreferBatonPass_End
	if_move_effect USER, EFFECT_BATON_PASS, AI_PreferBatonPass_GoForBatonPass
	if_random_less_than 80, AI_Risky_End

AI_PreferBatonPass_GoForBatonPass: @ 81DBF5A
	if_random_less_than 20, AI_Risky_End
	score +3

AI_PreferBatonPass_End: @ 81DBF62
	end

AI_Nothing: @ 81DBF63
	end

AI_HPAware: @ 81DBF64
	if_hp_more_than USER, 70, AI_HPAware_UserHasHighHP
	if_hp_more_than USER, 30, AI_HPAware_UserHasMediumHP
	get_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenLowHP, AI_HPAware_TryToDiscourage
	jump AI_HPAware_ConsiderTarget

AI_HPAware_UserHasHighHP: @ 81DBF81
	get_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenHighHP, AI_HPAware_TryToDiscourage
	jump AI_HPAware_ConsiderTarget

AI_HPAware_UserHasMediumHP: @ 81DBF90
	get_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenMediumHP, AI_HPAware_TryToDiscourage
	jump AI_HPAware_ConsiderTarget

AI_HPAware_TryToDiscourage: @ 81DBF9F
	if_random_less_than 50, AI_HPAware_ConsiderTarget
	score -2

AI_HPAware_ConsiderTarget: @ 81DBFA7
	if_hp_more_than TARGET, 70, AI_HPAware_TargetHasHighHP
	if_hp_more_than TARGET, 30, AI_HPAware_TargetHasMediumHP
	get_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenTargetLowHP, AI_HPAware_TargetTryToDiscourage
	jump AI_HPAware_End

AI_HPAware_TargetHasHighHP: @ 81DBFC4
	get_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenTargetHighHP, AI_HPAware_TargetTryToDiscourage
	jump AI_HPAware_End

AI_HPAware_TargetHasMediumHP: @ 81DBFD3
	get_effect
	if_in_bytes AI_HPAware_DiscouragedEffectsWhenTargetMediumHP, AI_HPAware_TargetTryToDiscourage
	jump AI_HPAware_End

AI_HPAware_TargetTryToDiscourage: @ 81DBFE2
	if_random_less_than 50, AI_HPAware_End
	score -2

AI_HPAware_End: @ 81DBFEA
	end

AI_HPAware_DiscouragedEffectsWhenHighHP: @ 81DBFEB
	.byte EFFECT_EXPLOSION
	.byte EFFECT_RESTORE_HP
	.byte EFFECT_REST
	.byte EFFECT_DESTINY_BOND
	.byte EFFECT_FLAIL
	.byte EFFECT_ENDURE
	.byte EFFECT_MORNING_SUN
	.byte EFFECT_SYNTHESIS
	.byte EFFECT_MOONLIGHT
	.byte EFFECT_SOFTBOILED
	.byte EFFECT_MEMENTO
	.byte EFFECT_GRUDGE
	.byte EFFECT_OVERHEAT
	.byte -1

AI_HPAware_DiscouragedEffectsWhenMediumHP: @ 81DBFF9
	.byte EFFECT_EXPLOSION
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_BIDE
	.byte EFFECT_CONVERSION
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_HPAware_DiscouragedEffectsWhenLowHP: @ 81DC024
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_BIDE
	.byte EFFECT_CONVERSION
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_RAGE
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_LOCK_ON
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_BELLY_DRUM
	.byte EFFECT_PSYCH_UP
	.byte EFFECT_MIRROR_COAT
	.byte EFFECT_SOLARBEAM
	.byte EFFECT_ERUPTION
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_HPAware_DiscouragedEffectsWhenTargetHighHP: @ 81DC054
	.byte -1

AI_HPAware_DiscouragedEffectsWhenTargetMediumHP: @ 81DC055
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_POISON
	.byte EFFECT_PAIN_SPLIT
	.byte EFFECT_PERISH_SONG
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_HPAware_DiscouragedEffectsWhenTargetLowHP: @ 81DC07D
	.byte EFFECT_SLEEP
	.byte EFFECT_EXPLOSION
	.byte EFFECT_ATTACK_UP
	.byte EFFECT_DEFENSE_UP
	.byte EFFECT_SPEED_UP
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte EFFECT_SPECIAL_DEFENSE_UP
	.byte EFFECT_ACCURACY_UP
	.byte EFFECT_EVASION_UP
	.byte EFFECT_ATTACK_DOWN
	.byte EFFECT_DEFENSE_DOWN
	.byte EFFECT_SPEED_DOWN
	.byte EFFECT_SPECIAL_ATTACK_DOWN
	.byte EFFECT_SPECIAL_DEFENSE_DOWN
	.byte EFFECT_ACCURACY_DOWN
	.byte EFFECT_EVASION_DOWN
	.byte EFFECT_BIDE
	.byte EFFECT_CONVERSION
	.byte EFFECT_TOXIC
	.byte EFFECT_LIGHT_SCREEN
	.byte EFFECT_OHKO
	.byte EFFECT_SUPER_FANG
	.byte EFFECT_SUPER_FANG
	.byte EFFECT_MIST
	.byte EFFECT_FOCUS_ENERGY
	.byte EFFECT_CONFUSE
	.byte EFFECT_ATTACK_UP_2
	.byte EFFECT_DEFENSE_UP_2
	.byte EFFECT_SPEED_UP_2
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte EFFECT_ACCURACY_UP_2
	.byte EFFECT_EVASION_UP_2
	.byte EFFECT_ATTACK_DOWN_2
	.byte EFFECT_DEFENSE_DOWN_2
	.byte EFFECT_SPEED_DOWN_2
	.byte EFFECT_SPECIAL_ATTACK_DOWN_2
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte EFFECT_ACCURACY_DOWN_2
	.byte EFFECT_EVASION_DOWN_2
	.byte EFFECT_POISON
	.byte EFFECT_PARALYZE
	.byte EFFECT_PAIN_SPLIT
	.byte EFFECT_CONVERSION_2
	.byte EFFECT_LOCK_ON
	.byte EFFECT_SPITE
	.byte EFFECT_PERISH_SONG
	.byte EFFECT_SWAGGER
	.byte EFFECT_FURY_CUTTER
	.byte EFFECT_ATTRACT
	.byte EFFECT_SAFEGUARD
	.byte EFFECT_PSYCH_UP
	.byte EFFECT_MIRROR_COAT
	.byte EFFECT_WILL_O_WISP
	.byte EFFECT_TICKLE
	.byte EFFECT_COSMIC_POWER
	.byte EFFECT_BULK_UP
	.byte EFFECT_CALM_MIND
	.byte EFFECT_DRAGON_DANCE
	.byte -1

AI_Unknown: @ 81DC0B9
	if_not_effect EFFECT_SUNNY_DAY, AI_Unknown_End
	if_equal 0, AI_Unknown_End
	is_first_turn USER
	if_equal 0, AI_Unknown_End
	score +5

AI_Unknown_End: @ 81DC0CF
	end

AI_Roaming: @ 81DC0D0
	if_status2 USER, S_TEMP_TRAP, AI_Roaming_End
	if_status2 USER, S_MEAN_LOOK, AI_Roaming_End
	get_ability TARGET
	if_equal ABILITY_SHADOW_TAG, AI_Roaming_End
	get_ability USER
	if_equal ABILITY_LEVITATE, AI_Roaming_Flee
	get_ability TARGET
	if_equal ABILITY_ARENA_TRAP, AI_Roaming_End

AI_Roaming_Flee: @ 81DC0FC
	flee

AI_Roaming_End: @ 81DC0FD
	end

AI_Safari: @ 81DC0FE
	if_random_100 AI_Safari_Flee
	watch

AI_Safari_Flee: @ 81DC104
	flee

@ This AI is used by the wild Poochyena in the first battle in the game.
@ If it reduces your health to 20% or below, it will flee, allowing you to win.
AI_GoEasy: @ 81DC105
	if_hp_equal TARGET, 20, AI_GoEasy_Flee
	if_hp_less_than TARGET, 20, AI_GoEasy_Flee
	end

AI_GoEasy_Flee: @ 81DC114
	flee

AI_Unused: @ 81DC115
	end
