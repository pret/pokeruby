#include "global.h"
#include "berry.h"
#include "field_control_avatar.h"
#include "event_object_movement.h"
#include "fieldmap.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "main.h"
#include "menu.h"
#include "random.h"
#include "task.h"
#include "text.h"
#include "constants/event_object_movement_constants.h"
#include "constants/items.h"

#ifdef ENGLISH
#define NAME_CHERI_BERRY   _("CHERI")
#define NAME_CHESTO_BERRY  _("CHESTO")
#define NAME_PECHA_BERRY   _("PECHA")
#define NAME_RAWST_BERRY   _("RAWST")
#define NAME_ASPEAR_BERRY  _("ASPEAR")
#define NAME_LEPPA_BERRY   _("LEPPA")
#define NAME_ORAN_BERRY    _("ORAN")
#define NAME_PERSIM_BERRY  _("PERSIM")
#define NAME_LUM_BERRY     _("LUM")
#define NAME_SITRUS_BERRY  _("SITRUS")
#define NAME_FIGY_BERRY    _("FIGY")
#define NAME_WIKI_BERRY    _("WIKI")
#define NAME_MAGO_BERRY    _("MAGO")
#define NAME_AGUAV_BERRY   _("AGUAV")
#define NAME_IAPAPA_BERRY  _("IAPAPA")
#define NAME_RAZZ_BERRY    _("RAZZ")
#define NAME_BLUK_BERRY    _("BLUK")
#define NAME_NANAB_BERRY   _("NANAB")
#define NAME_WEPEAR_BERRY  _("WEPEAR")
#define NAME_PINAP_BERRY   _("PINAP")
#define NAME_POMEG_BERRY   _("POMEG")
#define NAME_KELPSY_BERRY  _("KELPSY")
#define NAME_QUALOT_BERRY  _("QUALOT")
#define NAME_HONDEW_BERRY  _("HONDEW")
#define NAME_GREPA_BERRY   _("GREPA")
#define NAME_TAMATO_BERRY  _("TAMATO")
#define NAME_CORNN_BERRY   _("CORNN")
#define NAME_MAGOST_BERRY  _("MAGOST")
#define NAME_RABUTA_BERRY  _("RABUTA")
#define NAME_NOMEL_BERRY   _("NOMEL")
#define NAME_SPELON_BERRY  _("SPELON")
#define NAME_PAMTRE_BERRY  _("PAMTRE")
#define NAME_WATMEL_BERRY  _("WATMEL")
#define NAME_DURIN_BERRY   _("DURIN")
#define NAME_BELUE_BERRY   _("BELUE")
#define NAME_LIECHI_BERRY  _("LIECHI")
#define NAME_GANLON_BERRY  _("GANLON")
#define NAME_SALAC_BERRY   _("SALAC")
#define NAME_PETAYA_BERRY  _("PETAYA")
#define NAME_APICOT_BERRY  _("APICOT")
#define NAME_LANSAT_BERRY  _("LANSAT")
#define NAME_STARF_BERRY   _("STARF")
#define NAME_ENIGMA_BERRY  _("ENIGMA")

