class ArticlesController < ApplicationController
	before_action :authenticate_user!

    def new
        @article = Article.new
        @team = Team.find(params[:team_id])
    end

	def edit
		@article = Article.find(params[:id])
		@team = Team.find(params[:team_id])
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "記事を投稿しました。"
            redirect_to team_article_path(@article)
		else
			flash[:danger] = "記事の投稿に失敗しました。項目を記載してください。"
            redirect_to "/teams/home/#{@team.id}"
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "記事を編集しました。"
            redeirect_to team_article_path(@article)
        else
            flash[:danger] = "記事の更新に失敗しました。もう一度記載内容を確認してください。"
            render :edit
        end
    end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "投稿を削除しました。"
	end

	private
	def article_params
		params.require(:article).permit(:user_id,
			                            :team_id,
			                            :article_title,
			                            :article_body)
	end
end
