# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/bootstrap'


RSpec.describe 'Game::Command' do
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
  let(:game) { Game::Command.new(strategy) }


  it 'has a valid instance' do
    expect(game.class).to eq(Game::Command)
  end

  it 'has to respond to the play method' do
    expect(game).to respond_to(:play)
  end
end
