# frozen_string_literal: true

require 'readline'

require_relative './lib/fight/character.rb'
require_relative './lib/fight/wizard.rb'
require_relative './lib/fight/character_rules.rb'
require_relative './lib/fight/fight_manager.rb'
require_relative './lib/fight/fight_rules.rb'
require_relative './lib/fight/displayer.rb'

a = Fight::Wizzard.new
b = Fight::Wizzard.new(:voldemort)

fighter = Fight::FightManager.new(fighters: [a, b])
fighter.add_fighters([a, b])
fighter.start_game

fighter.init
fighter.with(a)
fighter.againt(b)
fighter.start_game

while input = Readline.readline('> ', true)
  break if input == 'exit'

  puts 'helper' if input == 'help'
end

p Readline::HISTORY.to_a

# require_relative "./lib/vendor/game/application.rb"
# require_relative "./lib/vendor/game/game_master.rb"
# require_relative "./lib/vendor/game/builder.rb"
#
# app = Application.new
# map = Builder.new.build
# executer = GameMaster.new(app.engine,app.fight_master)
#
# #executer.start_game(map)
##
#
# @in_game = true
# @rooms = []
# @rooms     = map
# @room_name = @rooms.keys.first
# @position = :gryffondor
# @moove = nil
# @available_direction = [:forward, :back, :left, :right]
# @has_begin = false
# loop do
#
#  # if current position is the position of the first room
#  if @position == @rooms.keys.first && @has_begin == false
#    puts "Hello ! Your' begin a dead game.... be carrefull" if @has_begin == false
#    @room = @rooms[@position]
#    @room.puts_description
#    puts "Where do you want to go ?  ( #{@rooms[@position].moves.keys.join(' / ')} )"
#    moove = STDIN.gets.chomp
#    @has_begin = true
#  else
#    puts "-- you'r in #{@position} ---------------------------------"
#    @room = @rooms[@position]
#    puts "Where do you want to go ?  ( #{@rooms[@position].moves.keys.join(' / ')} )"
#    moove = STDIN.gets.chomp
#  end
#
#  puts '------------------------------------------------------'
#
#  @moove = moove.to_sym
#
#  if  @available_direction.include?(@moove)
#    @room_name =  @rooms[@position].moves[@moove]
#    puts "tu viens d'arriver dans la room #{@room_name}"
#  end
#
#  @position = @room_name.to_sym
#  @room = @rooms[@position]
#
#  @in_game = false if  @position == @rooms.keys.last
#  break if !@in_game
#
# end
#
# puts "You'r out of the game ! alive ? lucky ! "