static const u8 gBerryDescriptionPart1_Cheri[] = _("Blooms with delicate pretty flowers.");
static const u8 gBerryDescriptionPart2_Cheri[] = _("The bright red BERRY is very spicy.");
static const u8 gBerryDescriptionPart1_Chesto[] = _("The BERRY’s thick skin and fruit are");
static const u8 gBerryDescriptionPart2_Chesto[] = _("very tough. It is dry-tasting all over.");
static const u8 gBerryDescriptionPart1_Pecha[] = _("Very sweet and delicious.");
static const u8 gBerryDescriptionPart2_Pecha[] = _("Also very tender - handle with care.");
static const u8 gBerryDescriptionPart1_Rawst[] = _("If the leaves grow long and curly,");
static const u8 gBerryDescriptionPart2_Rawst[] = _("the BERRY seems to grow very bitter.");
static const u8 gBerryDescriptionPart1_Aspear[] = _("The hard BERRY is dense with a rich");
static const u8 gBerryDescriptionPart2_Aspear[] = _("juice. It is quite sour.");
static const u8 gBerryDescriptionPart1_Leppa[] = _("Grows slower than CHERI and others.");
static const u8 gBerryDescriptionPart2_Leppa[] = _("The smaller the BERRY, the tastier.");
static const u8 gBerryDescriptionPart1_Oran[] = _("A peculiar BERRY with a mix of flavors.");
static const u8 gBerryDescriptionPart2_Oran[] = _("BERRIES grow in half a day.");
static const u8 gBerryDescriptionPart1_Persim[] = _("Loves sunlight. The BERRY’s color");
static const u8 gBerryDescriptionPart2_Persim[] = _("grows vivid when exposed to the sun.");
static const u8 gBerryDescriptionPart1_Lum[] = _("Slow to grow. If raised with loving");
static const u8 gBerryDescriptionPart2_Lum[] = _("care, it may grow two BERRIES.");
static const u8 gBerryDescriptionPart1_Sitrus[] = _("Closely related to ORAN. The large");
static const u8 gBerryDescriptionPart2_Sitrus[] = _("BERRY has a well-rounded flavor.");
static const u8 gBerryDescriptionPart1_Figy[] = _("The BERRY, which looks chewed up,");
static const u8 gBerryDescriptionPart2_Figy[] = _("brims with spicy substances.");
static const u8 gBerryDescriptionPart1_Wiki[] = _("The BERRY is said to have grown lumpy");
static const u8 gBerryDescriptionPart2_Wiki[] = _("to help POKéMON grip it.");
static const u8 gBerryDescriptionPart1_Mago[] = _("The BERRY turns curvy as it grows.");
static const u8 gBerryDescriptionPart2_Mago[] = _("The curvier, the sweeter and tastier.");
static const u8 gBerryDescriptionPart1_Aguav[] = _("The flower is dainty. It is rare in its");
static const u8 gBerryDescriptionPart2_Aguav[] = _("ability to grow without light.");
static const u8 gBerryDescriptionPart1_Iapapa[] = _("The BERRY is very big and sour.");
static const u8 gBerryDescriptionPart2_Iapapa[] = _("It takes at least a day to grow.");
static const u8 gBerryDescriptionPart1_Razz[] = _("The red BERRY tastes slightly spicy.");
static const u8 gBerryDescriptionPart2_Razz[] = _("It grows quickly in just four hours.");
static const u8 gBerryDescriptionPart1_Bluk[] = _("The BERRY is blue on the outside, but");
static const u8 gBerryDescriptionPart2_Bluk[] = _("it blackens the mouth when eaten.");
static const u8 gBerryDescriptionPart1_Nanab[] = _("This BERRY was the seventh");
static const u8 gBerryDescriptionPart2_Nanab[] = _("discovered in the world. It is sweet.");
static const u8 gBerryDescriptionPart1_Wepear[] = _("The flower is small and white. It has a");
static const u8 gBerryDescriptionPart2_Wepear[] = _("delicate balance of bitter and sour.");
static const u8 gBerryDescriptionPart1_Pinap[] = _("Weak against wind and cold.");
static const u8 gBerryDescriptionPart2_Pinap[] = _("The fruit is spicy and the skin, sour.");
static const u8 gBerryDescriptionPart1_Pomeg[] = _("However much it is watered,");
static const u8 gBerryDescriptionPart2_Pomeg[] = _("it only grows up to six BERRIES.");
static const u8 gBerryDescriptionPart1_Kelpsy[] = _("A rare variety shaped like a root.");
static const u8 gBerryDescriptionPart2_Kelpsy[] = _("Grows a very large flower.");
static const u8 gBerryDescriptionPart1_Qualot[] = _("Loves water. Grows strong even in");
static const u8 gBerryDescriptionPart2_Qualot[] = _("locations with constant rainfall.");
static const u8 gBerryDescriptionPart1_Hondew[] = _("A BERRY that is very valuable and");
static const u8 gBerryDescriptionPart2_Hondew[] = _("rarely seen. It is very delicious.");
static const u8 gBerryDescriptionPart1_Grepa[] = _("Despite its tenderness and round");
static const u8 gBerryDescriptionPart2_Grepa[] = _("shape, the BERRY is unimaginably sour.");
static const u8 gBerryDescriptionPart1_Tamato[] = _("The BERRY is lip-bendingly spicy.");
static const u8 gBerryDescriptionPart2_Tamato[] = _("It takes time to grow.");
static const u8 gBerryDescriptionPart1_Cornn[] = _("A BERRY from an ancient era. May not");
static const u8 gBerryDescriptionPart2_Cornn[] = _("grow unless planted in quantity.");
static const u8 gBerryDescriptionPart1_Magost[] = _("A BERRY that is widely said to have");
static const u8 gBerryDescriptionPart2_Magost[] = _("a finely balanced flavor.");
static const u8 gBerryDescriptionPart1_Rabuta[] = _("A rare variety that is overgrown with");
static const u8 gBerryDescriptionPart2_Rabuta[] = _("hair. It is quite bitter.");
static const u8 gBerryDescriptionPart1_Nomel[] = _("Quite sour. Just one bite makes it");
static const u8 gBerryDescriptionPart2_Nomel[] = _("impossible to taste for three days.");
static const u8 gBerryDescriptionPart1_Spelon[] = _("The vividly red BERRY is very spicy.");
static const u8 gBerryDescriptionPart2_Spelon[] = _("Its warts secrete a spicy substance.");
static const u8 gBerryDescriptionPart1_Pamtre[] = _("Drifts on the sea from somewhere.");
static const u8 gBerryDescriptionPart2_Pamtre[] = _("It is thought to grow elsewhere.");
static const u8 gBerryDescriptionPart1_Watmel[] = _("A huge BERRY, with some over 20");
static const u8 gBerryDescriptionPart2_Watmel[] = _("inches discovered. Exceedingly sweet.");
static const u8 gBerryDescriptionPart1_Durin[] = _("Bitter to even look at. It is so");
static const u8 gBerryDescriptionPart2_Durin[] = _("bitter, no one has ever eaten it as is.");
static const u8 gBerryDescriptionPart1_Belue[] = _("It is glossy and looks delicious, but");
static const u8 gBerryDescriptionPart2_Belue[] = _("it is awfully sour. Takes time to grow.");
static const u8 gBerryDescriptionPart1_Liechi[] = _("A mysterious BERRY. It is rumored to");
static const u8 gBerryDescriptionPart2_Liechi[] = _("contain the power of the sea.");
static const u8 gBerryDescriptionPart1_Ganlon[] = _("A mysterious BERRY. It is rumored to");
static const u8 gBerryDescriptionPart2_Ganlon[] = _("contain the power of the land.");
static const u8 gBerryDescriptionPart1_Salac[] = _("A mysterious BERRY. It is rumored to");
static const u8 gBerryDescriptionPart2_Salac[] = _("contain the power of the sky.");
static const u8 gBerryDescriptionPart1_Petaya[] = _("A mysterious BERRY. It is rumored to");
static const u8 gBerryDescriptionPart2_Petaya[] = _("contain the power of all living things.");
static const u8 gBerryDescriptionPart1_Apicot[] = _("A very mystifying BERRY. No telling");
static const u8 gBerryDescriptionPart2_Apicot[] = _("what may happen or how it can be used.");
static const u8 gBerryDescriptionPart1_Lansat[] = _("Said to be a legendary BERRY.");
static const u8 gBerryDescriptionPart2_Lansat[] = _("Holding it supposedly brings joy.");
static const u8 gBerryDescriptionPart1_Starf[] = _("So strong, it was abandoned at the");
static const u8 gBerryDescriptionPart2_Starf[] = _("world’s edge. Considered a mirage.");
static const u8 gBerryDescriptionPart1_Enigma[] = _("A completely enigmatic BERRY.");
static const u8 gBerryDescriptionPart2_Enigma[] = _("Appears to have the power of stars.");
#elif defined(GERMAN)
#define NAME_CHERI_BERRY   _("AMRENA")
#define NAME_CHESTO_BERRY  _("MARON")
#define NAME_PECHA_BERRY   _("PIRSIF")
#define NAME_RAWST_BERRY   _("FRAGIA")
#define NAME_ASPEAR_BERRY  _("WILBIR")
#define NAME_LEPPA_BERRY   _("JONAGO")
#define NAME_ORAN_BERRY    _("SINEL")
#define NAME_PERSIM_BERRY  _("PERSIM")
#define NAME_LUM_BERRY     _("PRUNUS")
#define NAME_SITRUS_BERRY  _("TSITRU")
#define NAME_FIGY_BERRY    _("GIEFE")
#define NAME_WIKI_BERRY    _("WIKI")
#define NAME_MAGO_BERRY    _("MAGO")
#define NAME_AGUAV_BERRY   _("GAUVE")
#define NAME_IAPAPA_BERRY  _("YAPA")
#define NAME_RAZZ_BERRY    _("HIMMIH")
#define NAME_BLUK_BERRY    _("MORB")
#define NAME_NANAB_BERRY   _("NANAB")
#define NAME_WEPEAR_BERRY  _("NIRBE")
#define NAME_PINAP_BERRY   _("SANANA")
#define NAME_POMEG_BERRY   _("GRANA")
#define NAME_KELPSY_BERRY  _("SETANG")
#define NAME_QUALOT_BERRY  _("QUALOT")
#define NAME_HONDEW_BERRY  _("HONMEL")
#define NAME_GREPA_BERRY   _("LABRUS")
#define NAME_TAMATO_BERRY  _("TAMOT")
#define NAME_CORNN_BERRY   _("SAIM")
#define NAME_MAGOST_BERRY  _("MAGOST")
#define NAME_RABUTA_BERRY  _("RABUTA")
#define NAME_NOMEL_BERRY   _("TRONZI")
#define NAME_SPELON_BERRY  _("KIWAN")
#define NAME_PAMTRE_BERRY  _("PALLM")
#define NAME_WATMEL_BERRY  _("WASMEL")
#define NAME_DURIN_BERRY   _("DURIN")
#define NAME_BELUE_BERRY   _("MYRTIL")
#define NAME_LIECHI_BERRY  _("LYDZI")
#define NAME_GANLON_BERRY  _("LINGAN")
#define NAME_SALAC_BERRY   _("SALKA")
#define NAME_PETAYA_BERRY  _("TAHAY")
#define NAME_APICOT_BERRY  _("APIKO")
#define NAME_LANSAT_BERRY  _("LANSAT")
#define NAME_STARF_BERRY   _("KRAMBO")
#define NAME_ENIGMA_BERRY  _("ENIGMA")

