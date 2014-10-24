class SessionsController < ApplicationController
  def new
  end

  def create  # will render create.js.erb
    @user = User.authenticate(params[:email], params[:password])
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :flash => { :success => "Logged out!" } 
  end
end
