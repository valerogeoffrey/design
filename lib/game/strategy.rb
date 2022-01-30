module Game
  class Strategy

    attr_accessor :map, :cursor, :room, :command_enigma, :fight

    def initialize(map, cursor)
      @map = map
      @cursor = cursor
    end

    def play_enigma
      command_enigma.play if command_enigma
    end

    def play_fight
    end

    def play_mvp
    end

    def on(room)
      @room = room
      @command_enigma = room.enigma
      @fight = room.fight
    end
  end
end