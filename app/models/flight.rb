class Flight < ApplicationRecord
  # before_destroy :not_referenced_by_any_cart
  belongs_to :user

  has_many :carts
  # has_many :orders, through: :carts

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
  
  validates :title, :user_id, presence: true


  private

  # def not_referenced_by_any_cart
  #   unless cart.empty?
  #     errors.add(:base, "Cart present")
  #     throw :abort
  #   end
  # end

end
