class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestions.all
  end
end
