# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../../../lib/bootstrap'

RSpec.describe 'Characters::Interface::OneVsOne' do
  let(:def1) do
    {
      'name' => 'Voldemort',
      'type' => 2,
      'points' => 40,
      'attacks' => { stupefix: 50 }
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
  let(:strategy) { Characters::Interface::OneVsOne }
  let(:init_strategy) { Characters::Interface::OneVsOne.new(character1) }

  it 'can be init' do
    interface = Characters::Interface::OneVsOne

    hero = Characters::Hero.instance
    mvp = Characters::Builder.new.fetch(:wizzard).first

    interface = interface.new(hero).against(mvp)
    expect(interface.class).to eq(Characters::Interface::OneVsOne)
  end

  it 'can permit to set enemy to handle' do
    init_strategy.against(character2)
    expect(init_strategy.player_two).to eq(character2)
  end

  context 'when we need to check the point for a specifi attack' do
      it 'return a unknow_attack code when invalid' do
        init_strategy.against(character2)
        expect(init_strategy.point_for('test')).to eq(:unknow_attack)
      end
      it 'return an integer point when valid attack' do
        init_strategy.against(character2)
        expect(init_strategy.point_for('stupefix')).to eq(50)
      end
  end

  context 'when player one attack player two' do
    it 'remove attack point' do
      character2.points = 50
        init_strategy.against(character2)

      expect(character2.points).to eq(50)
      init_strategy.attack(:stupefix)
      expect(character2.points).to eq(0)
    end
  end

  it 'can check the point for an attack' do
    init_strategy.against(character2)
    expect(init_strategy.point_for('test')).to eq(:unknow_attack)
    expect(init_strategy.point_for('stupefix')).to eq(50)
  end

  context "when we need to make actions" do
    context "when there is no enemy" do
      it 'raise an UnknowPlayerError' do
        expect { init_strategy.can_attack?('test') }.to raise_error(UnknowPlayerError)
      end
    end
    context "when it's an unknow attack" do
      it 'raise an UnknowAttackError' do
        init_strategy.against(character2)
        expect { init_strategy.can_attack?('test') }.to raise_error(UnknowAttackError)
      end
    end
    context "when enemy is dead" do
      it 'raise an DeadEnemyError' do
        character2.points = 0
        init_strategy.against(character2)
        expect { init_strategy.can_attack?('stupefix') }.to raise_error(DeadEnemyError)
      end
    end
    context "when player is dead" do
      it 'raise an DeadPlayerError' do
        character1.points = 0
        init_strategy.against(character2)
        expect { init_strategy.can_attack?('stupefix') }.to raise_error(DeadPlayerError)
      end
    end
  end

end
