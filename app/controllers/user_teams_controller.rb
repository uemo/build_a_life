class UserTeamsController < ApplicationController
    before_action :authenticate_user!

	def create
		@user_team = UserTeam.new(user_team_params)
		 if @user_team.save
            flash[:notice] = "チームに参加しました。"
            redirect_to teams_path
         else
            flash[:danger] = "チームに参加できませんでした。"
            redirect_to teams_path
         end
    end

    def destroy
        @user_team = UserTeam.find(params[:id])
        @user_team.destroy
        flash[:notice] = "チームから脱退しました。。"
        redirect_to teams_path
    end

    private

    def user_team_params
    	params.require(:user_team).permit(:user_id, :team_id)
    end

end