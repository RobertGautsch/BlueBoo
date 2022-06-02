class AnswersController < ApplicationController
  def show
    @answer = Answer.find(params[:id]) # ???
    @user = current_user
    @assessment = @user.assessments.last
    @suggestions = @answer.suggestions
  end

  # hand questions category in params
  # params include questions_category
  # also add link in result
end
