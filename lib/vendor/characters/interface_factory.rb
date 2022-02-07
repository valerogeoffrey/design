module Characters
  class InterfaceFactory

    attr_accessor :mode, :level, :how, :character_count, :interfaces
    def initialize
      @mode = :regular
      @level = 1
      @how = 1
      @interfaces = []
      @character_count = 1 if @mode == :regular
    end

    def for_how(how)
      @how = how
      self
    end

    def mode(mode)
      @mode = mode
      self
    end

    def at_level(level)
      level = level < 0 ? 1 : level
      level = level > 5 ? 5 : level
      @level = level
      self
    end

    def get
      for _ in 1 .. how
        interface = compute_interface
        interfaces << interface
      end

      interfaces
    end

    private

    def compute_interface
      case level
      when 1 then compute_level(1)
      when 2 then compute_level(2)
      when 3 then compute_level(3)
      when 4 then compute_level(4)
      when 5 then compute_level(5)
      end
    end

    def compute_level(level)
      hero = Characters::CharacterFactory.new.hero(level)
      mvp = Characters::CharacterFactory.new.for_how(character_count).at_level(level).get.first
      Characters::Interface::OneVsOne.new(hero).against(mvp)
    end
  end
end