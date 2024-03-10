class SignInController < ApplicationController
  
  def index
    flash.now[:notice] = "This is the Sign In page @ '/sign_in/index'\nYou can log-in iff you are an exisitng user & authenticate yourself successfully."
    # why is this needed initially
    @user = User.new()
  end

  def check
    begin
      @user = User.find_by(email:user_params[:email])
      puts
      p("CHECK_FIND_BY: #{@user.inspect}")
      puts

      raise "User missing!" if @user.nil?

      # VERIFY USER EXISTANCE
      # VERIFY PASSWORD
      if@user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:alert]="INVALID PASSWORD ENTERED, PLEASE TRY AGAIN"
        puts
        p(flash[:alert])
        puts
        flash.delete(:notice)
        # i am rendering index so @user must have new instance everytime
        render :index
      end

      #  on second attempt with wrong password: No route matches [PATCH] "/sign_in", doesnt do post again & if we do correctly we get that error

    rescue 
      puts
      p("RESCUE BLOCK CALLED: USER NOT FOUND")
      puts
      flash.now[:alert]="USER 404"
      flash.delete(:notice)
      render :index
    end
    
  end

  private
  def user_params
    # debug
    p(params)
    # once with :user when user not found or user == nil, if the @user == User.class then params has {:user}
    if params[:user]
      params.require(:user).permit(:email, :password)
    else
      params.permit(:email, :password) 
    end




  end
end
