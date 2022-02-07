# frozen_string_literal: true

module Game
  class Strategy
    attr_accessor :map, :cursor, :room, :command_enigma, :fight, :displayer
    attr_reader :command_fight

    def initialize(map, cursor, displayer)
      @map = map
      @cursor = cursor
      @displayer = displayer
    end

    def play
      ask_for_moove
      moove = fetch_console
      moove_to(moove)
      display_position

      set_commands

      play_enigma
      play_fight
      play_mvp
    rescue InvalidMoove
      puts "sorry you can't go in this direction"
    end

    def play_enigma
      command_enigma&.play
    end

    def play_fight
      command_fight&.play

      command_fight.strategy.prevent_dead_player
    end

    def play_mvp; end

    def end?
      cursor.is_final_room?
    end

    private

    def set_commands
      @command_enigma = cursor.room.enigma
      @command_fight = cursor.room.fight
    end

    def moove_to(moove)
      cursor.moove_to(moove)
    end

    def display_position
      displayer.room_position(cursor.position.to_s)
    end

    def ask_for_moove
      displayer.ask_for_moove(cursor.available_moves.join(' / '))
    end
  end
end
