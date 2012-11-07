class CreateResourceScores < ActiveRecord::Migration
  def change
    create_table :resource_scores do |t|
      t.integer :resource_id
      t.integer :add_count
      t.integer :up_count
      t.integer :down_count

      t.timestamps
    end
  end
end
