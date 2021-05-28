class ResultTestsController < ApplicationController
  layout "admin"

  def show
    @result_test = ResultTest.find(params[:id])
    @result_test_detail = LabTest.joins(:raw_test, :result_test).where(:id => @result_test['lab_test_id'])
                           .where('result_tests.id = ?', params[:id])
                           .select("result_tests.*, raw_tests.name").first()
    render :json => @result_test_detail
  end

  def edit
    @result_test = ResultTest.find(params[:id])
  end

  def update
    @result_test = ResultTest.find(params[:id])
    @result_test.update(result_params)
    redirect_to admin_user_test_path(@result_test['user_test_id'])
  end

  private
    def result_params
      params.require(:result_test).permit( :result, :note)
    end
end
