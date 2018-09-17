require 'test_helper'

class UserMailMailerTest < ActionMailer::TestCase
  test "sendReport" do
    mail = UserMailMailer.sendReport
    assert_equal "Sendreport", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
