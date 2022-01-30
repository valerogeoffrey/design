require_relative 'room'
Dir["./lib/vendor/rooms/concrete/*.rb"].each { |file| require file }

module Rooms
  class Builder
    
    def hydrate(room)
      @data = room
      self
    end

    def build
      @room = Rooms::Room.new.hydrate(@data)
      self
    end

    def link_action(actions)
      @room.link_actions(actions)
    end
    
    def rooms
      rooms = []
      (1..5).each do |number|
        rooms << Object::const_get("Rooms::Concrete::Room#{number}").data
      end
      rooms
    end
  
  end
end