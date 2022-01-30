module Characters
  class Character

    attr_accessor :points, :enemy
    attr_reader :name, :attacks, :type, :strategy
    def initialize(name = :harry_potter, points = 50)
      @name   = name
      @points = points

      @enemy  = nil
      @ally  = nil
    end

    def setting(strategy)
      @strategy = strategy
    end

    def self.create(*args)
      self.new(*args)
    end

    def fight_how(strategy)
      @strategy= strategy
    end

    def fight_with(characters)
      @ally = characters
      self
    end

    def fight_against(characters)
      @enemy = characters
      strategy.set_enemy(@enemy)
      self
    end

    def attack(name)
      strategy.can_attack?(name)
      process_attack_action(name)
    rescue DeadPlayerError => _ then :player_dead
    rescue DeadEnemyError => _ then :enemy_dead
    rescue UnknowPlayerError => _ then :unkwnow_enemy
    rescue UnknowAttackError => _ then :unauthorize_attack
    end

    private

    def process_attack_action(name)
      strategy.process_attack_action(name)
    end
  end
end
