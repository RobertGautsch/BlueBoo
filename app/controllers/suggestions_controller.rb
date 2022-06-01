class SuggestionsController < ApplicationController
  def index
    @user = current_user
    @assessments = @user.assessments
    @answers = @assessments.answers
    @suggestions = @answers.suggestions
    # @suggestions = Suggestion.where(answer.assessment.user_id: current_user.id)
    puts "#{@suggestions}"
  end
end
