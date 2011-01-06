class AddExtSectionIdToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :sectionId, :string
  end

  def self.down
    remove_column :sections, :sectionId
  end
end