static const u8 gBerryDescriptionPart1_Cheri[] = _("Erblüht mit hübschen, zarten Blumen.");
static const u8 gBerryDescriptionPart2_Cheri[] = _("Diese knallrote BEERE ist sehr scharf.");
static const u8 gBerryDescriptionPart1_Chesto[] = _("Diese BEERE hat eine dicke Haut und");
static const u8 gBerryDescriptionPart2_Chesto[] = _("hartes Fruchtfleisch. Trocken!");
static const u8 gBerryDescriptionPart1_Pecha[] = _("Sehr süß und delikat.");
static const u8 gBerryDescriptionPart2_Pecha[] = _("Sehr zart. Vorsichtig anfassen!");
static const u8 gBerryDescriptionPart1_Rawst[] = _("Wenn die Blätter lang und wellig sind,");
static const u8 gBerryDescriptionPart2_Rawst[] = _("wird die BEERE sehr bitter.");
static const u8 gBerryDescriptionPart1_Aspear[] = _("Diese harte BEERE ist sehr");
static const u8 gBerryDescriptionPart2_Aspear[] = _("saftig und sauer im Geschmack!");
static const u8 gBerryDescriptionPart1_Leppa[] = _("Wächst langsamer als AMRENA und");
static const u8 gBerryDescriptionPart2_Leppa[] = _("andere. Je kleiner, desto delikater.");
static const u8 gBerryDescriptionPart1_Oran[] = _("Eine BEERE unterschiedlichsten Ge-");
static const u8 gBerryDescriptionPart2_Oran[] = _("schmacks. Wächst an einem halben Tag.");
static const u8 gBerryDescriptionPart1_Persim[] = _("Liebt Sonnenlicht. Die BEERE");
static const u8 gBerryDescriptionPart2_Persim[] = _("wächst im Sonnenlicht sehr schnell.");
static const u8 gBerryDescriptionPart1_Lum[] = _("Langsamer Wuchs. Wird sie liebevoll ge-");
static const u8 gBerryDescriptionPart2_Lum[] = _("pflegt, kann sie 2 BEEREN tragen.");
static const u8 gBerryDescriptionPart1_Sitrus[] = _("Eng verwandt mit SINEL. Diese große");
static const u8 gBerryDescriptionPart2_Sitrus[] = _("BEERE ist von rundem Geschmack.");
static const u8 gBerryDescriptionPart1_Figy[] = _("Die BEERE sieht angekaut aus. Sie ist");
static const u8 gBerryDescriptionPart2_Figy[] = _("voller scharfer Substanzen.");
static const u8 gBerryDescriptionPart1_Wiki[] = _("Die BEERE wächst unförmig,");
static const u8 gBerryDescriptionPart2_Wiki[] = _("damit PKMN sie besser greifen können.");
static const u8 gBerryDescriptionPart1_Mago[] = _("Die BEERE hat Ausbeulungen. Je mehr");
static const u8 gBerryDescriptionPart2_Mago[] = _("Beulen, desto schmackhafter ist sie.");
static const u8 gBerryDescriptionPart1_Aguav[] = _("Die Blume ist zart. Sie ist fähig,");
static const u8 gBerryDescriptionPart2_Aguav[] = _("ohne Licht wachsen zu können.");
static const u8 gBerryDescriptionPart1_Iapapa[] = _("Die BEERE ist groß und sauer.");
static const u8 gBerryDescriptionPart2_Iapapa[] = _("Sie braucht einen Tag zum Wachsen.");
static const u8 gBerryDescriptionPart1_Razz[] = _("Diese rote BEERE schmeckt etwas");
static const u8 gBerryDescriptionPart2_Razz[] = _("scharf. Sie wächst in nur 4 Stunden.");
static const u8 gBerryDescriptionPart1_Bluk[] = _("Die BEERE ist außen blau, verfärbt");
static const u8 gBerryDescriptionPart2_Bluk[] = _("sich im Mund aber schwarz.");
static const u8 gBerryDescriptionPart1_Nanab[] = _("Diese BEERE war die 7., die auf der");
static const u8 gBerryDescriptionPart2_Nanab[] = _("Welt entdeckt wurde. Sie ist süß.");
static const u8 gBerryDescriptionPart1_Wepear[] = _("Die Blume ist klein und weiß. Angenehm");
static const u8 gBerryDescriptionPart2_Wepear[] = _("bitter und sauer zugleich.");
static const u8 gBerryDescriptionPart1_Pinap[] = _("Wind und Kälte verträgt sie nicht.");
static const u8 gBerryDescriptionPart2_Pinap[] = _("Fruchtfleisch: Scharf. Haut: Sauer.");
static const u8 gBerryDescriptionPart1_Pomeg[] = _("Egal wie viel Wasser sie bekommt, sie");
static const u8 gBerryDescriptionPart2_Pomeg[] = _("trägt immer bis zu 6 BEEREN.");
static const u8 gBerryDescriptionPart1_Kelpsy[] = _("Eine Seltenheit. Geformt wie eine");
static const u8 gBerryDescriptionPart2_Kelpsy[] = _("Wurzel. Hat eine große Blume.");
static const u8 gBerryDescriptionPart1_Qualot[] = _("Liebt das Wasser. Wächst besonders");
static const u8 gBerryDescriptionPart2_Qualot[] = _("gut in regenreichen Gegenden.");
static const u8 gBerryDescriptionPart1_Hondew[] = _("Eine wertvolle und seltene BEERE.");
static const u8 gBerryDescriptionPart2_Hondew[] = _("Sie ist sehr schmackhaft.");
static const u8 gBerryDescriptionPart1_Grepa[] = _("Die BEERE ist zart und von runder");
static const u8 gBerryDescriptionPart2_Grepa[] = _("Form. Aber sie ist unglaublich sauer!");
static const u8 gBerryDescriptionPart1_Tamato[] = _("Die Schärfe der BEERE verbrennt die");
static const u8 gBerryDescriptionPart2_Tamato[] = _("Lippen. Sie braucht Zeit zum Wachsen.");
static const u8 gBerryDescriptionPart1_Cornn[] = _("Eine BEERE aus alten Zeiten. Wächst");
static const u8 gBerryDescriptionPart2_Cornn[] = _("nur, wenn in großen Mengen gepflanzt.");
static const u8 gBerryDescriptionPart1_Magost[] = _("Eine BEERE, die für ihren feinen, aus-");
static const u8 gBerryDescriptionPart2_Magost[] = _("gewogenen Geschmack bekannt ist.");
static const u8 gBerryDescriptionPart1_Rabuta[] = _("Eine Seltenheit, die über und über mit");
static const u8 gBerryDescriptionPart2_Rabuta[] = _("Haaren bewachsen ist. Sehr bitter!");
static const u8 gBerryDescriptionPart1_Nomel[] = _("Sehr sauer. Ein Biss betäubt die");
static const u8 gBerryDescriptionPart2_Nomel[] = _("Geschmacksnerven für 3 Tage!");
static const u8 gBerryDescriptionPart1_Spelon[] = _("Die leuchtend rote BEERE ist sehr");
static const u8 gBerryDescriptionPart2_Spelon[] = _("scharf. Gibt scharfe Substanzen ab!");
static const u8 gBerryDescriptionPart1_Pamtre[] = _("Wird vom Meer angespült. Sie wächst");
static const u8 gBerryDescriptionPart2_Pamtre[] = _("an einem anderen Ort.");
static const u8 gBerryDescriptionPart1_Watmel[] = _("Eine große BEERE, 25 cm groß.");
static const u8 gBerryDescriptionPart2_Watmel[] = _("Außergewöhnlich süß.");
static const u8 gBerryDescriptionPart1_Durin[] = _("Bitter schon ihr Anblick! Sie ist so");
static const u8 gBerryDescriptionPart2_Durin[] = _("bitter, dass niemand sie pur isst.");
static const u8 gBerryDescriptionPart1_Belue[] = _("Sie glänzt, sieht zart aus, ist extrem");
static const u8 gBerryDescriptionPart2_Belue[] = _("sauer und braucht Zeit zum Wachsen.");
static const u8 gBerryDescriptionPart1_Liechi[] = _("Eine geheimnisvolle BEERE. Man sagt,");
static const u8 gBerryDescriptionPart2_Liechi[] = _("sie enthalte die Kraft des Meeres.");
static const u8 gBerryDescriptionPart1_Ganlon[] = _("Eine geheimnisvolle BEERE. Man sagt,");
static const u8 gBerryDescriptionPart2_Ganlon[] = _("sie enthalte die Kraft des Landes.");
static const u8 gBerryDescriptionPart1_Salac[] = _("Eine geheimnisvolle BEERE. Man sagt,");
static const u8 gBerryDescriptionPart2_Salac[] = _("sie enthalte die Kraft des Himmels.");
static const u8 gBerryDescriptionPart1_Petaya[] = _("Eine geheimnisvolle BEERE. Man sagt,");
static const u8 gBerryDescriptionPart2_Petaya[] = _("sie enthalte die Kraft allen Lebens.");
static const u8 gBerryDescriptionPart1_Apicot[] = _("Eine rätselhafte BEERE. Man kann");
static const u8 gBerryDescriptionPart2_Apicot[] = _("nicht sagen, wie und was sie ist.");
static const u8 gBerryDescriptionPart1_Lansat[] = _("Eine legendäre BEERE. Sie zu");
static const u8 gBerryDescriptionPart2_Lansat[] = _("tragen bringt Freude.");
static const u8 gBerryDescriptionPart1_Starf[] = _("So stark, dass sie an den Rand der");
static const u8 gBerryDescriptionPart2_Starf[] = _("Welt verbannt wurde. Ein Märchen?");
static const u8 gBerryDescriptionPart1_Enigma[] = _("Eine enigmatische BEERE. Sie scheint");
static const u8 gBerryDescriptionPart2_Enigma[] = _("die Macht der Sterne zu besitzen.");
#endif

