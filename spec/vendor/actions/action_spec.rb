require 'spec_helper'
require'./lib/vendor/actions/action'

RSpec.describe 'Action' do
  
  def capture_response
    $stdin.gets.chomp
  end
  
  let(:action) {Actions::Action.new}
  
  it "should have a valid instance" do
    expect(action.class).to eq Actions::Action
  end

  it "should have have somes attributes" do
    expect(action).to have_attributes(:user_response => "")
    expect(action).to have_attributes(:question => "")
    expect(action).to have_attributes(:reponse  => "")
  end

  it "should respond to hydrate" do
    expect(action).to respond_to(:hydrate)
  end
  
  it " should pass question / response" do
    args = {question: "test 1", reponse: "2"}
    action.hydrate(args)
    expect(action.question.to_s).to eq"test 1"
    expect(action.reponse.to_s).to eq"2"
  end
  
  it "should be able to puts the question" do
    args = {question: "test 1", reponse: "2"}
    action.hydrate(args)
    expect{action.ask_question}.to output("#{action.question}\n").to_stdout
  end
  
  it "should be possible to set a reponse to the question" do
    action.set_response("test")
    expect(action.user_response).to eq("test")
  end
  
  it "should be possible to compare reponse to know its a good answer" do
    args = {question: "test 1", reponse: "test"}
    action.hydrate(args)
    action.set_response("test")
    expect(action.is_good_answer?).to eq true
  end


  it "should be possible to execute an action" do
    args = {question: "test 1", reponse: "test"}
    action.hydrate(args)
  
    # dont know how to test a chomps action STDIN.gets
  end
  
  
end