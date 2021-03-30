class AdminController < ApplicationController
  include AdminHelper

  layout "admin"
  before_action :is_signed_in?

  def index
  end
end
