# frozen_string_literal: true

# Rooms::RoomBuilder.build
module Rooms
  class RoomBuilder
    def self.build
      rooms = {}
      Rooms.fetch_rooms_definition.each do |room_definition|
        rooms[room_definition[:id]] = Room.hydrate(room_definition)
      end

      rooms
    end
  end
end
