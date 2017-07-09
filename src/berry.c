#include "global.h"
#include "berry.h"
#include "field_control_avatar.h"
#include "field_map_obj.h"
#include "fieldmap.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "items.h"
#include "main.h"
#include "rng.h"
#include "string_util.h"
#include "text.h"

#define BERRY_NAME_LENGTH 6

#define FIRST_BERRY ITEM_CHERI_BERRY
#define LAST_BERRY  ITEM_ENIGMA_BERRY

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

const u8 gBerryDescriptionPart1_Cheri[] = _("Blooms with delicate pretty flowers.");
const u8 gBerryDescriptionPart2_Cheri[] = _("The bright red BERRY is very spicy.");
const u8 gBerryDescriptionPart1_Chesto[] = _("The BERRY’s thick skin and fruit are");
const u8 gBerryDescriptionPart2_Chesto[] = _("very tough. It is dry-tasting all over.");
const u8 gBerryDescriptionPart1_Pecha[] = _("Very sweet and delicious.");
const u8 gBerryDescriptionPart2_Pecha[] = _("Also very tender - handle with care.");
const u8 gBerryDescriptionPart1_Rawst[] = _("If the leaves grow long and curly,");
const u8 gBerryDescriptionPart2_Rawst[] = _("the BERRY seems to grow very bitter.");
const u8 gBerryDescriptionPart1_Aspear[] = _("The hard BERRY is dense with a rich");
const u8 gBerryDescriptionPart2_Aspear[] = _("juice. It is quite sour.");
const u8 gBerryDescriptionPart1_Leppa[] = _("Grows slower than CHERI and others.");
const u8 gBerryDescriptionPart2_Leppa[] = _("The smaller the BERRY, the tastier.");
const u8 gBerryDescriptionPart1_Oran[] = _("A peculiar BERRY with a mix of flavors.");
const u8 gBerryDescriptionPart2_Oran[] = _("BERRIES grow in half a day.");
const u8 gBerryDescriptionPart1_Persim[] = _("Loves sunlight. The BERRY’s color");
const u8 gBerryDescriptionPart2_Persim[] = _("grows vivid when exposed to the sun.");
const u8 gBerryDescriptionPart1_Lum[] = _("Slow to grow. If raised with loving");
const u8 gBerryDescriptionPart2_Lum[] = _("care, it may grow two BERRIES.");
const u8 gBerryDescriptionPart1_Sitrus[] = _("Closely related to ORAN. The large");
const u8 gBerryDescriptionPart2_Sitrus[] = _("BERRY has a well-rounded flavor.");
const u8 gBerryDescriptionPart1_Figy[] = _("The BERRY, which looks chewed up,");
const u8 gBerryDescriptionPart2_Figy[] = _("brims with spicy substances.");
const u8 gBerryDescriptionPart1_Wiki[] = _("The BERRY is said to have grown lumpy");
const u8 gBerryDescriptionPart2_Wiki[] = _("to help POKéMON grip it.");
const u8 gBerryDescriptionPart1_Mago[] = _("The BERRY turns curvy as it grows.");
const u8 gBerryDescriptionPart2_Mago[] = _("The curvier, the sweeter and tastier.");
const u8 gBerryDescriptionPart1_Aguav[] = _("The flower is dainty. It is rare in its");
const u8 gBerryDescriptionPart2_Aguav[] = _("ability to grow without light.");
const u8 gBerryDescriptionPart1_Iapapa[] = _("The BERRY is very big and sour.");
const u8 gBerryDescriptionPart2_Iapapa[] = _("It takes at least a day to grow.");
const u8 gBerryDescriptionPart1_Razz[] = _("The red BERRY tastes slightly spicy.");
const u8 gBerryDescriptionPart2_Razz[] = _("It grows quickly in just four hours.");
const u8 gBerryDescriptionPart1_Bluk[] = _("The BERRY is blue on the outside, but");
const u8 gBerryDescriptionPart2_Bluk[] = _("it blackens the mouth when eaten.");
const u8 gBerryDescriptionPart1_Nanab[] = _("This BERRY was the seventh");
const u8 gBerryDescriptionPart2_Nanab[] = _("discovered in the world. It is sweet.");
const u8 gBerryDescriptionPart1_Wepear[] = _("The flower is small and white. It has a");
const u8 gBerryDescriptionPart2_Wepear[] = _("delicate balance of bitter and sour.");
const u8 gBerryDescriptionPart1_Pinap[] = _("Weak against wind and cold.");
const u8 gBerryDescriptionPart2_Pinap[] = _("The fruit is spicy and the skin, sour.");
const u8 gBerryDescriptionPart1_Pomeg[] = _("However much it is watered,");
const u8 gBerryDescriptionPart2_Pomeg[] = _("it only grows up to six BERRIES.");
const u8 gBerryDescriptionPart1_Kelpsy[] = _("A rare variety shaped like a root.");
const u8 gBerryDescriptionPart2_Kelpsy[] = _("Grows a very large flower.");
const u8 gBerryDescriptionPart1_Qualot[] = _("Loves water. Grows strong even in");
const u8 gBerryDescriptionPart2_Qualot[] = _("locations with constant rainfall.");
const u8 gBerryDescriptionPart1_Hondew[] = _("A BERRY that is very valuable and");
const u8 gBerryDescriptionPart2_Hondew[] = _("rarely seen. It is very delicious.");
const u8 gBerryDescriptionPart1_Grepa[] = _("Despite its tenderness and round");
const u8 gBerryDescriptionPart2_Grepa[] = _("shape, the BERRY is unimaginably sour.");
const u8 gBerryDescriptionPart1_Tamato[] = _("The BERRY is lip-bendingly spicy.");
const u8 gBerryDescriptionPart2_Tamato[] = _("It takes time to grow.");
const u8 gBerryDescriptionPart1_Cornn[] = _("A BERRY from an ancient era. May not");
const u8 gBerryDescriptionPart2_Cornn[] = _("grow unless planted in quantity.");
const u8 gBerryDescriptionPart1_Magost[] = _("A BERRY that is widely said to have");
const u8 gBerryDescriptionPart2_Magost[] = _("a finely balanced flavor.");
const u8 gBerryDescriptionPart1_Rabuta[] = _("A rare variety that is overgrown with");
const u8 gBerryDescriptionPart2_Rabuta[] = _("hair. It is quite bitter.");
const u8 gBerryDescriptionPart1_Nomel[] = _("Quite sour. Just one bite makes it");
const u8 gBerryDescriptionPart2_Nomel[] = _("impossible to taste for three days.");
const u8 gBerryDescriptionPart1_Spelon[] = _("The vividly red BERRY is very spicy.");
const u8 gBerryDescriptionPart2_Spelon[] = _("Its warts secrete a spicy substance.");
const u8 gBerryDescriptionPart1_Pamtre[] = _("Drifts on the sea from somewhere.");
const u8 gBerryDescriptionPart2_Pamtre[] = _("It is thought to grow elsewhere.");
const u8 gBerryDescriptionPart1_Watmel[] = _("A huge BERRY, with some over 20");
const u8 gBerryDescriptionPart2_Watmel[] = _("inches discovered. Exceedingly sweet.");
const u8 gBerryDescriptionPart1_Durin[] = _("Bitter to even look at. It is so");
const u8 gBerryDescriptionPart2_Durin[] = _("bitter, no one has ever eaten it as is.");
const u8 gBerryDescriptionPart1_Belue[] = _("It is glossy and looks delicious, but");
const u8 gBerryDescriptionPart2_Belue[] = _("it is awfully sour. Takes time to grow.");
const u8 gBerryDescriptionPart1_Liechi[] = _("A mysterious BERRY. It is rumored to");
const u8 gBerryDescriptionPart2_Liechi[] = _("contain the power of the sea.");
const u8 gBerryDescriptionPart1_Ganlon[] = _("A mysterious BERRY. It is rumored to");
const u8 gBerryDescriptionPart2_Ganlon[] = _("contain the power of the land.");
const u8 gBerryDescriptionPart1_Salac[] = _("A mysterious BERRY. It is rumored to");
const u8 gBerryDescriptionPart2_Salac[] = _("contain the power of the sky.");
const u8 gBerryDescriptionPart1_Petaya[] = _("A mysterious BERRY. It is rumored to");
const u8 gBerryDescriptionPart2_Petaya[] = _("contain the power of all living things.");
const u8 gBerryDescriptionPart1_Apicot[] = _("A very mystifying BERRY. No telling");
const u8 gBerryDescriptionPart2_Apicot[] = _("what may happen or how it can be used.");
const u8 gBerryDescriptionPart1_Lansat[] = _("Said to be a legendary BERRY.");
const u8 gBerryDescriptionPart2_Lansat[] = _("Holding it supposedly brings joy.");
const u8 gBerryDescriptionPart1_Starf[] = _("So strong, it was abandoned at the");
const u8 gBerryDescriptionPart2_Starf[] = _("world’s edge. Considered a mirage.");
const u8 gBerryDescriptionPart1_Enigma[] = _("A completely enigmatic BERRY.");
const u8 gBerryDescriptionPart2_Enigma[] = _("Appears to have the power of stars.");
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

