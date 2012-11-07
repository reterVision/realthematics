class ChangeTableNameToResourcesUsersActions < ActiveRecord::Migration
  def change
    rename_table(:resource_score_users,:resources_users_actions)
    rename_column(:resources_users_actions, :resource_score_id, :resource_id)
  end
end
