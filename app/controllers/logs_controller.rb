class LogsController < ApplicationController
  before_action :authenticate_user!

  def index
  	 @notes = Note.where(user_id: params[:user_id])
  	 @user = User.find(params[:user_id])

  	 @team_member = UserTeam.where(user_id: current_user.id)
     @team_members = []
     @team_member.each do |member|
     my_team = member.team_id
     @user_teams = UserTeam.where(team_id: my_team)

       @user_teams.each do |user_team|
          if @team_members.include?(user_team.user)
          else @team_members.push(user_team.user)
          end
       end
     end
  end

  def create
  end

end
