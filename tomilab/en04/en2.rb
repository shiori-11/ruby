# ファイル（file.txt）から読み込んだ名前を昇順に並び替えて、name.txtに書き込むプログラムを作成しなさい。 

a = Array.new
ARGF.each do |x|
 a << x
end

a.sort!

f = File.open("name.txt", 'w')
a.each do |x|
  f.print x
end
f.close
