module Characters
  class FetchCharacter
    def initialize
      @collections = []
    end

    def fetch_character(type)
      YAML.load_file('lib/config/characters.yml').each do |character_type, definitions|
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
      when :wizzard then Characters::Wizzard.new(definition.merge(name: character_name))
      else Characters::Definition.new(definition.merge(name: character_name))
      end
    end
  end
end

