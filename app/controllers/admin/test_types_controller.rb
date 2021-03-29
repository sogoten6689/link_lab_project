class Admin::TestTypesController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

  def index
    @test_types = TestType.all
    @breadcrumbs = [["Test Type", admin_test_types_url]]
  end

  def new
    @test_type = TestType.new
    @breadcrumbs = [["Test Type", admin_test_types_url], ["New Test Type", new_admin_test_type_url]]
  end

  def create
    @test_type = TestType.new(test_type_params)
    @test_type.save
    redirect_to  admin_test_types_path
  end

  def edit
    @test_type = TestType.find(params[:id])
    @breadcrumbs = [["Test Type", admin_test_types_url], ["Edit Test Type", edit_admin_test_type_url(params[:id])]]
  end

  def update
    @test_type = TestType.find(params[:id])
    @test_type.update(test_type_params)
    redirect_to  admin_test_types_path
  end

  def destroy
    @test_type = TestType.find(params[:id])
    @test_type.delete
    redirect_to  admin_test_types_path
  end

  private
    def test_type_params
      params.require(:test_type).permit(:en_name, :vi_name)
    end
end
