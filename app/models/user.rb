class User < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :cart_flights, through: :carts, source: :flights
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
