# coding: utf-8
# 演習2
# Hanakoが1位、Jiroが3位とする。
# このような配列aから、名前を鍵として指定すると順位を返すようなハッシュを作るコードを示せ。

a = ["Hanako", "Taro", "Jiro"]
h = Hash.new
a.each_with_index do |n, i|
  h[n] = i + 1
end

while (c =gets().chomp) != "exit" do
  if h.key?(c)
     p h[c]
  else
    puts "存在しません"
  end
end

