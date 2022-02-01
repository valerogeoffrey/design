# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/errors'
require_relative '../../../../lib/vendor/characters/definition'
require_relative '../../../../lib/vendor/characters/character'
require_relative '../../../../lib/vendor/characters/wizzard'
require_relative '../../../../lib/vendor/characters/strategy/base_strategy'
require_relative '../../../../lib/vendor/characters/strategy/one_vs_one'

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
  let(:strategy) { Characters::Strategy::OneVsOne }

  it 'can be create' do
    expect(Characters::Character.create(definition).class).to eq(Characters::Character)
  end

  it 'can be instantiate' do
    expect(Characters::Character.new(definition).class).to eq(Characters::Character)
  end

  it 'can have a strategy to play with character' do
    expect(character1).to respond_to(:fight_how)
    expect(character1).to respond_to(:strategy)
  end

  it 'can have ally' do
    expect(character1.fight_with(character2).ally).to eq(character2)
  end

  it 'has to have enemy' do
    character1.fight_how(strategy)
    expect(character1.fight_against(character2).enemy).to eq(character2)
  end

  it 'have attributes' do
    expect(character1.name).to eq("Voldemort")
    expect(character1.type).to eq(2)
    expect(character1.points).to eq(40)
    expect(character1.attacks).to eq({ stupefix: 50 })
  end

  context 'when no strategy set and try to attack' do
    it 'return a no_strategy code' do
      expect(character1.attack(:stupefix)).to eq(:no_strategy)
    end
  end

  context 'when no player set and try to attack' do
    it 'return a :unkwnow_enemy code' do
      character1.fight_how(strategy)
      expect(character1.attack(:stupefix)).to eq(:unkwnow_enemy)
    end
  end

  context 'when enemy is dead and you try to attack it' do
    it 'return a :enemy_dead code' do
      character1.fight_how(strategy)
      character2.points = 0
      character1.fight_against(character2)
      expect(character1.attack('stupefix')).to eq(:enemy_dead)
    end
  end

  context 'when player is dead and you try to attack his enemy' do
    it 'return a :player_dead code' do
      character1.fight_how(strategy)
      character1.points = 0
      character1.fight_against(character2)
      expect(character1.attack('stupefix')).to eq(:player_dead)
    end
  end

  context 'when player try to attack with unauthorize attack' do
    it 'return a :unauthorize_attack code' do
      character1.fight_how(strategy)
      character1.fight_against(character2)
      expect(character1.attack('foo')).to eq(:unauthorize_attack)
    end
  end

end
