# frozen_string_literal: true

require_relative 'lib/bootstrap'

puts "What's the name of your hero ? "
name = fetch_console
Characters::Hero.instance.name = name

puts "What's difficulty do you want to play ? ( 1 - 3 )"
difficulty = fetch_console

options = {
  with_enigma: true,
  with_fight: true,
  difficulty: difficulty,
}
map = Game::Map.new(options).build
cursor = Game::Walker.new(map)
displayer = Game::Displayer
strategy = Game::Strategy.new(map, cursor, displayer)

Game::Command.new(strategy).play
