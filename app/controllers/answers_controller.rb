class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was saved successfully"
    else
      @errors = @answer.errors.full_messages.join(', ')
      redirect_to question_path(@question), notice: @errors
    end
  end

  def bestanswer
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.update_attributes(best_answer: true)
    best_answer_converter(@question, @answer)
    redirect_to @question, notice: 'You marked the best answer'
  end

  private

  def answer_params
    params.require(:answer).permit(:description, :question_id, :best_answer)
  end

  def best_answer_converter(question, answer)
    question.answers.each do |a|
      if a != answer
        a.best_answer = false
        a.save
      end
    end
  end

end
