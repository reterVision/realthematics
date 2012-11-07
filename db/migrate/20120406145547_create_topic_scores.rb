class CreateTopicScores < ActiveRecord::Migration
  def change
    create_table :topic_scores do |t|
      t.integer :topic_id
      t.integer :up_count
      t.integer :down_count

      t.timestamps
    end
  end
end
