# frozen_string_literal: true

module Characters
  module Strategy
    class BaseStrategy

      def fight_against(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def can_attack?(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def attack(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end

      def point_for(_)
        raise NotImplementedError "#{self.class} have not implement #{__method__}"
      end
    end
  end
end
