# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/bootstrap'

RSpec.describe 'Game::Walker' do
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
  let(:walker) { Game::Walker.new(map) }

  it 'has a valid instance' do
    expect(walker.class).to eq(Game::Walker)
  end

  it 'give us access to map wich is a Hash' do
    expect(walker.map.class).to eq(Hash)
  end

  it 'give us access to position attr' do
    expect(walker.position.class).to eq(Symbol)
  end

  it 'give us access to moove attr' do
    expect(walker.moove).to eq(nil)
  end

  it 'give us access to available_moves' do
    expect(walker.available_moves).to eq([:forward])
  end

  context 'when we try to moove ' do
    context "with an invalid moove" do
      it 'raise an InvalidMoove error' do
        expect { walker.moove_to(:b) }.to raise_error(InvalidMoove)
      end
    end

    context "when it's a valid moove" do
      it 'set the moove' do
        walker.moove_to(:forward)
        expect(walker.moove).to eq(:forward)
      end
    end
  end

  describe "#is_final_room?" do
    context "when we are not in the last room" do
      it 'return a false' do
        expect(walker.is_final_room?).to eq(false)
      end
    end
    context 'when we are in the final room' do
      it 'return true' do
        walker.moove_to(:forward)
        expect(walker.is_final_room?).to eq(true)
      end
    end
  end

  describe "#next_room" do
    context 'when we moove and need the next_room id symbol' do
      it 'return the next_room symbol id' do
        walker.set_moove(:forward)
        expect(walker.next_room).to eq(:b)
      end
    end
  end

  describe "#set_moove" do
    it 'return self' do
      walker.set_moove(:forward)
      expect(walker.set_moove(:forward).class).to eq(Game::Walker)
    end
    it 'has the correct moove ' do
      walker.set_moove(:forward)
      expect(walker.moove).to eq(:forward)
    end
  end

  describe "#legal_moove?" do
    it 'return true when valid moove' do
      walker.set_moove(:forward)
      expect(walker.set_moove(:forward).class).to eq(Game::Walker)
    end
    it 'has the correct moove ' do
      expect(walker.legal_moove?(:xxx)).to eq(false)
      expect(walker.legal_moove?(:forward)).to eq(true)
    end
  end

  describe "#room" do
    it 'return the room of the current position' do
      expect(walker.room.class).to eq(Rooms::Room)
    end
  end
end
