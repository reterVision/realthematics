class ChangeTableNameToTopicsUsersActions < ActiveRecord::Migration
  def change
    rename_table(:topic_score_users,:topics_users_actions)
    rename_column(:topics_users_actions, :topic_score_id, :topic_id)
  end
end
