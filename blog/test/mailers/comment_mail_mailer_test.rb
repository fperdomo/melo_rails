require 'test_helper'

class CommentMailMailerTest < ActionMailer::TestCase
  test "mailComment" do
    mail = CommentMailMailer.mailComment
    assert_equal "Mailcomment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
