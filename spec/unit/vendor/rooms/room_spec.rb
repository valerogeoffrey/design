# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/bootstrap'


RSpec.describe 'Rooms::Room' do
  let(:definition) do
    {
      id: :room1,
      name: 'test',
      description: 'test description',
      first_room: true,
      last_room: false,
      moves: {
        forward: :room1
      }
    }

  end
  let(:room) { Rooms::Room.hydrate(definition) }

  it 'has a valid instance' do
    expect(room.class).to eq(Rooms::Room)
  end

  it 'return the correct attributes' do
    expect(room.id).to eq(:room1)
    expect(room.name).to eq("test")
    expect(room.description).to eq('test description')
    expect(room.first_room).to eq(true)
    expect(room.last_room).to eq(false)
    expect(room.moves).to eq({forward: :room1})
  end
end
