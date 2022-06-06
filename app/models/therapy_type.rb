class TherapyType < ApplicationRecord
  has_many :therapist_therapy_types, dependent: :destroy
  has_many :therapists, dependent: :destroy
end
