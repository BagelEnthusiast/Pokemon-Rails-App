class QuestionsController < ApplicationController
  def new
    @q = Question.new
    selected_move = @q.new_move
    correct_pokemon = @q.correct_pokemon
    temp = @q.set_options

    @question = Question.create(
      content: "What pokemon has #{selected_move.name}?",
      "#{temp.keys[0]}": temp[temp.keys[0]],
      "#{temp.keys[1]}": temp[temp.keys[1]],
      "#{temp.keys[2]}": temp[temp.keys[2]],
      "#{temp.keys[3]}": temp[temp.keys[3]],
      correct_answer: correct_pokemon.name,
    )
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
