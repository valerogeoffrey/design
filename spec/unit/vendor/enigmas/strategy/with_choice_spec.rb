# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../../../lib/vendor/enigmas/strategy/base_strategy'
require_relative '../../../../../lib/vendor/enigmas/strategy/with_choice'
require_relative '../../../../../lib/vendor/enigmas/definition'
require_relative '../../../../../lib/vendor/enigmas/enigma'

RSpec.describe 'Enigmas::Strategy::WithChoice' do

  let (:definition)  do
    {
      question: '> How much is: 1 + 1 ?',
      response: '2',
      type: :choice,
      choices: ['1', '2', '6', '3']
    }
  end
  let (:enigma) { Enigmas::Enigma.hydrate(definition) }
  let(:strategy) { Enigmas::Strategy::WithChoice.new }

  it 'check if it is a good result' do
    strategy.on(enigma)

    strategy.response = "test"
    expect(strategy.good_result?).to eq(false)

    strategy.response = "2"
    expect(strategy.good_result?).to eq(true)
  end

  it 'return a pre-formated question to puts' do
    strategy.on(enigma)
    expect(strategy.question).to eq('> How much is: 1 + 1 ? - one choice - ( 1 / 2 / 6 / 3 )')
  end
end