const u8 gBerryDescriptionPart1_Cheri[] = _("Erblüht mit hübschen, zarten Blumen.");
const u8 gBerryDescriptionPart2_Cheri[] = _("Diese knallrote BEERE ist sehr scharf.");
const u8 gBerryDescriptionPart1_Chesto[] = _("Diese BEERE hat eine dicke Haut und");
const u8 gBerryDescriptionPart2_Chesto[] = _("hartes Fruchtfleisch. Trocken!");
const u8 gBerryDescriptionPart1_Pecha[] = _("Sehr süß und delikat.");
const u8 gBerryDescriptionPart2_Pecha[] = _("Sehr zart. Vorsichtig anfassen!");
const u8 gBerryDescriptionPart1_Rawst[] = _("Wenn die Blätter lang und wellig sind,");
const u8 gBerryDescriptionPart2_Rawst[] = _("wird die BEERE sehr bitter.");
const u8 gBerryDescriptionPart1_Aspear[] = _("Diese harte BEERE ist sehr");
const u8 gBerryDescriptionPart2_Aspear[] = _("saftig und sauer im Geschmack!");
const u8 gBerryDescriptionPart1_Leppa[] = _("Wächst langsamer als AMRENA und");
const u8 gBerryDescriptionPart2_Leppa[] = _("andere. Je kleiner, desto delikater.");
const u8 gBerryDescriptionPart1_Oran[] = _("Eine BEERE unterschiedlichsten Ge-");
const u8 gBerryDescriptionPart2_Oran[] = _("schmacks. Wächst an einem halben Tag.");
const u8 gBerryDescriptionPart1_Persim[] = _("Liebt Sonnenlicht. Die BEERE");
const u8 gBerryDescriptionPart2_Persim[] = _("wächst im Sonnenlicht sehr schnell.");
const u8 gBerryDescriptionPart1_Lum[] = _("Langsamer Wuchs. Wird sie liebevoll ge-");
const u8 gBerryDescriptionPart2_Lum[] = _("pflegt, kann sie 2 BEEREN tragen.");
const u8 gBerryDescriptionPart1_Sitrus[] = _("Eng verwandt mit SINEL. Diese große");
const u8 gBerryDescriptionPart2_Sitrus[] = _("BEERE ist von rundem Geschmack.");
const u8 gBerryDescriptionPart1_Figy[] = _("Die BEERE sieht angekaut aus. Sie ist");
const u8 gBerryDescriptionPart2_Figy[] = _("voller scharfer Substanzen.");
const u8 gBerryDescriptionPart1_Wiki[] = _("Die BEERE wächst unförmig,");
const u8 gBerryDescriptionPart2_Wiki[] = _("damit PKMN sie besser greifen können.");
const u8 gBerryDescriptionPart1_Mago[] = _("Die BEERE hat Ausbeulungen. Je mehr");
const u8 gBerryDescriptionPart2_Mago[] = _("Beulen, desto schmackhafter ist sie.");
const u8 gBerryDescriptionPart1_Aguav[] = _("Die Blume ist zart. Sie ist fähig,");
const u8 gBerryDescriptionPart2_Aguav[] = _("ohne Licht wachsen zu können.");
const u8 gBerryDescriptionPart1_Iapapa[] = _("Die BEERE ist groß und sauer.");
const u8 gBerryDescriptionPart2_Iapapa[] = _("Sie braucht einen Tag zum Wachsen.");
const u8 gBerryDescriptionPart1_Razz[] = _("Diese rote BEERE schmeckt etwas");
const u8 gBerryDescriptionPart2_Razz[] = _("scharf. Sie wächst in nur 4 Stunden.");
const u8 gBerryDescriptionPart1_Bluk[] = _("Die BEERE ist außen blau, verfärbt");
const u8 gBerryDescriptionPart2_Bluk[] = _("sich im Mund aber schwarz.");
const u8 gBerryDescriptionPart1_Nanab[] = _("Diese BEERE war die 7., die auf der");
const u8 gBerryDescriptionPart2_Nanab[] = _("Welt entdeckt wurde. Sie ist süß.");
const u8 gBerryDescriptionPart1_Wepear[] = _("Die Blume ist klein und weiß. Angenehm");
const u8 gBerryDescriptionPart2_Wepear[] = _("bitter und sauer zugleich.");
const u8 gBerryDescriptionPart1_Pinap[] = _("Wind und Kälte verträgt sie nicht.");
const u8 gBerryDescriptionPart2_Pinap[] = _("Fruchtfleisch: Scharf. Haut: Sauer.");
const u8 gBerryDescriptionPart1_Pomeg[] = _("Egal wie viel Wasser sie bekommt, sie");
const u8 gBerryDescriptionPart2_Pomeg[] = _("trägt immer bis zu 6 BEEREN.");
const u8 gBerryDescriptionPart1_Kelpsy[] = _("Eine Seltenheit. Geformt wie eine");
const u8 gBerryDescriptionPart2_Kelpsy[] = _("Wurzel. Hat eine große Blume.");
const u8 gBerryDescriptionPart1_Qualot[] = _("Liebt das Wasser. Wächst besonders");
const u8 gBerryDescriptionPart2_Qualot[] = _("gut in regenreichen Gegenden.");
const u8 gBerryDescriptionPart1_Hondew[] = _("Eine wertvolle und seltene BEERE.");
const u8 gBerryDescriptionPart2_Hondew[] = _("Sie ist sehr schmackhaft.");
const u8 gBerryDescriptionPart1_Grepa[] = _("Die BEERE ist zart und von runder");
const u8 gBerryDescriptionPart2_Grepa[] = _("Form. Aber sie ist unglaublich sauer!");
const u8 gBerryDescriptionPart1_Tamato[] = _("Die Schärfe der BEERE verbrennt die");
const u8 gBerryDescriptionPart2_Tamato[] = _("Lippen. Sie braucht Zeit zum Wachsen.");
const u8 gBerryDescriptionPart1_Cornn[] = _("Eine BEERE aus alten Zeiten. Wächst");
const u8 gBerryDescriptionPart2_Cornn[] = _("nur, wenn in großen Mengen gepflanzt.");
const u8 gBerryDescriptionPart1_Magost[] = _("Eine BEERE, die für ihren feinen, aus-");
const u8 gBerryDescriptionPart2_Magost[] = _("gewogenen Geschmack bekannt ist.");
const u8 gBerryDescriptionPart1_Rabuta[] = _("Eine Seltenheit, die über und über mit");
const u8 gBerryDescriptionPart2_Rabuta[] = _("Haaren bewachsen ist. Sehr bitter!");
const u8 gBerryDescriptionPart1_Nomel[] = _("Sehr sauer. Ein Biss betäubt die");
const u8 gBerryDescriptionPart2_Nomel[] = _("Geschmacksnerven für 3 Tage!");
const u8 gBerryDescriptionPart1_Spelon[] = _("Die leuchtend rote BEERE ist sehr");
const u8 gBerryDescriptionPart2_Spelon[] = _("scharf. Gibt scharfe Substanzen ab!");
const u8 gBerryDescriptionPart1_Pamtre[] = _("Wird vom Meer angespült. Sie wächst");
const u8 gBerryDescriptionPart2_Pamtre[] = _("an einem anderen Ort.");
const u8 gBerryDescriptionPart1_Watmel[] = _("Eine große BEERE, 25 cm groß.");
const u8 gBerryDescriptionPart2_Watmel[] = _("Außergewöhnlich süß.");
const u8 gBerryDescriptionPart1_Durin[] = _("Bitter schon ihr Anblick! Sie ist so");
const u8 gBerryDescriptionPart2_Durin[] = _("bitter, dass niemand sie pur isst.");
const u8 gBerryDescriptionPart1_Belue[] = _("Sie glänzt, sieht zart aus, ist extrem");
const u8 gBerryDescriptionPart2_Belue[] = _("sauer und braucht Zeit zum Wachsen.");
const u8 gBerryDescriptionPart1_Liechi[] = _("Eine geheimnisvolle BEERE. Man sagt,");
const u8 gBerryDescriptionPart2_Liechi[] = _("sie enthalte die Kraft des Meeres.");
const u8 gBerryDescriptionPart1_Ganlon[] = _("Eine geheimnisvolle BEERE. Man sagt,");
const u8 gBerryDescriptionPart2_Ganlon[] = _("sie enthalte die Kraft des Landes.");
const u8 gBerryDescriptionPart1_Salac[] = _("Eine geheimnisvolle BEERE. Man sagt,");
const u8 gBerryDescriptionPart2_Salac[] = _("sie enthalte die Kraft des Himmels.");
const u8 gBerryDescriptionPart1_Petaya[] = _("Eine geheimnisvolle BEERE. Man sagt,");
const u8 gBerryDescriptionPart2_Petaya[] = _("sie enthalte die Kraft allen Lebens.");
const u8 gBerryDescriptionPart1_Apicot[] = _("Eine rätselhafte BEERE. Man kann");
const u8 gBerryDescriptionPart2_Apicot[] = _("nicht sagen, wie und was sie ist.");
const u8 gBerryDescriptionPart1_Lansat[] = _("Eine legendäre BEERE. Sie zu");
const u8 gBerryDescriptionPart2_Lansat[] = _("tragen bringt Freude.");
const u8 gBerryDescriptionPart1_Starf[] = _("So stark, dass sie an den Rand der");
const u8 gBerryDescriptionPart2_Starf[] = _("Welt verbannt wurde. Ein Märchen?");
const u8 gBerryDescriptionPart1_Enigma[] = _("Eine enigmatische BEERE. Sie scheint");
const u8 gBerryDescriptionPart2_Enigma[] = _("die Macht der Sterne zu besitzen.");
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

