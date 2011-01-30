class AddRankToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :rank, :integer
  end

  def self.down
  end
end
