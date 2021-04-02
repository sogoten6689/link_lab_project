class Admin::DoctorsController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @doctors = Doctor.all.order(:id)
    @breadcrumbs = [[t('doctors.name'), admin_doctors_url]]
  end

  def new
    @doctor = Doctor.new
    @breadcrumbs = [[t('doctors.name'), admin_doctors_url], [t('doctors.new'), new_admin_doctor_url]]
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to  admin_doctors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
    @breadcrumbs = [[t('doctors.name'), admin_doctors_url], [t('doctors.edit'), edit_admin_doctor_url(params[:id])]]
  end

  def update
    @doctor = Doctor.find(params[:id])
    if@doctor.update(doctor_params)
      redirect_to  admin_doctors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.delete
    redirect_to  admin_doctors_path
  end

  private
    def doctor_params
      params.require(:doctor).permit(:en_name, :vi_name)
    end

    def invalid_foreign_key
      redirect_to admin_doctors_path, {alert: t('doctors.errors.invalid_foreign_key')}
    end
end