const struct BerryTree gBlankBerryTree = {0};

extern u8 BerryTreeScript;
extern u16 gScriptLastTalked;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;

__attribute__((naked))
void debug_sub_80C2B04()
{
    asm(
        "	push	{lr}\n"
        "	mov	r0, #0x0\n"
        "	bl	sub_80B47D8\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r2, ._1\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r2\n"
        "	ldrh	r0, [r1, #0x10]\n"
        "	sub	r0, r0, #0x1\n"
        "	strh	r0, [r1, #0x10]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._2:\n"
        "	.align	2, 0\n"
        "._1:\n"
        "	.word	gTasks\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80C2B30()
{
    asm(
        "	push	{lr}\n"
        "	mov	r0, #0x1\n"
        "	bl	sub_80B47D8\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r2, ._3\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r1, r1, r2\n"
        "	ldrh	r0, [r1, #0x10]\n"
        "	sub	r0, r0, #0x1\n"
        "	strh	r0, [r1, #0x10]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._4:\n"
        "	.align	2, 0\n"
        "._3:\n"
        "	.word	gTasks\n"
        "\n"
    );
}

// unused
void ClearEnigmaBerries(void)
{
    CpuFill16(0, &gSaveBlock1.enigmaBerry, sizeof(gSaveBlock1.enigmaBerry));
}

void SetEnigmaBerry(u8 *src)
{
    u32 i;
    u8 *dest = (u8*)&gSaveBlock1.enigmaBerry;

    for (i = 0; i < sizeof(gSaveBlock1.enigmaBerry); i++)
        dest[i] = src[i];

    gSaveBlock1.enigmaBerry.berry.description1 = gSaveBlock1.enigmaBerry.description1;
    gSaveBlock1.enigmaBerry.berry.description2 = gSaveBlock1.enigmaBerry.description2;
}

__attribute__((naked))
void debug_sub_80C2BD0()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	ldr	r3, ._11\n"
        "	ldr	r1, ._11 + 4\n"
        "	add	r4, r3, r1\n"
        "	ldr	r6, [r4]\n"
        "	add	r1, r1, #0x4\n"
        "	add	r2, r3, r1\n"
        "	ldr	r7, [r2]\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [r4]\n"
        "	str	r1, [r2]\n"
        "	add	r4, r0, #0\n"
        "	mov	r2, #0x0\n"
        "	ldr	r5, ._11 + 8\n"
        "._10:\n"
        "	add	r0, r4, r1\n"
        "	ldrb	r0, [r0]\n"
        "	add	r2, r2, r0\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, r5\n"
        "	bls	._10	@cond_branch\n"
        "	ldr	r1, ._11 + 4\n"
        "	add	r0, r3, r1\n"
        "	str	r6, [r0]\n"
        "	add	r1, r1, #0x4\n"
        "	add	r0, r3, r1\n"
        "	str	r7, [r0]\n"
        "	add	r0, r2, #0\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._12:\n"
        "	.align	2, 0\n"
        "._11:\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x316c\n"
        "	.word	0x52b\n"
        "\n"
    );
}

