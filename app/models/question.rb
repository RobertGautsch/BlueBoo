class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  def next
    Question.where("id > ?", id).order(id: :asc).limit(1).first
  end

  def back
    Question.where("id < ?", id).order(id: :desc).limit(1).first
  end
end
