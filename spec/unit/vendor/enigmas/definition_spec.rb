# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/vendor/enigmas/definition'

RSpec.describe 'Enigmas::Definition' do
  let(:definition) { Enigmas }

  it 'has a to respond to #fetch_enigmas_definition' do
    expect(definition).to respond_to(:fetch_enigmas_definition)
  end

  context 'when calling the #fetch_enigmas_definition' do
    it 'has to return an array' do
      expect(definition.fetch_enigmas_definition.class).to eq(Array)
    end

    it 'has to not be empty' do
      expect(definition.fetch_enigmas_definition.size ).to  be > 0
    end

    it 'has to contains hash only' do

      expect(definition.fetch_enigmas_definition.map(&:class).uniq).to  eq([Hash])
    end

    it 'has to contain attributes' do
      attr = %i(question response type choices)
      expect(definition.fetch_enigmas_definition.map(&:keys).flatten.uniq ).to eq(attr)
    end
  end

end
