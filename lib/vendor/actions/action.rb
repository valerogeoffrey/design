require_relative "generic.rb"

module Actions
  class Action < Generic
    attr_reader :question, :reponse, :disclaimer
    attr_accessor :user_response

    def initialize
      @user_response = ""
      @question      = ""
      @reponse       = ""
      @disclaimer    = "Well done you found the right answer, you will be able to move on the next room"
    end

    def hydrate(args)
      @question = args[:question] || @question
      @reponse  = args[:reponse] || @reponse

      self
    end

    def ask_question
      puts question
    end

    def set_response(response)
      self.user_response = response
      self
    end

    def is_good_answer?
      user_response == reponse
    end

    def execute_action
      puts ""
      puts "Your need to ask goot to move on ! "
      puts ask_question
      response_action = gets.chomp.to_i
      good_response   = set_response(response_action).is_good_answer?
      puts @disclaimer if good_response
      good_response
    end
  end
end
