class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update]
   before_action :correct_user,   only: [:edit, :update]

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  def new
  	@user = User.new
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
    	log_in @user
    	flash[:success] = "Welcome to the Twitter App!"
    	redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
 
     def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user?(@user)
    end
end
