class Liking < ActiveRecord::Base

	validates_uniqueness_of :user_id, :scope => :like_id
 
	before_save :update_counts

	belongs_to :user
	belongs_to :like, :class_name => "User"

  POINTS = { :LIKE => 20,  :DISLIKE => 10}

	def update_counts
		user = User.friendly.find_by_id(self.like_id)
		if status == 'like'
			likes = user.likes + 1
			points = user.points + Liking::POINTS[:LIKE]
			if new_record?
				user.update_attributes!(:likes => likes, :points => points)
        #user.increment!(:likes) && user.increment!(:points, 20)
      else
      	dislikes = user.dislikes - 1
      	points = points + Liking::POINTS[:DISLIKE]
      	user.update_attributes!(:likes => likes, :dislikes => dislikes ,:points => points)
      	#user.decrement!(:dislikes) && user.increment!(:points, 10) if !new_record?
      end
    else
      dislikes = user.dislikes + 1
      points = user.points - Liking::POINTS[:DISLIKE]
      if new_record?
      	user.update_attributes!(:dislikes => dislikes, :points => points)
      	#user.increment!(:dislikes) && user.decrement!(:points, 10)
      else
        likes = user.likes - 1
        points = points - Liking::POINTS[:LIKE]
        user.update_attributes!(:likes => likes , :dislikes => dislikes, :points => points)
        #user.decrement!(:likes) && user.decrement!(:points, 20) if !new_record?
      end
		end
	end

end
