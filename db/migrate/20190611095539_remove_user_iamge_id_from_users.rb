class RemoveUserIamgeIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_iamge_id, :string
  end
end
