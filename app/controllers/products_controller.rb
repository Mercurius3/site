class ProductsController < ApplicationController
  def index
    @products = Product.where(active: true).order("position")
  end

  def show
    @product = Product.find(params[:id])
  end
end
