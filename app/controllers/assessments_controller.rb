class AssessmentsController < ApplicationController
  def show
    @assessment = Assessments.find(params[:id])
  end
end
