class Product < ActiveRecord::Base
  rails_admin do
    
  end
  mount_uploader :picture, PictureUploader
  
  belongs_to :category
  has_many :events
  belongs_to :teacher
  has_many :transactions
end
