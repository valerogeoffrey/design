module Fight
  class FightBuilder

    attr_accessor :displayer , :fight_strategy, :fighters, :mode
    def initialize(mode: :one_vs_one)
      @mode = mode
    end

    def build
      initialize_strategies(mode)
      fight_manager = Fight::FightManager.new(strategy: fight_strategy, displayer: displayer)
      fight_manager.prepare_fighters(fighters: fighters)
      fight_manager
    rescue  Fight::Strategy::PlayerPresenceError => _
      :no_player_in_game
    end

    private

    def initialize_strategies(mode, options = {} )
      case mode
      when :one_vs_one then init_one_vs_one_strategy ;
      when :one_enemy then init_one_enemy_strategy(options[:hero]) ;
      end
    end

    def init_one_enemy_strategy(hero)
      base_builder_strategy do
        player_two = Characters::FetchCharacter.new.fetch_character(:wizzard).shuffle.first
      end
    end

    def init_one_vs_one_strategy
      base_builder_strategy do
        player_one = Characters::Wizzard.new
        player_two = Characters::FetchCharacter.new.fetch_character(:wizzard).shuffle.first
      end
    end

    def base_builder_strategy(*args, &block)
      character_strategy = Characters::Strategy::OneVsOne

      if block_given?
        block.call
      end

      player_one.setting(character_strategy.new(player_one))
      player_two.setting(character_strategy.new(player_two))
      @fighters = {master: hero, enemy:player_two }

      @displayer = DisplayerStrategy::Displayer.new
      @fight_strategy = Strategy::FightOneVsOne.new(fighters: @fighters)
    end
  end
end