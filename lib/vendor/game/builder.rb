require_relative "../rooms/builder.rb"
require_relative "../actions/action_builder.rb"
require_relative "../rooms/builder.rb"
require_relative "feeder.rb"

class Builder
  
  attr_accessor :room_builder, :action_builder, :data
  
  def initialize
    @room_builder   = Rooms::Builder.new
    @action_builder = Actions::ActionBuilder.new
    @data           = Feeder.process
    @rooms          = {}
  end
  
  def build
    @data.each do |room, action|
      actions         = [].push(process_action action)
      room            = process_room(room, actions)
      @rooms[room.id] = room
    end
    @rooms
  end
  
  private
  
  def process_action(action)
    @action_builder.hydrate(action).build
  end
  
  def process_room(room, actions)
    @room_builder
      .hydrate(room)
      .build
      .link_action(actions)
  end

end