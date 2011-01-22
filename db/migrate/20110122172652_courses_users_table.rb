class CoursesUsersTable < ActiveRecord::Migration
  def self.up
    create_table :courses_users, :id=> false do |t|
      t.integer :course_id, :null => false
      t.integer :user_id, :null => false
    end
  end

  def self.down
      drop_table :courses_users
  end
end
