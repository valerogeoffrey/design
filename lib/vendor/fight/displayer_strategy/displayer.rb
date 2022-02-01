# frozen_string_literal: true

module Fight
  module DisplayerStrategy
    class Displayer < BaseDisplayer
      def enemy_is_dead
        puts "You'r enemy is dead"
        puts 'You have win ! '
        puts 'congratulations ! '
      end

      def enemy_attack(player)
        puts 'You have been hit from your enemy'
        puts "you have left #{player.points} left"
      end

      def attack_your_enemy(player)
        puts "You have hit you'r enemy"
        puts "he have left #{player.points} left"
      end
    end
  end
end
