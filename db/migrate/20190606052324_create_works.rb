class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :work_title
      t.integer :status_k
      t.integer :status_g
      t.integer :status_m
      t.integer :status_c
      t.integer :status_s
      t.integer :exp

      t.timestamps
    end
  end
end
