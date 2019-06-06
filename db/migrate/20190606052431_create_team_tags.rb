class CreateTeamTags < ActiveRecord::Migration[5.2]
  def change
    create_table :team_tags do |t|
      t.integer :team_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
