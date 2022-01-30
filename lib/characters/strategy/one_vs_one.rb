module Characters
  module Strategy
    class OneVsOne < BaseStrategy

      attr_accessor :response
      attr_accessor :player_one, :player_two
      # assume fight can be ONLY 1 vs 1
      def initialize(player_one , other_player = nil)
        @player_one = player_one
        @player_two = other_player
        @response = nil
      end

      def set_enemy(enemy)
        @player_two = enemy
      end

      def can_attack?(attack)
        raise UnknowPlayerError if player_two.nil?
        raise UnknowAttackError unless attack_available?(attack)
        raise DeadEnemyError if enemy_is_dead?
        raise DeadPlayerError if player_is_dead?

        true
      end

      def process_attack_action(attack)
        player_two.points =
          player_two.points - point_for(attack) < 0 ?
            0 : player_two.points - point_for(attack)
      end

      def point_for(attack)
        return :unknow_attack unless attack_available?(attack)
        attacks.fetch(attack)
      end

      def fight_against(character)
        @player_two = character
      end

      private

      def attacks
        player_one.attacks
      end

      def attack_available?(attack)
        attacks.include? attack
      end

      def enemy_is_dead?
        player_two.points <= 0 ? true : false
      end

      def player_is_dead?
        player_one.points <= 0 ? true : false
      end

      def is_dead?(player)
        player.points <= 0 ? true : false
      end
    end
  end
end