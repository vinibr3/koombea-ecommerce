# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cart_items
  has_many :orders

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: URI::MailTo::EMAIL_REGEXP,
                    length: { maximum: 255 }
  validates :password, length: { minimum: 6, maximum: 15 }

  before_save :changes_email_to_downcase

  private

  def changes_email_to_downcase
    self.email = self.email.to_s.downcase
  end
end
