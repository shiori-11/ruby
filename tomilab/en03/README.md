# 演習1（en1.rb）
コマンドラインの引数から数値を入力し、10新数を2進数に変換して出力しなさい。（マイナスを含める場合は32bitで表示させなさい）

**実行画面**
	
	$ ruby en1.rb -3
	11111111111111111111111111111101
	$ruby en1.rb 3
	00000000000000000000000000000011
	
===

# 演習2（en2.rb）
複数の整数が記入されたファイルを読み込み、昇順にソートした結果を出力するプログラムを作成しなさい。ファイルには下記のように記入されているものとする。

**n1.txt**

	5,2,13,7,90,5,-5,0
	10,8,7,6,4,3,1,-4
	
**実行画面**

	$ ruby en2.rb n1.txt
	-5, -4, 0, 1, 2, 3, 4, 5, 5, 6, 7, 7, 8, 10, 13, 90