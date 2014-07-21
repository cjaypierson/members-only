class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :edit, :udpate, :destroy]

	def index
		@posts = Post.paginate(page: params[:page], per_page: 9)
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			flash[:success] = "Post created!"
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash.notice = "Post Deleted"
		redirect_to current_user
	end

	private
		def post_params
			params.require(:post).permit(:title,:body,:user_id)
		end
end
