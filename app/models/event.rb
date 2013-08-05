class Event < ActiveRecord::Base
  rails_admin do
    
  end
  belongs_to :product
end
