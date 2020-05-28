#
#	テーブル定義生成スクリプト
#	2000.12.5 by tama
#
#	使用するさいの書式
#	awk -f ndw.awk 入力ファイル名(拡張子は.ndw以外認めない)
#
#　入力するファイル例
#		…
#	
#

BEGIN{
	start_flag = 0
	}

$0 ~/\/\*[ |	]*NDW TABLE START/{
	start_flag = 1
#	printf("enum{\n");
	counter = 0;
	}

(start_flag ==1) && $0 ~/\/\*[ |	]*NDW TABLE END/{
	start_flag = 0
#	printf("};\n\n");
	}

(start_flag ==1) && $0 ~/,[ |	]*\/\*[ |	]*/{
	now = $0
	sub(/.*\/\*[ |	]*/,"",now)
	sub(/[ |	]*\*\/.*$/,"",now)
	printf("#define %-20s\t %3d\n",now,counter);
#	printf("\t%-20s\t//%03d\n",now ",",counter)
	counter++;
	}


