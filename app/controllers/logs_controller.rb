class LogsController < ApplicationController

  def index
  	@notes = Note.all
  	@user = User.find(params[:user_id])
  end

  def create
  end

end
