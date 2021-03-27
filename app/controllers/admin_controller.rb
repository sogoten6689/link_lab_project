class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :is_signed_in?

  def is_signed_in?
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      redirect_to admin_path
    end

  end

  def index
  end

end
