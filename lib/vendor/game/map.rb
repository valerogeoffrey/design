# frozen_string_literal: true

module Game
  class Map
    class << self
      def build(mode: :room)
        case mode
        when :room then build_rooms
        when :room_with_enigma then build_rooms(with_enigma: true)
        end
      end

      def build_rooms(with_enigma: false, with_fight: false)
        rooms = Rooms::RoomBuilder.build
        attach_enigmas(rooms) if with_enigma
        attach_fight(rooms) if with_fight

        rooms
      end

      def build_enigmas_command
        commands = []
        displayer = Enigmas::Displayer
        Enigmas::Builder.build.each do |enigma|
          strategy = enigma.type == :free ? Enigmas::Strategy::Free : Enigmas::Strategy::WithChoice
          commands << Enigmas::Command.new(enigma, strategy.new, displayer)
        end
        commands
      end

      def attach_enigmas(rooms)
        enigmas_command = build_enigmas_command
        shuffled_rooms = rooms.to_a.shuffle
        event_rooms = shuffled_rooms[0..1]
        event_rooms.each do |_, room|
          room.enigma = enigmas_command.sample
        end
      end

      def attach_fight(rooms)
        enigmas_command = build_fights_command
        shuffled_rooms = rooms.to_a.shuffle
        event_rooms = shuffled_rooms[0..1]
        event_rooms.each do |_, room|
          room.enigma = enigmas_command.sample
        end
      end

      def build_fights_command
        commands = []
        displayer = Fight::DisplayerStrategy::Displayer
        Enigmas::Builder.build.each do |enigma|
          strategy = enigma.type == :free ? Enigmas::Strategy::Free : Enigmas::Strategy::WithChoice
          commands << Enigmas::Command.new(enigma, strategy.new, displayer)
        end
        commands
      end
    end
  end
end
