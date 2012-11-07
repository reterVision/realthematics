class MergeResourceScoresToResources < ActiveRecord::Migration
  def up
    drop_table :resource_scores
    add_column :resources, :up_count, :integer, :default => 0
    add_column :resources, :down_count, :integer, :default => 0
    add_column :resources, :add_count, :integer, :default => 1
  end

  def down
    create_table :resource_scores do |t|
      t.integer :resource_id
      t.integer :add_count
      t.integer :up_count
      t.integer :down_count

      t.timestamps
    end
    remove_column :resources, :up_count
    remove_column :resources, :down_count
    remove_column :resources, :add_count
  end
end
