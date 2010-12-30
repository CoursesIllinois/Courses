class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :courseNumber
      t.string :hours
      t.text :description
      t.string :title
      t.string :subjectCode
      t.integer :subjectId
      t.references :major

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
