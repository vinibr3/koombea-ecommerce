class CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items
                              .includes(:product)
                              .where(removed_at: nil)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(removed_at: Date.current)
    flash.now[:alert] = @cart_item.errors.full_messages.join(', ') if @cart_item.errors.any?

    redirect_to cart_items_path
  end
end
