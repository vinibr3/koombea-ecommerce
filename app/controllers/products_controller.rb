# frozen_string_literal: true

class ProductsController < EcommerceController
  def index
    @products = params[:term] ? Product.search(params[:term], page: params[:page], per_page: 20) : Product.page(params[:page])
  end
end
