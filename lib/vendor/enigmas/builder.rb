# frozen_string_literal: true

module Enigmas
  class Builder
    def self.build
      enigmas = []
      Enigmas.fetch_enigmas_definition.each do |enigma|
        enigmas << Enigma.hydrate(enigma)
      end
      enigmas
    end
  end
end
