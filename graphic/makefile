
TARGET_ARC=pokegra.bin
TARGET_HEADER = $(TARGET_ARC:.bin=.h)		#2001.06.01 add by tama
TARGET_LIST=pokeagb.lst
ARCNAME_LIST=arcname.lst
START_ADRS=867d000
SRC_DIR	= c:..
DEFAULTLST=default.lst
PMLST=pm2comp.lst

SOGA_LIST=soga.lst
MATSU_LIST=matsuda.lst
MORI_LIST=mori.lst
TAYA_LIST=taya.lst
NAKA_LIST=nakamura.lst
IWA_LIST=iwasawa.lst

include	$(ARCNAME_LIST)

#コンパイル対象拡張子
.SUFFIXES:
.SUFFIXES:.ach .sch .ssc .scl .pch .psc .pcl .bin .lst

$(TARGET_ARC):$(PRSFILES)$(ARCNAME_LIST)
	prslink $(ARCNAME_LIST) $(TARGET_ARC:.bin=) $(START_ADRS)
#	cp $(TARGET_ARC) $(SRC_DIR)/graphic			#2001.06.01 add by tama
#	cp $(TARGET_HEADER) $(SRC_DIR)/source			#2001.06.01 add by tama
#	cp $(TARGET_HEADER) $(SRC_DIR)/graphic			#2001.07.04 change by matsuda
#	cp $(TARGET_ARC:.bin=.h) t:/src/source			#2001.06.01 del by tama

%.pin:%.bin
	arc $< $(TARGET_LIST)

%.pch:%.ach
	arc $< $(TARGET_LIST)

%.pch:%.sch
	arc $< $(TARGET_LIST)

%.psc:%.ssc
	arc $< $(TARGET_LIST)

%.pcl:%.scl
	arc $< $(TARGET_LIST)

ov_%.pcl:ov_%.col
	arc $< $(TARGET_LIST)

$(ARCNAME_LIST):$(TARGET_LIST)
	mkarclst $< $@

$(TARGET_LIST):$(DEFAULTLST) $(PMLST) $(SOGA_LIST) $(MATSU_LIST) $(MORI_LIST) $(TAYA_LIST) $(NAKA_LIST) $(IWA_LIST)
	lstlink $(DEFAULTLST) $(PMLST) $(SOGA_LIST) $(MATSU_LIST) $(MORI_LIST) $(TAYA_LIST) $(NAKA_LIST) $(IWA_LIST) $(TARGET_LIST)

.PHONY:	all clean 

all:	clean $(TARGET_ARC)

clean:
	-rm *.pch
	-rm *.PCH
	-rm *.psc
	-rm *.PSC
	-rm *.pcl
	-rm *.PCL
	-rm *.arc
	-rm arcname.lst


