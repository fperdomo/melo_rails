class CommentMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mail_mailer.mailComment.subject
  #
  def sendMailToAuthor(mailDestination, comment)
    @greeting = "Hi"
    @commentBody = comment.body
    @commentAuthor = comment.user.email
    mail to: mailDestination, subject: "Nuevo comentario en tu Artículo"
  end
end
