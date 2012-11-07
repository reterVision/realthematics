class CreateResourceScoreUsers < ActiveRecord::Migration
  def change
    create_table :resource_score_users do |t|
      t.integer :resource_score_id
      t.integer :user_id
      t.integer :user_action

      t.timestamps
    end
  end
end
