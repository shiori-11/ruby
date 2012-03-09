# coding: UTF-8
# 数を１秒ごとにカウントしてください。
# このとき、カウントしている数を全角数字で表示してください。
# この処理は無限ループさせ、Enterキーを押す事で処理を終了するようにしてください。


t = Thread.new do 
  n = 0
  loop {
    j = n.to_s.tr("0-9","０-９")
    puts j
    sleep 1
    n += 1
  }
end

while l = gets
  
  if l =~ /\n/
    Thread::kill(t)
    exit
  end
end
