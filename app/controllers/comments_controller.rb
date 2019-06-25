class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@note = Note.find(params[:note_id])
		@comment.user_id = current_user.id
		@comment.note_id = @note.id
		# コメントをしたら、ユーザーのステータス(social,user_exp)に値を1加算する。
		if @comment.save
			user = User.find(current_user.id)
            value_s = user.social.to_i + 1
            value_e = user.user_exp.to_i + 1
            user.update(social: value_s.to_i,
            	        user_exp: value_e.to_i)
        # ここまで

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
		# コメントを消したら、ユーザーのステータス(social,user_exp)値を1減らす。
		if comment.destroy
			user = User.find(current_user.id)
            value_s = user.social.to_i - 1
            value_e = user.user_exp.to_i - 1
            user.update(social: value_s.to_i,
            	        user_exp: value_e.to_i)
        # ここまで
		flash[:notice] = "コメントを削除しました。"
        redirect_to note_path(@note)
    end

	private
	def comment_params
		params.require(:comment).permit(:user_id,
			                            :note_id,
			                            :comment_body)
	end
end