#ifdef DEBUG
__attribute__((naked))
u32 GetEnigmaBerryChecksum(struct EnigmaBerry *enigmaBerry)
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r9\n"
        "	mov	r6, r8\n"
        "	push	{r6, r7}\n"
        "	add	r3, r0, #0\n"
        "	lsl	r1, r1, #0x18\n"
        "	lsr	r1, r1, #0x18\n"
        "	mov	r9, r1\n"
        "	lsl	r2, r2, #0x18\n"
        "	lsr	r2, r2, #0x18\n"
        "	mov	r8, r2\n"
        "	ldr	r4, ._16\n"
        "	ldr	r1, ._16 + 4\n"
        "	add	r0, r4, r1\n"
        "	add	r2, r0, #0\n"
        "	ldr	r1, ._16 + 8\n"
        "	ldmia	r1!, {r5, r6, r7}\n"
        "	stmia	r2!, {r5, r6, r7}\n"
        "	ldmia	r1!, {r5, r6, r7}\n"
        "	stmia	r2!, {r5, r6, r7}\n"
        "	ldr	r1, [r1]\n"
        "	str	r1, [r2]\n"
        "	add	r1, r3, #0\n"
        "	bl	StringCopy\n"
        "	ldr	r0, ._16 + 12\n"
        "	add	r6, r4, r0\n"
        "	ldr	r1, ._16 + 16\n"
        "	add	r0, r6, #0\n"
        "	bl	StringCopy\n"
        "	ldr	r1, ._16 + 20\n"
        "	add	r5, r4, r1\n"
        "	ldr	r1, ._16 + 24\n"
        "	add	r0, r5, #0\n"
        "	bl	StringCopy\n"
        "	ldr	r2, ._16 + 28\n"
        "	add	r0, r4, r2\n"
        "	str	r6, [r0]\n"
        "	ldr	r6, ._16 + 32\n"
        "	add	r0, r4, r6\n"
        "	str	r5, [r0]\n"
        "	mov	r2, #0x0\n"
        "	ldr	r6, ._16 + 36\n"
        "	ldr	r7, ._16 + 40\n"
        "	add	r5, r4, r7\n"
        "	ldr	r3, ._16 + 44\n"
        "._13:\n"
        "	add	r0, r2, r5\n"
        "	add	r1, r2, r3\n"
        "	ldrb	r1, [r1]\n"
        "	strb	r1, [r0]\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, r6\n"
        "	ble	._13	@cond_branch\n"
        "	ldr	r0, ._16\n"
        "	ldr	r3, ._16 + 48\n"
        "	ldr	r2, ._16 + 52\n"
        "	add	r1, r0, r2\n"
        "	mov	r2, #0xf\n"
        "._14:\n"
        "	ldrh	r0, [r3]\n"
        "	strh	r0, [r1]\n"
        "	add	r3, r3, #0x2\n"
        "	add	r1, r1, #0x2\n"
        "	sub	r2, r2, #0x1\n"
        "	cmp	r2, #0\n"
        "	bge	._14	@cond_branch\n"
        "	mov	r2, #0x0\n"
        "	ldr	r5, ._16 + 56\n"
        "	ldr	r3, ._16 + 60\n"
        "._15:\n"
        "	add	r0, r2, r5\n"
        "	add	r1, r2, r3\n"
        "	ldrb	r1, [r1]\n"
        "	strb	r1, [r0]\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, #0x11\n"
        "	ble	._15	@cond_branch\n"
        "	ldr	r5, ._16 + 64\n"
        "	add	r0, r4, r5\n"
        "	mov	r6, r9\n"
        "	strb	r6, [r0]\n"
        "	ldr	r7, ._16 + 68\n"
        "	add	r0, r4, r7\n"
        "	mov	r1, r8\n"
        "	strb	r1, [r0]\n"
        "	ldr	r2, ._16 + 4\n"
        "	add	r0, r4, r2\n"
        "	bl	debug_sub_80C2BD0\n"
        "	add	r5, r5, #0x4\n"
        "	add	r1, r4, r5\n"
        "	str	r0, [r1]\n"
        "	pop	{r3, r4}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._17:\n"
        "	.align	2, 0\n"
        "._16:\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x3160\n"
        "	.word	gBerries\n"
        "	.word	0x361c\n"
        "	.word	gUnknown_Debug_083F7F84\n"
        "	.word	0x3649\n"
        "	.word	gUnknown_Debug_083F7F90\n"
        "	.word	0x316c\n"
        "	.word	0x3170\n"
        "	.word	0x47f\n"
        "	.word	0x317c\n"
        "	.word	gSpriteImage_83C172C+0x80\n"
        "	.word	gSpriteImage_83C172C+0x500\n"
        "	.word	0x35fc\n"
        "	.word	gSaveBlock1+0x3676\n"
        "	.word	gUnknown_Debug_839B6CE\n"
        "	.word	0x3688\n"
        "	.word	0x3689\n"
        "\n"
    );
}
#else
u32 GetEnigmaBerryChecksum(struct EnigmaBerry *enigmaBerry)
{
    const u8 *description1;
    const u8 *description2;
    u32 i;
    u32 checksum;
    u8 *dest;

    description1 = gSaveBlock1.enigmaBerry.berry.description1;
    description2 = gSaveBlock1.enigmaBerry.berry.description2;
    gSaveBlock1.enigmaBerry.berry.description1 = 0;
    gSaveBlock1.enigmaBerry.berry.description2 = 0;

    dest = (u8*)enigmaBerry;
    checksum = 0;
    for (i = 0; i < ((u32)&gSaveBlock1.enigmaBerry.checksum - (u32)&gSaveBlock1.enigmaBerry); i++)
    {
        checksum += dest[i];
    }

    gSaveBlock1.enigmaBerry.berry.description1 = description1;
    gSaveBlock1.enigmaBerry.berry.description2 = description2;

    return checksum;
}
#endif

