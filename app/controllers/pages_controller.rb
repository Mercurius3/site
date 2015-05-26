class PagesController < ApplicationController
  before_action :permalink

  def show

  end
  
  def category
#    @category = Category.current_category(params[:id]).first
		@category = Category.find_by_name(params[:id])
		@products = @category.own_products.sorted
#		@products = @category.own_products.sorted
  end

  def overzicht
    @products = Product.own_products.sorted
  end
  
  def inopdracht
    @products = Product.third_party.sorted
  end

  def download(page)
    send_file @page.picture.url,
      :filename => @page[:picture],
      :type => "application/pdf"
  end
  
  private
  def permalink
#    @page = Page.find_by_permalink!(params[:id])
		@page = Page.friendly.find(params[:id])
  end
    
end
