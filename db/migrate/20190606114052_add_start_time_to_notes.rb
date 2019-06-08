class AddStartTimeToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :start_time, :datetime
  end
end
