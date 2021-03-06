class SessionsController < ApplicationController
  def new
  end
  #login user
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    		log_in user
    		remember user
      redirect_to user
    else
    	flash[:danger] = 'Invalid email/password combination' 
    render 'new'
  	end
	end
  #logout user
  def destroy
  	 log_out if logged_in?
    redirect_to root_url
  end
end
