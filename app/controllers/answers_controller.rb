class AnswersController < ApplicationController
  def show
    @answer = Answer.find(params[:id]) # ???
    # @user = current_user
    # @assessment = @user.assessments.last
    # answers = curent_user.assements.last.anwsers
    # answers.each do |aw|
    @all_suggestions = Suggestion.where(question: @answer.question).where(answer_type: @answer.answer_type)
    @suggestions = @all_suggestions.select { |suggestion| suggestion.question.category == params[:category] }
  end

  def create
    @user = current_user
    @assessment = @user.assessments.last
    @question = Question.find(params[:question])

    @answer = Answer.new
    @answer.assessment = @assessment
    @answer.question = @question
    @answer.content = params[:content]
    @answer.answer_type = params[:type]
    @next_question = @question.next

    if @answer.save
      if @next_question != nil
        redirect_to question_path(@next_question)
      else
        redirect_to result_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
end