__attribute__((naked))
void debug_sub_80C2D24()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r8\n"
        "	push	{r7}\n"
        "	ldr	r6, [sp, #0x18]\n"
        "	ldr	r4, [sp, #0x1c]\n"
        "	mov	r8, r4\n"
        "	ldr	r5, ._18\n"
        "	ldr	r7, ._18 + 4\n"
        "	add	r4, r5, r7\n"
        "	strb	r0, [r4]\n"
        "	ldr	r4, ._18 + 8\n"
        "	add	r0, r5, r4\n"
        "	strb	r1, [r0]\n"
        "	add	r7, r7, #0x2\n"
        "	add	r0, r5, r7\n"
        "	strb	r2, [r0]\n"
        "	ldr	r1, ._18 + 12\n"
        "	add	r0, r5, r1\n"
        "	strb	r3, [r0]\n"
        "	add	r4, r4, #0x3\n"
        "	add	r0, r5, r4\n"
        "	strb	r6, [r0]\n"
        "	add	r7, r7, #0x3\n"
        "	add	r0, r5, r7\n"
        "	mov	r1, r8\n"
        "	strb	r1, [r0]\n"
        "	sub	r4, r4, #0x19\n"
        "	add	r0, r5, r4\n"
        "	bl	debug_sub_80C2BD0\n"
        "	ldr	r7, ._18 + 16\n"
        "	add	r5, r5, r7\n"
        "	str	r0, [r5]\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._19:\n"
        "	.align	2, 0\n"
        "._18:\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x3175\n"
        "	.word	0x3176\n"
        "	.word	0x3178\n"
        "	.word	0x368c\n"
        "\n"
    );
}

#ifdef DEBUG

