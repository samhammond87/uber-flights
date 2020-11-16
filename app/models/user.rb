class User < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :cart_flights, through: :carts, source: :flights
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
