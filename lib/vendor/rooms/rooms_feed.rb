require_relative '../rooms/feeder'
module Rooms
  class RoomsFeed
    def initialize
      @liste = []
      hydrate_rooms
    end
    
    def list
      @liste
    end
    
    def hydrate_rooms
      @liste << Feeder.new.get_rooms
    end
  end
end
