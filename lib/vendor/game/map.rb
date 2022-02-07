# frozen_string_literal: true

module Game
  class Map

    attr_accessor :options, :rooms, :hero

    def initialize(options = {})
      @options = options
      @difficulty = options.fetch(:difficulty, 1)
    end

    def build
      build_rooms
      attach_enigmas if with_enigmas
      attach_fight if with_fight

      rooms
    end

    def build_rooms
      @rooms = Rooms::RoomBuilder.build
    end

    private

    def with_enigmas
      !options.fetch(:with_enigmas, nil).nil?
    end

    def with_fight
      !options.fetch(:with_fights, nil).nil?
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

    def attach_enigmas
      enigmas_command = build_enigmas_command

      shuffled_rooms = rooms.to_a.shuffle
      event_rooms = shuffled_rooms[0 .. @difficulty]
      event_rooms.each do |_, room|
        room.enigma = enigmas_command.shuffle.sample
      end
    end

    def attach_fight
      fights = build_fighting(rooms.to_a.size)

      shuffled_rooms = rooms.to_a.shuffle
      event_rooms = shuffled_rooms[0 .. rooms.to_a.size]
      event_rooms.each_with_index do |(_, room), index|
        room.fight = fights[index]
      end
    end

    def build_fighting(size)
      command = []
      displayer = Fight::DisplayerStrategy::Displayer.new
      @hero = Characters::Hero.instance
      hero_points_from_difficulty

      for _ in 0 .. size
        interface = Characters::Interface::OneVsOne
        mvp = Characters::FetchCharacter.new.fetch_character(:wizzard).sample
        mvp = mvp_points_from_difficulty(mvp)

        interface = interface.new(hero).against(mvp)
        strategy = Fight::Strategy::FightOneVsOne.new(interface)

        command << Fight::Commander.new(strategy, displayer)
      end

      command
    end

    def hero_points_from_difficulty
      case @difficulty
      when 1 then @hero.points = 100
      when 2 then @hero.points = 80
      when 3 then @hero.points = 60
      end
    end

    def mvp_points_from_difficulty(mvp)
      case @difficulty
      when 1 then mvp.points = mvp.points * 0.75
      when 3 then mvp.points = mvp.points * 1.15
      end
      mvp
    end
  end
end
