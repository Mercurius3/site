class Page < ActiveRecord::Base
  rails_admin do
    
  end
  mount_uploader :picture, PictureUploader
end
