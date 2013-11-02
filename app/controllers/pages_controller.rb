class PagesController < ApplicationController
  def show
    @page = Page.find_by_permalink!(params[:id])
  end
  
  def category
    @page = Page.find_by_permalink!(params[:id])
    name = params[:id].capitalize
    @category = Category.where(name: name).first
    @products = @category.products.where(third_party: false, active: true).order(:position)
  end

  def overzicht
    @page = Page.find_by_permalink!(params[:id])
    @products = Product.where(third_party: false, active: true).order(:position)
  end
  
  def inopdracht
    @page = Page.find_by_permalink!(params[:id])
    @products = Product.where(third_party: true, active: true).order(:position)
  end
  
  def download(page)
    send_file @page.picture.url,
      :filename => @page[:picture],
      :type => "application/pdf"
  end
end
