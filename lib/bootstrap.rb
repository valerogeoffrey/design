require 'yaml'
require_relative 'observer'



def autoload
  [
    'utile',
    'errors',
    'characters/character',
    'characters/definition',
    'characters/wizzard',
    'characters/character_builder',
    'characters/strategy/base_strategy',
    'characters/strategy/one_vs_one',
    'fight/fight_manager',
    'fight/fight_builder',
    'fight/displayer_strategy/base_displayer',
    'fight/displayer_strategy/displayer',
    'fight/strategy/base_strategy',
    'fight/strategy/fight_one_vs_one',
    'rooms/definitions',
    'rooms/room',
    'enigmas/definition',
    'enigmas/displayer',
    'enigmas/enigma',
    'enigmas/builder',
    'rooms/room_builder',
    'enigmas/strategy/base_strategy',
    'enigmas/strategy/with_choice',
    'enigmas/strategy/free',
    'enigmas/command',
    'game/map',
    'game/walker',
    'game/displayer',
    'game/strategy',
    'game/command',
  ].each{ |file| require_relative(file) }
end
# need these files to play this mortal game
autoload
