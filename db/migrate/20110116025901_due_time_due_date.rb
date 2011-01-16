class DueTimeDueDate < ActiveRecord::Migration
  def self.up
    rename_column :announcements, :dueDate, :dueTime
    add_column :announcements, :dueDate, :date
  end

  def self.down
  end
end
