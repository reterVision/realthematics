class DevideTopicsUserIdForResources < ActiveRecord::Migration
  def change
      add_column :resources, :user_id, :integer
      add_column :resources, :topic_id, :integer
      remove_column(:resources, :topics_user_id)
  end

end
