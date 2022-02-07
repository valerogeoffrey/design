require 'spec_helper'
require_relative '../../../../lib/bootstrap'

RSpec.describe Fight::Commander do

  let(:hero) { Characters::Hero.instance }
  let(:mvp) do
    mvp = Characters::FetchCharacter.new.fetch_character(:wizzard).sample
    mvp.points = 1
    mvp
  end
  let (:interface) { Characters::Interface::OneVsOne.new(hero).against(mvp) }
  let(:strategy) { Fight::Strategy::FightOneVsOne.new(interface) }
  let(:displayer) { Fight::DisplayerStrategy.Displayer }
  let(:empty_fight_manager) { Fight::Commander.new(strategy, displayer) }
  let(:fight_manager) { Fight::FightBuilder.new.build }

  context "when we fight in one vs one " do
    context "when we need to initialize the fight manager object with figthers" do
      describe "# new " do
        it "should return an instance of Commander" do
          expect(fight_manager.class).to eq (Fight::Commander)
        end
      end
    end
  end

  it "should respond to #play" do
    expect(fight_manager).to respond_to(:play)
  end
end