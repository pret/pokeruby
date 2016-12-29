#ifndef GUARD_CONFIG_H
#define GUARD_CONFIG_H

#ifndef REVISION
#define REVISION 0
#endif

#if REVISION == 2
#define BUGFIX_BERRY
#endif

#if REVISION >= 1
#define BUGFIX_GLYPHWIDTH
#define BUGFIX_SAVEFAILEDSCREEN1
#endif

// #define BUGFIX_SAVEFAILEDSCREEN2

// European editions of Ruby/Sapphire and all editions of Emerald have this fix.
// #define BUGFIX_TRAINERAPPROACH

// Fixed in Emerald.
// #define BUGFIX_SETMONIVS

#endif // GUARD_CONFIG_H
