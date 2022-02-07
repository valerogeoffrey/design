# frozen_string_literal: true

module Characters
  class Builder
    def initialize
      @collections = []
    end

    def fetch(type)
      YAML.load_file('lib/vendor/config/characters.yml').each do |character_type, definitions|
        fetch_wizzards(definitions, :wizzard) if character_type.to_sym == type.to_sym
      end
      @collections
    end

    def fetch_wizzards(definitions, type)
      definitions.each do |character_name, definition|
        @collections << spawn_character(definition, character_name, type)
      end
    end

    def spawn_character(definition, character_name, type)
      case type
      when :wizzard then Characters::Definition.new(definition.merge(name: character_name)).create(:wizzard)
      else Characters::Definition.new(definition.merge(name: character_name)).create
      end
    end
  end
end
