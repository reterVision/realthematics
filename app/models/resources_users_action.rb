class ResourcesUsersAction < ActiveRecord::Base
  before_save :default_values
  validate :allow_nil => true, :presence => true, :uniqueness => true
  belongs_to :users
  belongs_to :resources
  
  def default_values
    self.user_action ||= 0  # 0 - none, 1 - add, 2 - up, 3 - down
  end
end
