class ChangeTypeToString < ActiveRecord::Migration
  def self.up
    change_column :announcements, :type, :string
  end

  def self.down
  end
end
