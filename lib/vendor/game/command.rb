# frozen_string_literal: true

# Game::Command.new.play
module Game
  class Command
    attr_reader :cursor, :displayer, :game_strategy

    def initialize(strategy)
      @game_strategy = strategy
      @displayer = game_strategy.displayer
      @cursor = game_strategy.cursor
    end

    def play
      displayer.room_position(position)
      loop do
        game_strategy.play
        break if game_strategy.end?
      rescue DeadPlayerError => _
        break
      end

      displayer.you_are_out
    end

    private

    def position
      game_strategy.cursor.position.to_s
    end
  end
end
