module Fight
  module Strategy
    class FightOneVsOne < BaseStrategy

      attr_accessor :master_player, :player_two
      def initialize(fighters:)
        raise PlayerPresenceError if fighters.empty?
        add_fighters(fighters)
      end

      def prevent_dead_player
        raise DeadPlayerError if player_dead?
        raise DeadEnemyError if enemy_dead?
      end

      def player_dead?
        master_player.points <= 0
      end

      def enemy_dead?
        player_two.points <= 0
      end

      def attack_authorize?(attack)
        raise NoAuthAttackError if attack > master_player.attacks.to_a.size
      end

      def choice_rand_attack
        2
      end

      def add_fighters(fighters)
        @master_player = fighters[:master]
        @player_two = fighters[:enemy]

        master_player.fight_against(player_two)
        player_two.fight_against(master_player)
      end

      def player_attack(attack)
        attack = attack_name(master_player, attack)
        master_player.attack(attack)
        master_player.enemy
      end

      def enemy_attack
        attack = player_two.attacks.keys.sample
        attack = :stupefix
        player_two.attack(attack)
        player_two.enemy
      end

      def attack_name(player,attack)
        player.attacks.to_a[attack - 1].first
      end

      def players_present?
        !player_two.nil? && !master_player.nil?
      end

      def reset_player
        player_two.points = 50
        master_player.points = 50
      end
    end
  end
end