# frozen_string_literal: true

module Characters
  class Definition
    attr_accessor :points, :attacks, :name, :type

    def initialize(attr_definition)
      attr_definition.each do |name, value|
        public_send("#{name}=", value)
      end
    end

    def create(type = nil)
      case type
      when :wizzard then Wizzard.new(self)
      else
        Character.new(self)
      end
    end
  end
end
