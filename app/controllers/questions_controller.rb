class QuestionsController < ApplicationController
    

    def new

    end

    def number_correct
        @number_correct = session[:number_correct]
    end

    def message
        @message = flash[:message]
    end

    def define_question
        @question = 
    end
    







    def question_params
        params.require(:question).permit(:content, :op1, :op2, :op3, :op4, :correct_answer)
    end
    

end
