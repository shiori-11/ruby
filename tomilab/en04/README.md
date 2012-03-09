# 演習1（en1.rb）
コマンドラインの引数に入力した約数を全て表示しなさい。

**実行画面**
	
	$ ruby en1.rb 50
	1,2,5,10,25,50
	
===

# 演習2（en2.rb）
ファイル(file.txt)から読み込んだ名前を昇順に並び替えて、name.txtに書きこむプログラムを作成しなさい。

**file.txt**
	
	keita
	oba
	shika
	yon
	oda
	piro
	yamamoto
	sugimoto
	amano
	homma
	tagagi
	wauchi
	maezawa
	johnny
	furutatsu
	takashi(virtual member)
	tominaga kazuto
	
**実行画面**
	
	$ ruby en2.rb file.txt
	$ cat name.txt
	amano
	furutatsu
	homma
	johnny
	keita
	maezawa
	oba
	oda
	piro
	shika
	sugimoto
	tagagi
	takashi(virtual member)
	tominaga kazuto
	wauchi
	yamamoto
	yon
	
===

# 演習3（en3.rb）
カレンダーを表示するプログラムを作成しなさい。コマンドライン引数から月と西暦を取得するし、カレンダーを表示する。西暦を入力しない場合は、今年のカレンダーを表示させる。

**実行画面**
	
	$ ruby en3.rb 5 2011
	2011/5
	Su Mo Tu We Th Fr Sa
 	 1  2  3  4  5  6  7
 	 8  9 10 11 12 13 14
	15 16 17 18 19 20 21
	22 23 24 25 26 27 28
	29 30 31
	$ ruby en3.rb 5 
	2012/5
	Su Mo Tu We Th Fr Sa
    	   1  2  3  4  5
	 6  7  8  9 10 11 12
	13 14 15 16 17 18 19
	20 21 22 23 24 25 26
	27 28 29 30 31