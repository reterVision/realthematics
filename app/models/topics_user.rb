class TopicsUser < ActiveRecord::Base
  validates :topic_id, :uniqueness => { :scope => :user_id,
      :message => "It's already in your list" }
  belongs_to :users
  belongs_to :topics
  
  def topicTitle
    Topic.find(self.topic_id).title
  end
end
