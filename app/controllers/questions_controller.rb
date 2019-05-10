class QuestionsController < ApplicationController
  before_action :number_correct, only: [:new]
  
  def new
    
    @q = Question.new
    selected_move = @q.new_move
    correct_pokemon = @q.correct_pokemon
    temp = @q.set_options
    @answer1 = temp[temp.keys[0]]
    @answer2 = temp[temp.keys[1]]
    @answer3 = temp[temp.keys[2]]
    @answer4 = temp[temp.keys[3]]
    @question = Question.create(
      content: "What pokemon has #{selected_move.name}?",
      "#{temp.keys[0]}": @answer1,
      "#{temp.keys[1]}": @answer2,
      "#{temp.keys[2]}": @answer3,
      "#{temp.keys[3]}": @answer4,
      correct_answer: correct_pokemon.name,
    )
    

    #if @question.answer == @question.correct_answer

  end

  def update
    if Question.last.correct_answer == params[:question][:user_answer]
      if session[:number_correct] == nil
        session[:number_correct] = 0
      end
      session[:number_correct] += 1
    end
    
      
    

    redirect_to new_question_path
  end

  def create
    byebug
    #if @question.answer == @question.correct_answer
  end

  def number_correct
    @number_correct = session[:number_correct]
  end

  def message
    @message = flash[:message]
  end

  def define_question
    # @question =
  end

  def question_params
    params.require(:question).permit(:content, :op1, :op2, :op3, :op4, :correct_answer)
  end
end
