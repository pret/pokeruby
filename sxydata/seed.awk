BEGIN{
	RS="{"			#レコード区切りを"{"にする	（通常は改行）
	FS="\n"			#フィールド区切りを改行にする	（通常はスペースorタブ）

	printf( "//sxyデータの「きのみＩＤ」定義 " )
	print "\n"
}


$8 ~/MV_SEED/ && $3 ~/SEED/ && $13 ~/seed_script/{

	symbol = toupper($2)		#大文字に統一
	sub(/,.*$/,"",symbol)		#","以降を削除
	sub(/^[\t ]*/,"",symbol)	#先頭のスペースやタブを削除

	id = tolower($12)			#小文字に統一
	sub(/,.*$/,"",id)			#","以降を削除

	if ( id in ID_List ) {

		#同じ数値を定義している個所がある場合
		printf("同じ値の定義があります\n") >> "/dev/stderr"
		printf("[%s] [%s] %s\n",ID_List[id],symbol,id) >> "/dev/stderr"
		printf("ERROR! %s\n",symbol)

		exit				#途中で終了

	}

	ID_List[id] = symbol		#要素として登録

	#定義を出力
	printf("#define ID_%-30s %s\n",symbol,id)
}

