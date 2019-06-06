class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :team_id
      t.integer :user_id
      t.text :chat_body

      t.timestamps
    end
  end
end
