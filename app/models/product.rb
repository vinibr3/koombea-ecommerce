class Product < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true,
                    length: { maximum: 255 }
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
end
