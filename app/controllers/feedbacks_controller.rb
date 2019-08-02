class FeedbacksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_feedback, only: [:show]

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path, notice: t('.feedback_was_created') }
        FeedbacksMailer.set_feedback(@feedback).deliver_now
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:body)
  end

end
