class Flight < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :flight_picture
  validates :title, presence: true,
  length: { minimum: 5 }
end
