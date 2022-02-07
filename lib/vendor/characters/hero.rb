module Characters
  class Hero
    include Singleton

    attr_accessor :hero
    def self.instance
      @@instance ||= new.hero
    end

    def initialize
      @hero = Characters::Wizzard.new(definition)
    end

    private

    def definition
      OpenStruct.new({
                       'name' => 'Harry Potter',
                       'points' => 70,
                       'type' => 2,
                       'attacks' => { :stupefix => 50, :expeliarmus => 60, :diffendo => 30, :obscuro => 55 }
                     })
    end
  end
end