require 'spec_helper'
require_relative '../../../lib/vendor/fight/fight_manager'
require_relative '../../../lib/vendor/fight/fighter'
require_relative '../../../lib/vendor/characters/wizzard'

RSpec.describe FightManager do
  let(:manager) { FightManager.new(fighter) }
  
  let(:harry_potter) { Characters::Wizzard.new('harry potter', 50)}
  let(:voldemort) { Characters::Wizzard.new('voldemort', 40)}
  
  let(:hero) { Fighter.new(harry_potter) }
  let(:mvp) { Fighter.new(voldemort) }

 
  it "should have a valid instance" do
    expect(manager.class).to eq FightManager
  end
  
  it "should respond to hero_is_dead?" do
    expect(manager).to respond_to(:hero_is_dead?)
  end
  
  it "should respond to hero_attack?" do
    expect(manager).to respond_to(:hero_attack)
  end
  
  it "should respond to mvp_attack?" do
    expect(manager).to respond_to(:mvp_attack)
  end



end