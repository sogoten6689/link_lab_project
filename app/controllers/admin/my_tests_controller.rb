class Admin::MyTestsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @user_tests = UserTest.all.order(:id)
    @breadcrumbs = [[t('user_tests.name'), admin_user_tests_url]]
  end

  def new
    @user_test = UserTest.new
    @doctors = User.all.where(:role => 1)
    @users = User.all.where(:role => 2)
    @lab_tests = RawTest.joins(:test_type, :lab_test).select('lab_tests.id, concat(raw_tests.name,  \' - \', test_types.vi_name) as name');
    @breadcrumbs = [[t('user_tests.name'), admin_user_tests_url], [t('user_tests.new_user_tests'), new_admin_user_test_url]]
  end

  def create
    @user_test = UserTest.new(new_user_params)
    if @user_test.save
      lab_test_ids = new_user_params[:lab_test_ids].reject { |c| c.empty? }
      if(!lab_test_ids.nil? && lab_test_ids.length > 0)
        lab_test_ids.each do | lab_test_id |
          new_result_test = ResultTest.new(:user_test_id => @user_test.id, :lab_test_id => lab_test_id, :result_status => 0)
          new_result_test.save
        end
      end

      redirect_to  admin_user_tests_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user_test = UserTest.find(params[:id])
    @doctors = User.all.where(:role => 1)
    @users = User.all.where(:role => 2)
    @result_tests = ResultTest.where(:user_test_id => params[:id])

    @result_tests = LabTest.joins(:raw_test, :result_test)
                           .where('result_tests.user_test_id = ?', params[:id])
                           .select("result_tests.*, raw_tests.name")
    # @user_test.lab_test_ids = @result_test_ids
    @lab_tests = RawTest.joins(:test_type, :lab_test).select('lab_tests.id, concat(raw_tests.name,  \' - \', test_types.vi_name) as name');
    @breadcrumbs = [[t('user_tests.name'), admin_labs_url], [t('user_tests.name'), edit_admin_lab_url(params[:id])]]
  end

  def edit
    @user_test = UserTest.find(params[:id])
    @doctors = User.all.where(:role => 1)
    @users = User.all.where(:role => 2)
    @result_test_ids = ResultTest.where(:user_test_id => params[:id]).pluck(:lab_test_id)
    @user_test.lab_test_ids = @result_test_ids
    @lab_tests = RawTest.joins(:test_type, :lab_test).select('lab_tests.id, concat(raw_tests.name,  \' - \', test_types.vi_name) as name');
    @breadcrumbs = [[t('user_tests.name'), admin_user_test_url], [t('user_tests.edit_lab_test'), edit_admin_user_url(params[:id])]]
  end

  def update
    @user_test = UserTest.find(params[:id])
    lab_test_ids = eidt_user_params[:lab_test_ids].reject { |c| c.empty? }
    if @user_test.test_status == 0
      ResultTest.where(:user_test_id => params[:id]).delete_all
      if(!lab_test_ids.nil? && lab_test_ids.length > 0)
        lab_test_ids.each do | lab_test_id |
          # old_result_test = ResultTest.all().where(:user_test_id => params[:id], :lab_test_id => lab_test_id)
          # if old_result_test.blank?
            new_result_test = ResultTest.new(:user_test_id => params[:id], :lab_test_id => lab_test_id, :result_status => 0)
            new_result_test.save
          # end
        end
      end
    end


    if @user_test.update(eidt_user_params)
      if @user_test.test_status == 0
        redirect_to  admin_user_tests_path
      else
        redirect_to  admin_user_test_path(@user_test.id)
      end
    else
      @doctors = User.all.where(:role => 1)
      @users = User.all.where(:role => 2)
      @lab_tests = LabTest.all
      @user_test = UserTest.all.order(:id)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_test = UserTest.find(params[:id])
    # @user_test.remove_image!
    # @user_test.save
    @user_test.delete
    redirect_to  admin_user_tests_path
  end

  private
    def new_user_params
      params.require(:user_test).permit( :doctor_id, :user_id, :phone, :address, :image, :reason, :note, :total, :test_status, :lab_test_ids => [])
    end

    def eidt_user_params
      params.require(:user_test).permit( :doctor_id, :user_id, :phone, :address, :image, :reason, :note, :total, :test_status, :lab_test_ids => [])
    end

    def invalid_foreign_key
      redirect_to admin_user_test_path, {alert: t('user_test.errors.invalid_foreign_key')}
    end
end
