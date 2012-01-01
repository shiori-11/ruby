# coding: utf-8
# 初期状態のセル
ac = [
    [0,2,2,2,2,2,2,2,2,0,0,0,0,0,0],
    [2,1,7,0,1,4,0,1,4,2,0,0,0,0,0],
    [2,0,2,2,2,2,2,2,0,2,0,0,0,0,0],
    [2,7,2,0,0,0,0,2,1,2,0,0,0,0,0],
    [2,1,2,0,0,0,0,2,1,2,0,0,0,0,0],
    [2,0,2,0,0,0,0,2,1,2,0,0,0,0,0],
    [2,7,2,0,0,0,0,2,1,2,0,0,0,0,0],
    [2,1,2,2,2,2,2,2,1,2,2,2,2,2,0],
    [2,0,7,1,0,7,1,0,7,1,1,1,1,1,2],
    [0,2,2,2,2,2,2,2,2,2,2,2,2,2,0]
]

# セルの規則
hash = {     0 => 0,     1 => 2,     2 => 0,     3 => 0,     5 => 0,
             6 => 3,     7 => 1,    11 => 2,    12 => 2,    13 => 2,
            21 => 2,    26 => 2,    27 => 2,    22 => 0,    23 => 0,
            32 => 0,    52 => 5,    62 => 2,    72 => 2,   102 => 2,
           112 => 0,   202 => 0,   203 => 0,   205 => 0,   212 => 5,
           222 => 0,   232 => 2,   522 => 2,  1232 => 1,  1242 => 1, 
          1252 => 5,  1262 => 1,  1272 => 1,  1275 => 1,  1422 => 1, 
          1432 => 1,  1442 => 1,  1472 => 1,  1625 => 1,  1722 => 1, 
          1725 => 5,  1752 => 1,  1762 => 1,  1772 => 1,
          2527 => 1, 10001 => 1, 10006 => 1, 10007 => 7, 10011 => 1,
         10012 => 1, 10021 => 1, 10024 => 4, 10027 => 7, 10051 => 1,
         10101 => 1, 10111 => 1, 10124 => 4, 10127 => 7, 10202 => 6,
         10212 => 1, 10221 => 1, 10224 => 4, 10226 => 3, 10227 => 7,
         10232 => 7, 10242 => 4, 10262 => 6, 10264 => 4, 10267 => 7,
         10271 => 0, 10272 => 7, 10542 => 7, 11112 => 1, 11122 => 1,
         11124 => 4, 11125 => 1, 11126 => 1, 11127 => 7, 11152 => 2,
         11212 => 1, 11222 => 1, 11224 => 4, 11225 => 1, 11227 => 7,
         11232 => 1, 11242 => 4, 11262 => 1, 11272 => 7,
         11322 => 1, 12224 => 4, 12227 => 7, 12243 => 4, 12254 => 7,
         12324 => 4, 12327 => 7, 12425 => 5, 12426 => 7, 12527 => 5,
         20001 => 2, 20002 => 2, 20004 => 2, 20007 => 1, 20012 => 2,
         20015 => 2, 20021 => 2, 20022 => 2, 20023 => 2, 20024 => 2,
         20025 => 0, 20026 => 2, 20027 => 2, 20032 => 6, 20042 => 3,
         20051 => 7, 20052 => 2, 20057 => 5, 20072 => 2, 20102 => 2,
         20112 => 2, 20122 => 2, 20142 => 2, 20172 => 2, 20202 => 2,
         20203 => 2, 20205 => 2, 20207 => 3, 20212 => 2, 20215 => 2,
         20221 => 2, 20222 => 2, 20227 => 2, 20232 => 1,
         20242 => 2, 20245 => 2, 20252 => 0, 20255 => 2, 20262 => 2,
         20272 => 2, 20312 => 2, 20321 => 6, 20322 => 6, 20342 => 2,
         20422 => 2, 20512 => 2, 20521 => 2, 20522 => 2, 20552 => 1,
         20572 => 5, 20622 => 2, 20672 => 2, 20712 => 2, 20722 => 2,
         20742 => 2, 20772 => 2, 21122 => 2, 21126 => 1, 21222 => 2,
         21224 => 2, 21226 => 2, 21227 => 2, 21422 => 2, 21522 => 2,
         21622 => 2, 21722 => 2, 22227 => 2, 22244 => 2, 22246 => 2,
         22276 => 2, 22277 => 2, 30001 => 3, 30002 => 2, 30004 => 1,
         30007 => 6, 30012 => 3, 30042 => 1, 30062 => 2,
         30102 => 1, 30122 => 0, 30251 => 1, 40112 => 0, 40122 => 0,
         40125 => 0, 40212 => 0, 40222 => 1, 40232 => 6, 40252 => 0,
         40322 => 1, 50002 => 2, 50021 => 5, 50022 => 5, 50023 => 2,
         50027 => 2, 50052 => 0, 50202 => 2, 50212 => 2, 50215 => 2,
         50222 => 0, 50224 => 4, 50272 => 2, 51212 => 2, 51222 => 0,
         51242 => 2, 51272 => 2, 60001 => 1, 60002 => 1, 60212 => 0,
         61212 => 5, 61213 => 1, 61222 => 5, 70007 => 7, 70112 => 0,
         70122 => 0, 70125 => 0, 70212 => 0, 70222 => 1, 70225 => 1,
         70232 => 1, 70252 => 5, 70272 => 0,

}
m = 0

