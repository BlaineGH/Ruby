class OutputsController < ApplicationController
	def index
	end

	def result
		@text = "Thanks for submitting this form! You have submitted this form #{session[:count]} time(s) now."
		session[:count] += 1
		render "results"
	end

	def create
		@user = User.new(user_params)
		session[:results] = user_params
		session[:count] = 0
		redirect_to "/result"
	end
	private
		def user_params
			params.require(:user).permit(:name, :dojolocation, :favlanguage, :comment)
	end
end
