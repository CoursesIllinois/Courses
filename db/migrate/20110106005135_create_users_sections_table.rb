class CreateUsersSectionsTable < ActiveRecord::Migration
  def self.up
    create_table :users_sections, :id => false do |t|
      t.references :user, :null => false
      t.references :section, :null => false
    end
  end

  def self.down
    drop_table :users_sections
  end
end
