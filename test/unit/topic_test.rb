require 'test_helper'

class TopicTest < ActiveSupport::TestCase
   test "The Title of a Topic can not be empty" do
     topic = Topic.new
     assert topic.invalid?
     assert topic.errors[:title].any?
     #assert topic.errors[:description].any?
   end
   
   test "The title should be unique in the system" do
     topic = Topic.new(:title=>Topic(:Startup).title, :description=>"Test")
     assert topic.save!  
     assert_equal "has already been taken", topic.errors[:title].join('; ')
   end
end