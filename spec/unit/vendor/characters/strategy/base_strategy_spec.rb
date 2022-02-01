# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../../lib/vendor/characters/strategy/base_strategy'

RSpec.describe 'Characters::Strategy::BaseStrategy' do
  let(:strategy) { Characters::Strategy::BaseStrategy.new}
  it 'has to respond to some methods' do
    expect(strategy).to respond_to(:fight_against)
    expect(strategy).to respond_to(:can_attack?)
    expect(strategy).to respond_to(:point_for)
    expect(strategy).to respond_to(:attack)
  end
end
