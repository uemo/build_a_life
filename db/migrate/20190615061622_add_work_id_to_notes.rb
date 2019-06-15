class AddWorkIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :work_id, :integer
  end
end
