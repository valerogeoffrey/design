# frozen_string_literal: true

module Fight
  module Strategy
    class FightOneVsOne < BaseStrategy
      attr_accessor :player_one, :player_two, :fight

      def initialize(fight)
        @fight = fight
        @player_one = fight.player_one
        @player_two = fight.player_two
        raise PlayerPresenceError if fight.player_one.nil? || fight.player_two.nil?
      end

      def pov_on_hero
        fight.point_of_view(player_one)
      end

      def pov_on_enemy
        fight.point_of_view(player_two)
      end

      def prevent_dead_players
        prevent_dead_player
        prevent_dead_enemy
      end

      def prevent_dead_player
        raise DeadPlayerError if player_dead?
      end

      def prevent_dead_enemy
        raise DeadEnemyError if enemy_dead?
      end

      def player_dead?
        player_one.points <= 0
      end

      def enemy_dead?
        player_two.points <= 0
      end

      def attack_authorize?(attack)
        raise NoAuthAttackError if attack > fight.pov.attacks.to_a.size
      end

      def choice_rand_attack
        (1..2).to_a.sample
      end

      def player_attack(attack)
        attack = attack_name(player_one, attack)
        fight.attack(attack)
        player_two
      end

      def enemy_attack(attack)
        attack = attack_name(player_two, attack)
        fight.attack(attack)
        player_one
      end

      def attack_name(player, attack)
        attack = attack.to_i
        return :unknow_attack if attack > player.attacks.to_a.size

        player.attacks.to_a[attack - 1].first
      end

      def players_present?
        !player_two.nil? && !player_one.nil?
      end

      def reset_player
        player_two.points = 50
        player_one.points = 50
      end
    end
  end
end
