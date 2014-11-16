class Post < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  mount_uploader :photo_url, ImageUploader
end
