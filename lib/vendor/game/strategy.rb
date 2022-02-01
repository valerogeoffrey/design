# frozen_string_literal: true

module Game
  class Strategy
    attr_accessor :map, :cursor, :room, :command_enigma, :fight

    def initialize(map, cursor, displayer)
      @map = map
      @cursor = cursor
      @displayer = displayer
    end

    def play
      displayer.ask_for_moove(cursor.available_moves.join(' / '))
      moove = fetch_console
      cursor.moove_to(moove)
      displayer.room_position(cursor.position.to_s)

      @command_enigma = cursor.room.enigma
      @command_fight = cursor.room.fight

      play_enigma
      play_fight
      play_mvp
    end

    def play_enigma
      command_enigma&.play
    end

    def play_fight
      command_fight&.play
    end

    def play_mvp; end

    def end?
      cursor.is_final_room?
    end
  end
end