__attribute__((naked))
bool32 IsEnigmaBerryValid()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r4, ._24\n"
        "	ldr	r1, ._24 + 4\n"
        "	add	r0, r4, r1\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	beq	._22	@cond_branch\n"
        "	ldr	r2, ._24 + 8\n"
        "	add	r0, r4, r2\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	beq	._22	@cond_branch\n"
        "	ldr	r1, ._24 + 12\n"
        "	add	r0, r4, r1\n"
        "	bl	debug_sub_80C2BD0\n"
        "	ldr	r2, ._24 + 16\n"
        "	add	r1, r4, r2\n"
        "	ldr	r1, [r1]\n"
        "	cmp	r0, r1\n"
        "	bne	._22	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	b	._23\n"
        "._25:\n"
        "	.align	2, 0\n"
        "._24:\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x3174\n"
        "	.word	0x316a\n"
        "	.word	0x3160\n"
        "	.word	0x368c\n"
        "._22:\n"
        "	mov	r0, #0x0\n"
        "._23:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}
#else
bool32 IsEnigmaBerryValid(void)
{
    if (!gSaveBlock1.enigmaBerry.berry.stageDuration)
        return FALSE;
    if (!gSaveBlock1.enigmaBerry.berry.maxYield)
        return FALSE;
    if (GetEnigmaBerryChecksum(&gSaveBlock1.enigmaBerry) != gSaveBlock1.enigmaBerry.checksum)
        return FALSE;
    return TRUE;
}
#endif

const struct Berry *GetBerryInfo(u8 berry)
{
    if (berry == 0x2B && IsEnigmaBerryValid())
        return &gSaveBlock1.enigmaBerry.berry;
    else
    {
        if (berry == 0 || berry > 0x2B)
            berry = 1;
        return &gBerries[berry - 1];
    }
}

struct BerryTree *GetBerryTreeInfo(u8 id)
{
    return &gSaveBlock1.berryTrees[id];
}

bool32 FieldObjectInteractionWaterBerryTree(void)
{
    struct BerryTree *tree = GetBerryTreeInfo(FieldObjectGetBerryTreeId(gSelectedMapObject));

    switch (tree->stage)
    {
    case 1:
        tree->watered1 = TRUE;
        break;
    case 2:
        tree->watered2 = TRUE;
        break;
    case 3:
        tree->watered3 = TRUE;
        break;
    case 4:
        tree->watered4 = TRUE;
        break;
    default:
        return FALSE;
    }
    return TRUE;
}

bool8 IsPlayerFacingPlantedBerryTree(void)
{
    if (GetFieldObjectScriptPointerForComparison() == &BerryTreeScript
     && GetStageByBerryTreeId(FieldObjectGetBerryTreeId(gSelectedMapObject)) == 0)
        return TRUE;
    else
        return FALSE;
}

bool8 TryToWaterBerryTree(void)
{
    if (GetFieldObjectScriptPointerForComparison() != &BerryTreeScript)
        return FALSE;
    else
        return FieldObjectInteractionWaterBerryTree();
}

void ClearBerryTrees(void)
{
    int i;
    struct SaveBlock1 *saveBlock1 = &gSaveBlock1;
    struct BerryTree berryTree = gBlankBerryTree;

    for (i = 0; i < (u8)ARRAY_COUNT(saveBlock1->berryTrees); i++) // casting to u8 fixes a mismatched signed compare. what
        saveBlock1->berryTrees[i] = berryTree;
}

bool32 BerryTreeGrow(struct BerryTree *tree)
{
    if (tree->growthSparkle)
        return FALSE;
    switch (tree->stage)
    {
    case 0:
        return FALSE;
    case 4:
        tree->berryYield = CalcBerryYield(tree);
    case 1:
    case 2:
    case 3:
        tree->stage++;
        break;
    case 5:
        tree->watered1 = 0;
        tree->watered2 = 0;
        tree->watered3 = 0;
        tree->watered4 = 0;
        tree->berryYield = 0;
        tree->stage = 2;
        if (++tree->regrowthCount == 10)
            *tree = gBlankBerryTree;
        break;
    }
    return TRUE;
}

void BerryTreeTimeUpdate(s32 minutes)
{
    int i;
    struct BerryTree *tree;

    for (i = 0; i < (u8)ARRAY_COUNT(gSaveBlock1.berryTrees); i++)
    {
        tree = &gSaveBlock1.berryTrees[i];

        if (tree->berry && tree->stage && !tree->growthSparkle)
        {
            if (minutes >= GetStageDurationByBerryType(tree->berry) * 71)
            {
                *tree = gBlankBerryTree;
            }
            else
            {
                s32 time = minutes;

                while (time != 0)
                {
                    if (tree->minutesUntilNextStage > time)
                    {
                        tree->minutesUntilNextStage -= time;
                        break;
                    }
                    time -= tree->minutesUntilNextStage;
                    tree->minutesUntilNextStage = GetStageDurationByBerryType(tree->berry);
                    if (!BerryTreeGrow(tree))
                        break;
                    if (tree->stage == 5)
                        tree->minutesUntilNextStage *= 4;
                }
            }
        }
    }
}

void PlantBerryTree(u8 id, u8 berry, u8 stage, bool8 sparkle)
{
    struct BerryTree *tree = GetBerryTreeInfo(id);

    *tree = gBlankBerryTree;
    tree->berry = berry;
    tree->minutesUntilNextStage = GetStageDurationByBerryType(berry);
    tree->stage = stage;
    if (stage == 5)
    {
        tree->berryYield = CalcBerryYield(tree);
        tree->minutesUntilNextStage *= 4;
    }
    if (!sparkle)
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
        return 1;
    else
        return item - FIRST_BERRY + 1;
}

u16 BerryTypeToItemId(u16 berry)
{
    u16 item = berry - 1;

    if (item > LAST_BERRY - FIRST_BERRY)
        return FIRST_BERRY;
    else
        return berry + FIRST_BERRY - 1;
}

