module Enigmas
  class Command
    attr_accessor :enigma, :strategy, :displayer, :try
    TRY = 2
    def initialize(enigma , strategy, displayer )
      @enigma = enigma
      @displayer = displayer
      @strategy = strategy.on(enigma)
      @try = 0
    end

    def play
      displayer.introduction
      loop do
        @try += 1
        displayer.ask_question(strategy.question)
        response = fetch_console
        strategy.response = response

        displayer.try_again(try_left) if !strategy.good_result?
        break if excedded_try?
        break if good_result?
      end

      reset_trying
      strategy.apply_bonus_malus(try)
    end

    def excedded_try?
      if try == TRY && !strategy.good_result?
        displayer.excedded_try
        true
      end
    end

    def good_result?
      if strategy.good_result?
        displayer.congratulation
        true
      end
    end

    def reset_trying
      @try = 0
    end

    private

    def try_left
      TRY - try
    end
  end
end