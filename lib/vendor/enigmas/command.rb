# frozen_string_literal: true

module Enigmas
  class Command
    TRY = 2
    attr_accessor :enigma, :strategy, :displayer, :try

    def initialize(enigma, strategy, displayer)
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

        displayer.try_again(try_left) unless strategy.good_result?
        break if excedded_try?
        break if good_result?
      end

      reset_trying
      strategy.apply_bonus_malus(try)
    end

    def excedded_try?
      if try >= TRY && !strategy.good_result?
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
