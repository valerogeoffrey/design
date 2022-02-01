# frozen_string_literal: true

module Enigmas
  module Strategy
    class Free < BaseStrategy
      def good_result?
        response.to_s == enigma.response.to_s
      end

      def question
        enigma.question + ' free response'
      end
    end
  end
end
