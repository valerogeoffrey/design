# frozen_string_literal: true

module Fight
  class FightBuilder
    attr_accessor :displayer, :fight_strategy, :fighters, :mode

    def initialize(mode: :one_vs_one)
      @mode = mode
    end

    def build
      initialize_strategies(mode)
      Fight::Commander.new(fight_strategy, displayer)
    rescue PlayerPresenceError => _e
      :no_player_in_game
    end

    private

    def initialize_strategies(mode, options = {})
      case mode
      when :one_vs_one then init_one_vs_one_strategy
      end
    end

    def init_one_vs_one_strategy
      base_builder_strategy do
        player_one = Characters::Hero.instance
        player_two = Characters::FetchCharacter.new.fetch_character(:wizzard).sample

        [player_one, player_two]
      end
    end

    def base_builder_strategy(*_args)
      @displayer = DisplayerStrategy::Displayer.new
      character_strategy = Characters::Interface::OneVsOne

      if block_given?
        player_one, player_two = yield
      end
      character_strategy = character_strategy.new(player_one).against(player_two)
      @fight_strategy = Strategy::FightOneVsOne.new(character_strategy)
    end
  end
end
