class CreateTopicScoreUsers < ActiveRecord::Migration
  def change
    create_table :topic_score_users do |t|
      t.integer :topic_score_id
      t.integer :user_id
      t.integer :user_action

      t.timestamps
    end
  end
end
