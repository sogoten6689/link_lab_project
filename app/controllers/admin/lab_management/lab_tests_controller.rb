class Admin::LabManagement::LabTestsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

  def index
    @lab_tests = LabTest.all.joins(:raw_test, :lab).order(:id)
    @breadcrumbs = [[t('lab_tests.name'), admin_lab_management_lab_tests_path]]
  end

  def new
    @lab_test = LabTest.new
    @lab_test.lab_id = current_user.lab_id
    @raw_tests = RawTest.all.order(:name)
    @labs = Lab.all.order(:id)
    @breadcrumbs = [[t('lab_tests.name'), admin_data_management_test_types_url], [t('lab_tests.new_lab_test'), new_admin_data_management_test_type_url]]
  end

  def create
    @lab_test = LabTest.new(lab_test_params)
    @lab_test.lab_id = current_user.lab_id
    if @lab_test.save
      redirect_to  admin_lab_management_lab_tests_path
    else
      @lab_test.lab_id = current_user.lab_id
      @raw_tests = RawTest.all.order(:name)
      @labs = Lab.all.order(:id)
      @test_types = TestType.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lab_test = LabTest.find(params[:id])
    @lab_test.lab_id = current_user.lab_id
    @raw_tests = RawTest.all.order(:name)
    @labs = Lab.all.order(:id)
    @breadcrumbs = [[t('lab_tests.name'), admin_data_management_test_types_url], [t('lab_tests.edit_lab_test'), edit_admin_data_management_test_type_url(params[:id])]]
  end

  def update
    @lab_test = LabTest.find(params[:id])
    @lab_test.lab_id = current_user.lab_id
    if @lab_test.update(lab_test_params)
      redirect_to  admin_lab_management_lab_tests_path
    else
      @lab_test.lab_id = current_user.lab_id
      @raw_tests = RawTest.all.order(:name)
      @labs = Lab.all.order(:id)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lab_test = LabTest.find(params[:id])
    @lab_test.delete
    redirect_to  admin_lab_management_lab_tests_path
  end

  private
  def lab_test_params
    params.require(:lab_test).permit(:lab_id, :raw_test_id, :lab_price, :lab_tax, :is_lab_price, :active)
  end
end
