class Buyer < ApplicationRecord
	has_one :account, as: :accountable

end
