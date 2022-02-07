# frozen_string_literal: true

module Fight
  module DisplayerStrategy
    class Displayer < BaseDisplayer
      def enemy_is_dead
        puts "# You'r enemy is dead !! Wooaaaaaaaa , congratulations !"
        puts '# ---------------------------------------------------------------#'
      end

      def enemy_attack(player)
        puts '# Be carreful ! Your enemy want to revenge ! '
        puts "# > You have been hit from your enemy, You have #{player.points} points left"
        puts "# "
        puts '# ---------------------------------------------------------------#'
        puts " "
      end

      def attack_your_enemy(player)
        puts "# > You have hit you'r enemy, #{player.name} has #{player.points} left"
      end
    end
  end
end
