class Product < ApplicationRecord
  mount_uploader :image_url, PictureUploader
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true 
end
