class QuizController < ApplicationController
  def start
    @question = Question.first
  end
end
