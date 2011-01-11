class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.integer :type
      t.time :dueDate
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
