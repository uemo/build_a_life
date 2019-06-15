class NotesController < ApplicationController

  def new
  	@note = Note.new
  end

  def create
  	note = Note.new(note_params)
  	note.user_id = current_user.id
  	if note.save
      # ユーザーへワークに設定した各ステータス値を加算する
       user = User.find(current_user.id)
       value_k = user.kind.to_i + note.work.status_k.to_i
       value_g = user.glamor.to_i + note.work.status_g.to_i
       value_m = user.mental.to_i + note.work.status_m.to_i
       value_c = user.coop.to_i + note.work.status_c.to_i
       value_s = user.social.to_i + note.work.status_s.to_i
       value_e = user.user_exp.to_i + note.work.exp.to_i
       user.update(kind: value_k.to_i,
                   glamor: value_g.to_i,
                   mental: value_m.to_i,
                   coop: value_c.to_i,
                   social: value_s.to_i,
                   user_exp: value_e.to_i)
       # ここまで
		   flash[:notice] = "今日の進捗を投稿しました！"
		   redirect_to note_path(note)
	else
		  flash[:notice] = "投稿内容に不備があります。もう一度記入してください。"
	    redirect_to new_note_path
	end
  end

  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy
  	redirect_to user_logs_path(current_user.id)
  end

  def show
  	@note = Note.find(params[:id])
    @comment = Comment.new
  end

  private
  def note_params
  	params.require(:note).permit(:user_id,
  		                         :note_image_id,
  		                         :note_body,
  		                         :result,
  		                         :start_time,
                               :work_id)
  end
end
