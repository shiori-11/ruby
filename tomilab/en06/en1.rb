# 転置行列とは行と列を入れ替えてできる行列のことを言います．
# file.txtから読み込んだ行列を転置行列に変換して出力しなさい．

a = Array.new
ARGF.each do |f|
  a << f.split(/\s/)
end

a[0].each_index do |i|
  a.each_index do |j|
    print "#{a[j][i]} "
  end
  puts 
end
