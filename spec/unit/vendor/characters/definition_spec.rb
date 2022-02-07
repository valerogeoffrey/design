# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/vendor/characters/character'
require_relative '../../../../lib/vendor/characters/definition'

RSpec.describe 'Definition' do
  let(:attributes) do
    {
      'name' => 'Harry Potter',
      'type' => 2,
      'points' => 80,
      'attacks' => { :avada_kedavra => 50, :expeliarmus => 60 }
    }
  end

  let(:definition) { Characters::Definition.new(attributes) }

  it 'has a valid instance' do
    expect(definition.class.name).to eq('Characters::Definition')
  end

  it 'has somes available attributes' do
    expect(definition).to respond_to(:points)
    expect(definition).to respond_to(:attacks)
    expect(definition).to respond_to(:name)
    expect(definition).to respond_to(:type)
  end

  it 'has set the point attribute' do
    expect(definition.points).to eq(80)
  end
  it 'has set the name attribute' do
    expect(definition.name).to eq('Harry Potter')
  end
  it 'has set the type attribute' do
    expect(definition.type).to eq(2)
  end
  it 'has set the attacks attribute' do
    expect(definition.attacks.class).to eq(Hash)
    expect(definition.attacks).to eq({ :avada_kedavra => 50, :expeliarmus => 60 })
  end

  it 'has to have symbol when defining attack name' do
    expect(definition.attacks.keys.map(&:class).uniq).to eq([Symbol])
  end
end
