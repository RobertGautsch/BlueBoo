class UserActivity < ApplicationRecord
  belongs_to :activities
  belongs_to :users
end