void GetBerryNameByBerryType(u8 berry, u8 *string)
{
    memcpy(string, GetBerryInfo(berry)->name, BERRY_NAME_LENGTH);
    string[BERRY_NAME_LENGTH] = EOS;
}

void ResetBerryTreeSparkleFlag(u8 id)
{
    GetBerryTreeInfo(id)->growthSparkle = 0;
}

u8 BerryTreeGetNumStagesWatered(struct BerryTree *tree)
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

u8 GetNumStagesWateredByBerryTreeId(u8 id)
{
    return BerryTreeGetNumStagesWatered(GetBerryTreeInfo(id));
}

u8 CalcBerryYieldInternal(u16 max, u16 min, u8 water)
{
    u32 randMin;
    u32 randMax;
    u32 rand;
    u32 extraYield;

    if (water == 0)
        return min;
    else
    {
        randMin = (max - min) * (water - 1);
        randMax = (max - min) * (water);
        rand = randMin + Random() % (randMax - randMin + 1);

        if ((rand & 3) > 1)
            extraYield = rand / 4 + 1;
        else
            extraYield = rand / 4;
        return extraYield + min;
    }
}

u8 CalcBerryYield(struct BerryTree *tree)
{
    const struct Berry *berry = GetBerryInfo(tree->berry);
    u8 min = berry->minYield;
    u8 max = berry->maxYield;

    return CalcBerryYieldInternal(max, min, BerryTreeGetNumStagesWatered(tree));
}

u8 GetBerryCountByBerryTreeId(u8 id)
{
    return gSaveBlock1.berryTrees[id].berryYield;
}

u16 GetStageDurationByBerryType(u8 berry)
{
    return GetBerryInfo(berry)->stageDuration * 60;
}

void FieldObjectInteractionGetBerryTreeData(void)
{
    u8 id;
    u8 berry;
    u8 unk;
    u8 group;
    u8 num;

    id = FieldObjectGetBerryTreeId(gSelectedMapObject);
    berry = GetBerryTypeByBerryTreeId(id);
    ResetBerryTreeSparkleFlag(id);
    unk = gScriptLastTalked;
    num = gSaveBlock1.location.mapNum;
    group = gSaveBlock1.location.mapGroup;
    if (sub_8060234(unk, num, group))
        gSpecialVar_0x8004 = 0xFF;
    else
        gSpecialVar_0x8004 = GetStageByBerryTreeId(id);
    gSpecialVar_0x8005 = GetNumStagesWateredByBerryTreeId(id);
    gSpecialVar_0x8006 = GetBerryCountByBerryTreeId(id);
    GetBerryNameByBerryType(berry, gStringVar1);
}

void sub_80B4EE4(void)
{
    SetMainCallback2(sub_80A68CC);
}

void FieldObjectInteractionPlantBerryTree(void)
{
    u8 berry = ItemIdToBerryType(gScriptItemId);

    PlantBerryTree(FieldObjectGetBerryTreeId(gSelectedMapObject), berry, 1, TRUE);
    FieldObjectInteractionGetBerryTreeData();
}

void FieldObjectInteractionPickBerryTree(void)
{
    u8 id = FieldObjectGetBerryTreeId(gSelectedMapObject);
    u8 berry = GetBerryTypeByBerryTreeId(id);

    gSpecialVar_0x8004 = AddBagItem(BerryTypeToItemId(berry), GetBerryCountByBerryTreeId(id));
}

