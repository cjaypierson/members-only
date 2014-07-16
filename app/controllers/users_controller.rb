class UsersController < ApplicationController
	before_action :signed_in_user, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the clubhouse!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@user_posts = @user.posts.all
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
