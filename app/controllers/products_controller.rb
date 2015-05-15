class ProductsController < ApplicationController
  def index
    @products = Product.where(active: true, third_party: false).order("position")
  end

  def show
    @product = Product.friendly.find(params[:id])
  end
end
