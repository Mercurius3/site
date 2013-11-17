class Product < ActiveRecord::Base
  rails_admin do
    
  end
  validates :name, presence: true
  # validates :description, presence: true #change test if description becomes manditory
  # validates :price, presence: true #change test if price becomes manditory
  # validates :startdate, presence: true #change test if startdate becomes manditory
  mount_uploader :picture, PictureUploader
  
  belongs_to :category
  has_many :events
  belongs_to :teacher
  has_many :transactions
  belongs_to :location
end
