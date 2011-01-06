class SplitNameToFirstAndLast < ActiveRecord::Migration
  def self.up
	remove_column :users, :name
	add_column :users, :firstname, :string
	add_column :users, :lastname, :string
  end

  def self.down
	remove_column :users, :firstname
	remove_column :users, :lastname
  end
end
