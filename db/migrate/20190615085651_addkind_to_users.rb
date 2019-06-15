class AddkindToUsers < ActiveRecord::Migration[5.2]
  def change
  	  add_column :users, :kind, :integer
  	  add_column :users, :glamor, :integer
  	  add_column :users, :mental, :integer
  	  add_column :users, :coop, :integer
  	  add_column :users, :social, :integer
  end
end
