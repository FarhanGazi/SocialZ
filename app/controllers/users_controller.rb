class UsersController < ApplicationController
	before_action :set_post
	before_action :authenticate_user!

	def show
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
    	@user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
    	params.require(:user).permit(:id)
    end
end
