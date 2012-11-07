class Resource < ActiveRecord::Base
  #default_scope :order => 'created_at DESC, up_count DESC, add_count DESC, down_count ASC'
  belongs_to :users
  belongs_to :topics
  has_many   :resources_users_actions
  
  def topic
    Topic.find(self.topic_id)
    rescue ActiveRecord::RecordNotFound
      Topic.new
  end
  def user
    aUser = User.find(self.user_id)
    if aUser.screen_name==nil
      aUser.screen_name = "a user"
    end
    aUser
    rescue ActiveRecord::RecordNotFound
      User.new
  end
end
