require_relative "../rooms/builder.rb"
require_relative "../actions/action_builder.rb"

Dir["./lib/vendor/actions/concrete/*.rb"].each { |file| require file }
Dir["./lib/vendor/rooms/concrete/*.rb"].each { |file| require file }

class Feeder
  def self.process
    #Initialisation des salle + actions peut etre mit dans un fichier de config

    rooms = []
    (1..5).each do |number|
      rooms << 
        [
          Object::const_get("Rooms::Concrete::Room#{number}").data,
          Object::const_get("Actions::Concrete::Action#{number}").data,
        ]
    end

    rooms

  end
end