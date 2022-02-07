# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/errors'
require_relative '../../../../lib/vendor/characters/definition'
require_relative '../../../../lib/vendor/characters/character'
require_relative '../../../../lib/vendor/characters/wizzard'
require_relative '../../../../lib/vendor/characters/interface/base_strategy'
require_relative '../../../../lib/vendor/characters/interface/one_vs_one'

RSpec.describe 'Character' do
  let(:def1) do
    {
      'name' => 'Voldemort',
      'type' => 2,
      'points' => 40,
      'attacks' => { stupefix:  50 }
    }
  end
  let(:def2) do
    {
      'name' => 'Harry Potter',
      'type' => 2,
      'points' => 80,
      'attacks' => { expeliarmus: 60 }
    }
  end
  let (:definition) { Characters::Definition.new(def1) }
  let(:character1) { Characters::Definition.new(def1).create(:wizzard) }
  let(:character2) { Characters::Definition.new(def2).create(:wizzard) }
  let(:strategy) { Characters::Interface::OneVsOne.init(character1) }

  it 'can be create' do
    expect(Characters::Character.create(definition).class).to eq(Characters::Character)
  end

  it 'can be instantiate' do
    expect(Characters::Character.new(definition).class).to eq(Characters::Character)
  end

  it 'can have ally' do
    expect(character1.fight_with(character2).ally).to eq(character2)
  end


  it 'have attributes' do
    expect(character1.name).to eq("Voldemort")
    expect(character1.type).to eq(2)
    expect(character1.points).to eq(40)
    expect(character1.attacks).to eq({ stupefix: 50 })
  end
end
