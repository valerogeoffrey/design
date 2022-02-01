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
        puts 'what attack do you want to triger?'
        player.attacks.keys.each_with_index do |attack, index|
          puts "#{index + 1} - #{attack}"
        end
        puts ''
        puts "You'r choice ? "
      end

      def attack_congrats(player, attack)
        puts ''
        puts 'you use the spell ' + player.attacks.to_a[attack - 1].first.to_s
        puts 'Impressive ! '
      end
    end
  end
end
