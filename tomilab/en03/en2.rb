# 複数の整数が記入されたファイルを読み込み、昇順にソートした結果を出力するプログラムを作成してください。
# ファイルに記入する整数は以下のように、カンマで区切ってあるものとします。
# 改行が入っていても文句を言ってはいけません。

a = Array.new
ARGF.each do |x|
  a += x.scan(/-?\d+/)
end

# 数字にしてソートするブロック
a.sort_by!{|x| x.to_i}
a.each_with_index do |n, i|
  print n
  print ", " if i != a.size - 1
end

puts 
