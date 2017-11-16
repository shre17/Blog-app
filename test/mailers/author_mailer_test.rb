require 'test_helper'

class AuthorMailerTest < ActionMailer::TestCase
  test "new_article" do
    mail = AuthorMailer.new_article
    assert_equal "New article", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
