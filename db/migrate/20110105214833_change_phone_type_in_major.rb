class ChangePhoneTypeInMajor < ActiveRecord::Migration
  def self.up
    change_table :majors do |t|
      t.remove :phone
      t.string :phone
    end
  end

  def self.down
    change_table :majors do |t|
      t.remove :phone
      t.integer :phone
    end
  end
end
