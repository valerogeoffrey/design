# frozen_string_literal: true

module Fight
  class Commander
    attr_accessor :displayer, :strategy

    def initialize(strategy, displayer)
      @strategy = strategy
      @displayer = displayer
    end


    def play
      loop do
        strategy.prevent_dead_players
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
      strategy.prevent_dead_players
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

    def attack_your_enemy
      strategy.pov_on_hero

      displayer.attacks_choice(strategy.player_one)

      attack = fetch_attack
      strategy.attack_authorize?(attack)

      attack_response = strategy.player_attack(attack)
      attack_name = strategy.attack_name(strategy.player_one, attack)

      displayer.attack_congrats(attack_response, attack_name)
    end

    def response_attack_from_your_enemy
      strategy.prevent_dead_players
      strategy.pov_on_enemy
      attack = strategy.choice_rand_attack
      strategy.attack_authorize?(attack)
      attack_response = strategy.enemy_attack(attack)
      displayer.enemy_attack(attack_response)
    end

    def attack_name(attack)
      player_one.attacks.to_a[attack - 1].first
    end

    def fetch_attack
      attack = gets
      attack ||= ''
      attack.chomp.to_i
    end
  end
end
