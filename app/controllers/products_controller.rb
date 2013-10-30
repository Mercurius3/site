class ProductsController < ApplicationController
  def index
    @products = Product.where(active: true, third_party: false).order("position")
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def inopdracht
    @products = Product.where(third_party: true)
  end
end
