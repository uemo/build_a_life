class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :team_image_id
      t.string :team_name
      t.text :team_body

      t.timestamps
    end
  end
end
