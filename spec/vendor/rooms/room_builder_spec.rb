require 'spec_helper'

require './lib/vendor/rooms/builder'

RSpec.describe 'Room Builder' do
  
  let(:builder) {Rooms::Builder.new}
  
  it "should have a valid instance" do
    expect(builder.class).to eq Rooms::Builder
  end
  
end