require_relative "../characters/wizzard.rb"

class FightMaster
  attr_reader :engine, :in_last_fight
  
  def initialize
    @in_last_fight = false
    @hero          = nil
    @mvp           = nil
    @in_fight      = true
    @in_last_fight = true
    @flee          = false
  end
  
  def init_engine(engine)
    @engine = engine
    self
  end
  
  def start
    init_fight_phase
    fight_if_in_finale_room
  end
  
  def init_fight_phase
    init_character_fight
    @in_last_fight = @engine.is_final_room? ? true : false
  end
  
  def init_character_fight
    hero  = Characters::Wizzard.new('harry potter', 50)
    mvp   = Characters::Wizzard.new('voldemort', 40)
    @hero = Fighter.new(hero)
    @mvp  = Fighter.new(mvp)
    
    @flee          = false
    @in_last_fight = true
  end
  
  def fight_if_in_finale_room
    while @in_last_fight
      fight_while_alive_or_flee
    end
  end
  
  def fight_while_alive_or_flee
    while alive do
      fight_phase
    end
    
    return_first_room if @flee
  end
  
  def alive
    @hero.character.points > 0 && !@flee
  end
  
  def return_first_room
    puts "It does not matter you will try the fight next time, continue to explore the rooms."
    @engine.set_position(engine.rooms.keys.first)
    @in_last_fight = false
    @flee          = true
  end
  
  def fight_phase
    mvp_attack_the_hero
    reset_if_gameover
    action_form_player
  end
  
  def mvp_attack_the_hero
    @hero = @mvp.attack(@hero)
  end
  
  def reset_if_gameover
    return unless @hero.character.points <= 0
    
    notify_death_hero
    @engine.set_position(@engine.rooms.keys.first)
    @in_last_fight, @flee  = [false, true]
    @hero.character.points = 50
  end

  
  def action_form_player
    puts "#{@mvp.character.name} attack #{@hero.character.name}, he has #{@hero.character.points} points left"
    puts "#{@hero.character.name}, do you want to attack or flee ? ( attack / flee )"
    action = STDIN.gets.chomp
    
    attack_or_flee(action)
  end
  
  def attack_or_flee(action)
    action == "flee" ? flee : attack
  end
  
  def flee
    engine.set_position(engine.rooms.keys.first)
    @in_last_fight, @flee = [false, true]
  end
  
  def attack
    @mvp = @hero.attack(@mvp)
    notify_attack if @mvp.character.points > 0
    exit_game if mvp_is_dead?
  end
  
  def exit_game
    notify_death_mvp
    @in_game, @in_last_fight = [false, false]
    exit
  end
  
  def mvp_is_dead?
    @mvp.character.points <= 0
  end
  
  def init_fight
    puts "#{@hero.character.name}, do you want to start the fight? ( Y / N )"
    action        = STDIN.gets.chomp
    self.in_fight = action == "Y" ? true : false
  end
  
  def notify_death_mvp
    puts "#{@hero.character.name} attack #{@mvp.character.name} and kill him ! "
    puts "#{@mvp.character.name} is dead, congratulation"
    puts "The wizarding world is finally free"
  end
  
  def notify_death_hero
    puts "#{@mvp.character.name} attaque #{@hero.character.name} and kill him, You have loose the game try again :("
  end
  
  def notify_attack
    puts "#{@hero.character.name} attack #{@mvp.character.name}, he has #{@mvp.character.points} points left"
  end

end