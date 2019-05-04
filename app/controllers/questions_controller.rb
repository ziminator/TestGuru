class QuestionsController < ApplicationController
  before_action :find_question, only: %i(show destroy)
  before_action :find_test, only: %i(index create)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def new

  end

  def show

  end

  def index
    @question = @test.questions
  end

  def create
    question = @test.question.new(question_params)
    if question.errors.any?
      render plain: question.errors
    else
      render plain: question.inspect
    end
  end

  def destroy
    @question.destroy
    render plain: "Destroy question id=#{params[:id]}"
  end

  private

  def quetion_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def resque_question_not_found
    render plain: 'Question not found!'
  end
end
