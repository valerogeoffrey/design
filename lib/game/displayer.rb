module Game
  class Displayer
    class << self
      def ask_for_moove(moove)
        puts ">> Dans quelle direction veux tu allé ? ( #{moove} )"
      end

      def room_position(position)
        puts ""
        puts "> ---- > Moove silently > -------------- >"
        puts ">> You are in the room ## #{position} ##"
      end

      def you_are_out
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts "> You'r out of this darkness hunted castle"
      end
    end
  end
end