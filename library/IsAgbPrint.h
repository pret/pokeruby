
#ifndef	__ISAGBPRN_H__
#define	__ISAGBPRN_H__

#ifdef __cplusplus
extern "C" {
#endif

/////////////////////////////////////////////////////////////////////////
/// Copyright 2000-2001 INTELLIGENT SYSTEMS Co.,Ltd.
/// IS-AGB-EMULATOR
/// PRINT DEBUG LIBRARY [libagbprn.a]

/////////////////////////////////////////////////////////////////////////
/// 関数説明
/// 
/// [プリントデバッグ初期化]
/// void AGBPrintInit(void);
///						プリントデバッグに使用するバッファを初期化します。現在は、
///						0x08fd0000 - 0x08fdffff までを使用します。将来このアドレス
///						はIS-CGB-EMULATORのエミュレーション搭載容量によって移動する
///						可能性があります。
///
/// [１文字出力]
///	 void AGBPutc(const char cChar);
///		cChar:	表示用キューバッファに１文字追加します。この関数を呼んでも
///						直ぐに表示されることはありません。ただし、キューバッファが
///						いっぱいになった場合には、１ブロック分表示出来るまで待ちつ
///						づけます
///
/// [文字列出力]
/// void AGBPrint(const char* pBuf);
///		 pBuf: 表示用キューバッファに文字列を追加します。この関数を呼んでも
///						直ぐに表示されることはありません。ただし、キューバッファが
///						いっぱいになった場合には、１ブロック分表示出来るまで待ちつ
///						づけます
///
/// [フォーマット付き文字列出力]
///	void AGBPrintf(const char *pBuf, ...)
///		 pBuf:	表示用キューバッファにフォーマットした文字列を追加します。
///						この関数を呼んでも直ぐに表示されることはありません。ただし、
///						キューバッファがいっぱいになった場合には、１ブロック分表示
///						出来るまで待ちつづけます(使用方法は、ANSIのprintf()関数と
///						同様です。）
///
/// [文字列１ブロック表示]
/// void AGBPrintFlush1Block(void);
///						表示用キューバッファからAGB側の動作にあまり影響を与えない
///						容量分をフラッシュします。この関数を、V-BLANK毎に呼び出す
///						などで、AGB側を完全に停止させることなく、すこしずつ、
///						IS-AGB-EMULATOR、IS-AGB-DEBUGGERのコマンドビューにに文字列を
///						フラッシュすることが出来ます。毎フレーム文字列を表示するよう
///						な場合に便利です。
///
/// [文字列フラッシュ]
/// void AGBPrintFlush(void);
///						表示用キューバッファが空になるまで、完全になくなるまで
///						IS-AGB-EMULATOR、IS-AGB-DEBUGGERのコマンドビューにに文字列
///						をフラッシュすることが出来ます。
///
/// [プログラム正当性チェックマクロ]
/// AGB_ASSERT( 評価式 );
///		 評価式 には、C言語の評価式を記述します。評価式 の値が真(ZERO以
///		 外)ならば次のプログラムを実行します。偽(ZERO)ならば、
///		 AGB_ASSERT()が定義されているソースファイル名とそのラインナンバー
///		 、評価式 を表示して、プログラムは停止します。
///
/// [プログラム正当性チェックマクロ]
/// AGB_WARNING( 評価式 );
///		 AGB_ASSERT()と同じ使用方法です。AGB_ASSERT()との違う点は、ASSERT
///		 は、プログラムを停止し以降の処理は行わない（ハングアップ状態）こ
///		 とに対し、AGB_WARNNING()は引き続きプログラムを実行する点です。

/////////////////////////////////////////////////////////////////////////
/// 使用上の注意
/// 
/// ・このライブラリはgcc用です。
/// ・このライブラリはthumb専用です。armでは使用することは出来ません。
/// ・文字列を出力しても、すぐにホストに出力される訳ではありません。バッ
///		ファがいっぱいになるか、フラッシュ系関数を呼び出すことでホスト側に出
///		力が行われます。
/// ・プリントデバッグで使用するエリアはユーザーが変更してはいけません。
/// ・IS-AGB-EMULATORハードウェアの都合上、ホスト側にデータを送る間には
///		(AGBFlash()が呼ばれる間)[一時的]に割込みを禁止、メモリウェイトが変
///		更されます。
/// ・gccコンパイラには、必ずオプション -mthumb-interwork を指定してくだ
///		さい。
/// ・AGBカートリッジ64Mフラッシュや出荷時のROMなどのリリースバージョンを
///   作成する際には、 NDEBUG を定義することでプリントデバッグ関数・マクロ
///   は必ず取り除いてください。
/// ・libisagbprn.aをリンクすると、自動的にlibg.aがリンクされます。
///   libg.aに含まれている関数名とユーザーが使用する関数名が衝突しないよう
///   ご注意ください。
///
/////////////////////////////////////////////////////////////////////////
/// Makefile リンク行の例
/// -L. -l isagbprn

/////////////////////////////////////////////////////////////////////////
/// 使用例
/// 
/// AGBPrintInit();
///
/// while(1) {
///   static int i;
///		AGBPrintf("TEST PROGRAM %d \n", i++);
///			pSelf->X++;
///			AGB_ASSERT((pSelf != NULL) && (pSelf->X > 0));
///   AGBFlush1Block();
/// }
///
/////////////////////////////////////////////////////////////////////////
///

#ifdef NDEBUG
	#define AGBPrintInit()
	#define AGBPutc(cChar)
	#define AGBPrint(pBuf)
	#define	AGBPrintf(arg...)
	#define AGBPrintFlush1Block()
	#define AGBPrintFlush()
	#define AGBAssert(file,line,info)
#else
	void AGBPrintInit(void);
	void AGBPutc(const char pBuf);
	void AGBPrint(const char* pBuf);
	void AGBPrintf(const char *pBuf, ...);
	void AGBPrintFlush1Block(void);
	void AGBPrintFlush(void);
	void AGBAssert(const char* pFile, int nLine, const char* pExpression, int nStopProgram);
#endif

/////////////////////////////////////////////////////////////////////////
///

#undef AGB_ASSERT
#ifdef NDEBUG
#define	AGB_ASSERT(exp)
#else
#define	AGB_ASSERT(exp)	(exp) ? ((void)0) : AGBAssert(__FILE__, __LINE__, #exp, 1);
#endif

#undef AGB_WARNING
#ifdef NDEBUG
#define	AGB_WARNING(exp)
#else
#define	AGB_WARNING(exp)	 (exp) ? ((void)0) : AGBAssert(__FILE__, __LINE__, #exp, 0);
#endif

/////////////////////////////////////////////////////////////////////////

#ifdef __cplusplus
}	 // extern "C"
#endif

#endif

