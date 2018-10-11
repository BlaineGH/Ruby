class OutputsController < ApplicationController
  def index
  	@text = "The current time & date:"
  	@date = Time.now.strftime("%b %d, %Y")
  	@time = Time.now.strftime("%I:%M %p")
  end
end
