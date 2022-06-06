class Therapist < ApplicationRecord
  has_many :therapist_therapy_types, dependent: :destroy
  has_many :therapy_types, through: :therapist_therapy_types, dependent: :destroy

  # include PgSearch::Therapist
  # pg_search_scope :search_by_address,
  #                 against: [ :address ],
  #                 using: {
  #                 tsearch: { prefix: true }
  # }
end
