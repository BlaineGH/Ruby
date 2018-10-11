class UsersController < ApplicationController
	layout "two_column"
	def index
		@users = User.all
		render "userindex"
	end

	def create
		@user = User.create(user_params)
		if @user.valid?
			redirect_to "/"
		else
			flash[:error] = @user.errors.full_messages
			redirect_to "/"
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :language)
		end
end
