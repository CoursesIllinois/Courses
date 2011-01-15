class AddRelCourseAnnounce < ActiveRecord::Migration
  def self.up
    add_column :announcements, :course_id, :integer
  end

  def self.down
  end
end
