require 'spec_helper'
require_relative '../lib/vendor/game/game'

RSpec.describe 'Game' do
  
  let(:game) {Game.new}
  
  it "should have a valid instance" do
    expect(game.class).to eq Game
  end
  

  it "should be possible to start the game" do
    expect(game).to respond_to(:start)
  end
  
  
end