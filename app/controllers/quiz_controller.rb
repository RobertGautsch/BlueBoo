class QuizController < ApplicationController
  def start
    @question = Question.first
  end

  def result
    @goods = current_user.answers.where(answer_type: "good")
    @bads = current_user.answers.where(answer_type: "bad")
    @neutrals = current_user.answers.where(answer_type: "neutral")
    # User.first.answers.where(answer_type: "bad").last.question.category
  end
end
