class Therapist < ApplicationRecord
  has_many :therapist_therapy_types, dependent: :destroy
  has_many :therapy_types, through: :therapist_therapy_types, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
