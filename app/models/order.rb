class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_status, foreign_key: :payment_status_code,
                              primary_key: :code

  has_many :items
end