const struct Berry gBerries[] =
{
    {
        .name = NAME_CHERI_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 20,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Cheri,
        .description2 = gBerryDescriptionPart2_Cheri,
        .stageDuration = 3,
        .spicy = 10,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_CHESTO_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 80,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Chesto,
        .description2 = gBerryDescriptionPart2_Chesto,
        .stageDuration = 3,
        .spicy = 0,
        .dry = 10,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_PECHA_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_SOFT,
        .size = 40,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Pecha,
        .description2 = gBerryDescriptionPart2_Pecha,
        .stageDuration = 3,
        .spicy = 0,
        .dry = 0,
        .sweet = 10,
        .bitter = 0,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_RAWST_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 32,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Rawst,
        .description2 = gBerryDescriptionPart2_Rawst,
        .stageDuration = 3,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 10,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_ASPEAR_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 50,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Aspear,
        .description2 = gBerryDescriptionPart2_Aspear,
        .stageDuration = 3,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 10,
        .smoothness = 25,
    },
    {
        .name = NAME_LEPPA_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 28,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Leppa,
        .description2 = gBerryDescriptionPart2_Leppa,
        .stageDuration = 4,
        .spicy = 10,
        .dry = 0,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_ORAN_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 35,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Oran,
        .description2 = gBerryDescriptionPart2_Oran,
        .stageDuration = 3,
        .spicy = 10,
        .dry = 10,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_PERSIM_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 47,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Persim,
        .description2 = gBerryDescriptionPart2_Persim,
        .stageDuration = 3,
        .spicy = 10,
        .dry = 10,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_LUM_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 34,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Lum,
        .description2 = gBerryDescriptionPart2_Lum,
        .stageDuration = 12,
        .spicy = 10,
        .dry = 10,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_SITRUS_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 95,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Sitrus,
        .description2 = gBerryDescriptionPart2_Sitrus,
        .stageDuration = 6,
        .spicy = 10,
        .dry = 10,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_FIGY_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 100,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Figy,
        .description2 = gBerryDescriptionPart2_Figy,
        .stageDuration = 6,
        .spicy = 10,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_WIKI_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 115,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Wiki,
        .description2 = gBerryDescriptionPart2_Wiki,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 10,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_MAGO_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 126,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Mago,
        .description2 = gBerryDescriptionPart2_Mago,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 0,
        .sweet = 10,
        .bitter = 0,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_AGUAV_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 64,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Aguav,
        .description2 = gBerryDescriptionPart2_Aguav,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 10,
        .sour = 0,
        .smoothness = 25,
    },
    {
        .name = NAME_IAPAPA_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 223,
        .maxYield = 3,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Iapapa,
        .description2 = gBerryDescriptionPart2_Iapapa,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 10,
        .smoothness = 25,
    },
    {
        .name = NAME_RAZZ_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 120,
        .maxYield = 6,
        .minYield = 3,
        .description1 = gBerryDescriptionPart1_Razz,
        .description2 = gBerryDescriptionPart2_Razz,
        .stageDuration = 1,
        .spicy = 10,
        .dry = 10,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 20,
    },
    {
        .name = NAME_BLUK_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 108,
        .maxYield = 6,
        .minYield = 3,
        .description1 = gBerryDescriptionPart1_Bluk,
        .description2 = gBerryDescriptionPart2_Bluk,
        .stageDuration = 1,
        .spicy = 0,
        .dry = 10,
        .sweet = 10,
        .bitter = 0,
        .sour = 0,
        .smoothness = 20,
    },
    {
        .name = NAME_NANAB_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 77,
        .maxYield = 6,
        .minYield = 3,
        .description1 = gBerryDescriptionPart1_Nanab,
        .description2 = gBerryDescriptionPart2_Nanab,
        .stageDuration = 1,
        .spicy = 0,
        .dry = 0,
        .sweet = 10,
        .bitter = 10,
        .sour = 0,
        .smoothness = 20,
    },
    {
        .name = NAME_WEPEAR_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 74,
        .maxYield = 6,
        .minYield = 3,
        .description1 = gBerryDescriptionPart1_Wepear,
        .description2 = gBerryDescriptionPart2_Wepear,
        .stageDuration = 1,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_PINAP_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 80,
        .maxYield = 6,
        .minYield = 3,
        .description1 = gBerryDescriptionPart1_Pinap,
        .description2 = gBerryDescriptionPart2_Pinap,
        .stageDuration = 1,
        .spicy = 10,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_POMEG_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 135,
        .maxYield = 6,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Pomeg,
        .description2 = gBerryDescriptionPart2_Pomeg,
        .stageDuration = 3,
        .spicy = 10,
        .dry = 0,
        .sweet = 10,
        .bitter = 10,
        .sour = 0,
        .smoothness = 20,
    },
    {
        .name = NAME_KELPSY_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 150,
        .maxYield = 6,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Kelpsy,
        .description2 = gBerryDescriptionPart2_Kelpsy,
        .stageDuration = 3,
        .spicy = 0,
        .dry = 10,
        .sweet = 0,
        .bitter = 10,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_QUALOT_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 110,
        .maxYield = 6,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Qualot,
        .description2 = gBerryDescriptionPart2_Qualot,
        .stageDuration = 3,
        .spicy = 10,
        .dry = 0,
        .sweet = 10,
        .bitter = 0,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_HONDEW_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 162,
        .maxYield = 6,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Hondew,
        .description2 = gBerryDescriptionPart2_Hondew,
        .stageDuration = 3,
        .spicy = 10,
        .dry = 10,
        .sweet = 0,
        .bitter = 10,
        .sour = 0,
        .smoothness = 20,
    },
    {
        .name = NAME_GREPA_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 149,
        .maxYield = 6,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Grepa,
        .description2 = gBerryDescriptionPart2_Grepa,
        .stageDuration = 3,
        .spicy = 0,
        .dry = 10,
        .sweet = 10,
        .bitter = 0,
        .sour = 10,
        .smoothness = 20,
    },
    {
        .name = NAME_TAMATO_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 200,
        .maxYield = 4,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Tamato,
        .description2 = gBerryDescriptionPart2_Tamato,
        .stageDuration = 6,
        .spicy = 20,
        .dry = 10,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 30,
    },
    {
        .name = NAME_CORNN_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 75,
        .maxYield = 4,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Cornn,
        .description2 = gBerryDescriptionPart2_Cornn,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 20,
        .sweet = 10,
        .bitter = 0,
        .sour = 0,
        .smoothness = 30,
    },
    {
        .name = NAME_MAGOST_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 140,
        .maxYield = 4,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Magost,
        .description2 = gBerryDescriptionPart2_Magost,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 0,
        .sweet = 20,
        .bitter = 10,
        .sour = 0,
        .smoothness = 30,
    },
    {
        .name = NAME_RABUTA_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 226,
        .maxYield = 4,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Rabuta,
        .description2 = gBerryDescriptionPart2_Rabuta,
        .stageDuration = 6,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 20,
        .sour = 10,
        .smoothness = 30,
    },
    {
        .name = NAME_NOMEL_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 285,
        .maxYield = 4,
        .minYield = 2,
        .description1 = gBerryDescriptionPart1_Nomel,
        .description2 = gBerryDescriptionPart2_Nomel,
        .stageDuration = 6,
        .spicy = 10,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 20,
        .smoothness = 30,
    },
    {
        .name = NAME_SPELON_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 133,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Spelon,
        .description2 = gBerryDescriptionPart2_Spelon,
        .stageDuration = 18,
        .spicy = 40,
        .dry = 10,
        .sweet = 0,
        .bitter = 0,
        .sour = 0,
        .smoothness = 70,
    },
    {
        .name = NAME_PAMTRE_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_SOFT,
        .size = 244,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Pamtre,
        .description2 = gBerryDescriptionPart2_Pamtre,
        .stageDuration = 18,
        .spicy = 0,
        .dry = 40,
        .sweet = 10,
        .bitter = 0,
        .sour = 0,
        .smoothness = 70,
    },
    {
        .name = NAME_WATMEL_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 250,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Watmel,
        .description2 = gBerryDescriptionPart2_Watmel,
        .stageDuration = 18,
        .spicy = 0,
        .dry = 0,
        .sweet = 40,
        .bitter = 10,
        .sour = 0,
        .smoothness = 70,
    },
    {
        .name = NAME_DURIN_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 280,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Durin,
        .description2 = gBerryDescriptionPart2_Durin,
        .stageDuration = 18,
        .spicy = 0,
        .dry = 0,
        .sweet = 0,
        .bitter = 40,
        .sour = 10,
        .smoothness = 70,
    },
    {
        .name = NAME_BELUE_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_SOFT,
        .size = 300,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Belue,
        .description2 = gBerryDescriptionPart2_Belue,
        .stageDuration = 18,
        .spicy = 10,
        .dry = 0,
        .sweet = 0,
        .bitter = 0,
        .sour = 40,
        .smoothness = 70,
    },
    {
        .name = NAME_LIECHI_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 111,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Liechi,
        .description2 = gBerryDescriptionPart2_Liechi,
        .stageDuration = 24,
        .spicy = 40,
        .dry = 0,
        .sweet = 40,
        .bitter = 0,
        .sour = 10,
        .smoothness = 80,
    },
    {
        .name = NAME_GANLON_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 33,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Ganlon,
        .description2 = gBerryDescriptionPart2_Ganlon,
        .stageDuration = 24,
        .spicy = 0,
        .dry = 40,
        .sweet = 0,
        .bitter = 40,
        .sour = 0,
        .smoothness = 80,
    },
    {
        .name = NAME_SALAC_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 95,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Salac,
        .description2 = gBerryDescriptionPart2_Salac,
        .stageDuration = 24,
        .spicy = 0,
        .dry = 0,
        .sweet = 40,
        .bitter = 0,
        .sour = 40,
        .smoothness = 80,
    },
    {
        .name = NAME_PETAYA_BERRY,
        .firmness = BERRY_FIRMNESS_VERY_HARD,
        .size = 237,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Petaya,
        .description2 = gBerryDescriptionPart2_Petaya,
        .stageDuration = 24,
        .spicy = 40,
        .dry = 0,
        .sweet = 0,
        .bitter = 40,
        .sour = 0,
        .smoothness = 80,
    },
    {
        .name = NAME_APICOT_BERRY,
        .firmness = BERRY_FIRMNESS_HARD,
        .size = 75,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Apicot,
        .description2 = gBerryDescriptionPart2_Apicot,
        .stageDuration = 24,
        .spicy = 0,
        .dry = 40,
        .sweet = 0,
        .bitter = 0,
        .sour = 40,
        .smoothness = 80,
    },
    {
        .name = NAME_LANSAT_BERRY,
        .firmness = BERRY_FIRMNESS_SOFT,
        .size = 97,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Lansat,
        .description2 = gBerryDescriptionPart2_Lansat,
        .stageDuration = 24,
        .spicy = 10,
        .dry = 10,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 30,
    },
    {
        .name = NAME_STARF_BERRY,
        .firmness = BERRY_FIRMNESS_SUPER_HARD,
        .size = 153,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Starf,
        .description2 = gBerryDescriptionPart2_Starf,
        .stageDuration = 24,
        .spicy = 10,
        .dry = 10,
        .sweet = 10,
        .bitter = 10,
        .sour = 10,
        .smoothness = 30,
    },
    {
        .name = NAME_ENIGMA_BERRY,
        .firmness = BERRY_FIRMNESS_UNKNOWN,
        .size = 0,
        .maxYield = 2,
        .minYield = 1,
        .description1 = gBerryDescriptionPart1_Enigma,
        .description2 = gBerryDescriptionPart2_Enigma,
        .stageDuration = 24,
        .spicy = 40,
        .dry = 40,
        .sweet = 40,
        .bitter = 40,
        .sour = 40,
        .smoothness = 40,
    },
};

