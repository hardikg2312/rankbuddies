class LikingsController < ApplicationController
  def create
  	@liking = current_user.likings.find_or_initialize_by(:like_id => params[:like_id])
  	@liking.status = params[:status] 
	  if @liking.save
	    flash[:notice] = "Added friend."
	    redirect_to root_url
	  else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	  end
  end

  def destroy
  end
end
