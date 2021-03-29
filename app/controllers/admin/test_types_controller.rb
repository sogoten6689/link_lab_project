class Admin::TestTypesController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?


  def index

  end

  def new
  end

  def create
  end
end
