class Page < ActiveRecord::Base

	extend FriendlyId
	friendly_id :permalink

  rails_admin do
  end

  validates :name, presence: true
  validates :content, presence: true
  validates :permalink, presence: true
  
  scope :main_nav, -> { where(main_navigation: true)}
  mount_uploader :picture, PictureUploader
end
