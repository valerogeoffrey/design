# frozen_string_literal: true

module Rooms
  class Room
    attr_reader :name, :description, :actions, :id, :first_room, :last_room, :moves
    attr_accessor :enigma, :fight

    def initialize(attributes)
      @id = attributes[:id]
      @name = attributes[:name]
      @description = attributes[:description]
      @first_room = attributes[:first_room]
      @last_room = attributes[:last_room]
      @moves = attributes[:moves]
    end

    def self.hydrate(attributes)
      raise MissingRoomAttributes unless correct_attributes?(attributes)

      new(attributes)
    end

    private

    def self.correct_attributes?(attributes)
      return true
      [:name, :description, :actions, :id, :is_first_room, :is_last_room, :moves] - attributes.key == []
    end

    def puts_description
      puts "You are currently in : #{name}"
    end
  end
end
