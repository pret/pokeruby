#ifndef GUARD_CONFIG_H
#define GUARD_CONFIG_H

// In the Generation 3 games, Asserts were used in various debug builds.
// Ruby/Sapphire and Emerald do not have these asserts while Fire Red
// still has them in the ROM. This is because the developers forgot
// to define NDEBUG before release, however this has been changed as
// Ruby's actual debug build does not use the AGBPrint features.

// To note, Ruby/Sapphire likely did not use AGBPrint. This is because
// the german debug ROM of Ruby did not have any uses of AGBPrint and
// the assert commands but instead a "crash" screen. This config exists
// for convenience for the user of pokeruby and NOT because it is
// authoritative. These additions are for user convenience based on
// officially recommended SDK practices for debugging and is therefore
// still in part authoritative.
#define NDEBUG

// To enable print debugging, comment out "#define NDEBUG". This allows
// the various AGBPrint functions to be used. (See include/gba/isagbprint.h).
// Some emulators support a debug console window: uncomment NoCashGBAPrint()
// and NoCashGBAPrintf() in libisagbprn.c to use no$gba's own proprietary
// printing system. Use NoCashGBAPrint() and NoCashGBAPrintf() like you
// would normally use AGBPrint() and AGBPrintf().

#ifndef REVISION
#define REVISION 0
#endif

#if (ENGLISH && REVISION == 2) || (GERMAN && REVISION == 1)
#define BUGFIX_BERRY
#endif

#if (ENGLISH && REVISION >= 1) || GERMAN
#define BUGFIX_GLYPHWIDTH
#define BUGFIX_SAVEFAILEDSCREEN1
#endif

#if GERMAN
#define BUGFIX_SAVEFAILEDSCREEN2
#endif

// European editions of Ruby/Sapphire and all editions of Emerald have this fix.
#if GERMAN
#define BUGFIX_TRAINERAPPROACH
#endif

#if (ENGLISH && REVISION >= 1) || GERMAN
#define BUGFIX_EVO_NAME
#endif

#ifdef ENGLISH
#define UNITS_IMPERIAL
#elif GERMAN
#define UNITS_METRIC
#endif

// Fixed in Emerald.
// #define BUGFIX_SETMONIVS

#endif // GUARD_CONFIG_H
