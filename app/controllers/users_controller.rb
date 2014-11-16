class UsersController < ApplicationController

  before_filter :login_required, :except => [:new, :create] 

  def index
    @posts = current_user.posts.order('id desc')
  end

  def show
    @user = User.friendly.find(params[:id])
    @liking = current_user.has_liking_relation(@user)
    @liking_status = @liking.first && @liking.first.status
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
