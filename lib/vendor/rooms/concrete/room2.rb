module Rooms
  module Concrete
    class Room2
      def self.data
        {
          :id            => :pouffsouffle,
          :name          => "Maison pouffsouffle",
          :description   => "Description maison pouffsouffle",
          :is_first_room => false,
          :is_last_room  => false,
          :moves         => {
            :forward => :serpentard,
          },
        }
      end
    end
  end
end