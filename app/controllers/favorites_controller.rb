class FavoritesController < ApplicationController
  before_action :authenticate_user!

	def create
        note = Note.find(params[:note_id])
        favorite = current_user.favorites.new(note_id: note.id)
        # いいねを押したら、ユーザーのステータス(coop,user_exp)に値を1加算する。
        if favorite.save
           user = User.find(current_user.id)
           value_c = user.coop.to_i + 1
           value_e = user.user_exp.to_i + 1
           user.update(coop: value_c.to_i,
                       user_exp: value_e.to_i)
        end
        # ここまで
        redirect_to note_path(note)
    end

    def destroy
        note = Note.find(params[:note_id])
        favorite = current_user.favorites.find_by(note_id: note.id)
        # いいねを消したら、ユーザーのステータス(coop,user_exp)値を1減らす。
        if favorite.destroy
           user = User.find(current_user.id)
           value_c = user.coop.to_i - 1
           value_e = user.user_exp.to_i - 1
           user.update(coop: value_c.to_i,
                       user_exp: value_e.to_i)
        end
        # ここまで
        redirect_to note_path(note)
    end

end
