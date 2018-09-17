namespace :schedule_mails do
  desc "Send the report daily to all suscribed users"
  task users_report: :environment do
    date = DateTime.now
    users = User.all
    startDate = date.beginning_of_day
    endDate = date.end_of_day
    comments = Comment.all.where('created_at BETWEEN ? AND ?',startDate,endDate)
    users.each do |user|
      UserMailMailer.sendReport(user, comments, date).deliver
    end
    puts "#{Time.now} - Deliver success!"
  end
end
