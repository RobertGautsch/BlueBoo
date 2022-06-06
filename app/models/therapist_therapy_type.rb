class TherapistTherapyType < ApplicationRecord
  belongs_to :therapist
  belongs_to :therapy_type
end
