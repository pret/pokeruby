BIN2C := tools/bin2c/bin2c

GEN_FONT_HEADERS := \
include/fonts/font0_lat_glyphs.h \
include/fonts/font1_lat_glyphs.h \
include/fonts/font0_jpn_glyphs.h \
include/fonts/font1_jpn_glyphs.h \
include/fonts/braille_glyphs.h \
include/fonts/down_arrow_tiles.h \
include/fonts/unknown_palette_81E6692.h \
include/fonts/default_palette.h

LINK_HEADERS := include/link/digit_tiles.h include/link/digit_palette.h

generated: $(GEN_FONT_HEADERS) $(LINK_HEADERS)

include/fonts/font0_lat_glyphs.h: graphics/fonts/font0_lat.1bpp
	$(BIN2C) $< sFont0LatinGlyphs >$@ -static -col 8 -pad 4

include/fonts/font1_lat_glyphs.h: graphics/fonts/font1_lat.1bpp
	$(BIN2C) $< sFont1LatinGlyphs >$@ -static -col 8 -pad 4

include/fonts/font0_jpn_glyphs.h: graphics/fonts/font0_jpn.1bpp
	$(BIN2C) $< sFont0JapaneseGlyphs >$@ -static -col 8 -pad 4

include/fonts/font1_jpn_glyphs.h: graphics/fonts/font1_jpn.1bpp
	$(BIN2C) $< sFont1JapaneseGlyphs >$@ -static -col 8 -pad 4

include/fonts/braille_glyphs.h: graphics/fonts/font6_braille.1bpp
	$(BIN2C) $< sBrailleGlyphs >$@ -static -col 8 -pad 4

include/fonts/down_arrow_tiles.h: graphics/fonts/down_arrow.4bpp
	$(BIN2C) $< sDownArrowTiles >$@ -static -size 4 -pad 10

include/fonts/unknown_palette_81E6692.h: graphics/fonts/unknown_81E6692.gbapal
	$(BIN2C) $< gUnknownPalette_81E6692 >$@ -size 2 -pad 6

include/fonts/default_palette.h: graphics/fonts/default.gbapal
	$(BIN2C) $< gFontDefaultPalette >$@ -size 2 -pad 6

include/link/digit_tiles.h: graphics/interface/link_test_digits.4bpp
	$(BIN2C) $< sLinkTestDigitTiles >$@ -static -size 4 -pad 10

include/link/digit_palette.h: graphics/interface/link_test_digits.gbapal
	$(BIN2C) $< sLinkTestDigitPalette >$@ -static -size 2 -pad 6
