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
print "\n"


