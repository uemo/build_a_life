class TagsController < ApplicationController

  def index
  	@tags = Tag.all
  	@tag = Tag.new
  end

  def create
  	@tag = Tag.new(tag_params)
  	if @tag.save
      flash[:notice] = "タグを作成しました。"
      redirect_to tags_path
    else
      flash[:notice] = "タグの作成に失敗しました。入力内容を確認してください。"
      redirect_to tags_path
    end
  end

  private

  def tag_params
  	params.require(:tag).permit(:tag_name)
  end

end
