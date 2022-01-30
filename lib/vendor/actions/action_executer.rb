module Actions
  class ActionExecuter
    
    def set_action(action)
      @action = action
    end

    def execute
      @action.ask_question
    end
  end
end