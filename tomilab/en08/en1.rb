# coding: UTF-8
class Chara
  def initialize(name)
    @name = nil
    @hp = 0
    @atk = 0
    @spd = 0
    @dfFlag = false
  end

  def getSpd
    @dfFlag = false
    rand(@spd)
  end

  def getName
    @name
  end

  def enemyDefence(eName)
    puts "#{eName}の防御！"
    @dfFlag = true
  end

  def attack(eName)
    puts "#{@name}の攻撃"
    atkPoint = 0
    atk = (@dfFlag)? @atk/2 : @atk
    rate = rand 100
    if rate < 30
      atkPoint = (atk * 0.3).to_i
      puts "#{eName}に#{atkPoint} の攻撃！"
      puts "効果はいまひとつのようだ"
    elsif rate < 90
      atkPoint = (atk * 0.8).to_i
      puts "#{eName}に#{atkPoint} の攻撃！"
    else
      atkPoint = atk
      puts "#{eName}に#{atkPoint} の攻撃！"
      puts "改心の一撃！！"
    end
    @dfFlag = false

    atkPoint
  end

  def hpPoint(p)
    @hp -= p
    @hp <= 0
  end

  def win(eName)
    puts "#{@name}は#{eName}に勝った!"
  end
end

class Hero < Chara
  def initialize(name)
    super
    @name = name
    puts "#{@name}の設定"
    loop {
      @hp = entry "HP : "
      @atk = entry "ATK : "
      @spd = entry "SPD : "
      break if @hp + @atk + @spd <= 100
      puts "設定値オーバーです。"
      puts "HP、攻撃力、スピードの値は合計100までです。"
    }
  end

  # パラメータを入力
  def entry (str)
    loop {
      print str
      c = gets()
      return c.to_i if c =~ /^\d+$/ && c.to_i > 0
      puts "入力値が不正です。"
    }
  end

  # 行動決定
  def move 
    loop {
      print "1:攻撃 2:防御 => "
      c = gets.chomp
      if c =~ /^\d+$/ && c.to_i > 0 && c.to_i < 3
        @move = c.to_i
        break 
      end
      puts "入力値が不正です。"
    }
  end

  def attack?
    @move == 1
  end

end

class Enemy < Chara
  def initialize(name)
    super
    @name = name
    loop {
      @hp = rand(10..100)
      @atk = rand(10..100)
      @spd = rand(10..100)
      break if @hp + @atk + @spd <= 100
    }
  end

  def attack?
    rand(1..3) == 1
  end
end

def move(hero, enemy)
  name = enemy.getName
  if hero.attack?
    atkPoint = hero.attack(name)
    if enemy.hpPoint(atkPoint)
      hero.win(name)
      exit
    end
  else
    enemy.enemyDefence(hero.getName)
  end
end



hero = Hero.new("ピカチュウ")
enemy = Enemy.new("きゅうべえ")

# ターン
loop {
  hero.move 

  # きゅうべえがはやい
  if hero.getSpd < enemy.getSpd
    move(enemy, hero)
    move(hero, enemy)
  else # ピカチュウがはやい
    move(hero, enemy)
    move(enemy, hero)
  end

}

