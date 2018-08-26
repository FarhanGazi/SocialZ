class UsersController < ApplicationController
	before_action :set_post
	before_action :authenticate_user!

	def show
	end

	private
    def set_post
    	@user = User.find(params[:id])
    end

    def post_params
    	params.require(:user).permit(:id)
    end
end