static const struct BerryTree gBlankBerryTree = {0};

extern u8 S_BerryTree[];
extern u16 gSpecialVar_LastTalked;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;

/*
    An enigma berry is a type of berry which functions
    as though it is a custom berry. Because it behaves
    like its a custom berry, it doesn't hold an identity
    represented in its icons or descriptions, leaving its
    information to be decided by the e-reader cards
    which were intended to deliver these custom
    berries.
*/

static u8 CalcBerryYield(struct BerryTree *tree);
static u16 GetStageDurationByBerryType(u8 berry);

#if DEBUG

extern u8 sub_80B47D8(u16 var);

u8 debug_sub_80C2B04(void)
{
    u8 taskId = sub_80B47D8(0);

    gTasks[taskId].data[4]--;
    CloseMenu();
    return 1;
}

u8 debug_sub_80C2B30(void)
{
    u8 taskId = sub_80B47D8(1);

    gTasks[taskId].data[4]--;
    CloseMenu();
    return 1;
}

#endif

// unused
// this could be static, but making it so causes a compile-time warning.
void ClearEnigmaBerries(void)
{
    CpuFill16(0, &gSaveBlock1.enigmaBerry, sizeof(gSaveBlock1.enigmaBerry));
}

void SetEnigmaBerry(u8 *src)
{
    // initialize the enigma berry by copying the data from the script.
    u32 i;
    u8 *dest = (u8*)&gSaveBlock1.enigmaBerry;

    for (i = 0; i < sizeof(gSaveBlock1.enigmaBerry); i++)
        dest[i] = src[i];

    // at this point, the description pointer is not yet initialized. we need to initialize it since
    // we dont know where in memory this is going to be. set the berry desc pointers to the
    // EnigmaBerry struct's description arrays since these are where the descriptions are stored.
    gSaveBlock1.enigmaBerry.berry.description1 = gSaveBlock1.enigmaBerry.description1;
    gSaveBlock1.enigmaBerry.berry.description2 = gSaveBlock1.enigmaBerry.description2;
}

