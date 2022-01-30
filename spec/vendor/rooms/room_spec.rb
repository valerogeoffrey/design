require 'spec_helper'
require_relative '../../../lib/vendor/rooms/builder'

RSpec.describe 'Room specification' do
  
  let(:liste_rooms) {Rooms::Builder.new.rooms}

  it "should have a liste of rooms" do
    expect(liste_rooms.class).to eq Array
  end
  
  it "should have a min of 1 room" do
    expect(liste_rooms.size).to be >= 1
  end
  
  it " should have a move for final" do
    final_statement = liste_rooms.map{|r| r[:is_last_room]}
    expect(final_statement).to include(true)
  end
  
  it " should have a single final move " do
    
   single_final_statement =
      liste_rooms.map{|r| r[:is_last_room]}
        .select{|state| state == true }
        .size == 1
   
    expect(single_final_statement).to be
  end

  it " should have a initial state" do
    first_statement = liste_rooms.map{|r| r[:is_first_room]}
    expect(first_statement).to include(true)
  end
  
  it " should have a single initial state" do
    single_first_statement =
      liste_rooms.map{|r| r[:is_first_room]}
        .select{|state| state == true }
        .size == 1
  
    expect(single_first_statement).to be
  end

  it " should have correct direction" do
    available_moove = [:forward, :left, :back, :right]
    liste_rooms.map{|r| r[:moves].keys}.flatten.each do |moove|
      expect(available_moove).to include moove
    end
  end
  
  it " should be able to move in direction" do
    liste_rooms.map{|r| r[:moves].keys.size}.flatten.each do |moove_count|
      expect(moove_count).to be >= 1
    end
  end
  
end