class AddAnswerFlagToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :is_answer, :boolean, :default => false
  end

  def self.down
    remove_column :responses, :is_answer
  end
end
