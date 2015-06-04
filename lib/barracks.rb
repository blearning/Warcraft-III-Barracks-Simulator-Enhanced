class Barracks

  attr_accessor :gold, :food, :lumber, :health_points

  def initialize(gold=1000, food=80)
    @gold = gold
    @food = food
    @lumber = 500
    @health_points = 500
  end

  def can_train_footman? 
    gold >= 135 && food >= 2
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      @shield = 2
      Footman.new
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  def can_train_seige?
    gold >= 200 && food >= 60 && lumber >= 3
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def train_seige
    if can_train_seige?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    end
  end

  def self.is_still_alive?
    true
  end

  def attack!(target)
    target.damage(@attack_power)
  end

  def damage(ap)
    @health_points -= ap
  end
 
  def can_be_attacked?
    health_points >= 0
  end

  def dead?
    health_points <= 0
  end

end
