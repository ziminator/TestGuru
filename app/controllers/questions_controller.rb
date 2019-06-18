class QuestionsController < ApplicationController
  before_action :find_question, only: %i(show destroy edit update)
  before_action :find_test, only: %i(index create new edit destroy)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def show

  end

  def edit

  end

  def index
    @question = @test.questions
  end

  def create
    @question = @test.question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
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
    #@test = Test.find_test(params[:test_id])
    @test = @question.test
  end

  def resque_question_not_found
    response.status = 404
    response.body 'Question not found!'
  end
end
