class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tests_passage, only: %i[show update result gist]

  def show
    @time_left = (@tests_passages.created_at.since(@tests_passages.test.time_limit.minutes) - Time.now).round
    redirect_to result_test_passage_path(@tests_passages) if @time_left <= 0
  end

  def result
  end

  def update
    @tests_passages.accept!(params[:answer_ids])

    if @tests_passages.completed?
      TestsMailer.completed_test(@tests_passages).deliver_now
      redirect_to result_test_passage_path(@tests_passages)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@tests_passages.current_question)
    answer = result.call

    flash_options = if result.success?
                      create_gist!(answer.html_url)
                      { notice: t('.success', gist_url: answer[:html_url]) }
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

  def awarded_badges!
    badge_service = BadgeService.new(@tests_passages)
    badge_service.awarded_badges!
    current_user.badges.push(badge_service.badges)
  end

end
