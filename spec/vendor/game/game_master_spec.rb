require 'spec_helper'
require_relative '../../../lib/vendor/game/game_master'
require_relative '../../../lib/vendor/game/application'

RSpec.describe 'Game master' do
  
  let(:app) {Application.new}
  let(:game_master) {GameMaster.new(app.engine,app.fight_master)}

  before(:all) do
    GameMaster.send(:public, *GameMaster.protected_instance_methods)
  end
  
  it "should have a valid instance" do
    expect(game_master.class).to eq GameMaster
  end
  
  it "should respond to start_a_game method" do
    expect(game_master).to respond_to(:start_game)
    expect(game_master).to respond_to(:start)
    expect(game_master).to respond_to(:play)
    expect(game_master).to respond_to(:init_game)
    expect(game_master).to respond_to(:moove_on)
    expect(game_master).to respond_to(:get_next_room)
    expect(game_master).to respond_to(:check_step_and_make_action)
  end
  
  
end