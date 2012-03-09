# コマンドラインの引数に入力した数値の約数を全て表示してください。

n = ARGV[0].to_i

n.times do |i|
  next if i == 0
  if n % i == 0
    print i
    print "," 
  end
end

puts n
