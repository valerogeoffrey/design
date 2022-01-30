require 'spec_helper'
require_relative '../lib/vendor/game/builder'

RSpec.describe 'Game Builder' do
  
  let(:builder) {Builder.new}
  
  it "should have a valid instance" do
    expect(builder.class).to eq Builder
  end

  it "should be possible build the game" do
    expect(builder).to respond_to(:build)
  end

  it "should return rooms when call build" do
    expect(builder.build.class).to eq Hash
  end
  it "should have at leat one room min " do
    expect(builder.build.class).to eq Hash
  end
  
end