# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/bootstrap'


RSpec.describe 'Game::Strategy' do
  let(:definition_a) do
    {
      id: :a,
      name: 'A',
      description: 'A',
      first_room: true,
      last_room: false,
      moves: {
        forward: :b
      }
    }
  end
  let(:definition_b) do
    {
      id: :b,
      name: 'B',
      description: 'B',
      first_room: false,
      last_room: true,
      moves: {
        backward: :a
      }
    }
  end
  let(:map) do
    {
      :a => Rooms::Room.hydrate(definition_a),
      :b => Rooms::Room.hydrate(definition_b)
    }
  end
  let(:cursor) { Game::Walker.new(map) }
  let(:displayer) { Game::Displayer }
  let(:strategy) { Game::Strategy.new(map, cursor, displayer) }

  it 'has a valid instance' do
    expect(strategy.class).to eq(Game::Strategy)
  end

  it 'has to respond to the game interface' do
    expect(strategy).to respond_to(:play)
    expect(strategy).to respond_to(:play_enigma)
    expect(strategy).to respond_to(:play_fight)
    expect(strategy).to respond_to(:play_mvp)
    expect(strategy).to respond_to(:end?)
  end

  context 'when we check the end of game' do
    it 'has to return true or false' do
      expect(strategy.end?).to eq(false)

      strategy.cursor.moove_to(:forward)
      expect(strategy.end?).to eq(true)
    end
  end
end
