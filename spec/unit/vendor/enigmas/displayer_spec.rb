# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/vendor/enigmas/displayer'

RSpec.describe 'Enigmas::Displayer' do
  let(:displayer) { Enigmas::Displayer }

  it 'has to respond to some methods' do
    expect(displayer).to respond_to(:ask_question)
    expect(displayer).to respond_to(:congratulation)
    expect(displayer).to respond_to(:excedded_try)
    expect(displayer).to respond_to(:introduction)
    expect(displayer).to respond_to(:try_again)
  end

  it 'has to puts text for #ask_question' do
    expect{displayer.ask_question('test')}.to output("test\n").to_stdout
  end

end
