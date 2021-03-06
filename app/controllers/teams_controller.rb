class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:home]

  def new
    @team = Team.new
    @tags = Tag.all
    @team.tags.build
    @team.user_teams.build
  end

  def create
  	@team = Team.new(team_params)
    if @team.save
      flash[:notice] = "チームを作成しました。"
      redirect_to team_path(@team)
    else
      flash[:danger] = "チームの作成に失敗しました。もう一度内容を確認してください。"
      redirect_to new_team_path
    end
  end

  def edit
    @team = Team.find(params[:id])
    @tag = Tag.where(team_id: params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
       flash[:notice] = "チーム情報を更新しました。"
       redirect_to team_path(@team)
    else
      flash[:danger] = "チーム情報の更新に失敗しました。もう一度登録内容を確認してください。"
      render :edit
    end
  end

  def show
    @team = Team.find(params[:id])
    @user_team = UserTeam.new
    @user_teams = UserTeam.where(team_id: params[:id])
    @tags = Tag.where(team_id: params[:id])
    @set_member = UserTeam.where(team_id: params[:id]).where(user_id: current_user.id)
  end

  def home
    @team = Team.find(params[:id])
    @user_teams = UserTeam.where(team_id: params[:id])
    @tags = Tag.where(team_id: params[:id])
    @articles = @team.articles.page(params[:page]).per(5).reverse_order
    @article = Article.new
  end

  def index
    @user_team = UserTeam.where(user_id: current_user.id)
    @teams = Team.all
    @tags = Tag.all
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    flash[:notice] = "チームを削除しました。"
    redirect_to teams_path
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
