class Admin::TestTypesController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @test_types = TestType.all.order(:id)
    @breadcrumbs = [[t('test_types.name'), admin_test_types_url]]
  end

  def new
    @test_type = TestType.new
    @breadcrumbs = [[t('test_types.name'), admin_test_types_url], [t('test_types.new_test_type'), new_admin_test_type_url]]
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
    @breadcrumbs = [[t('test_types.name'), admin_test_types_url], [t('test_types.edit_test_type'), edit_admin_test_type_url(params[:id])]]
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

    def invalid_foreign_key
      redirect_to admin_test_types_path, {alert: t('testTypes.errors.invalid_foreign_key')}
    end
end
