class PostsController < ApplicationController
	layout "three_column"
	def index
		@users = User.all
		@posts = Post.all
		render "postindex"
	end
	def create
		@post = Post.create(post_params)
		if @posts.valid?
			redirect_to "/posts"
		else
			flash[:error] = @post.errors.full_messages
			redirect_to "/posts"
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :user_id)
		end
end
