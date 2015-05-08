class Product < ActiveRecord::Base
  rails_admin do
#		configure :description do
#//			html_attributes rows: 20, cols: 50
#//		end		
  end
  scope :third_party, -> { where(third_party: true, active: true) }
  scope :own_products, -> { where(third_party: false, active: true) }
  scope :sorted, -> { order(:position) }
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :startdate, presence: true
  mount_uploader :picture, PictureUploader
  
  belongs_to :category
  has_many :events
  belongs_to :teacher
  has_many :transactions
  belongs_to :location
end
