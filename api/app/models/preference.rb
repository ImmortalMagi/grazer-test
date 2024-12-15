class Preference < ApplicationRecord
  belongs_to :user
  validates :user, :looking_for_diet_type, :lower_age, :upper_age, :distance, :gender, presence: true
  validates :lower_age, :upper_age, :distance, numericality: true
end
