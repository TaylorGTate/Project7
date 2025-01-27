#---
# Excerpted from "Agile Web Development with Rails 5.1",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails51 for more book information.
#---
class Product < ApplicationRecord

  mount_uploader :image_url, PictureUploader
  belongs_to :seller
  has_many :line_items
  has_many :orders, through: :line_items   
  before_destroy :ensure_not_referenced_by_any_line_item

  #...

  validates :title, :description, :image_url, presence: true
# 
  validates :title, uniqueness: true
  validates :title, length: {minimum: 4}
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }


  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
