class HomeController < ApplicationController
  def index
    flash.now[:notice] = "You are currently @ 'home/index' route."

    if session[:user_id]
      # get the user data from Users-Table with find() & display details
      begin
        @logged_user = User.find(session[:user_id]) 
        flash.now[:notice] = "Siged-In as #{@logged_user.email}"  
      rescue 
      end
    end

  end
end
