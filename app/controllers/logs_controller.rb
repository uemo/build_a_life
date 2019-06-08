class LogsController < ApplicationController

  def index
  	@notes = Note.all
  end

  def create
  end

end
