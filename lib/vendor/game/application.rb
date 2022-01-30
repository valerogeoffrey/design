require_relative 'engine'
require_relative '../fight/fight_master_wrapper'

class Application
  
  attr_accessor :engine,:fight_master
  
  def initialize
    @engine  = Engine.new
    @fight_master  = FightMasterWrapper.instance
  end
  
end