module AuthenticatedSystem
  protected


	  # Returns true or false if the user is logged in.
	  # Preloads @current_user with the user model if they're logged in.
	  def logged_in?
	    !!current_user
	  end

    # Check if the user is authorized
    #
    # Override this method in your controllers if you want to restrict access
    # to only a few actions or if you want to check if the user
    # has the correct rights.
    #
    # Example:
    #
    #  # only allow nonbobs
    #  def authorized?
    #    current_user.login != "bob"
    #  end
    #
    def authorized?(action = action_name, resource = nil)
      logged_in?
    end

	  # Filter method to enforce a login requirement.
	  #
	  # To require logins for all actions, use this in your controllers:
	  #
	  #   before_filter :login_required
	  #
	  # To require logins for specific actions, use this in your controllers:
	  #
	  #   before_filter :login_required, :only => [ :edit, :update ]
	  #
	  # To skip this in a subclassed controller:
	  #
	  #   skip_before_filter :login_required
	  #
	  def login_required
	    authorized?
	  end

	  # Store the URI of the current request in the session.
    #
    # We can return to this location by calling #redirect_back_or_default.
    def store_location
      session[:return_to] = request.url unless request[:preview]
    end

    # Redirect to the URI stored by the most recent store_location call or
    # to the passed default.  Set an appropriately modified
    #   after_filter :store_location, :only => [:index, :new, :show, :edit]
    # for any controller you want to be bounce-backable.
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end


end