require 'spec_helper'
require_relative '../../../../lib/bootstrap'

RSpec.describe Fight::Strategy::FightOneVsOne do

  let(:hero) { Characters::Hero.instance }
  let(:mvp) do
    mvp = Characters::FetchCharacter.new.fetch_character(:wizzard).sample
    mvp.points = 1
    mvp
  end
  let (:interface) { Characters::Interface::OneVsOne.new(hero).against(mvp) }
  let(:strategy) { Fight::Strategy::FightOneVsOne.new(interface) }
  let(:map) { Game::Map.new({with_enigmas: true, with_fights: true}).build }
  let(:first_fight) { map[map.keys[0]].fight }
  let(:second_fight) { map[map.keys[1]].fight }

  context 'when it attack his enemy' do
    context 'with a valid attack' do
      it 'reduce the enemy points' do
        initial_point = strategy.player_two.points
        strategy.player_attack(2)
        expect(strategy.player_two.points).to be < initial_point
      end
    end
    context 'with an invalid attack' do
      it 'do not change points' do
        initial_point = strategy.player_two.points
        strategy.player_attack('6788')
        expect(strategy.player_two.points).to eq(initial_point)
      end
    end
    context 'when the choosen attack is not an INT transformable' do
      it 'take the first attack - index 0' do
        initial_point = strategy.player_two.points
        strategy.player_attack('foo_attack')
        expect(strategy.player_two.points).to be < initial_point
      end
    end
  end

  context 'when hero has to fight multiple enemy' do
    context 'when it attack the first enemy and the second' do
      before { $stdin = StringIO.new('3') }
      after { $stdin = STDIN }
      it 'has to have coherent object_id between fights' do
        puts first_fight.strategy.inspect


        first_hero_id = first_fight.strategy.player_one.object_id
        second_hero_id = second_fight.strategy.player_one.object_id
        expect(first_hero_id).to eq(second_hero_id)
      end
      it 'can start the first fight' do
        first_fight.strategy.player_two.points = 1
        expect(first_fight.play).to eq(:finished)
      end
      it 'can start the second fight' do
        second_fight.strategy.player_two.points = 1
        expect(second_fight.play).to eq(:finished)
      end
      it 'has to have the same point like before first fight' do
        first_fight.strategy.pov_on_enemy
        first_fight.strategy.enemy_attack(2)
        hero_point_after_first_fight = first_fight.strategy.player_one.points
        expect(hero_point_after_first_fight).to eq(second_fight.strategy.player_one.points)
      end
    end
  end
end