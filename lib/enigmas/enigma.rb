module Enigmas
  class Enigma
    attr_accessor :question, :response, :choices, :type
    def initialize(attributes)
      attributes.each do |name, value|
        public_send("#{name}=", value)
      end
    end

    def self.hydrate(attributes)
      self.new(attributes)
    end
  end
end