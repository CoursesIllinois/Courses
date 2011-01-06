class AddPhoneCarrierToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :carrier, :string
  end

  def self.down
    remove_column :users, :carrier
  end
end
