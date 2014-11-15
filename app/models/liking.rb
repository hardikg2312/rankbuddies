class Liking < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :like, :class_name => "User"

end
