class Users::SessionsController < Devise::SessionsController

  after_action :set_greeting, only: :create

  private

  def set_greeting
    flash[:notice] = "Hello, #{current_user_name}"
  end

end
