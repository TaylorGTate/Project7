class Buyer < ApplicationRecord
	has_one :account, as: :accountable
  has_many :orders

end
