class AuthenticationsController < ApplicationController
	def index
	  @authentications = current_user.authentications if current_user
	end

	def create
	  omniauth = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	  if authentication
	  	session[:user_id] = authentication.user_id
	    redirect_to users_path
	  else
	  	if user = User.add_auth_user(omniauth)
	  	   session[:user_id] = user.id
	  	   redirect_to users_path
	  	else
	  	   redirect_to root_path, :flash => { :success => "Authentication Faild!" } 
	  	end
	  end
	end

	def destroy
	  @authentication = current_user.authentications.find(params[:id])
	  @authentication.destroy
	  flash[:notice] = "Successfully destroyed authentication."
	  redirect_to authentications_url
	end
end
