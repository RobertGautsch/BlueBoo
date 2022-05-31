class QuestionsController < ApplicationController
  def show
    @question = Questions.find(params[:id])
  end
end
