module Fight
  module Strategy
    class BaseStrategy

      def prevent_dead_player
        raise NotImplementedError, "class #{self.clas} has not implemented #{__method__}"
      end

      def player_dead?
        raise NotImplementedError, "class #{self.clas} has not implemented #{__method__}"
      end

      def enemy_dead?
        raise NotImplementedError, "class #{self.clas} has not implemented #{__method__}"
      end

      def attack_authorize?(_)
        raise NotImplementedError, "class #{self.clas} has not implemented #{__method__}"
      end

      def choice_rand_attack
        raise NotImplementedError, "class #{self.clas} has not implemented #{__method__}"
      end

      def add_fighters(_)
        raise NotImplementedError, "You need to implement the #{__method__} method"
      end

      def player_attack(_)
        raise NotImplementedError, "You need to implement the #{__method__} method"
      end

      def enemy_attack
        raise NotImplementedError, "You need to implement the #{__method__} method"
      end

      def attack_name(*args)
        raise NotImplementedError, "You need to implement the #{__method__} method"
      end

      def players_present?
        raise NotImplementedError, "You need to implement the #{__method__} method"
      end

      def reset_player
        raise NotImplementedError, "You need to implement the #{__method__} method"
      end
    end
  end
end