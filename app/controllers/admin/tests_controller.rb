class Admin::TestsController < Aadmin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy update_inline]

  def index

  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
