class CreateNotifyPrefs < ActiveRecord::Migration
  def self.up
    create_table :notify_prefs do |t|
      t.boolean :email
      t.boolean :text
      t.boolean :android
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :notify_prefs
  end
end