tmp_ac = Marshal.load(Marshal.dump(ac))
max_j = ac[0].size - 1
tmp_j = max_j
max_i = false
min_j = false

# セル内の計算
loop { 

    # 列を増やす作業
    for i in 0..(ac.size-1)
        min_j = true if ac[i][0] != 0
    end

    if min_j == true
        for i in 0..(ac.size-1)
            ac[i].unshift(0)
        end
        tmp_ac = Marshal.load(Marshal.dump(ac))
        tmp_j += 1
        max_j = tmp_j
        min_j = false
    end

    # 0行目に0以外の数字がある場合、上に新しい行を追加する。
    tmp = Array.new 
    for j in 0..(ac[0].size-1)
        tmp << 0
        max_i = true unless ac[0][j] == 0
        min_i = true unless ac[ac.size-1][j] == 0
    end

    if max_i == true
        ac.unshift(Marshal.load(Marshal.dump(tmp)))
        tmp_ac = Marshal.load(Marshal.dump(ac))
        max_i = false
    end

    if min_i == true
        ac << Marshal.load(Marshal.dump(tmp))
        tmp_ac = Marshal.load(Marshal.dump(ac))
        min_i = false
    end

    # 結果の表示
    puts "Time = #{m}========\n"
    for i in 0..(ac.size-1)
        for j in 0..(ac[i].size-1)
            if ac[i][j] == 0
                print " " 
            else
                print ac[i][j] 
            end
        end
        print "\n"
    end
    print "================ \n\n"
    m += 1
    

    # セルの計算
    (ac.size-1).downto(0) do |i|
        (ac[i].size-1).downto(0) do |j|
            acmatch = Array.new
            l = b = r = t = 0
 
            c = ac[i][j]
            t = ac[i-1][j] if i != 0
            r = ac[i][j+1] if j != ac[i].size - 1
            b = ac[i+1][j] if i != ac.size - 1                       
            l = ac[i][j-1] if j != 0
                
            # 4種類のパターンを作る 
            acmatch << c*10000 + t*1000 + r*100 + b*10 + l
            acmatch << c*10000 + l*1000 + t*100 + r*10 + b
            acmatch << c*10000 + b*1000 + l*100 + t*10 + r
            acmatch << c*10000 + r*1000 + b*100 + l*10 + t


            # 次のセルの状態を探す
            for x in 0..(acmatch.size - 1)
                if hash.key? acmatch[x]
                    tmp_ac[i][j] = hash[acmatch[x]]
                end
            end
        end
        
        
        if ac[i][ac[i].size-1] != 0
            tmp_j += 1
        end

    end
    p tmp_j
    p max_j

    # 列を増やす作業
    if max_j < tmp_j
        max_j = tmp_j
        for i in 0..(ac.size-1)
            if tmp_ac[i][max_j] == nil
                if ac[i-1][max_j] != nil
                    acmatch = ac[i-1][max_j]*1000 + ac[i][max_j-1]             
                elsif i != ac.size - 1 && ac[i+1][max_j] != nil
                    acmatch = ac[i][max_j-1] + ac[i+1][max_j]*10
                else
                    acmatch = ac[i][max_j-1]
                end
            end
            tmp_ac[i][max_j] = hash[acmatch]

        end
    end

    # 次のセル状態を代入
    ac = Marshal.load(Marshal.dump(tmp_ac))
}
