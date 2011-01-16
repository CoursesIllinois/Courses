class TypeToAtype < ActiveRecord::Migration
  def self.up
    rename_column :announcements, :type, :atype
  end

  def self.down
  end
end
