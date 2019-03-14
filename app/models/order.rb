class Order < ApplicationRecord
  validates :name, :address, :email, :pay_type, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :pay_type, inclusion: pay_type.keys
  belongs_to :buyer, optional: true
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items 
	enum pay_type: {
		"Check"  => 0,
		"Credit card"  => 1,
		"Purchase order"  => 2
	}
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  paginates_per 10

	def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

	def total_price
  	line_items.to_a.sum { |item| item.total_price }
  end
end
