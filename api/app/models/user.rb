class User < ApplicationRecord
  validates :name, :gender, :locationX, :locationY, :diet_type, :age, presence: true
  validates :age, numericality: { only_integer: true }
  validates :locationX, :locationY, numericality: true

  has_many :preferences
end
