# frozen_string_literal: true

class CheckoutService < ApplicationService
  def run
    ActiveRecord::Base.transaction do
      order = create_order
      remove_items_from_cart
      order
    end
  end

  private

  attr_accessor :user, :cart_items

  def initialize(args)
    @user = args[:user]
    @cart_items = args[:cart_items]
  end

  def create_order
    items = cart_items.map { |i| Item.new(product: i.product,
                                           price: i.product.price,
                                           quantity: 1) }

    user.orders.create!(payment_status: PaymentStatus.paid,
                       total: items.sum{|i| i.product.price },
                       items: items)
  end

  def remove_items_from_cart
    cart_items.update_all(removed_at: Time.current)
  end
end
