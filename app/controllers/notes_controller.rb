class NotesController < ApplicationController

  def new
  	@note = Note.new
    @comment = Comment.new
  end

  def create
  	note = Note.new(note_params)
  	note.user_id = current_user.id
  	if note.save
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
