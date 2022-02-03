require 'spec_helper'
require_relative '../../../../lib/bootstrap'

RSpec.describe Fight::FightManager do

  let(:game) { Fight::FightBuilder.new.build}

  context "when we fight in one vs one " do
    context "when we need to initialize the fight manager object with figthers" do
      describe "# new " do
        it "should return an instance of FightManager" do
          expect(game.class).to eq Fight::FightManager
        end
      end
    end
  end

  it "should respond to #add_fighters" do
    expect(game).to respond_to(:add_fighters)
  end

  it "should respond to #start_game" do
    expect(game).to respond_to(:start_game)
  end


  it "should return no_players if none players init " do
    game = Fight::FightManager.new()
    game.stub(:gets) {"3"}
    expect(game.start_game).to eq(:no_players)
  end


  describe 'a phase' do
    context ' with an invalid attack' do
      before do
        $stdin = StringIO.new('9349949')
      end

      after do
        $stdin = STDIN
      end

      it "should just pass at the next step" do
        expect(game.static_phase).to eq(nil)
      end
    end

    context ' with an valid attack' do
      before do
        $stdin = StringIO.new('1')
      end

      after do
        $stdin = STDIN
      end

      it "should return true" do
        expect(game.static_phase).to eq(true)
      end

      it "should decrease enemy points" do
        before_point = game.player_two.points
        game.static_phase
        expect(before_point).to be > (game.player_two.points)
      end

      it "should be attack from enemy" do
        before_point = game.player_one.points
        game.static_phase
        expect(before_point).to be > (game.player_one.points)
      end

    end
  end
end