# 素数を算出するプログラムを作ってください。
# 入力された自然数までの素数を表示させます。
# たとえば「3」と入力すると「2,3」、「8」と入力すると「2,3,5,7」が表示されます。

n = ARGV[0].to_i
count = []

(2..n).each do |i|
  (2..i).each do |j|  
    count << j if i == j
    break if i % j == 0
  end
end

count.each_with_index do |c,i|
  print c
  print "," unless i == count.size-1
end
puts
