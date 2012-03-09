# 演習1
# 1 以上の整数 n を引数として取り、1 から n までを画面に表示するメソッド foo を作りなさい。 
# codeing: utf-8
def foo n
   y = n.to_s.size
  (1..n).each do |x|
    printf "%#{y}d", x
    if x % 5 == 0 || x == n
      puts
    else
      print ","
    end
  end
end

exit if (i = ARGV[0].to_i) < 1

foo i

