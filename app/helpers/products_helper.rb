module ProductsHelper
  def price
    content_tag :li, number_to_currency(@product.price), class: "price"
  end
  
  def teacher
    content_tag(:li, @product.teacher.name, class: "bullet-item")
  end
  
  def date
    if @product.events.first
      show_date = @product.events.first.eventdate
    else
      show_date = "datum nog niet bekend"
    end
    content_tag(:li, show_date, class: "bullet-item")
  end
  
  def button
    content_tag :li, class: "cta-button" do
      link_to 'Aanmelden', new_transaction_path(product_id: @product.id), class: "button"
    end
  end
end
