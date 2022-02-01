# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/vendor/enigmas/displayer'
require_relative '../../../../lib/vendor/enigmas/strategy/base_strategy'
require_relative '../../../../lib/vendor/enigmas/strategy/free'
require_relative '../../../../lib/vendor/enigmas/definition'
require_relative '../../../../lib/vendor/enigmas/enigma'
require_relative '../../../../lib/vendor/enigmas/command'

RSpec.describe 'Enigmas::Command' do
  let (:strategy) { Enigmas::Strategy::Free.new}
  let (:displayer) {Enigmas::Displayer}

  let (:def_free)  do
    {
      question: '> How Much is: 1 + 1 ? ',
      response: '2',
      type: :free
    }
  end
  let (:enigma) { Enigmas::Enigma.hydrate(def_free) }

  let(:command) { Enigmas::Command.new(enigma, strategy, displayer) }

  it 'has a TRY constant' do
    expect(Enigmas::Command::TRY).to eq(2)
  end

  it 'has the power of reset the try counter' do
    command.try = 10
    expect(command.try).to eq 10

    command.reset_trying
    expect(command.try).to eq 0
  end

  context 'when we call to #good_result? method' do
    it 'return  nil when invalid' do
      command.strategy.response = "test"
      expect(command.good_result?).to eq(nil)
    end

    it 'return  true when valid' do
      command.strategy.response = "2"
      expect(command.good_result?).to eq(true)
    end
  end

  context 'when we call to #excedded_try?? method' do
    it 'return nil when the user has not exceeded the try counter' do
      command.try = 0
      expect(command.excedded_try?).to eq(nil)
    end

    it 'return true user has exceeded the treshold' do
      command.try = 3
      expect(command.excedded_try?).to eq(true)
    end
  end
end
