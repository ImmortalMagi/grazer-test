class Preference < ApplicationRecord
  belongs_to :user
  validates :user, :looking_for_diet_type, :ages, :distance, :gender, presence: true
  validates :distance, numericality: true
end