static u32 GetEnigmaBerryChecksum(struct EnigmaBerry *enigmaBerry)
{
    const u8 *description1;
    const u8 *description2;
    u32 i;
    u32 checksum;
    u8 *dest;

    // the description pointers could be pointing to anywhere in memory. we do not want these
    // pointers to factor into the checksum as it will produce a different result every time: so
    // back the pointers up and set them to null so the checksum is safe to calculate.
    description1 = gSaveBlock1.enigmaBerry.berry.description1;
    description2 = gSaveBlock1.enigmaBerry.berry.description2;
    gSaveBlock1.enigmaBerry.berry.description1 = NULL;
    gSaveBlock1.enigmaBerry.berry.description2 = NULL;

    dest = (u8*)enigmaBerry;
    checksum = 0;
    for (i = 0; i < ((u32)&gSaveBlock1.enigmaBerry.checksum - (u32)&gSaveBlock1.enigmaBerry); i++)
        checksum += dest[i];

    // the checksum is calculated: the descriptions are safe to restore now.
    gSaveBlock1.enigmaBerry.berry.description1 = description1;
    gSaveBlock1.enigmaBerry.berry.description2 = description2;

    return checksum;
}

#if DEBUG

extern const u8 gSpriteImage_UnusedCherry[];
extern const u16 gSpritePalette_UnusedCherry[];
extern u8 gUnknown_Debug_839B6CE[];

static const u8 gUnknown_Debug_083F7F84[] = _("そとから　きた　きのみ");
static const u8 gUnknown_Debug_083F7F90[] = _("ただいま　かいはつちゅう");

void debug_sub_80C2C18(const u8 *name, u8 holdEffect, u8 holdEffectParam)
{
    s32 i;

    gSaveBlock1.enigmaBerry.berry = gBerries[0];
    StringCopy(gSaveBlock1.enigmaBerry.berry.name, name);
    StringCopy(gSaveBlock1.enigmaBerry.description1, gUnknown_Debug_083F7F84);
    StringCopy(gSaveBlock1.enigmaBerry.description2, gUnknown_Debug_083F7F90);
    gSaveBlock1.enigmaBerry.berry.description1 = gSaveBlock1.enigmaBerry.description1;
    gSaveBlock1.enigmaBerry.berry.description2 = gSaveBlock1.enigmaBerry.description2;
    for (i = 0; i < 0x480; i++)
        gSaveBlock1.enigmaBerry.pic[i] = gSpriteImage_UnusedCherry[i];
    for (i = 0; i < 16; i++)
        gSaveBlock1.enigmaBerry.palette[i] = gSpritePalette_UnusedCherry[i];
    for (i = 0; i < 18; i++)
        gSaveBlock1.enigmaBerry.itemEffect[i] = gUnknown_Debug_839B6CE[i];
    gSaveBlock1.enigmaBerry.holdEffect = holdEffect;
    gSaveBlock1.enigmaBerry.holdEffectParam = holdEffectParam;
    gSaveBlock1.enigmaBerry.checksum = GetEnigmaBerryChecksum(&gSaveBlock1.enigmaBerry);
}

void debug_sub_80C2D24(u8 spicy, u8 dry, u8 sweet, u8 bitter, u8 sour, u8 smoothness)
{
    gSaveBlock1.enigmaBerry.berry.spicy = spicy;
    gSaveBlock1.enigmaBerry.berry.dry = dry;
    gSaveBlock1.enigmaBerry.berry.sweet = sweet;
    gSaveBlock1.enigmaBerry.berry.bitter = bitter;
    gSaveBlock1.enigmaBerry.berry.sour = sour;
    gSaveBlock1.enigmaBerry.berry.smoothness = smoothness;
    gSaveBlock1.enigmaBerry.checksum = GetEnigmaBerryChecksum(&gSaveBlock1.enigmaBerry);
}

#endif

// due to e-reader scans being particularly volatile to failure, it is a requirement to check for
// their integrity here due to scans possibly failing to produce the correct result.
bool32 IsEnigmaBerryValid(void)
{
    if (gSaveBlock1.enigmaBerry.berry.stageDuration == 0)
        return FALSE;
    if (gSaveBlock1.enigmaBerry.berry.maxYield == 0)
        return FALSE;
    if (GetEnigmaBerryChecksum(&gSaveBlock1.enigmaBerry) != gSaveBlock1.enigmaBerry.checksum)
        return FALSE;
    return TRUE;
}

const struct Berry *GetBerryInfo(u8 berry)
{
    // when getting the pointer to the berry info, enigma berries are handled differently. if your
    // berry is an Enigma Berry and its checksum is valid, fetch the pointer to its information in
    // the save block.
    if (berry == GETBERRYID(ITEM_ENIGMA_BERRY) && IsEnigmaBerryValid())
        return &gSaveBlock1.enigmaBerry.berry;
    else
    {
        // invalid berries will be flattened into a cheri berry. Interestingly, if your berry was
        // an enigma berry whos checksum failed, the game will use the Enigma Berry information
        // for this: meaning if you see the Enigma Berry information, its actually because the
        // checksum failed.
        if (berry == BERRY_NONE || berry > GETBERRYID(LAST_BERRY))
            berry = GETBERRYID(FIRST_BERRY);
        return &gBerries[berry - 1];
    }
}

