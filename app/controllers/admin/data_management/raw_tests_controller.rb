class Admin::DataManagement::RawTestsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

  def index
    @raw_tests = RawTest.all.joins(:test_type).order(:id)
    @breadcrumbs = [[t('raw_tests.name'), admin_data_management_raw_tests_path]]
  end

  def new
    @raw_test = RawTest.new
    @test_types = TestType.all
    @breadcrumbs = [[t('raw_tests.name'), admin_data_management_test_types_url], [t('raw_tests.new_raw_test'), new_admin_data_management_test_type_url]]
  end

  def create
    @raw_test = RawTest.new(raw_test_params)
    if @raw_test.save
      redirect_to  admin_data_management_raw_tests_path
    else
      @test_types = TestType.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @raw_test = RawTest.find(params[:id])
    @test_types = TestType.all
    @breadcrumbs = [[t('raw_tests.name'), admin_data_management_test_types_url], [t('raw_tests.edit_raw_test'), edit_admin_data_management_test_type_url(params[:id])]]
  end

  def update
    @raw_test = RawTest.find(params[:id])
    if @raw_test.update(raw_test_params)
      redirect_to  admin_data_management_raw_tests_path
    else
      @test_types = TestType.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @raw_test = RawTest.find(params[:id])
    @raw_test.delete
    redirect_to  admin_data_management_raw_tests_path
  end

  private
  def raw_test_params
    params.require(:raw_test).permit(:name, :note, :cost, :tax, :test_type_id)
  end
end
