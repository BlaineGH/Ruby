class UsersController < ApplicationController
	layout "two_column"
  def new
  end

  def show
  	@user = User.find(current_user)
  end

  def edit
  	@user = User.find(current_user)
  end

  def create
  	@user = User.create(user_params)
  		if @user.valid?
  			session[:user_id] = @user.id
  			redirect_to "/users/#{@user.id}"
  		else
  			flash[:errors] = @user.errors.full_messages
  			redirect_to "/users/new"
  		end
  end
  def redirect
  	redirect_to "/sessions/new"
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
