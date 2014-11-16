class Liking < ActiveRecord::Base

	validates_uniqueness_of :user_id, :scope => :like_id
 
	before_save :update_counts

	belongs_to :user
	belongs_to :like, :class_name => "User"

	def update_counts
		user = User.friendly.find_by_id(self.like_id)
		if status == 'like'
			user.increment!(:likes) && user.increment!(:points, 20)
			user.decrement!(:dislikes) && user.increment!(:points, 10) if !new_record?
		else
			user.increment!(:dislikes) && user.decrement!(:points, 10)
			user.decrement!(:likes) && user.decrement!(:points, 20) if !new_record?
		end
	end

end
