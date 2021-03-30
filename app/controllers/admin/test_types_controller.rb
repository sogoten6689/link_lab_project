class Admin::TestTypesController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

  def index
    @test_types = TestType.all.order(:id)
    @breadcrumbs = [[t('testTypes.name'), admin_test_types_url]]
  end

  def new
    @test_type = TestType.new
    @breadcrumbs = [[t('testTypes.name'), admin_test_types_url], [t('testTypes.new_test_type'), new_admin_test_type_url]]
  end

  def create
    @test_type = TestType.new(test_type_params)
    if @test_type.save
      redirect_to  admin_test_types_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @test_type = TestType.find(params[:id])
    @breadcrumbs = [[t('testTypes.name'), admin_test_types_url], [t('testTypes.edit_test_type'), edit_admin_test_type_url(params[:id])]]
  end

  def update
    @test_type = TestType.find(params[:id])
    if@test_type.update(test_type_params)
      redirect_to  admin_test_types_path
    else
      render :edit, status: :unprocessable_entity
    end
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
