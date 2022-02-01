# frozen_string_literal: true

module Enigmas
  class Enigma
    attr_accessor :question, :response, :choices, :type

    def initialize(definition)
      definition.each do |name, value|
        public_send("#{name}=", value)
      end
    end

    def self.hydrate(attributes)
      new(attributes)
    end
  end
end
