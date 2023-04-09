class Product < ApplicationRecord
  searchkick
  
  has_many_attached :images

  has_many :cart_items

  validates :title, presence: true,
                    length: { maximum: 255 }
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
end
