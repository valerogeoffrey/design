require 'spec_helper'
require'./lib/vendor/rooms/feeder'

RSpec.describe 'Room Feeder' do
  
  let(:feeder) {Rooms::Feeder.new}
  
  it "should have a valid instance" do
    expect(feeder.class).to eq Rooms::Feeder
  end

  it " should have a list of room" do
    expect(feeder.get_rooms.class).to eq Array
  end

  it "should be possible to get room from external source" do
    expect(feeder).to respond_to(:get_rooms)
  end

  it " should have a min item in room list" do
    expect(feeder.get_rooms.size).to be >= 1
  end

end