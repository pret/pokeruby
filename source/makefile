#==========================================================================
#
#	ポケモンＡＧＢ	ＭＡＫＥ記述
#
#		2001.01.25	by Sosuke Tamada (GAME FREAK inc.)
#==========================================================================


#PM_VERSIONの定義
VERSION	= poke_ver
include	$(VERSION)

LOCAL_LIB	= ../library

AGBINC	= $(LOCAL_LIB)
AGBLIB	= $(LOCAL_LIB)
#AGBINC	= $(AGBDIR)/include
#AGBLIB	= $(AGBDIR)/lib

# 生成されるロムイメージ名
TARGET_NAME = poke_agb

# サウンドデータ格納ディレクトリ
SOUND_DIR = ../snd_file/
include $(SOUND_DIR)SoundFiles

# ソースファイル一覧
# .SFILES .ASMFILESが定義されている
SRCLIST	= srcfiles
include $(SRCLIST)

# 補助スクリプトファイル名
NDWSCRIPT = ndw.awk


.SFILES    =  crt0.s 

.OFILES    =   $(.SFILES:.s=.o) $(.CFILES:.c=.o) $(.ASMFILES:.s=.o)

#グラフィックデータのバイナリ関連
GRAPHIC_BIN	= ../graphic/pokegra.bin
GRAPHIC_OFILE=pokegra.o
.OFILES		+= $(GRAPHIC_OFILE)

#バージョン定義など
DEFINEFLAGS	=	-D PM_VERSION=$(PM_VERSION) \
			  	-D PM_LANG=$(PM_LANG)

ifeq	($(PR_VER_ROM),YES)
DEFINEFLAGS	+=	-D PR_VER_ROM=$(PR_VER_ROM)
endif
ifeq	($(FESTA_VER_ROM),YES)
DEFINEFLAGS	+=	-D FESTA_VER_ROM=$(FESTA_VER_ROM)
endif
ifeq	($(PM_DEBUG),YES)
DEFINEFLAGS +=	-D PM_DEBUG=$(PM_DEBUG)
endif


AS_CPPFLAG	=	-E $(DEFINEFLAGS) -D"ASM_CPP" -I$(AGBINC)

ASFLAGS    =   -I$(AGBINC) -mthumb-interwork

CFLAGS     =   	$(DEFINEFLAGS) \
				-g -O2 -I$(AGBINC) -mthumb-interwork \
				-nostdlib -Wall

#↓の#をとって有効にするとメモリマップ（poke_agb.map）が出力される
#LDFLAGS		+= -Map $(MAPFILE)

LDFLAGS	 +=	\
		-T $(LDSCRIPT) \
		-nostartfiles \
		-L$(LOCAL_LIB)/ -lagbbackup -lagbrtc \
		-L$(AGBLIB)/ -lisagbprn -lagbsyscall 

DEPENDFILE =   Mdepend
MAPFILE    =   $(TARGET_NAME).map
TARGET_ELF =   $(TARGET_NAME).elf
TARGET_BIN =   $(TARGET_NAME).bin
LDSCRIPT   =   poke_lnk.x


#コンパイル対象拡張子
.SUFFIXES:.ndw .tbl .s .c .o

$(TARGET_BIN): $(TARGET_ELF)
	objcopy -v -O binary $< $@

$(TARGET_ELF): $(.OFILES) $(SOUND_FILES) Makefile $(.AFILES) $(DEPENDFILE) $(.LIBFILES)
	@echo > $(MAPFILE)
	@$(CC) -g -o $@ $(.OFILES) $(SOUND_FILES) $(.LIBFILES) -Wl,$(LDFLAGS)


#グラフィックデータのバイナリ関連
$(GRAPHIC_OFILE): $(GRAPHIC_BIN)
	objcopy -v -I binary -O elf32-little $< $@


#.tbl.ndw:
%.ndw:	%.tbl
	gawk -f $(NDWSCRIPT) $< > $@

#アセンブラソースをCプリプロセッサで処理してからアセンブルする
%.o: %.s
	cp $< $*.c
	$(CC) $(AS_CPPFLAG) $*.c > $*.app
	$(AS) $(ASFLAGS) -o $@ $*.app
	rm $*.c $*.app


# ターゲット（ファイル以外）
.PHONY: all clean depend date date2 test map asm

test:
	-cp $(TARGET_BIN) before.bin
	$(MAKE)
	fc /B $(TARGET_BIN) before.bin

all:   clean depend
	$(MAKE) $(TARGET_BIN)

asm:
	-rm $(.ASMFILES:.s=.o)
	$(MAKE)

clean:
	-rm $(.OFILES) $(DEPENDFILE) $(TARGET_ELF) $(TARGET_BIN) $(MAPFILE) before.bin

depend:
	$(CC) $(CFLAGS) -M $(.CFILES) > $(DEPENDFILE)

$(DEPENDFILE): 
	$(CC) $(CFLAGS) -M $(.CFILES) > $(DEPENDFILE)

crt0.o:		crt0.s rom_h.s $(AGBINC)\AgbDefine.s \
 $(AGBINC)\AgbMacro.s $(AGBINC)\AgbMemoryMap.s

multisio.o: multisioasm.s
 
usescript.h:	ev_cmd.s ev_work.s ev_call.s
evdata.o:	usescript.h	../evdata/scriptlist.s

include $(DEPENDFILE)

date:
	awk -vstring="build_date" -f getdate.awk > d_date.h

date2:
	awk -vstring="continue_date" -f getdate.awk > d_date2.h

map:
	awk -f ../mapdata/scrn_list.awk ../mapdata/scrn_list

