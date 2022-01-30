require_relative '../rooms/builder'
module Rooms
  class Feeder
    def get_rooms
      [] << Builder.new.rooms
    end
  
  end
end
