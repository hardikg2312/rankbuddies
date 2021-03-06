class UsersController < ApplicationController

  before_filter :login_required, :except => [:new, :create] 
  after_filter :store_location, :only => [:show]

  def index
    @bg_color = User::COLOR_CODES_BG[:DEFUALT]
    @posts = current_user.posts.order('id desc')
  end

  def show
    @user = User.friendly.find_by_slug(params[:id])
    @liking = current_user.has_liking_relation(@user)
    @liking_status = @liking.first && @liking.first.status
    @color = current_user.get_text_color
    @liking_status == 'like' ?  @color = User::COLOR_CODES[:LIKE] : @color = User::COLOR_CODES[:DISLIKE] if @liking_status
    @bg_color = User::COLOR_CODES_BG[:DEFUALT]
    @liking_status == 'like' ?  @bg_color = User::COLOR_CODES_BG[:LIKE] : @bg_color = User::COLOR_CODES_BG[:DISLIKE] if @liking_status
    @posts_by_user = @user.posts
    @posts_on_user = Post.where('post_for = ? ', @user.id)
  end

  def new
    if current_user
      redirect_to home_path
    else
      @user = User.new
      render :layout => false
    end
  end

  def create # will render create.js.erb
    @user = User.new(user_params)
    @user.provider_email = params[:user][:email]
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
    end
end
