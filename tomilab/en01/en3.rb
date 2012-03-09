# 演習3
# 引数として数を取り、その階乗を計算して返す関数を作ってください。

def factiorial n
  kai = 1
  if n < 0 
    kai = "nil"
  elsif n > 1
    (1..n).each do |x|
      kai *= x
    end
  end

  kai
end
p ARGV[0].to_i

puts factiorial ARGV[0].to_i

