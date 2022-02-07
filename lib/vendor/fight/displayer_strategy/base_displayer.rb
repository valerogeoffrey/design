# frozen_string_literal: true

module Fight
  module DisplayerStrategy
    class BaseDisplayer
      def attack_issue
        puts "You have miss you'r enemy"
      end

      def player_is_dead
        puts "You'r dead :("
      end

      def attacks_choice(player)
        puts "> #{player.name} what spell do you want to use ?"
        player.attacks.keys.each_with_index do |attack, index|
          puts "#{index + 1} - #{attack}"
        end
        puts ''
        puts "> You'r choice ? "
      end

      def attack_congrats(player, attack)
        puts ''
        puts '# ---------------------------------------------------------------#'
        puts "# > You use the spell #{attack.to_s} Impressive ! #{player.name} has #{player.points} points left"
      end
    end
  end
end
