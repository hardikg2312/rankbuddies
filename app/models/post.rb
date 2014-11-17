class Post < ActiveRecord::Base
  validate :at_least_one_params

  belongs_to :user, :counter_cache => true
  mount_uploader :photo_url, ImageUploader

  def at_least_one_params
    if [self.content, self.photo_url].reject(&:blank?).size == 0
      errors[:base] << ("Please choose at least one name - any language will do.")
    end
  end   

end
