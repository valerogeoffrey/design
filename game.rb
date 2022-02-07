# frozen_string_literal: true

require 'readline'

require_relative 'lib/bootstrap'

interface = Characters::Interface::OneVsOne

hero = Characters::Hero.instance
mvp = Characters::FetchCharacter.new.fetch_character(:wizzard).first

interface = interface.new(hero).against(mvp)

displayer = Fight::DisplayerStrategy::Displayer.new
strategy = Fight::Strategy::FightOneVsOne.new(interface)
manager = Fight::Commander.new(strategy, displayer)

manager.play