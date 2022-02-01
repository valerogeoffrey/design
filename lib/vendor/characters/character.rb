# frozen_string_literal: true

module Characters
  class Character
    attr_accessor :points, :enemy, :ally, :attacks
    attr_reader :name, :attacks, :type, :strategy

    def initialize(definition)
      @name = definition.name
      @points = definition.points
      @attacks= definition.attacks
      @type = definition.type

      @enemy = nil
      @ally = nil
    end

    def self.create(*args)
      new(*args)
    end

    def fight_how(strategy)
      @strategy = strategy.init(self)
    end

    def fight_with(characters)
      @ally = characters
      self
    end

    def fight_against(characters)
      @enemy = characters
      strategy.fight_against(@enemy)
      self
    end

    def attack(name)
      raise CharactersStrategyError if strategy.nil?

      strategy.can_attack?(name)
      strategy.attack(name)
   rescue CharactersStrategyError => _e then
      :no_strategy
    rescue DeadPlayerError => _e then
      :player_dead
    rescue DeadEnemyError => _e then
      :enemy_dead
    rescue UnknowPlayerError => _e then
      :unkwnow_enemy
    rescue UnknowAttackError => _e then
      :unauthorize_attack
    end
  end
end
