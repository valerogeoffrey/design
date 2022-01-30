require_relative 'application'
require_relative 'builder'
require_relative 'game_master'
class Game
  
  def initialize
    @app = Application.new
    @game = Builder.new.build
    #@executer = GameMaster.new(@app.engine,@app.fight_master)
  end
  
  def game
    @game.inspect
  end
  
  def start
    @executer.start_game(@game)
  end
  
end


