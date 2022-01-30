module Rooms
  module Concrete
    class Room5
      def self.data
        {
          :id            => :final,
          :name          => "Final",
          :description   => "Description maison Final",
          :is_first_room => false,
          :is_last_room  => true,
          :moves         => {
            :back => :agrid
          },
        }
      end
    end
  end
end