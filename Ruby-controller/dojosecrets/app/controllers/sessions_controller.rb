class SessionsController < ApplicationController
	layout "two_column"
  def new
  end
  def create
  	@user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  		if @user == nil
  			flash[:errors] = ["You need to register"]
  			redirect_to "/sessions/new"
  		else
	  		if @user.valid?
	  			session[:user_id] = @user.id
	  			redirect_to "/users/#{@user.id}"
	  		else
	  			flash[:errors] = @user.errors.full_messages
	  			redirect_to "/sessions/new"
	  		end
	  	end
  end
  def destroy
  	session[:user_id] = nil
  	redirect_to "/sessions/new"
  end
end
