class Topic < ActiveRecord::Base
  validates :title, :presence=>true, :uniqueness=>true
  default_scope :order => 'created_at'
  # has_and_belongs_to_many :users
  has_many :topics_users
  has_many :topics_users_actions
  has_many :users, :through=>:topics_users
  has_many :resources
end
