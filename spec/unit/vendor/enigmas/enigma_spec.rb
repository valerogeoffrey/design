# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/vendor/enigmas/enigma'

RSpec.describe 'Enigmas::Enigma' do
  let (:definition) do
    {
      question: '> How much is: 1 + 1 ?',
      response: '2',
      type: :choice,
      choices: ['1', '2', '6', '3']
    }
  end
  let(:enigma) { Enigmas::Enigma.hydrate(definition) }
  let(:empty_enigma) { Enigmas::Enigma.hydrate({}) }

  it 'respond to an hydrate self method' do
    expect(enigma).to respond_to(:hydrate)
  end
  it 'respond to somes mandatory attributes' do
    expect(empty_enigma).to respond_to(:question)
    expect(empty_enigma).to respond_to(:response)
    expect(empty_enigma).to respond_to(:choices)
    expect(empty_enigma).to respond_to(:type)
  end

  it 'fetch the correct attributes value' do
    expect(enigma.question).to eq('> How much is: 1 + 1 ?')
    expect(enigma.response).to eq('2')
    expect(enigma.choices).to eq(['1', '2', '6', '3'])
    expect(enigma.type).to eq(:choice)
  end
end
