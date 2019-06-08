class ChangeDataTeamImageIdToTeams < ActiveRecord::Migration[5.2]
  def change
  	change_column :teams, :team_image_id, :text
  end
end
