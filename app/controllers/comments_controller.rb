class CommentsController < ApplicationController

	def  create
		@comment = Comment.new(comment_params)
		@note = Note.find(params[:note_id])
		@comment.user_id = current_user.id
		@comment.note_id = @note.id
		if @comment.save
	  	flash[:notice] = "コメントを投稿しました。"
	    redirect_to note_path(@note)
	    else
	  	flash[:notice] = "コメントの投稿に失敗しました。もう一度内容を確認してください。"
	  	redirect_to note_path(@note)
	    end
	end

	def destroy
		@note = Note.find(params[:note_id])
		comment = Comment.find(params[:id])
		comment.destroy
		flash[:notice] = "コメントを削除しました。"
        redirect_to note_path(@note)

	private
	def comment_params
		params.require(:comment).permit(:user_id,
			                            :note_id,
			                            :comment_body)
	end
end
