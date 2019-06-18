class TestController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @tests = Test.find(params[:id])
  end

end
