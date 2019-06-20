class ChangeDataStartTimeToNote < ActiveRecord::Migration[5.2]
  def change
  	change_column :notes, :start_time, :date
  end
end
