# coding: utf-8

class LinearList
  attr_reader :id, :name, :belong, :nextObj

  def initialize(id, name, belong)
    @id = id
    @name = name
    @belong = belong
  end

  def createNext(id, nextName, nextBelong)
    @nextObj = LinearList.new(id, nextName, nextBelong)
  end

end

lines = Array.new
ARGF.each do |f|
  lines << f.split(/\s/)
end

list = ""
nlist = ""

lines.each_with_index do |l, i|
  if i == 0
    list  = LinearList.new(i+1,l[0],l[1])
    nlist = list
  else
    nlist.createNext(i+1, l[0], l[1])
    nlist = nlist.nextObj
  end
end
  

while list != nil
  puts "ID:#{list.id} 名前:#{list.name}　所属:#{list.belong}"
  list = list.nextObj
end
