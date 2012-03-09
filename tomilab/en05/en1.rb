# ３の倍数と３のつく数字のときだけアホになります
# ・コマンドラインから好きな数字を入力する（１以上）
# ・1から順番に数を表示する
# ・その数が3の倍数、もしくは3のつく数字であれば"Aho"と表示する

if (n = ARGV[0].to_i) < 0
  exit
end

1.upto(n) do |x|
  if x % 3 == 0 || x.to_s =~ /3/
    print "Aho " 
  else
    print "#{x} "
  end
end

puts 
