class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :assessment
  has_many :suggestions, dependent: :destroy
end
