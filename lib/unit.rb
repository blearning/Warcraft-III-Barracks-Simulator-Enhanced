class Unit

  attr_reader :health_points, :attack_power

  def initialize(hp=60, ap=10)
    @health_points = hp
    @attack_power = ap
  end

  def damage(dmg)
    @health_points -= dmg
    dead?
  end

  def attack!(target)
    if dead?
      puts "sorry, you are dead, you cannot attack"
      return false
    elsif target.dead?
      puts "sorry, your unit is dead, you cant attack"
      return false
    else
    target.damage(attack_power)
    end
  end

  def dead?
    health_points <= 0
  end


end