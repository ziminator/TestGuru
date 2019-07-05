class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success?
      { notice: t('.sucess') }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_pasage, flash_options

  end

  private

  def set_test_pasage
    @test_pasage = TestPassage.find(params[:id])
  end

  def create_gist(gist_url)
    current_user.gist.create(question: @tests_passages.current_question, url: gist_url)
  end

end
