# コマンドラインの引数から数値を入力し、１０進数を２進数に変換して出力しなさい。
# (余力がある人は入力する数値がマイナスの場合も考えてみてね☆ただし、マイナスも含める場合は32bitで表示する)

n = ARGV[0].to_i

exit if n < -2147483648 || n > 2147483647
p bit = sprintf("%32b", n)
if bit =~ /\.\./
  bit.gsub!(/ /, "1")
  p bit.to_s.size 
  if bit.to_s.size == 34
    bit.gsub!(/\./, "")
  elsif bit.to_s.size == 33
    bit.sub!(/\./, "")
  end
  bit.gsub!(/\./, "1")
else
  bit.gsub!(/ /, "0")
end

puts bit
