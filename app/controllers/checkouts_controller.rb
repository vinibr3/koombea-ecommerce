# frozen_string_literal: true

class CheckoutsController < EcommerceController
  def new
    @cart_items = cart_items
  end

  def create
    @order = CheckoutService.run(user: current_user,
                                 cart_items: cart_items)

    if @order.persisted?
      flash[:notice] = t('.success')
      redirect_to products_path
    else
      flash[:alert] = @order.errors.full_messages.join(', ')
      redirect_to new_checkout_path
    end
  end

  def cart_items
    current_user.cart_items
                .includes(:product)
                .where(removed_at: nil)
  end
end
