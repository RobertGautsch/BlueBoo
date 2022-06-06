class Therapist < ApplicationRecord
  has_many :therapist_therapy_types, dependent: :destroy
  has_many :therapy_types, through: :therapist_therapy_types, dependent: :destroy

  def index
    @therapists = Therapist.all
  end
end
