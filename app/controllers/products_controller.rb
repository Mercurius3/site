class ProductsController < ApplicationController
  def index
    @products = Product.where(active: true, third_party: false).order("position")
  end

  def show
    @product = Product.find(params[:id])
  end
end
