class CreateMajors < ActiveRecord::Migration
  def self.up
    create_table :majors do |t|
      t.integer :phone
      t.string :webSiteAddress
      t.string :address2
      t.string :contact
      t.string :contactTitle
      t.text :subjectDescription
      t.string :subjectCode
      t.string :unitName

      t.timestamps
    end
  end

  def self.down
    drop_table :majors
  end
end
