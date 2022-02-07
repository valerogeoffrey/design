# frozen_string_literal: true

module Characters
  class Character
    attr_accessor :points, :enemy, :ally, :attacks
    attr_reader :name, :attacks, :type, :strategy

    def initialize(definition)
      differ_init(definition)
      @enemy = nil
      @ally = nil
    end

    def self.create(*args)
      new(*args)
    end

    def fight_with(characters)
      @ally = characters
      self
    end

    def fight_against(characters)
      @enemy = characters
      strategy.fight_against(@enemy)
      self
    end

    private

    def differ_init(definition)
      definition = definition.nil? ? OpenStruct.new : definition

      @name = definition.name || default_name
      @points = definition.points || default_points
      @attacks = definition.attacks || default_attacks
      @type = definition.type || default_type
    end

    def default_name
      'Harry Potter'
    end

    def default_points
      50
    end

    def default_attacks
      { stupefix: 10 }
    end

    def default_type
      2
    end
  end
end
