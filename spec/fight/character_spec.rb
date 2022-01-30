require 'spec_helper'
require_relative '../../lib/characters/character'
require_relative '../../lib/characters/wizzard'
require_relative '../../lib/characters/rules'

RSpec.describe Characters::Character do
  let(:character) { Characters::Wizzard.new }
  let(:enemy) { Characters::Wizzard.create(:voldemort, 50) }

  it "should have a valid instance" do
    expect(character.class).to eq Characters::Wizzard
  end

  describe 'fight' do
    it 'should respond to fight_with method' do
      expect(character).to respond_to(:fight_with)
    end

    it 'should have a fighter char with;, when called fight_with' do
      character.fight_with(enemy)
      expect(character.enemy).not_to be(nil)
    end

    it 'should be able to attack with attack method' do
      expect(character).to respond_to(:attack)
    end

    it "should return unauthorize_attack if attack name is not in list " do
      attack = character.fight_with(enemy).attack(:none)
      expect(attack).to eq(:unauthorize_attack)
    end

    it "should substract point for the attack " do
      before_points = enemy.points
      character.fight_with(enemy).attack(:stupefix)
      expect(before_points).to be > enemy.points
    end

    it "should not have a point < 0" do
      character.fight_with(enemy).attack(:avada_kedavra)
      character.fight_with(enemy).attack(:avada_kedavra)
      character.fight_with(enemy).attack(:avada_kedavra)

      expect(enemy.points).to eq(0)
    end

    it 'Should notify when enemy is dead during attack' do
      character.fight_with(enemy).attack(:avada_kedavra)
      character.fight_with(enemy).attack(:avada_kedavra)
      attack = character.fight_with(enemy).attack(:avada_kedavra)

      expect(attack).to eq(:enemy_dead)
    end

    it 'Should not be able to figh if enemy is not set' do
      expect( character.attack(:avada_kedavra)).to eq(:unkwnow_enemy)
    end

    it 'Should not be able to fight if is dead' do
      character.fight_with(enemy).attack(:avada_kedavra)
      character.fight_with(enemy).attack(:avada_kedavra)
      character.fight_with(enemy).attack(:avada_kedavra)

      expect(enemy.fight_with(character).attack(:avada_kedavra)).to eq(:player_dead)
    end

  end
end