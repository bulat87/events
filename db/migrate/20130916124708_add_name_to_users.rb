class AddNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :family_name, :string
  end
end
