# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/bootstrap'

RSpec.describe 'Game::Map' do

  let(:map) { Game::Map.new({ with_enigmas: true, with_fights: true }).build }

  context "when map contain some enemy to fight" do
    it 'has to have the different enemy object all the time' do
      fighter_ids = map.map { |_, room| room.fight.strategy.player_two.object_id }
      expect(fighter_ids.size).to eq(fighter_ids.uniq.size)
    end
    it 'has to have the same hero all the time ' do
      fighter_ids = map.map { |_, room| room.fight.strategy.player_one.object_id }
      expect(fighter_ids.uniq.size).to eq 1
    end
  end
end
