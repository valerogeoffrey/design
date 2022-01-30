class FightManager
  attr_accessor :in_fight, :hero, :mvp, :fighter
  
  def initialize(fighter)
    @fighter  = fighter
    @in_fight = false
    @hero     = @fighter.hero
    @mvp      = @fighter.mvp
  end
  
  def hero_is_dead?
    hero.points <= 0
  end
  
  def hero_attack
    fighter.attack(:mvp).mvp
  end
  
  def mvp_attack
    fighter.attack(:hero).hero
  end

end
