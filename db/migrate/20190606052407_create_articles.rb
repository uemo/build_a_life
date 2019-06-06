class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :team_id
      t.integer :user_id
      t.string :article_title
      t.text :article_body

      t.timestamps
    end
  end
end
