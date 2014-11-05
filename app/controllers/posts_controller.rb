class PostsController < ApplicationController

  def new
    @post = Post.new
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
