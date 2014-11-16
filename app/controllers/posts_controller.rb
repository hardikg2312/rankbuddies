class PostsController < ApplicationController
  
  def index
  	@user = User.friendly.find_by_slug(params[:user_id])
  	@posts_by_user = @user.posts
  	@posts_on_user = Post.where('post_for = ? ', @user.id)
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to home_path
  end

  private
    def post_params
      params.require(:post).permit(:content, :photo_url)
    end
end
