class Flight < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :flight_picture
  validates :title, presence: true,
  length: { minimum: 5 }
  validates :cost, numericality: { greater_than_or_equal_to: 0 },
  presence: true
  validates :duration, numericality: { greater_than: 0 },
  presence: true
  validates :capacity, numericality: { greater_than: 0 },
  presence: true
end
