class RemoveCarrierFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :carrier
  end

  def self.down
    add_column :users, :carrier, :string
  end
end
