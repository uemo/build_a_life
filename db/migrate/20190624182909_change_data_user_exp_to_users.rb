class ChangeDataUserExpToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :user_exp, :integer, :default => 0
  	change_column :users, :number_days, :integer, :default => 0
  	change_column :users, :max_number_days, :integer, :default => 0
  	change_column :users, :number_return, :integer, :default => 0
  	change_column :users, :kind, :integer, :default => 0
  	change_column :users, :glamor, :integer, :default => 0
  	change_column :users, :mental, :integer, :default => 0
  	change_column :users, :coop, :integer, :default => 0
  	change_column :users, :social, :integer, :default => 0
  end
end
