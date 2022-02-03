# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../../../lib/vendor/enigmas/strategy/base_strategy'
require_relative '../../../../../lib/vendor/enigmas/strategy/free'
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
    expect(strategy.stop_asking?(2)).to eq(true)
  end

end
