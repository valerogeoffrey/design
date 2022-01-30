# Game::Command.new.play
module Game
  class Command

    attr_reader :cursor, :map, :displayer, :game_strategy
    def initialize
      @map = Map.build(mode: :room_with_enigma)
      @cursor = Walker.new(map)
      @displayer = Displayer
      @game_strategy = Strategy.new(map, cursor)
    end

    def play
      displayer.room_position(position)
      loop do
        moove_phase

        game_strategy.play_enigma
        game_strategy.play_fight
        game_strategy.play_mvp

        break if cursor.is_final_room?
      end

      displayer.you_are_out
    end

    private

    def moove_phase
      displayer.ask_for_moove(mooves)
      moove = fetch_console
      cursor.moove_to(moove)
      displayer.room_position(position)

      game_strategy.on(cursor.room)
    end

    def position
      cursor.position.to_s
    end

    def mooves
      cursor.available_moves.join(' / ')
    end
  end
end