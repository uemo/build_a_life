class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :note_image_id
      t.text :note_body
      t.string :result

      t.timestamps
    end
  end
end
