class Order < ApplicationRecord
  before_validation :set_total!
  belongs_to :user
  has_many :carts
  has_many :flights
  # , through: :carts

  # validates :total, presence: true, 
  # numericality: { greater_than_or_equal_to: 0 }

  validates :user_id, presence: true

  # def set_total!
  #   self.total = flights.map(&:cost).sum
  # end
end
