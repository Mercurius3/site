class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.valid?
      QuestionMailer.new_question(@question).deliver
      redirect_to root_path
    else
      render :new
    end
  end
end