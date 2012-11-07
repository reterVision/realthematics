require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "registration_succeed" do
    mail = Notifier.registration_succeed
    assert_equal "Registration succeed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
