class Admin::UserTestsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @users = User.all.order(:id)
    @breadcrumbs = [[t('users.name'), admin_users_url]]
  end

  def new
    @user = User.new
    @breadcrumbs = [[t('users.name'), admin_users_url], [t('users.new'), new_admin_user_url]]
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      redirect_to  admin_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
    @labs = Lab.all.order(:id)
    @users = User.all.order(:id)
    @breadcrumbs = [[t('users.name'), admin_users_url], [t('users.edit'), edit_admin_user_url(params[:id])]]
  end

  def update
    @user = User.find(params[:id])
    if@user.update(eidt_user_params)
      redirect_to  admin_users_path
    else
      @labs = Lab.all.order(:id)
      @users = User.all.order(:id)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.remove_image!
    @user.save
    @user.delete
    redirect_to  admin_users_path
  end

  private
    def new_user_params
      params.require(:user).permit( :username, :phone, :address, :image, :role, :lab_id, :email)
    end


    def eidt_user_params
      params.require(:user).permit( :username, :phone, :address, :image, :role, :lab_id, :email, :remove_image, :file)
    end

    def invalid_foreign_key
      redirect_to admin_users_path, {alert: t('users.errors.invalid_foreign_key')}
    end
end
