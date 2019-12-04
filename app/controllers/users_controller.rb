class UsersController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "you have successfully update your profile."
			redirect_to root_path
		else
			redirect_to edit_user_path(@user)
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end

