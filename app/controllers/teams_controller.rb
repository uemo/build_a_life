class TeamsController < ApplicationController

  def new
  	@team = Team.new
  	@tags = Tag.all
    @team.tags.build
    @team.user_teams.build
  end

  def create
  	@team = Team.new(team_params)
    # @team.user_id = current_user.id
    if @team.save
      flash[:notice] = "チームを作成しました。"
      redirect_to team_path(@team)
    else
      flash[:notice] = "チームの作成に失敗しました。もう一度内容を確認してください。"
      redirect_to new_team_path
    end
  end

  def show
    @team = Team.find(params[:id])
    @user_team = UserTeam.where(team_id: @team.id)
  end

  def index
    @teams = Team.all
  end

  private

  def team_params
  	params.require(:team).permit(:team_image,
  	                             :team_name,
  	                             :team_body,
  	                              tags_attributes: [:id, :team_id, :tag_name, :_destroy],
                                  user_teams_attributes: [:id, :user_id, :team_id])
  end

end
