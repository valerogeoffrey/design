require 'spec_helper'
require_relative '../../../lib/vendor/game/engine'
require_relative "../../../lib/vendor/game/builder.rb"

RSpec.describe Engine do
  let(:engine) {Engine.new}
  let(:rooms) {Builder.new.build}
  
  it "should have a valid instance" do
    expect(engine.class).to eq Engine
  end
  
  it "should be possible to set theses rooms" do
    engine.rooms = rooms
    expect(engine.rooms).to eq rooms
  end
  
  it "should be possible to set a position" do
    position = :positionA
    engine.position = position
    expect(engine.position).to eq position
  end

  it "should be possible to get possible mooves" do
    engine.rooms = rooms
    engine.position = :gryffondor
    expect(engine.get_moves).to eq "forward / right"
  end
  
  it "should be possible to know if the current position is the final room?" do
    engine.position = :gryffondor
    expect(engine.is_final_room?).to eq false
  end

  it "should be possible to know if the current position is NOT the final room?" do
    engine.position = :gryffondor
    expect(engine.is_not_in_final_room?).to eq true
  end

  it "should be possible to init_scenario" do
    expect(engine).to respond_to(:init_scenario)
  end
  
  it "should be possible to set the moove" do
    moove = "right"
    engine.set_moove(moove)
    moove = engine.moove
    expect(moove).to eq :right
    
    moove = :right
    engine.set_moove(moove)
    moove = engine.moove
    expect(moove).to eq :right
  end
  
  it "should be possible get the next room" do
    engine.rooms = rooms
    engine.position = :gryffondor
    engine.moove = :right
    
    expect(engine.get_next_room).to eq :agrid
  end
  
  it "should be possible test if it's a legal moove" do
    engine.moove = :right
    expect(engine.is_legal_moove?).to eq true

    engine.moove = :fuck_you
    expect(engine.is_legal_moove?).to eq false
  end
  
  it "should be possible get the room object" do
    engine.rooms = rooms
    engine.position = :agrid
    agrid_rooms = rooms[:agrid]
    
    expect(engine.get_obj_room).to eq agrid_rooms
  end
  
end
