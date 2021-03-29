class Admin::TestTypesController < ApplicationController
  include AdminHelper
  layout "admin"
  before_action :is_signed_in?

  def index
    @testTypes = TestType.all
  end

  def new
    @testType = TestType
  end

  def create
    testType = TestType.new
    testType.en_name = params[:en_name]
    testType.vi_name = params[:vi_name]
    testType.save
    redirect_to  admin_test_types_path
  end
end
