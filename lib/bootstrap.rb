# frozen_string_literal: true

require 'yaml'
require_relative 'observer'

def autoload
  [
    'utile',
    'errors',
    'vendor/characters/character',
    'vendor/characters/definition',
    'vendor/characters/wizzard',
    'vendor/characters/character_builder',
    'vendor/characters/strategy/base_strategy',
    'vendor/characters/strategy/one_vs_one',
    'vendor/fight/fight_manager',
    'vendor/fight/fight_builder',
    'vendor/fight/displayer_strategy/base_displayer',
    'vendor/fight/displayer_strategy/displayer',
    'vendor/fight/strategy/base_strategy',
    'vendor/fight/strategy/fight_one_vs_one',
    'vendor/rooms/definitions',
    'vendor/rooms/room',
    'vendor/enigmas/definition',
    'vendor/enigmas/displayer',
    'vendor/enigmas/enigma',
    'vendor/enigmas/builder',
    'vendor/rooms/room_builder',
    'vendor/enigmas/strategy/base_strategy',
    'vendor/enigmas/strategy/with_choice',
    'vendor/enigmas/strategy/free',
    'vendor/enigmas/command',
    'vendor/game/map',
    'vendor/game/walker',
    'vendor/game/displayer',
    'vendor/game/strategy',
    'vendor/game/command'
  ].each { |file| require_relative(file) }
end
# need these files to play this mortal game
autoload
