module Enigmas
  module Strategy
    class BaseStrategy
      attr_reader :enigma
      attr_accessor :response

      def on(enigma)
        @enigma = enigma
        self
      end

      def question
        raise "you have to implement the method #{__method__}"
      end

      def good_result?
        raise "you have to implement the method #{__method__}"
      end

      def apply_bonus_malus(try)
        if try == 2 && ! good_result?
          # add Malus /  sub points / sub items inventory / move in previous rooms etc...
          # Observer.update('reset_position', true)
        end

        if good_result?
          # add point / attack / item / go directly to the last room etc..
          # Observer.update('reset_position', true)
        end
      end

      def stop_asking?(try)
        good_result? || try == 2
      end
    end
  end
end