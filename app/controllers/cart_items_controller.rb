class CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items
                              .includes(:product)
                              .where(removed_at: nil)
  end

  def create
    @cart_item = CartItem.new(valid_params)

    if @cart_item.save
      flash[:notice] = t('.success')
    else
      flash.now[:alert] = @cart_item.errors.full_messages.join(', ')
    end

    redirect_to products_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(removed_at: Date.current)
      flash[:notice] = t('.success')
    else
      flash.now[:alert] = @cart_item.errors.full_messages.join(', ')
    end

    redirect_to cart_items_path
  end

  private

  def valid_params
    params.require(:cart_item).permit(:product_id).merge(user: current_user)
  end
end
