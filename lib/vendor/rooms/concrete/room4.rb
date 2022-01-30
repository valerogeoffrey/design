module Rooms
  module Concrete
    class Room4
      def self.data
        {
          :id            => :agrid,
          :name          => "Agrid",
          :description   => "Description maison Agrid",
          :is_first_room => false,
          :is_last_room  => false,
          :moves         => {
            :left => :final,
            :right => :gryffondor,
            :back => :serpentard,
          },
        }
      end
    end
  end
end