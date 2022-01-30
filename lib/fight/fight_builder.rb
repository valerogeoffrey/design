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

    def initialize_strategies(mode)
      case mode
      when :one_vs_one then init_one_vs_one_strategies ;
      end
    end

    def init_one_vs_one_strategies
      character_strategy = Characters::Strategy::OneVsOne

      player_one = Characters::Wizzard.new
      player_one.setting(character_strategy.new(player_one))
      player_two = Characters::FetchCharacter.new.fetch_character(:wizzard).shuffle.first
      player_two.setting(character_strategy.new(player_two))

      @displayer = DisplayerStrategy::Displayer.new
      @fighters = {master: player_one, enemy:player_two }
      @fight_strategy = Strategy::FightOneVsOne.new(fighters: @fighters)
    end
  end
end