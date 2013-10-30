class PagesController < ApplicationController
  def show
    @page = Page.find_by_permalink!(params[:id])
  end
  
  def download(page)
    @page = page
    send_file @page.picture.url,
      :filename => @page[:picture],
      :type => "application/pdf"
  end
end
