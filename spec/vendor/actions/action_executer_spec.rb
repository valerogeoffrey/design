require 'spec_helper'
require'./lib/vendor/actions/action_executer'
require_relative '../../../lib/vendor/actions/concrete/action_1'
require_relative '../../../lib/vendor/actions/action'

RSpec.describe 'Action Executer' do
  
  let(:action_executer) {Actions::ActionExecuter.new}
  let(:concret_action) {Actions::Concrete::Action1.data}
  let(:action) {Actions::Action.new}
  
  it "should have a valid instance" do
    expect(action_executer.class).to eq Actions::ActionExecuter
  end

  it "should respond to set_action && execute" do
    expect(action_executer).to respond_to(:execute)
  end

  it "should be able to set an action" do
    action.hydrate(concret_action)
    action_executer.set_action(action)
    
    expect {action_executer.execute}.to output("#{action.question}\n").to_stdout
  end

end