# Controller to manage all the operations on Users
class UsersController < ApplicationController
	# common method that sets the user
    before_action :set_user
    # constantine the user to log in before doing any action on this controller
    before_action :authenticate_user!

    # showes the user set before this action
    def show
    end

    private
    # method that sets the user before any avtion
    def set_user
    	@user = User.find(params[:id])
    end

    # method that acepts only expected parameters
    def user_params
    	params.require(:user).permit(:id)
    end
end