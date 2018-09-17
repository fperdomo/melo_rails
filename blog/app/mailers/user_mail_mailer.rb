class UserMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mail_mailer.sendReport.subject
  #
  def sendReport(user, comments, date)
    mailDestination = user.email
    startDate = date.beginning_of_day
    endDate = date.end_of_day
    @countArticles = user.articles.where('created_at BETWEEN ? AND ?',startDate,endDate).count
    @countCommentsDo = comments.where('user_id = ?', user.id).count
    @countCommentsReceived = comments.where('article_id in (?)', user.articles.select(:id)).count
    mail to: mailDestination, subject: "Reporte Diario #{date}"
  end
end
