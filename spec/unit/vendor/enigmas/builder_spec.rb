# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../../lib/vendor/enigmas/definition'
require_relative '../../../../lib/vendor/enigmas/enigma'
require_relative '../../../../lib/vendor/enigmas/builder'

RSpec.describe 'Enigmas::Builder' do
  let(:builder) { Enigmas::Builder }

  it 'has a respond to build static method' do
    expect(builder).to respond_to(:build)
  end

  context "when we call the build method" do
    it 'has to return an array' do
      expect(builder.build.class).to eq(Array)
    end

    it 'has to return some items' do
      expect(builder.build.size).to be > 0
    end

    it 'has to return array of Enigma Object' do
      expect(builder.build.map(&:class).uniq).to eq([Enigmas::Enigma])
    end
  end
end
