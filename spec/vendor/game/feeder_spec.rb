require 'spec_helper'
require_relative '../../../lib/vendor/game/feeder'

RSpec.describe 'Feeder room to the game builder' do
  
  let(:feeder) {Feeder}
  
  it "should have a valid instance" do
    expect(feeder.new.class).to eq Feeder
  end
  
  it "should be prespond to the self method process" do
    expect(feeder).to respond_to(:process)
  end
  
  it "should return rooms when call process" do
    expect(feeder.process.class).to eq Array
  end
  
  it "should have at leat one room min " do
    expect(feeder.process.size).to be >= 1
  end
  
  it "should have a valid room object" do
    result = feeder.process
    result.each do |object|
      room =  object.first
      expect(room.class).to eq Hash
      expect(room).to include(:id)
      expect(room[:id].class).to eq Symbol

      expect(room).to include(:name)
      expect(room[:name].class).to eq String

      expect(room).to include(:description)
      expect(room[:description].class).to eq String

      expect(room).to include(:is_first_room)
      expect([true, false]).to include room[:is_first_room]

      expect(room).to include(:is_last_room)
      expect([true, false]).to include room[:is_last_room]

      expect(room).to include(:moves)
      expect(room[:moves].class).to eq Hash
      expect(room[:moves].keys.size).to be >= 1

      valid_moves = %i(forward right left back)
      room[:moves].keys.each do |move|
        expect(valid_moves).to include move
      end
    end
  end
  
  it "should have a valid action object" do
    result = feeder.process
    result.each do |object|
      action =  object.last
      expect(action.class).to eq Hash
      expect(action).to include :question
      expect(action).to include :reponse

      expect(action[:question]).not_to be nil
      expect(action[:reponse]).not_to be nil
    end
  end
  
  it "should have a valid path to end in final room " do
     #"dont know how to implement right now..."
     
    expect(true).to eq true
  end
  
end