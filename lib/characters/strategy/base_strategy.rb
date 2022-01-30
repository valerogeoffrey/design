module Characters
  module Strategy
    class BaseStrategy

      def fight_with(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def fight_against(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def set_enemy(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def can_attack?(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def process_attack_action(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def point_for(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end
    end
  end
end