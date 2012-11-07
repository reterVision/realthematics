class MergeTopicScoresToTopics < ActiveRecord::Migration
  def up
    drop_table:topic_scores
    add_column :topics, :up_count, :integer, :default => 0
    add_column :topics, :down_count, :integer, :default => 0    
  end

  def down
    create_table :topic_scores do |t|
      t.integer :topic_id
      t.integer :up_count
      t.integer :down_count

      t.timestamps
    end
    remove_column :topics, :up_count
    remove_column :topics, :down_count 
  end
end
