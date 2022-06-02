class AnswersController < ApplicationController
  def show
    @answer = Answer.find(params[:id]) # ???
    @user = current_user
    @assessment = @user.assessments.last
    @suggestions = @answer.suggestions
    # answers = curent_user.assements.last.anwsers

  end

  # somehow transform content to answer_type??

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

  # private

  # def answer_params
  #   params.require(:answer).permit(:question_id, :content, :answer_type, :asessment_id)
  # end

  # hand questions category in params
  # params include questions_category
  # also add link in result
end
