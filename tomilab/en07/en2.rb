# coding: UTF-8
# ブロック付きメソッドafterschoolを定義してafterschool.txtを読み込み、与えられたブロックに引数を渡しなさい。

def afterschool()
  a = Array.new
  ARGF.each do |f|
    a = f.split(/\s/)
    yield a[0],a[1],a[2],a[3]
  end
end

afterschool {|n1,n2,n3,n4|
  puts "【名前】#{n1}\t 【誕生日】#{n2}\t 【身長】#{n3}cm\t 【血液型】#{n4}型"
}


