class SiegeEngine < Unit

  def initialize
    @attack_power = 50
    @health_points = 400
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
    elsif can_attack_target?(target)
    target.damage(attack_power * 2)
    end
  end

  def dead?
    health_points <= 0
  end

  def can_attack_target?(target)
    if target.instance_of?(SiegeEngine)
      true
    elsif target.instance_of?(Unit)
      false
    end

  end

end
