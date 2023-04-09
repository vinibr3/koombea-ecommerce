class PaymentStatus < ApplicationRecord
  has_many :orders, primary_key: :code,
                    foreign_key: :payment_status_code

  validates :alias, presence: true,
                    uniqueness: { case_sensitive: true }
  validates :code, presence: true,
                   uniqueness: true

  def self.paid
    find_by_code(10)
  end
end
