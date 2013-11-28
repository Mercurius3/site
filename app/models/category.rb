class Category < ActiveRecord::Base
  rails_admin do
  end
  has_many :products
  delegate :own_products, to: :products
  
  def self.current_category(name)
    where(name: name.capitalize)
  end
end
