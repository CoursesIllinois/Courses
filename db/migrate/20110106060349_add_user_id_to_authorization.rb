class AddUserIdToAuthorization < ActiveRecord::Migration
  def self.up
    add_column :authorizations, :user_id, :integer
  end

  def self.down
    remove_column :authorizations, :user_id
  end
end
