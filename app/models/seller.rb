class Seller < ApplicationRecord
  has_one :account, as: :accountable
end
