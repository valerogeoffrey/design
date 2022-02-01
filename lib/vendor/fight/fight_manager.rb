# frozen_string_literal: true

module Fight
  class FightManager
    attr_accessor :displayer, :strategy

    def initialize(strategy:, displayer:)
      @strategy = strategy
      @displayer = displayer
    end

    def prepare_fighters(fighters: {})
      add_fighters(fighters)
    rescue PlayerPresenceError => _e
      :no_players
    end

    def start_game
      loop do
        strategy.prevent_dead_player
        attack_your_enemy
        response_attack_from_your_enemy
      rescue DeadPlayerError => _e
        displayer.player_is_dead
        break
      rescue DeadEnemyError => _e
        displayer.enemy_is_dead
        break
      rescue NoAuthAttackError => _e
        displayer.attack_issue
        response_attack_from_your_enemy
        next
      end

      :finished
    end

    def reset
      strategy.reset_player
      start_game
    end

    def static_phase
      strategy.prevent_dead_player
      attack_your_enemy
      response_attack_from_your_enemy

      true
    rescue DeadPlayerError => _e
      displayer.player_is_dead
    rescue DeadEnemyError => _e
      displayer.enemy_is_dead
    rescue NoAuthAttackError => _e
      displayer.attack_issue
      response_attack_from_your_enemy
    end

    private

    def add_fighters(fighters)
      return :invalid_number_of_players unless strategy.players_present?

      strategy.add_fighters(fighters)
    end

    def attack_your_enemy
      displayer.attacks_choice(strategy.master_player)

      attack = fetch_attack
      strategy.attack_authorize?(attack)

      execute_attack(attack)

      displayer.attack_congrats(strategy.master_player, attack)
    end

    def response_attack_from_your_enemy
      strategy.choice_rand_attack
      attack_response = strategy.enemy_attack
      displayer.enemy_attack(attack_response)
    end

    def execute_attack(attack)
      attack_response = strategy.player_attack(attack)
      displayer.attack_your_enemy(attack_response)
    end

    def attack_name(attack)
      player_one.attacks.to_a[attack - 1].first
    end

    def fetch_attack
      gets.chomp.to_i
    end
  end
end
