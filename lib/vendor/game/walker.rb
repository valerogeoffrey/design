# frozen_string_literal: true

module Game
  class Walker
    attr_reader :map, :available_position
    attr_accessor :position, :moove

    def initialize(map = Rooms::RoomBuilder.build)
      @map = map
      @available_position = map.keys
      @position = @available_position.first
    end

    def rooms=(rooms) end

    def position=(position)
      raise InvalidPosition unless available_position.include? position.to_sym

      @position = position
    end

    def moove_to(moove)
      position = set_moove(moove).next_room

      raise InvalidPosition unless available_position.include? position.to_sym

      @position = position
      self
    end

    def available_moves
      map[position].moves.keys
    end

    def is_final_room?
      room.last_room
    end

    def is_not_in_final_room?
      !room.last_room
    end

    def next_room
      map[position].moves[moove]
    end

    def set_moove(moove)
      raise InvalidMoove unless available_moves.include? moove.to_sym

      @moove = moove.to_sym
      self
    end

    def is_legal_moove?
      map[position].moves.key?(moove) ? true : false
    end

    def room
      map[position]
    end
  end
end
