# coding: UTF-8
# ケンブリッジ変換してください。
# ケンブリッジ変換とは、単語ごとに最初と最後以外の文字の順番を入れ替える操作です。
# できれば、任意の文をケンブリッジ変換できるようにしてください。

a = Array.new
ARGF.each do |f|
  a += f.split(/[　 ]/)
end


a.each do |word|
  j = word.size 
  if word[j-1] == "\n"
    i = 3
  else
    i = 2
  end
  n = word[1..j-i].split(//)
  n.sort_by!{rand}
  tmp = n.join("")
  word[1..j-i] = tmp
end

a.each do |word|
  print word 
  print "　" unless  word =~ /\n/
end

