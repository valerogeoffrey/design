# frozen_string_literal: true

module Characters
  class Definition
    attr_accessor :points, :attacks, :name, :type

    def initialize(attr_definition)
      attr_definition.each do |name, value|
        public_send("#{name}=", value)
      end
      prevent_string_attacks_key
    end

    def create(type = nil)
      case type
      when :wizzard then Wizzard.new(self)
      else
        Character.new(self)
      end
    end

    private

    def prevent_string_attacks_key
      attacks.keys.each do |key|
        attacks[(key.to_sym rescue key) || key] = attacks.delete(key)
      end
    end
  end
end
