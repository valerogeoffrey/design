require 'spec_helper'
require'./lib/vendor/actions/action_builder'

RSpec.describe 'Action Builder' do
  
  let(:action) {Actions::ActionBuilder.new}
  
  it "should have a valid instance" do
    expect(action.class).to eq Actions::ActionBuilder
  end

  it "should respond to hydrate && build" do
    expect(action).to respond_to(:hydrate)
    expect(action).to respond_to(:build)
  end


  it "should be able to build the action" do
    args = {question: "test 1", reponse: "2"}
    builted = action.hydrate(args).build
    
    expect(builted.question).to eq"test 1"
    expect(builted.reponse).to eq"2"
  end



end