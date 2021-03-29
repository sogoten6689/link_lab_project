class Admin::FacultiesController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

end
