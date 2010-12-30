class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :room
      t.integer :referenceNumber
      t.text :notes
      t.string :type
      t.string :instructor
      t.string :days
      t.time :startTime
      t.time :endTime
      t.string :building
      t.string :sectionId
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
