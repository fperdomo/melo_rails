# Preview all emails at http://localhost:3000/rails/mailers/comment_mail_mailer
class CommentMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mail_mailer/mailComment
  def mailComment
    CommentMailMailer.mailComment
  end

end
