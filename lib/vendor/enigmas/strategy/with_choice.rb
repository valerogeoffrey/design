# frozen_string_literal: true

module Enigmas
  module Strategy
    class WithChoice < BaseStrategy

      def good_result?
        response.to_s == enigma.response.to_s
      end

      def question
        enigma.question + " - one choice - ( #{enigma.choices.join(' / ')} )"
      end
    end
  end
end
