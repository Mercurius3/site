class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    name = params[:name].capitalize
    @category = Category.where(name: name).first
    @products = @category.products.order(:position)
  end
end