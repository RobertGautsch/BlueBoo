class Activity < ApplicationRecord
  has_many :user_activities, dependent: :destroy
end
