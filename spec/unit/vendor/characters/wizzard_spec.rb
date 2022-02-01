# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/vendor/characters/definition'
require_relative '../../../../lib/vendor/characters/character'
require_relative '../../../../lib/vendor/characters/wizzard'

RSpec.describe 'Wizzard' do
  let(:def1) do
    {
      'name' => 'Voldemort',
      'type' => 2,
      'points' => 40,
      'attacks' => { 'stupefix' => 50 }
    }
  end
  let(:wizzard) { Characters::Definition.new(def1).create(:wizzard) }

  it 'has a valid instance' do
    expect(wizzard.class.name).to eq('Characters::Wizzard')
  end

  it 'has somes available attributes' do
    expect(wizzard).to respond_to(:points)
    expect(wizzard).to respond_to(:attacks)
    expect(wizzard).to respond_to(:name)
    expect(wizzard).to respond_to(:type)
  end
end
