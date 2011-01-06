class RemoveSelfRefFromSections < ActiveRecord::Migration
  def self.up
    remove_column :sections, :sectionId
  end

  def self.down
    add_column :sections, :sectionId, :string
  end
end
