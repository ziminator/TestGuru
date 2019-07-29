require "#{Rails.root}/lib/clients/octo_kit_client"

class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tests_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @tests_passage.accept!(params[:answer_ids])

    if @tests_passages.completed?
      TestMailer.completed_test(@tests_passages).deliver_now
      redirect_to result_test_passage_path(@tests_passages)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@tests_passages.current_question, OctoKitClient.new)
    answer = service.call

    flash_options = if service.client.success?
                      create_gist!(answer.html_url)
                      { notice: t('.sucess', gist_url: answer[:html_url] }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @tests_passages, flash_options
  end

  private

  def set_tests_passage
    @tests_passages = TestPassage.find(params[:id])
  end

  def create_gist!(gist_url)
    current_user.gists.create(question: @tests_passages.current_question, url: gist_url)
  end

end
