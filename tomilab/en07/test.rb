puts "Test start"

puts "Create thread"

t = Thread.new do
  loop{
    puts "Start thread"
    puts "End thread"
    sleep 3 
  }
end

while line = gets
  if line.chop == "."
    Thread::kill(t)
    puts "the thread killed"
    break
  end
end

puts "Test compleated"
