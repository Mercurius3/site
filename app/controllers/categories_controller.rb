class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    name = params[:name].capitalize
    @category = Category.where(name: name).first
    @products = @category.products.where(active: true, third_party: false).order(:position)
  end
end