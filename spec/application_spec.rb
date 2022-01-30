require 'spec_helper'
require_relative '../lib/vendor/game/application'

RSpec.describe 'Application' do
  let(:application) { Application.new }
  
  it "should have a valid instance" do
    expect(application.class).to eq Application
  end
  
  it" should have a engin attribute" do
    expect(application).to respond_to(:engine)
  end
  
  it" should have a fight master" do
    expect(application).to respond_to(:fight_master)
  end
  


end