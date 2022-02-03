# frozen_string_literal: true

module Characters
  class Wizzard < Character
    attr_accessor :points, :attacks, :name, :type

    def initialize(definition = nil)
      super
    end
  end
end
