class LogsController < ApplicationController

  def index
  	@notes = Note.where(user_id: current_user.id)
  	@user = User.find(params[:user_id])
  end

  def create
  end

end
