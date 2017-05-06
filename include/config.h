#ifndef GUARD_CONFIG_H
#define GUARD_CONFIG_H

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

// Fixed in Emerald.
// #define BUGFIX_SETMONIVS

#endif // GUARD_CONFIG_H
