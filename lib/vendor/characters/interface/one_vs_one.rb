# frozen_string_literal: true

module Characters
  module Interface
    class OneVsOne < BaseStrategy

      attr_accessor :player_one, :player_two, :pov

      # assume fight can be ONLY 1 vs 1
      def initialize(hero, other_player = nil)
        @player_one = hero
        @player_two = other_player
        @pov = @player_one
      end

      def self.init(player_one)
        self.new(player_one)
      end

      def against(character)
        @player_two = character
        self
      end

      def point_of_view(player)
        @pov = player
      end

      def attack(attack)
        can_attack?(attack)

        player = pov == player_one ? player_two : player_one
        left_points = player.points - point_for(attack)
        player.points = left_points < 0 ? 0 : left_points

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

      private

      def point_for(attack_name)
        return :unknow_attack unless attack_available?(attack_name)

        attacks.fetch(attack_name.to_sym)
      end

      def can_attack?(attack)
        raise UnknowPlayerError if player_one.nil? || player_two.nil?
        raise UnknowAttackError unless attack_available?(attack)
        raise DeadEnemyError if enemy_is_dead?
        raise DeadPlayerError if player_is_dead?

        true
      end

      def attacks
        pov.attacks
      end

      def attack_available?(attack)
        pov.attacks.keys.map(&:to_sym).include? attack.to_sym
      end

      def enemy_is_dead?
        player_two.points <= 0
      end

      def player_is_dead?
        player_one.points <= 0
      end

      def is_dead?
        pov.points <= 0
      end
    end
  end
end
