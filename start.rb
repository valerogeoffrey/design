require_relative 'lib/bootstrap'


map = Map.build(mode: :room_with_enigma)
cursor = Walker.new(map)
displayer = Displayer
strategy = Strategy.new(map, cursor, displayer)

Game::Command.new(strategy).play