void FieldObjectInteractionRemoveBerryTree(void)
{
    RemoveBerryTree(FieldObjectGetBerryTreeId(gSelectedMapObject));
    sub_8060288(gScriptLastTalked, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

u8 PlayerHasBerries(void)
{
    return IsBagPocketNonEmpty(BAG_BERRIES);
}

#ifdef DEBUG

void debug_sub_80C33FC(u8 *buffer, s32 value, u8 n) {
    StringAppend(gStringVar4, buffer);
    ConvertIntToDecimalStringN(gStringVar1, value, STR_CONV_MODE_LEADING_ZEROS, n);
    StringAppend(gStringVar4, gStringVar1);
}

extern const u8 gUnknown_Debug_083F7F9D[];
extern const u8 gUnknown_Debug_083F7FA2[];
extern const u8 gUnknown_Debug_083F7FA9[];
extern const u8 gUnknown_Debug_083F7FB0[];
extern const u8 gUnknown_Debug_083F7FB7[];
extern const u8 gUnknown_Debug_083F7FBE[];
extern const u8 gUnknown_Debug_083F7FC5[];
extern const u8 gUnknown_Debug_083F7FCC[];
extern const u8 gUnknown_Debug_083F7FD3[];
extern const u8 gUnknown_Debug_083F7FD3[];
extern const u8 gUnknown_Debug_083F7FD3[];

#ifdef NONMATCHING
u8* DebugOpenBerryInfo(void) {
    s32 i;
    u8 berryTreeId;
    struct BerryTree *berryTree;

    if (GetFieldObjectScriptPointerForComparison() != &BerryTreeScript) {
        return NULL;
    }

    berryTreeId = FieldObjectGetBerryTreeId(gSelectedMapObject);
    berryTree = GetBerryTreeInfo(berryTreeId);
    
    for (i = 0; i < 500; i++) {
        gStringVar4[i] |= 0xFF;
    }

    debug_sub_80C33FC(gUnknown_Debug_083F7F9D, berryTreeId, 3);
    debug_sub_80C33FC(gUnknown_Debug_083F7FA2, berryTree->berry, 2);
    debug_sub_80C33FC(gUnknown_Debug_083F7FA9, berryTree->stage, 2);
    debug_sub_80C33FC(gUnknown_Debug_083F7FB0, berryTree->secondsUntilNextStage, 5);
    debug_sub_80C33FC(gUnknown_Debug_083F7FB7, berryTree->berryYield, 2);
    debug_sub_80C33FC(gUnknown_Debug_083F7FBE, berryTree->regrowthCount, 3);
    debug_sub_80C33FC(gUnknown_Debug_083F7FC5, berryTree->growthSparkle, 1);
    debug_sub_80C33FC(gUnknown_Debug_083F7FCC, berryTree->watered1, 1);
    debug_sub_80C33FC(gUnknown_Debug_083F7FD3, berryTree->watered2, 1);
    debug_sub_80C33FC(gUnknown_Debug_083F7FD3, berryTree->watered3, 1);
    debug_sub_80C33FC(gUnknown_Debug_083F7FD3, berryTree->watered4, 1);

    return gStringVar4;
}
#else
__attribute__((naked))
void DebugOpenBerryInfo()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	bl	GetFieldObjectScriptPointerForComparison\n"
        "	ldr	r1, ._138\n"
        "	cmp	r0, r1\n"
        "	beq	._136	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._137\n"
        "._139:\n"
        "	.align	2, 0\n"
        "._138:\n"
        "	.word	BerryTreeScript\n"
        "._136:\n"
        "	ldr	r0, ._141\n"
        "	ldrb	r0, [r0]\n"
        "	bl	FieldObjectGetBerryTreeId\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	add	r0, r6, #0\n"
        "	bl	GetBerryTreeInfo\n"
        "	add	r5, r0, #0\n"
        "	mov	r2, #0x0\n"
        "	ldr	r7, ._141 + 4\n"
        "	ldr	r4, ._141 + 8\n"
        "	mov	r3, #0xff\n"
        "._140:\n"
        "	add	r1, r2, r4\n"
        "	ldrb	r0, [r1]\n"
        "	orr	r0, r0, r3\n"
        "	strb	r0, [r1]\n"
        "	add	r2, r2, #0x1\n"
        "	cmp	r2, r7\n"
        "	ble	._140	@cond_branch\n"
        "	ldr	r0, ._141 + 12\n"
        "	add	r1, r6, #0\n"
        "	mov	r2, #0x3\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 16\n"
        "	ldrb	r1, [r5]\n"
        "	mov	r2, #0x2\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 20\n"
        "	ldrb	r1, [r5, #0x1]\n"
        "	lsl	r1, r1, #0x19\n"
        "	lsr	r1, r1, #0x19\n"
        "	mov	r2, #0x2\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 24\n"
        "	ldrh	r1, [r5, #0x2]\n"
        "	mov	r2, #0x5\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 28\n"
        "	ldrb	r1, [r5, #0x4]\n"
        "	mov	r2, #0x2\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 32\n"
        "	ldrb	r1, [r5, #0x5]\n"
        "	lsl	r1, r1, #0x1c\n"
        "	lsr	r1, r1, #0x1c\n"
        "	mov	r2, #0x3\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 36\n"
        "	ldrb	r1, [r5, #0x1]\n"
        "	lsr	r1, r1, #0x7\n"
        "	mov	r2, #0x1\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 40\n"
        "	ldrb	r1, [r5, #0x5]\n"
        "	lsl	r1, r1, #0x1b\n"
        "	lsr	r1, r1, #0x1f\n"
        "	mov	r2, #0x1\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r4, ._141 + 44\n"
        "	ldrb	r1, [r5, #0x5]\n"
        "	lsl	r1, r1, #0x1a\n"
        "	lsr	r1, r1, #0x1f\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldrb	r1, [r5, #0x5]\n"
        "	lsl	r1, r1, #0x19\n"
        "	lsr	r1, r1, #0x1f\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldrb	r1, [r5, #0x5]\n"
        "	lsr	r1, r1, #0x7\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	bl	debug_sub_80C33FC\n"
        "	ldr	r0, ._141 + 8\n"
        "._137:\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._142:\n"
        "	.align	2, 0\n"
        "._141:\n"
        "	.word	gSelectedMapObject\n"
        "	.word	0x1f3\n"
        "	.word	gStringVar4\n"
        "	.word	gUnknown_Debug_083F7F9D\n"
        "	.word	gUnknown_Debug_083F7FA2\n"
        "	.word	gUnknown_Debug_083F7FA9\n"
        "	.word	gUnknown_Debug_083F7FB0\n"
        "	.word	gUnknown_Debug_083F7FB7\n"
        "	.word	gUnknown_Debug_083F7FBE\n"
        "	.word	gUnknown_Debug_083F7FC5\n"
        "	.word	gUnknown_Debug_083F7FCC\n"
        "	.word	gUnknown_Debug_083F7FD3\n"
        "\n"
    );
}
#endif

#endif

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
    for (i = 0; i < (u8)ARRAY_COUNT(gSaveBlock1.mapObjects); i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].animPattern == 12)
        {
            cam_left = gMapObjects[i].coords2.x;
            cam_top = gMapObjects[i].coords2.y;
            if (left <= cam_left && cam_left <= right && top <= cam_top && cam_top <= bottom)
                ResetBerryTreeSparkleFlag(gMapObjects[i].trainerRange_berryTreeId);
        }
    }
}

#if DEBUG
static const u8 gUnknown_Debug_083F7F84[] = _("そとから　きた　きのみ");
static const u8 gUnknown_Debug_083F7F90[] = _("ただいま　かいはつちゅう");
static const u8 gUnknown_Debug_083F7F9D[] = _("POS:");
static const u8 gUnknown_Debug_083F7FA2[] = _("\nTYPE:");
static const u8 gUnknown_Debug_083F7FA9[] = _("\nGROW:");
static const u8 gUnknown_Debug_083F7FB0[] = _("\nTIME:");
static const u8 gUnknown_Debug_083F7FB7[] = _("\nFCNT:");
static const u8 gUnknown_Debug_083F7FBE[] = _("\nSCNT:");
static const u8 gUnknown_Debug_083F7FC5[] = _("\nHOOK:");
static const u8 gUnknown_Debug_083F7FCC[] = _("\nWBIT:");
static const u8 gUnknown_Debug_083F7FD3[] = _("");
#endif