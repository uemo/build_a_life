class CreateWorkNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :work_notes do |t|
      t.integer :note_id
      t.integer :work_id

      t.timestamps
    end
  end
end
