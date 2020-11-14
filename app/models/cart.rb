class Cart < ApplicationRecord
  belongs_to :order, inverse_of: :carts
  belongs_to :flight, inverse_of: :carts
end
