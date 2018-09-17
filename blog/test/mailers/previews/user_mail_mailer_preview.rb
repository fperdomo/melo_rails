# Preview all emails at http://localhost:3000/rails/mailers/user_mail_mailer
class UserMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mail_mailer/sendReport
  def sendReport
    UserMailMailer.sendReport
  end

end
