class Page < ActiveRecord::Base
  rails_admin do
  end

  scope :main_nav, -> { where(main_navigation: true)}
  mount_uploader :picture, PictureUploader
end
