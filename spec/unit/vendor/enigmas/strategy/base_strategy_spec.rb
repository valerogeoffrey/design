# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../../../lib/vendor/enigmas/strategy/base_strategy'
require_relative '../../../../../lib/vendor/enigmas/definition'
require_relative '../../../../../lib/vendor/enigmas/enigma'


RSpec.describe 'Enigmas::Strategy::BaseStrategy' do

  let (:definition)  do
    {
      question: '> How much is: 1 + 1 ? ',
      response: '2',
      type: :free
    }
  end
  let (:enigma) { Enigmas::Enigma.hydrate(definition) }
  let(:strategy) { Enigmas::Strategy::Free.new }

  it 'respond to #on to set the enigma to handle' do
    strategy.on(enigma)
    expect(strategy.enigma).to eq(enigma)
  end

  it 'respond to stop_asking?' do
    strategy.on(enigma)
    strategy.response = 'test'
    strategy.try = 2
    expect(stop_asking?(2)).to eq(false)
  end

  it 'check if it is a good result' do
    strategy.on(enigma)

    strategy.response = "test"
    expect(strategy.good_result?).to eq(false)

    strategy.response = "2"
    expect(strategy.good_result?).to eq(true)
  end

  it 'return a pre-formated question to puts' do
    strategy.on(enigma)
    expect(strategy.question).to eq('> How much is: 1 + 1 ?  free response')
  end
end
