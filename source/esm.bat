del evdata.o
del sxydata.o
awk -f ..\sxydata\seed.awk ../sxydata/*.sxy > ..\sxydata\seed_def.h
awk -f ..\sxydata\sxychk.awk ../sxydata/*.sxy
make
