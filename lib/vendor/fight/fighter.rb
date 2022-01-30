Dir["../characters/*.rb"].each { |file| require file }

class Fighter
    attr_accessor :character
    attr_reader :spells
    @@instance

    def initialize(character)
        @character = character
        @spells    = {
            avada_kedavra: 10,
            expeliarmus:   15,
            stupefix:      5,
        }
        @target = nil
    end

    def self.instance(character = nil)
        @@instance ||= Fighter.new(character)
    end

    def set_point(points)
        character.points = points
    end

    def attack(target)
        @target = target
        points           = spells[spells.keys.sample]
        target.character.points = target.character.points - points

        target
    end

    def is_dead?
        character.points <= 0
    end

end
