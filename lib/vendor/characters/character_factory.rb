module Characters
  class CharacterFactory

    attr_accessor :how, :level, :characters

    def initialize
      @how = 1
      @level = 1
      @characters = []
    end

    def hero(level)
      character = Characters::Hero.instance
      character.points = compute_points(character.points, level, 0.2)
      character.attacks = character.attacks.transform_values { |attack_value| compute_attack_value(level, attack_value, 0.3) }
      character
    end

    def for_how(how)
      @how = how
      self
    end

    def at_level(level)
      level = level < 0 ? 1 : level
      level = level > 5 ? 5 : level
      @level = level
      self
    end

    def get
      for _ in 1 .. @how
        character = Characters::Builder.new.fetch(:wizzard).shuffle.sample
        characters << fit_level(character)
      end

      characters
    end

    private

    def fit_level(character)
      case level
      when 1 then compute_level(1, character)
      when 2 then compute_level(2, character)
      when 3 then compute_level(3, character)
      when 4 then compute_level(4, character)
      when 5 then compute_level(5, character)
      end
    end

    def compute_level(level, character)
      attacks = character.attacks.sort_by { |k, v| v }
      attacks = attacks[0 .. level].to_h
      attacks = attacks.transform_values { |attack_value| compute_attack_value(level, attack_value) }
      character.attacks = attacks
      character.points = compute_points(character.points, level, 0.1)

      character
    end

    def compute_attack_value(level, attack_value, coeff = 0.1)
      attack_value * (0.4 + (coeff * level))
    end

    def compute_points(points, level, coeff = 0.1)
      (points + (points * (level * coeff))).to_i
    end
  end
end