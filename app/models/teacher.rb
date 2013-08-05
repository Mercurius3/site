class Teacher < ActiveRecord::Base
  rails_admin do
  end
  has_many :products
end
