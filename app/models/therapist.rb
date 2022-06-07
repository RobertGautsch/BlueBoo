class Therapist < ApplicationRecord
  has_many :therapist_therapy_types, dependent: :destroy
  has_many :therapy_types, through: :therapist_therapy_types, dependent: :destroy
  # include PgSearch::Model
  # pg_search_scope :search_by_address,
  #                 against: [ :address ],
  #                 using: {
  #                 tsearch: { prefix: true }
  # }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
