require_relative "./lib/bootstrap"

fight = Fight::FightBuilder.new.build
fight.start_game