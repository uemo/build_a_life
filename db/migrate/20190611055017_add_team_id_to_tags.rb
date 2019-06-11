class AddTeamIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :team_id, :integer
  end
end
