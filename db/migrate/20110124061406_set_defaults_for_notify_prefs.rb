class SetDefaultsForNotifyPrefs < ActiveRecord::Migration
  def self.up
    change_column_default :notify_prefs, :email, false
    change_column_default :notify_prefs, :text, false
    change_column_default :notify_prefs, :android, false
  end

  def self.down
    change_column_default :notify_prefs, :email, nil
    change_column_default :notify_prefs, :text, nil 
    change_column_default :notify_prefs, :android, nil
  end
end
