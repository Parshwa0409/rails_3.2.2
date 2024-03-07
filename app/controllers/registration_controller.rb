class RegistrationController < ApplicationController
  def index
    flash.now[:notice] = "This is the Sign Up Index (generated) page @ '/sign_up/index'."
  end

  # when we use any instance variable inside the controller class, the same instance variable is available to the corresponding view. So we can access the variable & display the instace variable & details if necessary
  # so def new(), this user varible wont be available in the "registrations/index", rather be available at "registrations/new"
  def new
    flash.now[:notice] = "This is the Sign Up page @ '/sign_up/new' or '/sign_up'. This page is present to register new users."

    @user = User.new()
  end

end
