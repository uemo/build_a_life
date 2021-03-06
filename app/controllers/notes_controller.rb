class NotesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    date = Note.where(user_id: current_user.id)
    date_last = date.last
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

       # 継続日数を計算する
       # 保存したレコードの日付とユーザーが前回作成した最新レコードの日付の差分を求める
       if date_last.nil?
          day = 1
       else
       day = (Date.parse(note.start_time.to_s) - Date.parse(date_last.start_time.to_s)).to_i
       end
       # 差分が1の場合number_daysカラムに値を1加える
       if day == 1 && note.result == "達成"
          keep_day = user.number_days + 1
          user.update(number_days: keep_day)
       end
       # 差分が2以上の場合number_daysカラムの値を0にし、return_dayカラムに値を1加える
       if day >= 2
          return_day = user.number_return + 1
          stop_day = 0
          user.update(number_days: stop_day, number_return: return_day)
       end
       # ここまで

       # 継続日数が最大継続日数を超えた場合には、最大継続日数を更新する。
       if  user.number_days > user.max_number_days
           m_number_days = user.number_days
           user.update(max_number_days: m_number_days)
       end
       # ここまで

		   flash[:notice] = "今日の進捗を投稿しました！"
		   redirect_to note_path(note)
	else
		  flash[:danger] = "投稿内容に不備があります。もう一度記入してください。"
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
