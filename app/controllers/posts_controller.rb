class PostsController < ApplicationController
  
  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_back_or_default('/')
  end

  private
    def post_params
      params.require(:post).permit(:content, :photo_url, :post_for)
    end
end
