class JoinsController < ApplicationController
	def index
	end
	def new
		@groups = Group.all
	end

	def create
		gu = GroupUser.new
		gu.user_id = current_user.id
		gu.group_id = params[:group_id]
		gu.save!
		redirect_to joins_path
	end
	def destroy
		gu = GroupUser.find_by(user_id: current_user.id, group_id: params[:id])
		gu.destroy
		redirect_to joins_path
	end
end
