class ExternalsController < ApplicationController
  def index
    @products = Thirdparty.where(active: true).order("position")
  end

  def show
    @product = Product.find(params[:id])
  end
end