// the save file can handle up to a number of 128 berry trees as indicated by its definition
// in global.h. Interestingly, this function does not check that limit of 128.
static struct BerryTree *GetBerryTreeInfo(u8 id)
{
    return &gSaveBlock1.berryTrees[id];
}

// this was called because the berry script was successful: meaning the player chose to
// water the tree. We need to check for the current tree stage and set the appropriate
// water flag to true.
bool32 EventObjectInteractionWaterBerryTree(void)
{
    // GetBerryTreeInfo does not sanitize the tree retrieved, but there are no known
    // instances where this can cause problems.
    struct BerryTree *tree = GetBerryTreeInfo(EventObjectGetBerryTreeId(gSelectedEventObject));

    switch (tree->stage)
    {
    case BERRY_STAGE_PLANTED:
        tree->watered1 = TRUE;
        break;
    case BERRY_STAGE_SPROUTED:
        tree->watered2 = TRUE;
        break;
    case BERRY_STAGE_TALLER:
        tree->watered3 = TRUE;
        break;
    case BERRY_STAGE_FLOWERING:
        tree->watered4 = TRUE;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

bool8 IsPlayerFacingUnplantedSoil(void)
{
    if (GetEventObjectScriptPointerPlayerFacing() == S_BerryTree
     && GetStageByBerryTreeId(EventObjectGetBerryTreeId(gSelectedEventObject)) == BERRY_STAGE_NO_BERRY)
        return TRUE;
    else
        return FALSE;
}

bool8 TryToWaterBerryTree(void)
{
    if (GetEventObjectScriptPointerPlayerFacing() != S_BerryTree)
        return FALSE;
    else
        return EventObjectInteractionWaterBerryTree();
}

void ClearBerryTrees(void)
{
    int i;
    struct SaveBlock1 *saveBlock1 = &gSaveBlock1;
    struct BerryTree berryTree = gBlankBerryTree;

    for (i = 0; i < MAX_BERRY_TREES; i++)
        saveBlock1->berryTrees[i] = berryTree;
}

// when the player does not interact with the tree for a period of time, this is called
// to advance the grow state.
static bool32 BerryTreeGrow(struct BerryTree *tree)
{
    if (tree->growthSparkle)
        return FALSE;
    switch (tree->stage)
    {
    case BERRY_STAGE_NO_BERRY:
        return FALSE;
    case BERRY_STAGE_FLOWERING:
        tree->berryYield = CalcBerryYield(tree);
    case BERRY_STAGE_PLANTED:
    case BERRY_STAGE_SPROUTED:
    case BERRY_STAGE_TALLER:
        tree->stage++;
        break;
    case BERRY_STAGE_BERRIES:
        tree->watered1 = 0;
        tree->watered2 = 0;
        tree->watered3 = 0;
        tree->watered4 = 0;
        tree->berryYield = 0;
        tree->stage = BERRY_STAGE_SPROUTED;
        if (++tree->regrowthCount == BERRY_REGROW_LIMIT)
            *tree = gBlankBerryTree;
        break;
    }
    return TRUE;
}

void BerryTreeTimeUpdate(s32 minutesPassed)
{
    int i;
    struct BerryTree *tree;

    for (i = 0; i < MAX_BERRY_TREES; i++)
    {
        tree = &gSaveBlock1.berryTrees[i];

        if (tree->berry != BERRY_NONE && tree->stage != BERRY_STAGE_NO_BERRY && tree->growthSparkle == FALSE)
        {
            // the player has waited too long to water the berry. Reset the tree. This is because
            // if the berry state is not in the unwatered state, the tree will grow anyway despite this
            // check, which means BerryTreeGrow will handle the regrow process for this, removing the
            // need for this check. This only handles the unwatered soil state.
            if (minutesPassed >= GetStageDurationByBerryType(tree->berry) * 71)
            {
                *tree = gBlankBerryTree;
            }
            else
            {
                // because time is altered below, perhaps they thought it was unsafe to change it, even
                // though that is not how passed arguments behave.
                s32 time = minutesPassed;

                while (time != 0)
                {
                    if (tree->minutesUntilNextStage > time)
                    {
                        // its been X minutes since the last berry update, so update
                        // minutesUntilNextStage appropriately to match the time offset
                        // that has passed since the update.
                        tree->minutesUntilNextStage -= time;
                        break;
                    }
                    // perform the subtraction the other way around to get the number of minutes since
                    // the inferred stage update that occured, since minutesUntilNextStage is <= time.
                    // we may need this variable to simulate multiple berry cycles in the while loop.
                    time -= tree->minutesUntilNextStage;
                    tree->minutesUntilNextStage = GetStageDurationByBerryType(tree->berry); // since the tree was inferred to update, set the new minutesUntilNextStage.
                    if (BerryTreeGrow(tree) == FALSE)
                        break;
                    if (tree->stage == BERRY_STAGE_BERRIES)
                        tree->minutesUntilNextStage *= 4;
                }
            }
        }
    }
}

void PlantBerryTree(u8 id, u8 berry, u8 stage, bool8 noSparkle)
{
    struct BerryTree *tree = GetBerryTreeInfo(id);

    *tree = gBlankBerryTree;
    tree->berry = berry;
    tree->minutesUntilNextStage = GetStageDurationByBerryType(berry);
    tree->stage = stage;
    if (stage == BERRY_STAGE_BERRIES)
    {
        tree->berryYield = CalcBerryYield(tree);
        tree->minutesUntilNextStage *= 4;
    }
    if (noSparkle == FALSE)
    {
        tree->growthSparkle = TRUE;
    }
}

void RemoveBerryTree(u8 id)
{
    gSaveBlock1.berryTrees[id] = gBlankBerryTree;
}

u8 GetBerryTypeByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].berry;
}

u8 GetStageByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].stage;
}

u8 ItemIdToBerryType(u16 item)
{
    u16 berry = item - FIRST_BERRY;

    if (berry > LAST_BERRY - FIRST_BERRY)
        return GETBERRYID(FIRST_BERRY);
    else
        return GETBERRYID(item);
}

static u16 BerryTypeToItemId(u16 berry)
{
    u16 item = berry - 1;

    if (item > LAST_BERRY - FIRST_BERRY)
        return FIRST_BERRY;
    else
        return GETITEMID(berry);
}

void GetBerryNameByBerryType(u8 berry, u8 *string)
{
    memcpy(string, GetBerryInfo(berry)->name, BERRY_NAME_LENGTH);
    string[BERRY_NAME_LENGTH] = EOS;
}

void ResetBerryTreeSparkleFlag(u8 id)
{
    GetBerryTreeInfo(id)->growthSparkle = FALSE;
}

static u8 BerryTreeGetNumStagesWatered(struct BerryTree *tree)
{
    u8 count = 0;

    if (tree->watered1)
        count++;
    if (tree->watered2)
        count++;
    if (tree->watered3)
        count++;
    if (tree->watered4)
        count++;
    return count;
}

