class Admin::DoctorsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @doctors = User.all.where(:role => 1).order(:id)
    @breadcrumbs = [[t('doctors.name'), admin_doctors_url]]
  end

  def new
    @user = User.new
    @labs = Lab.all.order(:id)
    @breadcrumbs = [[t('doctors.name'), admin_doctors_url], [t('doctors.new'), new_admin_doctor_url]]
  end


  def create
    user_params = new_doctor_params
    password = SecureRandom.hex(8)
    user_params[:password] = password
    user_params[:password_confirmation] = password
    @user = User.new(user_params)
    @user.role = 1
    if @user.save
      ApplicationMailer.send_password(@user, password).deliver
      redirect_to  admin_doctors_path
    else
      @labs = Lab.all.order(:id)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
    @breadcrumbs = [[t('doctors.name'), admin_doctors_url], [t('doctors.edit'), edit_admin_doctor_url(params[:id])]]
  end

  def update
    @user = User.find(params[:id])
    if @user.update(edit_user_params)
      redirect_to  admin_doctors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.remove_image!
    @user.save
    @user.delete
    redirect_to  admin_doctors_path
  end

  private
    def new_doctor_params
      params.require(:user).permit( :username, :phone, :address, :image, :lab_id, :email)
    end

    def edit_user_params
      params.require(:user).permit( :username, :phone, :address, :role, :image, :lab_id, :email, :file)
    end

    def invalid_foreign_key
      redirect_to admin_doctors_path, {alert: t('doctors.errors.invalid_foreign_key')}
    end
end
