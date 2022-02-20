class Admin::LabManagement::MyLabsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @labs = Lab.all.order(:id)
    @breadcrumbs = [[t('labs.name'), admin_data_management_labs_url]]
  end

  def new
    @lab = Lab.new
    @breadcrumbs = [[t('labs.name'), admin_data_management_labs_url], [t('labs.new'), new_admin_data_management_lab_url]]
  end

  def create
    @lab = Lab.new(new_lab_params)
    if @lab.save
      redirect_to  admin_data_management_labs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lab = Lab.find(params[:id])
    @breadcrumbs = [[t('labs.name'), admin_data_management_labs_url], [t('labs.name'), edit_admin_data_management_lab_url(params[:id])]]
  end

  def edit
    @lab = Lab.find(params[:id])
    @users = User.all.order(:id)
    @breadcrumbs = [[t('labs.name'), admin_data_management_labs_url], [t('labs.edit'), edit_admin_data_management_lab_url(params[:id])]]
  end

  def update
    @lab = Lab.find(params[:id])
    if@lab.update(eidt_lab_params)
      redirect_to  admin_data_management_labs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lab = Lab.find(params[:id])
    @lab.remove_image!
    @lab.save
    @lab.delete
    redirect_to  admin_data_management_labs_path
  end

  private
    def new_lab_params
      params.require(:lab).permit( :name, :phone, :address, :image, :description)
    end


    def eidt_lab_params
      params.require(:lab).permit( :name, :phone, :address, :image, :description, :user_id)
    end

    def invalid_foreign_key
      redirect_to admin_data_management_labs_path, {alert: t('labs.errors.invalid_foreign_key')}
    end
end