static u8 GetNumStagesWateredByBerryTreeId(u8 id)
{
    return BerryTreeGetNumStagesWatered(GetBerryTreeInfo(id));
}

static u8 CalcBerryYieldInternal(u16 max, u16 min, u8 water)
{
    u32 randMin;
    u32 randMax;
    u32 rand;
    u32 extraYield;

    // depending on if the player gave the tree plenty of water, berry yield will be affected proportionally.

    if (water == 0)
        return min;
    else
    {
        randMin = (max - min) * (water - 1);
        randMax = (max - min) * (water);
        rand = randMin + Random() % (randMax - randMin + 1);

        if ((rand % 4) > 1)
            extraYield = rand / 4 + 1;
        else
            extraYield = rand / 4;
        return extraYield + min;
    }
}

static u8 CalcBerryYield(struct BerryTree *tree)
{
    const struct Berry *berry = GetBerryInfo(tree->berry);
    u8 min = berry->minYield;
    u8 max = berry->maxYield;

    return CalcBerryYieldInternal(max, min, BerryTreeGetNumStagesWatered(tree));
}

static u8 GetBerryCountByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].berryYield;
}

static u16 GetStageDurationByBerryType(u8 berry)
{
    return GetBerryInfo(berry)->stageDuration * 60;
}

void EventObjectInteractionGetBerryTreeData(void)
{
    u8 id;
    u8 berry;
    u8 localId;
    u8 group;
    u8 num;

    id = EventObjectGetBerryTreeId(gSelectedEventObject);
    berry = GetBerryTypeByBerryTreeId(id);
    ResetBerryTreeSparkleFlag(id);
    localId = gSpecialVar_LastTalked;
    num = gSaveBlock1.location.mapNum;
    group = gSaveBlock1.location.mapGroup;
    if (IsBerryTreeSparkling(localId, num, group))
    {
        // we cannot allow the player to grow/interact with the tree while the tree
        // is undergoing the sparkling effect, so set the special var to the sparkling
        // state and let the event script process the flag.
        gSpecialVar_0x8004 = BERRY_STAGE_SPARKLING;
    }
    else
        gSpecialVar_0x8004 = GetStageByBerryTreeId(id);
    gSpecialVar_0x8005 = GetNumStagesWateredByBerryTreeId(id);
    gSpecialVar_0x8006 = GetBerryCountByBerryTreeId(id);
    GetBerryNameByBerryType(berry, gStringVar1);
}

void Berry_FadeAndGoToBerryBagMenu(void)
{
    SetMainCallback2(sub_80A68CC);
}

void EventObjectInteractionPlantBerryTree(void)
{
    u8 berry = ItemIdToBerryType(gSpecialVar_ItemId);

    PlantBerryTree(EventObjectGetBerryTreeId(gSelectedEventObject), berry, 1, TRUE);
    EventObjectInteractionGetBerryTreeData();
}

void EventObjectInteractionPickBerryTree(void)
{
    u8 id = EventObjectGetBerryTreeId(gSelectedEventObject);
    u8 berry = GetBerryTypeByBerryTreeId(id);

    gSpecialVar_0x8004 = AddBagItem(BerryTypeToItemId(berry), GetBerryCountByBerryTreeId(id));
}

void EventObjectInteractionRemoveBerryTree(void)
{
    RemoveBerryTree(EventObjectGetBerryTreeId(gSelectedEventObject));
    sub_8060288(gSpecialVar_LastTalked, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

bool8 PlayerHasBerries(void)
{
    return IsBagPocketNonEmpty(BAG_BERRIES);
}

#if DEBUG
void debug_sub_80C33FC(const u8 *buffer, s32 value, u8 n)
{
    StringAppend(gStringVar4, buffer);
    ConvertIntToDecimalStringN(gStringVar1, value, STR_CONV_MODE_LEADING_ZEROS, n);
    StringAppend(gStringVar4, gStringVar1);
}

static const u8 gUnknown_Debug_083F7F9D[] = _("POS:");
static const u8 gUnknown_Debug_083F7FA2[] = _("\nTYPE:");
static const u8 gUnknown_Debug_083F7FA9[] = _("\nGROW:");
static const u8 gUnknown_Debug_083F7FB0[] = _("\nTIME:");
static const u8 gUnknown_Debug_083F7FB7[] = _("\nFCNT:");
static const u8 gUnknown_Debug_083F7FBE[] = _("\nSCNT:");
static const u8 gUnknown_Debug_083F7FC5[] = _("\nHOOK:");
static const u8 gUnknown_Debug_083F7FCC[] = _("\nWBIT:");
static const u8 gUnknown_Debug_083F7FD3[] = _("");

u8* DebugOpenBerryInfo(void)
{
    if (GetEventObjectScriptPointerPlayerFacing() != S_BerryTree)
    {
        return NULL;
    }
    else
    {
        u32 berryTreeId = EventObjectGetBerryTreeId(gSelectedEventObject);
        struct BerryTree *berryTree = GetBerryTreeInfo(berryTreeId);
        s32 i;

        for (i = 0; i < 500; i++)
            gStringVar4[i] = EOS;

        debug_sub_80C33FC(gUnknown_Debug_083F7F9D, berryTreeId, 3);
        debug_sub_80C33FC(gUnknown_Debug_083F7FA2, berryTree->berry, 2);
        debug_sub_80C33FC(gUnknown_Debug_083F7FA9, berryTree->stage, 2);
        debug_sub_80C33FC(gUnknown_Debug_083F7FB0, berryTree->minutesUntilNextStage, 5);
        debug_sub_80C33FC(gUnknown_Debug_083F7FB7, berryTree->berryYield, 2);
        debug_sub_80C33FC(gUnknown_Debug_083F7FBE, berryTree->regrowthCount, 3);
        debug_sub_80C33FC(gUnknown_Debug_083F7FC5, berryTree->growthSparkle, 1);
        debug_sub_80C33FC(gUnknown_Debug_083F7FCC, berryTree->watered1, 1);
        debug_sub_80C33FC(gUnknown_Debug_083F7FD3, berryTree->watered2, 1);
        debug_sub_80C33FC(gUnknown_Debug_083F7FD3, berryTree->watered3, 1);
        debug_sub_80C33FC(gUnknown_Debug_083F7FD3, berryTree->watered4, 1);

        return gStringVar4;
    }
}

#endif

// whenever the player is not within view of the berry tree during its sparkle state, the
// sparkle state will be reset.
void ResetBerryTreeSparkleFlags(void)
{
    s16 cam_left;
    s16 cam_top;
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
    int i;

    GetCameraCoords(&cam_left, &cam_top);
    left = cam_left;
    top = cam_top + 3;
    right = cam_left + 14;
    bottom = top + 8;
    for (i = 0; i < (u8)ARRAY_COUNT(gSaveBlock1.eventObjects); i++)
    {
        if (gEventObjects[i].active && gEventObjects[i].movementType == MOVEMENT_TYPE_BERRY_TREE_GROWTH)
        {
            cam_left = gEventObjects[i].currentCoords.x;
            cam_top = gEventObjects[i].currentCoords.y;
            if (left <= cam_left && cam_left <= right && top <= cam_top && cam_top <= bottom)
                ResetBerryTreeSparkleFlag(gEventObjects[i].trainerRange_berryTreeId);
        }
    }
}
