class RenameSectionsAndUsersRelation < ActiveRecord::Migration
  def self.up
    drop_table :users_sections
    create_table :sections_users, :id=>false do |t|
      t.references :section, :null => false
      t.references :user, :null => false
    end
  end

  def self.down
    drop_table :sections_users
  end
end
