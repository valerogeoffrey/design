module Actions
    class Generic
        attr_reader :question,:reponse,:disclaimer
        attr_accessor :user_response
        
        def initialize (question, response)
            @question     = question
            @reponse      = reponse
            @user_response = ""
            @disclaimer = "Well done you found the right answer, you will be able to move on the next room"
        end

        def ask_question
            puts question
        end

        def set_response(response)
            self.user_response = response
            self
        end

        def is_good_answer?
            user_reponse == reponse
        end
    end
end
