require_relative "../actions/action_executer.rb"
require_relative "../actions/action.rb"
module Rooms
  class Generic

    attr_reader :name, :description, :actions

    def initialize(name, description)

      @action_executer = Actions::ActionExecuter.new
      @name            = name
      @description     = description
      @actions         = []
      @moves           = {}
      @is_first_room   = false
    end

    def puts_description
      puts " "
      puts "//////////////////////////////////////////////////////////////////////////////////"
      puts "You are currently in : #{name}"
      puts "#{description}"
      puts "Your goal is to go to the Final room named Death Rooms"
    end

    def link_actions(actions)
      @actions = actions
      self
    end
    
    def execute_actions
      @actions.each do |action|
        have_not_pass_action = false
        until have_not_pass_action
          have_not_pass_action = action.execute_action
        end
      end
    end
  end
end

