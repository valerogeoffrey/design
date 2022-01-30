require 'spec_helper'
require_relative '../../../lib/vendor/rooms/rooms_feed'

RSpec.describe 'Rooms' do
  
  let(:rooms) {Rooms::RoomsFeed.new}
  
  it "should have a valid instance" do
    expect(rooms.class).to eq Rooms::RoomsFeed
  end
  
  it " should have a list of room" do
    expect(rooms.list.class).to eq Array
  end
  
  it "should be possible to hydrate room" do
    expect(rooms).to respond_to(:hydrate_rooms)
  end
  
  it " should have a min item in room list" do
    expect(rooms.list.size).to be >= 1
  end
  
end