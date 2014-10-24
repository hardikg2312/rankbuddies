class UsersController < ApplicationController
  def index 
  end

  def new
    if current_user
      redirect_to users_path
    else
      @user = User.new
      render :layout => false
    end
  end

  def create # will render create.js.erb
    @user = User.new(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
    end
end
