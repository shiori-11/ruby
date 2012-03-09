# 今年のカレンダーを表示するプログラムを作ってください。
# コマンドライン引数（1～12の範囲の整数）をとり、それを表示する月とします。
# 余力があれば、任意の年（西暦1年～）を表示できるようにしてください。
# 西暦2011年1月1日は土曜日です。西暦1年1月1日は便宜的に月曜日とします。

require 'date'

month = ARGV[0].to_i
year = ARGV[1].to_i

year = Date.today.year if year == 0

puts "#{year}/#{month}"

d = Date.new(year, month, 1)
p d.wday 
puts "Su Mo Tu We Th Fr Sa"
1.upto(d.wday) do |n|
  print "   "
end 


while month == d.month
  printf "%2d ", d.day
  puts if d.saturday?
  d += 1
end

puts 
