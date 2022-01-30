Dir["./actions/action_0.rb"].each { |file| require file }
Dir["./actions/*.rb"].each { |file| require file }
Dir["./rooms/*.rb"].each { |file| require file }

class Engine
  
  attr_writer :moove
  attr_reader :rooms, :position, :available_direction,
              :voldemort_is_alive, :has_no_error,
              :moove
  
  def initialize
    @rooms = {}
    @moove               = ""
    @has_no_error        = true
    @voldemort_is_alive  = true
    @available_direction = [:forward, :back, :left, :right]
    @position            = :r1
  end
  
  def rooms=(rooms)
    @rooms = rooms
  end
  
  def position=(position)
    @position = position
  end
  
  def set_position(position)
    @position = position
    self
  end
  
  def get_moves
    @rooms[@position].moves.keys.join(' / ')
  end
  
  def is_final_room?
    @position == @rooms.keys.last
  end
  
  def is_not_in_final_room?
    @position != @rooms.keys.last
  end
  
  def init_scenario
    # if current position is the position of the first room
    if @position == @rooms.keys.first
      puts "Hello ! Your' begin a dead game.... be carrefull"
      @room = get_obj_room
      @room.puts_description
      @room.execute_actions
      puts "Where do you want to go ?  ( #{self.get_moves} )"
    end
  end
  
  def get_next_room
    @rooms[position].moves[moove]
  end
  
  def set_moove(moove)
    @moove = moove.to_sym
    self
  end
  
  def is_legal_moove?
    available_direction.include?(moove) ? true : false
  end
  
  def get_obj_room
    @rooms[position]
  end

end
