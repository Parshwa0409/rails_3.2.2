class RegistrationController < ApplicationController
  def index
    flash.now[:notice] = "This is the Sign Up Index (generated) page @ '/sign_up/index'."
  end

  
  # when we use any instance variable inside the controller class, the same instance variable is available to the corresponding view. So we can access the variable & display the instace variable & details if necessary
  # so def new(), this user varible wont be available in the "registrations/index", rather be available at "registrations/new"
  def new
    flash.now[:notice] = "This is the Sign Up page @ '/sign_up/new' aliased as '/sign_up'. This page is present to register new users."
    
    # You're getting the NilClass error because @user has no value (it's nil) when you first load the form on the new action.When you do the render :new in your create action there is no problem because it's using the @user you've defined at the top of create.

    # without @user in new(), params = Parameters: {"authenticity_token"=>"[FILTERED]", "email"=>"sunnysrn15@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]", "commit"=>"Sign Up"}

    # with
    @user=User.new()
    # params = params: {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"parshwapatil9@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up", "controller"=>"registration", "action"=>"create"} } ?? WHY
  end

  # now post-sign_up lads to the "regestrations/create", therefore the "create()" will get all the form element and we can access the data inside the form
  def create
    flash[:notice] = "You have submitted form & you have been redirected to 'registrations/create' route."
    
    # User.new(params[:user]) # will create a user but then this is not secure

    # therefore create a new private funtion which would return the user_params easily & securely


    @user = User.new(user_params())

    # we can do check now if everything was saved successfully then "redirect_to" the root page.
    # else, render the page where they create the new user i.e sign-up page.

    if @user.save # check if the entered data was successfully added to the database
      # Sign-Up successul, so sign-in the user now 
        # we can use cookies but its not protected , therefore we can use session-cookies same as cookied but the data stored is encrypted
      
      session[:user_id] = @user.id 
      # this is accessible through out the app now, so when we are redirected to root_path=home#index, we can see if some session{:user_id} is set then user has signed-in else no one has signed-in

      redirect_to root_path
    else
      flash.now[:alert] = "Sign Up was not successfull, please try again."
      flash.delete(:notice)
      render :new
    end

  end


  private

  def user_params
    # rails - 6
    # params.require(:user).permit(:email, :password, :password_confirmation) #===# params[:user] but "requires()" raise an error if user not found.

    # rails - 7
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end
