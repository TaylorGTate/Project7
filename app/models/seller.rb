class Seller < ApplicationRecord
  has_one :account, as: :accountable
  has_many :products
end
