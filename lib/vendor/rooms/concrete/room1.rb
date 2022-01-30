module Rooms
  module Concrete
  class Room1
    def self.data
      {
        :id            => :gryffondor,
        :name          => "Maison Gryffondor",
        :description   => "Description maison gryffondor",
        :is_first_room => true,
        :is_last_room  => false,
        :moves         => {
          :forward => :pouffsouffle,
          :right => :agrid,
        },
      }
    end
  end
end
end