# frozen_string_literal: true

class OrdersController < EcommerceController
  def index
    @orders = current_user.orders
                          .includes(:payment_status, items: [:product])
                          .order('created_at DESC')
                          .page(params[:page])
                          .per(20)
  end

  def show
    @order = Order.find(params[:id])
  end
end
