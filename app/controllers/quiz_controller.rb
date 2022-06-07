class QuizController < ApplicationController
  skip_before_action :authenticate_user!, only: :start
  def start
    @question = Question.first
    Assessment.create(user: current_user)
  end

  def result
    @goods = current_user.assessments.last.answers.where(answer_type: "good")
    @bads = current_user.assessments.last.answers.where(answer_type: "bad")
    @neutrals = current_user.assessments.last.answers.where(answer_type: "neutral")
    # User.first.answers.where(answer_type: "bad").last.question.category
  end

  def dashboard
    @goods = current_user.assessments.last.answers.where(answer_type: "good")
    @bads = current_user.assessments.last.answers.where(answer_type: "bad")
    @neutrals = current_user.assessments.last.answers.where(answer_type: "neutral")
  end
end
