require_relative "generic.rb"
module Rooms
  class Room < Generic

    attr_accessor :name, :description, :actions, :id, :is_first_room, :is_last_room, :moves

    def initialize()
      @id            = :r1
      @name          = "Name Of your Room"
      @description   = "Description Of your room"
      @is_first_room = false
      @is_last_room  = false
      @moves         = {}

      super(@name, @description)
    end

    def hydrate(args)
      @id            = args[:id] || @id
      @name          = args[:name] || @name
      @description   = args[:description] || @description
      @is_first_room = args[:is_first_room] || @is_first_room
      @is_last_room  = args[:is_last_room] || @is_last_room
      @moves         = args[:moves] || @moves
      self
    end

    def puts_description
      puts "You are currently in : #{name}"
    end
  end
end