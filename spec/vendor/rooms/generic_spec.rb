require 'spec_helper'

require_relative "../../../lib/vendor/actions/action_executer"
require_relative "../../../lib/vendor/actions/action"
require_relative "../../../lib/vendor/rooms/generic.rb"

RSpec.describe 'Generic Room' do
  
  let(:room) {Rooms::Generic.new('name','description')}
  
  it "should have a valid instance" do
    expect(room.class).to eq Rooms::Generic
  end
  
  it " should be able to  link_actions" do
    expect(room).to respond_to(:link_actions)
    expect(room.link_actions([1,2,3,4]).actions).to eq [1,2,3,4]
  end
  
  it " should be able to execute_actions" do
    expect(room).to respond_to(:execute_actions)
  end
  
end